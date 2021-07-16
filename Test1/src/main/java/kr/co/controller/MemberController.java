package kr.co.controller;

import java.net.Authenticator.RequestorType;
import java.util.List;

import javax.xml.ws.RequestWrapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.domain.MemberDTO;
import kr.co.service.MemberService;

@Controller
@RequestMapping("/member")	//주소창에 값을 추가
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@RequestMapping("/ma")
	public String ma(@ModelAttribute("id") String id, @ModelAttribute("name") String name) {
		System.out.println(id);
		System.out.println(name);
		
		return "/member/ma";
	}
	@GetMapping("/jsontest3")
	/* @RequestMapping("/jsontest3") */
	@ResponseBody
	public List<MemberDTO> jsontest3(){
		List<MemberDTO> list = mService.list();			return list;	}
	
	@RequestMapping("/jsontest2")
	@ResponseBody
	public MemberDTO jsontest2() {
		return new MemberDTO("m001", null, "kim", "a@a.com", null, null);	}
	
	@RequestMapping("/jsontest")
	@ResponseBody
	public String jsontest() {		return "/member/insert";	}
	
	
	
	
	
	
	 @RequestMapping(value = "/delete", method = RequestMethod.POST)
		public String delete(String userId) {
			  mService.delete(userId);
			  return "redirect:/member/list";
		  }
	
	 
	  @RequestMapping(value = "/update", method = RequestMethod.POST)
	   public String update(MemberDTO dto, RedirectAttributes rttr) {
	  mService.update(dto);
	  rttr.addFlashAttribute("test", "노출이 안되게 하고 싶어요");
	  return "redirect:/member/read/"+dto.getUserId(); 
	  }
	 
	
	@RequestMapping(value = "/update/{userId}", method = RequestMethod.GET)
	public String update(@PathVariable("userId") String userId,Model model) {
		
		MemberDTO dto = mService.read(userId);
		model.addAttribute("dto", dto);
		
		return "/member/update";
	}
	
	
	
	@RequestMapping(value = "/read/{userId}", method = RequestMethod.GET)
	public String read(@PathVariable("userId") String userId,Model model) {
		
		MemberDTO dto = mService.read(userId);
		model.addAttribute("dto", dto);
		
		return "/member/read";
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(MemberDTO dto) {
		mService.insert(dto);
		
		return "redirect:/member/list";
	}	
	
	
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public void insert() {
		
	}	
	
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model) {
		
	List<MemberDTO> list = mService.list();
	model.addAttribute("list",list);
		return "/member/list";	//뷰의 정보와 의미보낸다. 그 후는 뷰리시브 한테 물어본다.
	}	//주소창에 값을 추가 대신에 member라는 폴더도 생성 해야한다.
	
	
	


}
