package com.project.health.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.UUID;

import javax.mail.Message;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.project.health.domain.Bmi;
import com.project.health.domain.User;
import com.project.health.essential.PLog;
import com.project.health.service.BmiService;
import com.project.health.service.ExerciseService;
import com.project.health.service.UserService;

@Controller
@RequestMapping("myPage")
public class MyPageController implements PLog{
		
	@Autowired
	BmiService bmiService;
	@Autowired
	ExerciseService exerciseService;

	public MyPageController() {
		log.debug("┌───────────────────────────");
		log.debug("│ MyPageController()      	");
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
