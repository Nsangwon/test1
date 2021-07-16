package kr.co.ezen;



import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.domain.MemberDTO;
import kr.co.persistence.MemberDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class MemberDAOTest {
   
   @Autowired
   private MemberDAO mDao;
   
   @Test
   public void testMemberDAOList() {
	   
	   List<MemberDTO>list=mDao.list();
	   System.out.println(list);
	   
   }

}