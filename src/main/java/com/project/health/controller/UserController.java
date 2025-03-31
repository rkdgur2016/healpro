package com.project.health.controller;

import java.io.File;
import java.sql.SQLException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.health.domain.Bmi;
import com.project.health.domain.User;
import com.project.health.essential.PLog;
import com.project.health.service.BmiService;
import com.project.health.service.UserService;

@Controller
@RequestMapping("user")
public class UserController implements PLog{
	
	@Autowired
	UserService userService;
	@Autowired
	BmiService bmiService;
	
	public UserController() {
		log.debug("┌───────────────────────────┐");
		log.debug("│ UserController()          │");
		log.debug("└───────────────────────────┘");
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
	
	@RequestMapping(value = "/profileUpdate.do"
			   , produces = "text/plain;charset=UTF-8") 
	@ResponseBody
	public int profileUpdate(String userId, @RequestParam(value = "imgFile", required = false) MultipartFile imgFile, HttpSession session) throws Exception {
		log.debug("┌───────────────────────────────────────┐");
		log.debug("│ UserController : profileUpdate()");
		log.debug("└───────────────────────────────────────┘");
		//세션에서 user 가져오고 user.id(pk) 가져와서 user.profile 고치는 식으로
		//user.profile은 user.profile 유효성 검사 해서 null일 경우 UUID 생성해서 넣고
		// null이 아닐 경우 기존 프로필 삭제 후 UUID 생성해서 넣기.
		
		 User user = (User) session.getAttribute("userId");
		 
		 String newProfileName = null;

		    // 이미지 파일이 존재할 경우 처리
		    if (imgFile != null && !imgFile.isEmpty()) {
		        // UUID를 생성해서 새로운 파일명 지정
		        String uuid = UUID.randomUUID().toString();
		        String originalFilename = imgFile.getOriginalFilename();
		        String extension = originalFilename.substring(originalFilename.lastIndexOf("."));
		        newProfileName = uuid + extension;

		        // 저장할 경로 설정 (예: "/upload/profile/")
		        String savePath = "C:/Users/windows10/git/healpro/src/main/webapp/resources/img/profile/" + newProfileName;
		        File saveFile = new File(savePath);

		        // 기존 프로필 이미지 삭제 (있다면)
		        if (user.getProfile() != null) {
		            File oldFile = new File("C:/Users/windows10/git/healpro/src/main/webapp/resources/img/profile/" + user.getProfile());
		            if (oldFile.exists()) {
		                oldFile.delete();
		            }
		        }

		        // 파일 저장
		        imgFile.transferTo(saveFile);
		    }

		    // 사용자 프로필 정보 업데이트
		    user.setProfile(newProfileName);
		    int result = userService.updateProfile(user);

		    return result;
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
