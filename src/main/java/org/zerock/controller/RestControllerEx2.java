package org.zerock.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.Rest1;
import org.zerock.domain.Rest2;

import jdk.internal.org.jline.utils.Log;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/rest2")
@Log4j
public class RestControllerEx2 {

	@RequestMapping("/ex1")
	public String method1() {
		return "hello";
	}
	
	@RequestMapping("/ex2")
	public Rest1 method2() {
		log.warn("method2");
		
		Rest1 r = new Rest1();
		r.setName("dd");
		r.setAge(3);
		
		return r;
	}
	
	@RequestMapping("/ex3")
	public String method3() {
		log.warn("method3");
		
		Rest1 r = new Rest1();
		r.setName("dd");
		r.setAge(3);
		
		//String res = "name: " + r.getName() + "," + "age: " + r.getAge();
		String res = "{\"name\":\"" + r.getName() + "\", \"age\":" + r.getAge() + "}";

		return res;
	}
	
	@RequestMapping("/ex4")
	public Rest1 method4() {
		log.warn("method4");
		
		Rest1 r = new Rest1();
		r.setName("dd");
		r.setAge(3);

		return r;
	}
	
	@RequestMapping("/ex5")
	public Rest2 method5() {
		Rest2 r2 = new Rest2();
		r2.setAddress("seoul");
		
		Rest1 rest1 = new Rest1();
		rest1.setName("dd");
		rest1.setAge(5);
		rest1.setVote(true);

		r2.setRest1(rest1);
		return r2;
	}
	
	
	@RequestMapping("/ex6")
	public String[] method6() {
		String[] arr = {"java", "json", "xml"};
		
		return arr;
	}
	
	
	@RequestMapping("/ex7")
	public List<String> method7() {
		List<String> list = new ArrayList<>();
		list.add("hello");
		list.add("world");
		list.add("spring");
		return list;
	}
	
	@RequestMapping("/ex8")
	public Map<String, String> method8() {
		Map<String, String> map = new HashMap<String, String>();
		map.put("java", "script");
		map.put("spring", "boot");
		map.put("lee", "mini");
		
		return map;
	}
	
	@RequestMapping("/ex9")
	public List<Rest1> method9() {
		List<Rest1> list = new ArrayList<Rest1>();
		
		Rest1 rest1_1 = new Rest1();
		rest1_1.setName("aa");
		rest1_1.setAge(2);
		rest1_1.setVote(true);
		
		Rest1 rest1_2 = new Rest1();
		rest1_2.setName("bb");
		rest1_2.setAge(4);
		rest1_2.setVote(false);
		
		list.add(rest1_1);
		list.add(rest1_2);
		
		return list;
	}
	
	@RequestMapping("/ex10")
	public ResponseEntity<String> method10() {
		return ResponseEntity.status(200).body("hello");
		
		//ResponseEntity.status가 Builder를 리턴
		//Builder.body가 ResponseEntity를 리턴
	}
	
	@RequestMapping("/ex11")
	public ResponseEntity<String> method11(int num) {
		if (num > 0) {
			return ResponseEntity.status(200).body("spring");
		} else {
			return ResponseEntity.status(404).body("");
		}
 	}
}
