package com.project.health.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.health.domain.User;
import com.project.health.essential.PLog;
import com.project.health.service.UserService;

@Controller
@RequestMapping("user")
public class UserController implements PLog{
	
	@Autowired
	UserService userService;
	
	public UserController() {
		log.debug("┌───────────────────────────┐");
		log.debug("│ UserController()          │");
		log.debug("└───────────────────────────┘");
	}
	
	@RequestMapping(value="/join.do", method=RequestMethod.POST)
	@ResponseBody
	public int join(User inVO) throws Exception {
		log.debug("┌───────────────────────────");
		log.debug("│ join()                 ");
		log.debug("└───────────────────────────");
		
		int flag= 0;
		
		log.debug("1.param:" + inVO);
		flag  = userService.doRegister(inVO);
		log.debug("2. 성공(1), 실패(0) : " + flag);
		
		return flag;
	}
	
	@RequestMapping(value="/idCheck.do", method=RequestMethod.GET)
	@ResponseBody
	public int idCheck(String userId) throws Exception {
		log.debug("┌───────────────────────────");
		log.debug("│ idCheck()                 ");
		log.debug("└───────────────────────────");
		
		int flag= 0;
		
		log.debug("1.param:" + userId);
		flag  = userService.idCheck(userId);
		log.debug("2. 존재(1), 존재하지 않음(0) : " + flag);
		
		return flag;
	}
	
	
	@RequestMapping(value = "/join.do", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String moveToPage(HttpSession httpSession) throws Exception {
		log.debug("┌───────────────────────────┐");
		log.debug("│ Page Loading -->          │");
		log.debug("└───────────────────────────┘");
		
		String viewName = "join/join";
		
		return viewName;
	}
	
}
