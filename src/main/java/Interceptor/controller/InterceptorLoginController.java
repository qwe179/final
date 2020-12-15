package Interceptor.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
public class InterceptorLoginController {

	private static final Logger logger = LoggerFactory.getLogger(InterceptorLoginController.class);
	
	@RequestMapping(value = "/interceptor/login",method=RequestMethod.GET)
	public void loginForm() {}
	
}