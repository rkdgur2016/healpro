package com.project.health.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.health.essential.PLog;

@Controller
@RequestMapping("main")
public class MainPageController implements PLog{
	
	public MainPageController() {
		log.debug("┌───────────────────────────");
		log.debug("│ MainPageController()      ");
		log.debug("└───────────────────────────");
	}
	
	@RequestMapping(value = "/main.do", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String moveToPage(HttpSession httpSession) throws Exception {
		log.debug("┌───────────────────────────┐");
		log.debug("│ main Page Loading -->   ");
		log.debug("└───────────────────────────┘");
		
		String viewName = "main/mainPage";
		
		return viewName;
	}
}
