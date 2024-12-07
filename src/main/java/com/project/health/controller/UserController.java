package com.project.health.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.health.essential.PLog;
import com.project.health.service.UserServiceInterface;

@Controller
@RequestMapping("user")
public class UserController implements PLog{
	
	@Autowired
	@Qualifier("userService")
	UserServiceInterface userServiceInterface;
	
	public UserController() {
		log.debug("┌───────────────────────────┐");
		log.debug("│ UserController()          │");
		log.debug("└───────────────────────────┘");
	}
	
	@RequestMapping(value = "/join.do"
			, method = RequestMethod.GET
			, produces = "text/plain;charset=UTF-8")
	public String moveToPage(HttpSession httpSession) throws Exception {
		log.debug("┌───────────────────────────┐");
		log.debug("│ Page Loading -->          │");
		log.debug("└───────────────────────────┘");
		
		String viewName = "join/join";
		
		return viewName;
	}
	
}
