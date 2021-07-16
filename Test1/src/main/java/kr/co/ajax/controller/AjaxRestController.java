package kr.co.ajax.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/rest")
public class AjaxRestController {

	@PostMapping(value = "/test3")
	public Map<String, Object> test3(@RequestBody Map<String, Object> map) {
		System.out.println(map);
		String test1 = map.get("test1").toString();
		String test2 =(String)map.get("test2");
		
	
		
	      List<Map<String, Object>> test4= (List<Map<String, Object>>)map.get("test4");
	      System.out.println(test4);
	      for(int i=0;i<test4.size();i++) {
	         Map<String, Object> subMap = test4.get(i);
	         System.out.println(subMap );
	         String userId = subMap.get("userId").toString();
	         String userName = subMap.get("userName").toString();
	         System.out.println(":::::::::::::test4 start");
	         System.out.println(userId);
	         System.out.println(userName);
	         System.out.println("::::::::::::::::test4 end");
	         
	      }

		 
		
		return map;
	}
	
	@PostMapping(value = "/test2")
	public Map<String, Object> test2(@RequestBody Map<String, Object> map) {
		
		String test1 = map.get("test1").toString();	
		String test2 = map.get("test2").toString();	
		String test3 = map.get("test3").toString();	
		System.out.println(test1);	System.out.println(test2);	System.out.println(test3);
		
		return map;
	}
	
	@PostMapping(value = "/test1", produces = "application/text;charset=utf8")
	public String test1(@RequestBody Map<String, Object> map) {
		
		String test1= map.get("test1").toString();
		
		System.out.println(test1);
		
		return test1;
	}
	
}
