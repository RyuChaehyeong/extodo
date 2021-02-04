package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
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
	
	@GetMapping("/list")
	public void list(Model model) {
		log.info("list");
		model.addAttribute("list", service.getList());
	}
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/register")
	public String register(TodoVO todo, RedirectAttributes rttr) {
		log.info("register: " + todo);
		
		service.register(todo);
		
		rttr.addFlashAttribute("result", todo.getNum());
		rttr.addFlashAttribute("message", todo.getNum() + "번 글이 등록되었습니다.");
		
		return "redirect:/todo/list";
	}
	
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("num") Long num, Model model) {
		model.addAttribute("todo", service.get(num));
	}
	
	@PostMapping("/modify")
	public String modify(TodoVO todo, RedirectAttributes rttr) {
		log.info("modify:" + todo);
		
		if (service.modify(todo)) {
			rttr.addFlashAttribute("result", "success");
			rttr.addFlashAttribute("message", todo.getNum() + "번 글이 수정되었습니다.");
		}
		
		return "redirect:/todo/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("num") Long num, RedirectAttributes rttr) {
		if (service.remove(num)) {
			rttr.addFlashAttribute("result", "success");
			rttr.addFlashAttribute("message", num + "번 글이 삭제되었습니다.");
		}
		return "redirect:/todo/list";
	}
}
