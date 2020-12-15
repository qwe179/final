package com.devmg.app;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devmg.dto.Chat;
import com.devmg.service.ChatService;

@Controller
public class ChatRoomController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@Autowired
	private ChatService chatservice;
	
	
	@RequestMapping(value = "/chatroom", method = RequestMethod.GET)
	public String home(Locale locale, Model model,HttpServletRequest request) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		
		HttpSession session = request.getSession();
		
		//여기서sender=내아이디 reciever=상대아이디
		String sender = session.getAttribute("id").toString();
		String reciever=request.getParameter("id").toString();
		System.out.println("sender =" +sender);
		System.out.println("reciever =" +reciever);
		Chat chat = new Chat();
		
		chat.setReciever(reciever);
		chat.setSender(sender);
		
		//Service 메소드 호출
		List<Chat> list =chatservice.SelectMessageService(chat);
				
				//View에 모델값 전달
		model.addAttribute("list",list);
		
		return "chatRoom";
	}
}
