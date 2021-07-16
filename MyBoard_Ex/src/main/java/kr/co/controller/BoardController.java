package kr.co.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.domain.BoardVO;
import kr.co.domain.PageTO;
import kr.co.service.BoardService;
import kr.co.utils.Utils;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService bService;
	
	@Autowired
	private ServletContext sc;
	
	private String uploadPath = "resources"+File.separator+"uploads";
	
	@RequestMapping(value = "/search/{curPage}", method = RequestMethod.GET, produces = "text/plain;charset=utf8")
	public String search(@PathVariable("curPage") int curPage , String criteria , String keyword, Model model){
		int amount = bService.getAmount();
		
		PageTO<BoardVO> to = new PageTO<BoardVO>(curPage);
		to.setAmount(amount);
		
		List<BoardVO> list = bService.search(to.getStartNum(), keyword,criteria);
		to.setList(list);
		model.addAttribute("criteria", criteria);
		model.addAttribute("keyword", keyword);
		model.addAttribute("to", to);
		
		return "/board/search";
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET, produces = "text/plain;charset=utf8")
	public void search(String criteria ,String keyword, Model model){
		
		
		int curPage =1;
		int amount = bService.getAmount();
		
		PageTO<BoardVO> to = new PageTO<BoardVO>(curPage);
		to.setAmount(amount);
		
		List<BoardVO> list = bService.search(to.getStartNum(), keyword,criteria);
		to.setList(list);
		model.addAttribute("criteria", criteria);
		model.addAttribute("keyword", keyword);
		model.addAttribute("to", to);
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/getAttach/{bno}", method = RequestMethod.GET)
	public List<String> getAttach(@PathVariable("bno") int bno) {
		
		return bService.getAttach(bno);
	}
	
	
	@ResponseBody	
	@RequestMapping(value = "/displayFile", method = RequestMethod.GET, produces = "application/text;charset=utf8")
	public ResponseEntity<byte[]> displayFile(String filename) {
		ResponseEntity<byte[]> entity = null;
		InputStream in = null;
		
		try {
			String extendName = Utils.getExtendName(filename);
			MediaType mType = Utils.getMediaType(extendName);
			HttpHeaders headers = new HttpHeaders();
			
			String uploadPath = sc.getRealPath(this.uploadPath);
			
			in = new FileInputStream(uploadPath+filename);
			
			if(mType != null) {
				headers.setContentType(mType);
			}else {
				filename = filename.substring(filename.indexOf("_")+1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment;filename=\""+new String(filename.getBytes("UTF-8"),"ISO-8859-1"));
			}
			
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),headers,HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally {
			if(in != null) {
				try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value = "/deleteFile", method = RequestMethod.POST, 
	produces = "text/plain;charset=utf8")
	public String deleteFile(String filename) {
		bService.deleteFile(filename);
		
		filename.replace('/', File.separatorChar);
		
		String uploadPath = sc.getRealPath(this.uploadPath);
		 String extendName = Utils.getExtendName(filename);
		MediaType mType = Utils.getMediaType(extendName);
		
		if(mType != null) {
			String systemFileName = Utils.getSystemfileName(filename);
			File f1 = new File(uploadPath, systemFileName);
			f1.delete();
		}
		File f = new File(uploadPath, filename);
		f.delete();
		
		return filename;
	}
	
	@ResponseBody
	@RequestMapping(value = "/uploadfile", method = RequestMethod.POST, 
	produces = "text/plain;charset=utf8")
	public String uploadfile(MultipartHttpServletRequest request) throws Exception {
		MultipartFile file = request.getFile("file");
		String oriName = file.getOriginalFilename();
		String uploadPath = sc.getRealPath(this.uploadPath);
		String filename = Utils.uploadFile(oriName, uploadPath, file);
		return filename;
	}
	
	@RequestMapping(value = "/delete/{bno}", method = RequestMethod.POST)
	public String delete(@PathVariable("bno") Integer bno, int curPage) {
		bService.delete(bno);
		return "redirect: /board/list/"+curPage;
	}
	
	@RequestMapping(value = "/update/{bno}", method = RequestMethod.POST)
	public String update(@PathVariable("bno") Integer bno, BoardVO vo,
			int curPage) {
		vo.setBno(bno);
		bService.update(vo);
		return "redirect: /board/read/"+bno+"?curPage="+curPage;
	}
	
	@RequestMapping(value = "/update/{bno}", method = RequestMethod.GET)
	public String update(@PathVariable("bno") Integer bno, Model model,
			@ModelAttribute("curPage") int curPage) {
		BoardVO vo = bService.update(bno);
		model.addAttribute("vo",vo);
		return "/board/update";
	}
	
	@RequestMapping(value = "/read/{bno}", method = RequestMethod.GET)
	public String read(@ModelAttribute("curPage") int curPage,
			@PathVariable("bno") Integer bno, Model model) {
		BoardVO vo = bService.read(bno);
		model.addAttribute("vo",vo);
		return "/board/read";
	}
	
	@RequestMapping(value = "/list/{curPage}", method = RequestMethod.GET)
	public String list(@PathVariable("curPage") int curPage, Model model) {
		
		int amount = bService.getAmount();
		PageTO<BoardVO> to = new PageTO<BoardVO>(curPage);
		to.setAmount(amount);
		
		List<BoardVO> list = bService.list(to.getStartNum());
		to.setList(list);
		model.addAttribute("to", to);
		return "/board/list";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(Model model) {
		int curPage =1;
		int amount = bService.getAmount();
		
		PageTO<BoardVO> to = new PageTO<BoardVO>(curPage);
		to.setAmount(amount);
		
		List<BoardVO> list = bService.list(to.getStartNum());
		to.setList(list);
		model.addAttribute("to", to);
	}
	
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(BoardVO vo) {
		bService.insert(vo);
		
		return "redirect:/board/list";
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public void insert() {
		
	}
	
}
