package kr.co.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.domain.ReplyVO;
import kr.co.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl  implements ReplyService{
	
	@Autowired
	private ReplyDAO rDao;
	
	@Override
	public void insert(ReplyVO vo) {
		rDao.insert(vo);
	}
	
	@Override
	public List<ReplyVO> list(int bno) {
		return rDao.list(bno);	
	}
	
	@Override
	public int delete(int rno) {
		
		return rDao.delete(rno);
	}
	
	@Override
	public int update(ReplyVO vo) {
		return rDao.update(vo);
	}

}
