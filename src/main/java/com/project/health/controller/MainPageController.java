package com.project.health.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.health.domain.Bmi;
import com.project.health.domain.Exercise;
import com.project.health.domain.ExerciseCategory;
import com.project.health.domain.ExercisePart;
import com.project.health.domain.User;
import com.project.health.essential.PLog;
import com.project.health.service.BmiService;
import com.project.health.service.ExerciseService;

@Controller
@RequestMapping("main")
public class MainPageController implements PLog{
	
	@Autowired
	BmiService bmiService;
	
	@Autowired
	ExerciseService exerciseService;
	
	public MainPageController() {
		log.debug("┌───────────────────────────");
		log.debug("│ MainPageController()      ");
		log.debug("└───────────────────────────");
	}
	
	
	@RequestMapping(value = "/bmiRecord.do", method = RequestMethod.POST)
	@ResponseBody
	public int bmiRecord(Bmi inVO) throws Exception {
		log.debug("┌───────────────────────────");
		log.debug("│ bmiRecord()  ");
		log.debug("└───────────────────────────");
		
		inVO.setUserNo((int)inVO.getUserNo());
		log.debug("inVO : " + inVO);
		
		int flag = bmiService.bmiRecord(inVO);
		log.debug("flag : " + flag);
		
		return flag;
	}
	
	@RequestMapping(value="/selectPart.do",method = RequestMethod.POST)
	@ResponseBody
	public List<Exercise> selectPart(int id) throws Exception{
		
		List<Exercise> exerciseList = exerciseService.selectExercise(id);
		
		return exerciseList;
	}
	
	@RequestMapping(value="/selectCategory.do",method = RequestMethod.POST)
	@ResponseBody
	public List<ExercisePart> selectCategory(int id) throws Exception{
		
		List<ExercisePart> partList = exerciseService.selectPart(id);
		
		return partList;
	}
	
	@RequestMapping(value = "/main.do", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String moveToPage(HttpSession session,Model model) throws Exception {
		log.debug("┌───────────────────────────");
		log.debug("│ main Page Loading -->   ");
		log.debug("└───────────────────────────");
		
		String viewName = "main/mainPage";
		
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
		
		List<ExerciseCategory> category = exerciseService.selectCategory();
		model.addAttribute("exerciseCategory", category);
		
		return viewName;
	}
}
