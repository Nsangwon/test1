package kr.co.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class TestAdvice {
	
	@Around("execution(* kr.co.service.TestService*.*(..))")	//특정메소드 시작하기전에 정의 해주어야한다
	public Object startLog(ProceedingJoinPoint pjp) throws Throwable {
		System.out.println(":::::::::::befor:::::::::::");
		long t1 = System.currentTimeMillis();
		
		Object result = pjp.proceed();	//코어코드 호출
		
		long t2 = System.currentTimeMillis();
		
		System.out.println(t2-t1);
		
		System.out.println(":::::::::::after:::::::::::");
		return result;
	}
	
}
