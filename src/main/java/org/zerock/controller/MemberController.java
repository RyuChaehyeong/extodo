package org.zerock.controller;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.domain.AuthVO;
import org.zerock.domain.MemberVO;
import org.zerock.service.MemberService;
import org.zerock.service.TodoService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
@AllArgsConstructor
public class MemberController {


	private MemberService service;
	private PasswordEncoder pwencoder;
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/register")
	public String register(MemberVO vo, AuthVO authVo) {
		String bfPw = vo.getPassword();
		vo.setPassword(pwencoder.encode(bfPw));
		service.register(vo);
		service.registerAuth(authVo);
		
		return "redirect:/todo/list";
		
		
	}
}
