package com.project.health.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.health.domain.Bmi;
import com.project.health.domain.User;
import com.project.health.essential.PLog;
import com.project.health.service.BmiService;
import com.project.health.service.ExerciseService;

@Controller
@RequestMapping("myPage")
public class MyPageController implements PLog{
		
	@Autowired
	BmiService bmiService;
	@Autowired
	ExerciseService exerciseService;

	public MyPageController() {
		log.debug("┌───────────────────────────");
		log.debug("│ MyPageController()      ");
		log.debug("└───────────────────────────");
	}
	
	@GetMapping(value = "/myPage.do")
	public String moveToMyPage(HttpSession session, Model model) throws Exception {
		
		String viewName = "myPage/myPage";
		
		if (session != null) {
	        try {
	        	log.debug("session : " + session);
	        	
	        	User user = (User) session.getAttribute("user");
	            List<Bmi> bmiList = bmiService.bmiList(user.getUserNo());

                model.addAttribute("bmiList", bmiList);

	        } catch (Exception e) {
	            log.debug("세션이 없습니다.");
	        }
	    } else {
	        log.debug("세션이 없습니다.");
	    }
		
		return viewName;
	}
}
