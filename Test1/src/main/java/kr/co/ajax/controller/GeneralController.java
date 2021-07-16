package kr.co.ajax.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/general")
public class GeneralController {
	
	
	
	
	
	@GetMapping(value = "/test3")
	public void test3() {
		
	}
	
	@GetMapping(value = "/test2")
	public void test2() {
		
	}
	
	@GetMapping(value = "/test1")
	public void test1() {
		
	}
}
