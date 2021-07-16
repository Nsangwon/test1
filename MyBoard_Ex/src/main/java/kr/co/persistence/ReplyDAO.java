package kr.co.persistence;

import java.util.List;

import kr.co.domain.ReplyVO;

public interface ReplyDAO {

	void insert(ReplyVO vo);

	List<ReplyVO> list(int bno);

	int delete(int rno);

	int update(ReplyVO vo);

	void deleteByBno(Integer bno);
	

}
