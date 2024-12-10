package com.project.health.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
	
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	@ResponseBody
	public User login(User inVO, HttpSession session) throws Exception {
		log.debug("┌───────────────────────────");
		log.debug("│ login()                 ");
		log.debug("└───────────────────────────");
		
		log.debug("1.param:" + inVO);
		log.debug("2.userId:" + inVO.getUserId());
		log.debug("3.userPw:" + inVO.getUserPw());
		
		User outVO  = userService.login(inVO);
		log.debug("4. user : " + outVO);
		
		if (outVO != null) {
	        // 로그인 성공 시 세션에 사용자 정보 저장
	        session.setAttribute("user", outVO);
	        log.debug("5. Session user : " + session.getAttribute("user"));
	    }
		
		return outVO;
	}
	
	@GetMapping(value = "/logout.do")
	public String logout(HttpSession session) throws SQLException{
		log.debug("┌───────────────────────────");
		log.debug("│ logout()                  ");
		log.debug("└───────────────────────────");
		
		session.invalidate(); //세션 끊기
		
		return "redirect:/main/main.do";
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
	
	@RequestMapping(value = "/loginPage.do", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String moveToLoginPage() throws Exception {
		log.debug("┌───────────────────────────");
		log.debug("│ login Page Loading -->    ");
		log.debug("└───────────────────────────");
		
		String viewName = "join/login";
		
		return viewName;
	}
	
	@RequestMapping(value = "/joinPage.do", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String moveToJoinPage() throws Exception {
		log.debug("┌───────────────────────────");
		log.debug("│ join Page Loading -->     ");
		log.debug("└───────────────────────────");
		
		String viewName = "join/join";
		
		return viewName;
	}
	
}
