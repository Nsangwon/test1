package kr.co.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.domain.BoardVO;
import kr.co.persistence.BoardDAO;
import kr.co.persistence.ReplyDAO;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardDAO bDao;
	
	@Autowired 
	private ReplyDAO rDao; 
	
	
	@Transactional
	@Override
	public void insert(BoardVO vo) {
		bDao.insert(vo);
		String[] files = vo.getFiles();
		if(files == null) {
			return;
		}
		for(String filename : files) {
			bDao.addAttach(filename, vo.getBno());
		}
	}
	
	@Override
	public List<BoardVO> list() {
		return bDao.list();
	}
	
	@Transactional
	@Override
	public BoardVO read(Integer bno) {
		
		bDao.readcnt(bno);
		BoardVO vo = bDao.read(bno);
		
		return vo;
	}
	
	
	@Override
	public BoardVO update(Integer bno) {
		return bDao.update(bno);
	}
	
	@Transactional
	@Override
	public void update(BoardVO vo) {
		bDao.update(vo);
		
		bDao.deleteAllFilenameByBno(vo.getBno());
		
		if(vo.getFiles() == null) {
			return;
		}
		for(String filename : vo.getFiles()) {
			bDao.addAttach(filename, vo.getBno());
		}
	}
	
	@Transactional
	@Override
	public void delete(Integer bno) {
		bDao.deleteAllFilenameByBno(bno);
		
		rDao.deleteByBno(bno);
		
		bDao.delete(bno);
		
	}
	
	@Override
	public int getAmount() {
		return bDao.getAmount();
	}
	@Override
	public List<BoardVO> list(int startNum) {
		
		return bDao.list(startNum);
	}
	
	@Override
	public List<String> getAttach(int bno) {
		
		return bDao.getAttach(bno);
	}
	
	@Override
	public void deleteFile(String filename) {
		bDao.deleteFile(filename);
		
	}
	
	@Override
	public List<BoardVO> search(int startNum,String keyword,String criteria) {
		
		return bDao.search(startNum,keyword,criteria);
	}

}
