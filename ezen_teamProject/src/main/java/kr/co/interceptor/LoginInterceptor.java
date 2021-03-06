package kr.co.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.domain.MemberDTO;


public class LoginInterceptor extends HandlerInterceptorAdapter{
    
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session =  request.getSession();
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		
		
		if (login != null) {
			session.invalidate(); 
		}
		
		
		
		return true;
	}
    
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		
		HttpSession session = request.getSession();
		Map<String, Object> map = modelAndView.getModel();
		 Object dto =map.get("login");
		 
		 
		 
		 if (dto != null) {
			session.setAttribute("login", dto);
			
			
			
			
			System.out.println(dto+"로그인 정보가 있다.");
			response.sendRedirect("/");
		}else {
			System.out.println(dto+"로그인 정보가 없다.");
			response.sendRedirect("/member/loginGet");
		}
		 
	}

	
	
	
}
