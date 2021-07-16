package kr.co.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	private SqlSession session;

	private final String NAMESPACE = "kr.co.member";

	@Override
	public List<MemberDTO> list() {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE + ".list");
	}

	@Override
	public void insert(MemberDTO dto) {
		session.insert(NAMESPACE + ".insert", dto);
	}

	@Override
	public MemberDTO read(String userId) {
		// TODO Auto-generated method stub
		return session.selectOne(NAMESPACE + ".read", userId);
	}

	@Override
	public void update(MemberDTO dto) {
		session.update(NAMESPACE + ".update", dto);

	}

	@Override
	public void delete(String userId) {
		// TODO Auto-generated method stub
		session.selectOne(NAMESPACE + ".delete", userId);

	}

}