package kr.co.service;

import java.util.List;

import kr.co.domain.ReplyVO;

public interface ReplyService {
	public void insert(ReplyVO vo);

	public List<ReplyVO> list(int bno);

	public int delete(int rno);

	public int update(ReplyVO vo);

}
