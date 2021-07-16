package kr.co.persistence;

import java.util.List;

import kr.co.domain.MemberDTO;

public interface MemberDAO {
	
	public List<MemberDTO> list();

	public void insert(MemberDTO dto);

	public MemberDTO read(String userId);

	public void update(MemberDTO dto);

	public void delete(String userId);
	

	
	
	
	

}
