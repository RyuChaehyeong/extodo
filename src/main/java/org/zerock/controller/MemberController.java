package org.zerock.controller;

import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
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
	
	@GetMapping("/findid")
	public void findId() {
		
	}
	
	
	@PostMapping("/findid")
	public String findId(String email, RedirectAttributes rttr, Model model) {
		
		String id = service.get(email);
		model.addAttribute("id", id);
		
		String host = "smtp.naver.com";
		String user = "fluid15@naver.com";
		String password = "0519chae^^&";
		
		String to_email = email;
		
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 465);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		 for(int i=0;i<10;i++)
         {
             int rIndex = rnd.nextInt(3);
             switch (rIndex) {
             case 0:
                 // a-z
                 temp.append((char) ((int) (rnd.nextInt(26)) + 97));
                 break;
             case 1:
                 // A-Z
                 temp.append((char) ((int) (rnd.nextInt(26)) + 65));
                 break;
             case 2:
                 // 0-9
                 temp.append((rnd.nextInt(10)));
                 break;
             }
         }
		
		 String AuthenticationKey = temp.toString();
		 model.addAttribute("AuthenticationKey", temp);
		 
         Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
             protected PasswordAuthentication getPasswordAuthentication() {
                 return new PasswordAuthentication(user,password);
             }
         });
         
         //email ����
         try {
             MimeMessage msg = new MimeMessage(session);
             msg.setFrom(new InternetAddress(user, "���������¸�����"));
             msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));
             
             //���� ����
             msg.setSubject("[�̸�������][���̵�ã��]������ ���¸����� ���������Դϴ�.");
             //���� ����
             msg.setText("�ȳ��ϼ���. �������� ���¸������Դϴ�.\nȨ���������� ���� ������ȣ�� �Է��ϼ���.\n���� ��ȣ :"+temp);
             
             Transport.send(msg);
             System.out.println("�̸��� ����");
             
         }catch (Exception e) {
             e.printStackTrace();// TODO: handle exception
         }
         
		return "/member/authnum";
	}
	
	@PostMapping("/authnum")
	public String authnum(String serverKey, String userKey, String id, Model model) {
		if (serverKey.equals(userKey)) {
			model.addAttribute("id", id);
			
		} else {
			model.addAttribute("failMsg", "������ȣ�� ��ġ���� �ʽ��ϴ�.");
		}
		
		return "/member/yourid";
	}
	
	@PostMapping("/yourid")
	public void yourid() {
		
	}
	
	
	@GetMapping("/findpw")
	public void findpw() {
		
	}
	
	
}
