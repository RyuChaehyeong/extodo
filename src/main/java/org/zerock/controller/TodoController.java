package org.zerock.controller;

import java.util.List;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.domain.TodoVO;
import org.zerock.service.TodoService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/todo/*")
@AllArgsConstructor
public class TodoController {
	
	private TodoService service;
	
	@GetMapping("/main")
	public void main() {
	}
	
	/*
	@GetMapping("/list")
	public void list(Model model) {
		log.info("list");
		model.addAttribute("list", service.getList());
	}
	*/
	
	@GetMapping("/list")
	public void list(@ModelAttribute("cri") Criteria cri, Model model) {
		List<TodoVO> list = service.getListWithPaging(cri);
		int total = service.getTotal(cri);
		PageDTO dto = new PageDTO(cri, total);
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", dto);
	}
	//list의 @ModelAttribute("cri")는 왜썼냐면
	//안붙여줬을 때 navbar에서 criteria로 model에서 꺼냇기 때문에 
	//cri라는 이름을 인식을 못해서 다시 이름을 써준 것이다. 
	
	@GetMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public void register(@ModelAttribute("cri") Criteria cri) {
		
	}
	
	@PostMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public String register(TodoVO todo ,RedirectAttributes rttr) {
		log.info("register: " + todo);
		
		service.register(todo);
		
		rttr.addFlashAttribute("result", todo.getNum());
		rttr.addFlashAttribute("message", todo.getNum() + "번 글이 등록되었습니다.");
		
		
		return "redirect:/todo/list";
	}
	
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("num") Long num, @ModelAttribute("cri") Criteria cri, Model model) {
		
		log.info(cri);
		model.addAttribute("todo", service.get(num));
		//model.addAttribute("cri", cri);
	}
	//@ModelAttribute("cri") 이거 안쓰고 싶으면 jsp에서 criteria로 사용
	
	
	@PreAuthorize("principal.username == #todo.writer")
	@PostMapping("/modify")
	public String modify(TodoVO todo, Criteria cri, RedirectAttributes rttr) {
		log.info("modify:" + todo);
		
		if (service.modify(todo)) {
			//flashAttribute는 query String 으로 붙지 않음
			rttr.addFlashAttribute("result", "success");
			rttr.addFlashAttribute("message", todo.getNum() + "번 글이 수정되었습니다.");
			//Attribute로 해야 query String 으로 붙는다.
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/todo/list";
	}
	
	@PreAuthorize("principal.username == #writer")
	@PostMapping("/remove")
	public String remove(@RequestParam("num") Long num, Criteria cri, RedirectAttributes rttr, String writer) {
		
		if (service.remove(num)) {
			rttr.addFlashAttribute("result", "success");
			rttr.addFlashAttribute("message", num + "번 글이 삭제되었습니다.");
			
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/todo/list";
	}
}
