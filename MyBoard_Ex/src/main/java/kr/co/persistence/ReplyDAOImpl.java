package kr.co.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO{

	@Autowired
	private SqlSession session;
	
	private final String NAMESPACE = "kr.co.reply";
	
	@Override
	public void insert(ReplyVO vo) {
		session.insert(NAMESPACE+".insert", vo);
	}
	
	@Override
	public List<ReplyVO> list(int bno) {
		return session.selectList(NAMESPACE+".list", bno);
	}
	
	@Override
	public int delete(int rno) {
		return session.delete(NAMESPACE+".delete", rno);
	}
	
	@Override
	public int update(ReplyVO vo) {
		return session.update(NAMESPACE+".update", vo);
	}
	
	@Override
	public void deleteByBno(Integer bno) {
		session.delete(NAMESPACE+".deleteByBno", bno);
		
	}

}
