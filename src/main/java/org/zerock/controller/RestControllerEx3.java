package org.zerock.controller;


import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.Rest1;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/rest3")
@Log4j
public class RestControllerEx3 {
	
	
	//request parameter로 넘어오는 것 (query String)
	//resqust parmaeter에 있는 거 잘 꺼내서 보여줄 것
	@RequestMapping("/ex1")
	public String method1(String name) {
		log.warn("name: " + name);
		return "spring";
	}
	
	
	//@PathVariable 경로에 데이터를 추가
	@RequestMapping("/ex2/{val}")
	public String method2(@PathVariable("val") String value) {
		log.info("method2");
		log.info(value);
		return "method2";
	}
	
	@RequestMapping("/ex3/{value}")
	public String method3(@PathVariable String value) {
		log.info("method3");
		log.info(value);
		return value;
	}
	
	@RequestMapping("/ex4/{val}/{age}")
	public String method4(@PathVariable String val, @PathVariable  int age) {
		return val + age;
	}
	
	@RequestMapping("/ex5")
	public String method5(@RequestBody String body) {
		log.info(body);
		return "method5";
	}
	
	@RequestMapping("/ex6")
	public String method6(@RequestBody String body) {
		log.info(body);
		return "method6";
	}
	
	@RequestMapping("/ex7")
	public String method7(@RequestBody Rest1 r1) {
		log.info(r1);
		return "method7";
	}
	
	@RequestMapping(path="/ex7", consumes="text/plain")
	public String method7(@RequestBody String body) {
		log.info(body);
		return "method7";
	}
	
	@RequestMapping(path="/ex8", consumes=MediaType.APPLICATION_JSON_VALUE)
	public String method8(@RequestBody Rest1 r1) {
		log.info(r1);
		return "method8";
	}
	@RequestMapping(path="/ex9", consumes = {MediaType.APPLICATION_JSON_VALUE,
			MediaType.TEXT_PLAIN_VALUE})
	public String method9(@RequestBody String body) {
		log.info(body);
		return "method9";
	}
}
