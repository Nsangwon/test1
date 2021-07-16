package kr.co.ezen;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.domain.BoardVO;
import kr.co.persistence.BoardDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class BoardDAOTest {

	@Autowired
	private BoardDAO bDao;

	@Test
	public void testBoardInsert() {
		/*
		 * BoardVO vo = new BoardVO(-1, "title1", "content1", "m001", 0, null, null);
		 * bDao.insert(vo);
		 */
	}

	@Test
	public void testGetAmount() {
		// int amount = bDao.getAmount();
		System.out.println(":::::");
		// System.out.println(amount);
		System.out.println("::::::");
	}

}