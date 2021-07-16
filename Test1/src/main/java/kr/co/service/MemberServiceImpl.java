package kr.co.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.domain.MemberDTO;
import kr.co.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO mDao;

	@Override
	public List<MemberDTO> list() {

		return mDao.list();

	}

	@Override
	public void insert(MemberDTO dto) {
		mDao.insert(dto);

	}

	@Override
	public MemberDTO read(String userId) {
		// TODO Auto-generated method stub
		return mDao.read(userId);
	}

	@Override
	public void update(MemberDTO dto) {
		mDao.update(dto);

	}

	@Override
	public void delete(String userId) {
		mDao.delete(userId);

	}

}
