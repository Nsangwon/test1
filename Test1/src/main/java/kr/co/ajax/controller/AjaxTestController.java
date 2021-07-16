package kr.co.ajax.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.domain.MemberDTO;

@Controller
@RequestMapping("/ajax")
public class AjaxTestController {
	
	@PostMapping(value = "/test4")
	@ResponseBody
	public List<MemberDTO> test4(int bno){
		
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		list.add(new MemberDTO("m001", null, null, "a@a.com", null, null));
		list.add(new MemberDTO("m002", null, null, "b@b.com", null, null));
		list.add(new MemberDTO("m003", null, null, "c@c.com", null, null));
		
		return list;
	}
	
	@GetMapping(value = "/test4")
	public void test4() {	}
	
	@PostMapping(value = "/test3")
	@ResponseBody
	public MemberDTO test3(MemberDTO dto) {
		
		System.out.println(dto.getUserId());
		System.out.println(dto.getUserPw());
		System.out.println(dto.getUserName());
		System.out.println(dto.getEmail());
		
		return dto;
	}
	
	@GetMapping(value = "/test3")
	public void test3() {	}
	
	@PostMapping(value = "/test2")
	@ResponseBody
	public String[] test2(String[] arr) {
		System.out.println(arr);
		for(String x : arr) {
			System.out.println(x);
		}
		
		return arr;
	}
	
	@GetMapping(value = "/test2")
	public void test2() {			}
	

	@RequestMapping(value =  "/test1", method = RequestMethod.POST, produces="application/text;charset=utf8")
	public @ResponseBody String test1(String str) {
		
		System.out.println(str);
		return str;	}
	
	
	@GetMapping("/test1")
	public void test1() {			}
}
