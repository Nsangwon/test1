package kr.co.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.domain.BoardVO;
import kr.co.domain.PageTO;

@Repository
public class BoardDAOImpl implements BoardDAO{
	
	@Autowired
	private SqlSession session;
	
	private final String NAMESPACE = "kr.co.board";
	
	@Override
	public void insert(BoardVO vo) {
		session.insert(NAMESPACE+".insert", vo);
	}
	
	@Override
	public List<BoardVO> list() {
		return session.selectList(NAMESPACE+".list");
	}
	
	@Override
	public BoardVO read(Integer bno) {
		return session.selectOne(NAMESPACE+".read", bno);
	}
	
	@Override
	public BoardVO update(Integer bno) {
		return read(bno);
	}
	
	@Override
	public void update(BoardVO vo) {
		session.update(NAMESPACE+".update", vo);
	}
	
	@Override
	public void delete(Integer bno) {
		session.delete(NAMESPACE+".delete", bno);
	}
	
	@Override
	public int getAmount() {
		return session.selectOne(NAMESPACE+".getAmount");
	}
	
	@Override
	public List<BoardVO> list(int startNum) {
		PageTO<BoardVO> to = new PageTO<BoardVO>();
		int perPage  = to.getPerPage();
		RowBounds	rb = new RowBounds(startNum-1, perPage);
		
		return session.selectList(NAMESPACE+".list", null, rb);
	}
	
	@Override
	public void readcnt(Integer bno) {
		session.update(NAMESPACE+".readcnt", bno);
	}
	
	@Override
	public void addAttach(String filename, int bno) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("filename", filename);
		map.put("bno", bno);
		
		session.insert(NAMESPACE+".addAttach", map);
	}
	
	@Override
	public List<String> getAttach(int bno) {
		
		return session.selectList(NAMESPACE+".getAttach", bno);
	}
	
	@Override
	public void deleteFile(String filename) {
		session.delete(NAMESPACE+".deleteFile", filename);
		
	}
	
	@Override
	public void deleteAllFilenameByBno(int bno) {
		session.delete(NAMESPACE+".deleteAllFilenameByBno", bno);
		
	}
	
	@Override
	public List<BoardVO> search(int startNum, String keyword, String criteria) {
		PageTO<BoardVO> to = new PageTO<BoardVO>();
		int perPage  = to.getPerPage();
		RowBounds	rb = new RowBounds(startNum-1, perPage);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("criteria", criteria);
		
		return session.selectList(NAMESPACE+".search", map, rb);
	}

}
