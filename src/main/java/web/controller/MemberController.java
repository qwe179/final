package web.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.dto.Member;
import web.service.face.MemberService;

@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired private MemberService memberService;
	
	@RequestMapping(value="/member/main")
	public void main() { }
	
	@RequestMapping(value="/member/join", method=RequestMethod.GET)
	public void join() { }

	@RequestMapping(value="/member/join", method=RequestMethod.POST)
	public String joinProcess(Member writer) {
		boolean joinResult = memberService.join(writer);
		
		if(joinResult) {
			logger.info("회원가입 성공");
			return "redirect:/member/main";
			
		} else {
			logger.info("회원가입 실패");
			return "redirect:/member/join";
			
		}
		
	}

	@RequestMapping(value="/member/login", method=RequestMethod.GET)
	public void login() { }

	@RequestMapping(value="/member/login", method=RequestMethod.POST)
	public String loginProcess(
			Member writer,
			HttpSession session,
			Model model) {
		
		boolean loginResult = memberService.login(writer);
		
		if(loginResult) {
			logger.info("로그인 성공");
		
			session.setAttribute("login", true);
			session.setAttribute("id", writer.getId());
			session.setAttribute("nick", memberService.getUsernick(writer));
			
			logger.info("세션상태 : " + session.getAttribute("login"));
			logger.info("세션 아이디 : " + session.getAttribute("id"));
			logger.info("세션 닉네임 : " + session.getAttribute("nick"));
			
			return "redirect:/member/main";

		} else {
			logger.info("로그인실패");
			return "redirect:/member/login";
		}
		
	}

	@RequestMapping(value="/member/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/member/main";
	}
	
}
