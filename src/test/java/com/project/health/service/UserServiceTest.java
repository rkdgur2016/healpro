package com.project.health.service;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.project.health.domain.User;
import com.project.health.essential.PLog;

@RunWith(SpringRunner.class) // 스프링 컨텍스트 프레임워크의 JUnit확장기능 지정
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml", "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
public class UserServiceTest implements PLog{

	@Autowired
	ApplicationContext context;
	
	@Autowired
	UserServiceInterface userService;
	
	User userVO01;
	User userVO02;
	
	@Before
	public void setUp() throws Exception {
		userVO01 = new User("lim", "1234", "강혁임", "lim@gmail.com","2001-01-16");
		userVO02 = new User("limrkdgur2016", "SS010216!");
	}
	
	@Test
	public void login() throws Exception{
		log.debug("┌────────────────────────────");
		log.debug("│ login()		");
		log.debug("└────────────────────────────");
		
		//1번째 유저 저장
		User user = userService.login(userVO02);
		log.debug("user : " + user);
		assertEquals(user.getUserId(), userVO02.getUserId());
		assertEquals(user.getUserPw(), userVO02.getUserPw());
	}
	
	@Ignore
	@Test
	public void join() throws Exception {
		log.debug("┌────────────────────────────");
		log.debug("│ join()						");
		log.debug("└────────────────────────────");
		
		//1번째 유저 저장
		int flag = userService.doRegister(userVO01);
		log.debug("flag : " + flag);
		assertEquals(1, flag);
		
	}
	
	@Ignore
	@Test
	public void idCheck() throws Exception {
		log.debug("┌────────────────────────────");
		log.debug("│ idCheck()					");
		log.debug("└────────────────────────────");
		
		int flag = userService.idCheck(userVO01.getUserId());
		log.debug("USER - ID : " + userVO01.getUserId());
		log.debug("flag : " + flag);
		
		assertEquals(1, flag);
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void beans() {
		log.debug("┌──────────────────────────────┐");
		log.debug("│ beans()                      │");
		log.debug("└──────────────────────────────┘");
		log.debug("context:" + context);
		log.debug("userService:" + userService);

		assertNotNull(context);
		assertNotNull(userService);

	}

}
