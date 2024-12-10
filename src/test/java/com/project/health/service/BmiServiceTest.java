package com.project.health.service;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.fail;
import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.ArrayList;
import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.project.health.domain.Bmi;
import com.project.health.essential.PLog;

@RunWith(SpringRunner.class) // 스프링 컨텍스트 프레임워크의 JUnit확장기능 지정
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml", "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
public class BmiServiceTest implements PLog{

	@Autowired
	ApplicationContext context;
	
	@Autowired
	BmiServiceInterface bmiService;
	
	Bmi bmiVO01;
	
	@Before
	public void setUp() throws Exception {
		bmiVO01 = new Bmi(18, 178.0, 63.0,(float)25.88,"저체중","2024-12-10 20:26:10");
	}
	
	@Test
	public void bmiRecord() throws Exception {
		log.debug("┌──────────────────────────────");
		log.debug("│ bmiRecored()                    ");
		log.debug("└──────────────────────────────");
		
		int flag = bmiService.bmiRecord(bmiVO01);
		log.debug("flag : " + flag);
		
		assertEquals(1, flag);
		
	}
	
	@Ignore
	@Test
	public void bmiList() throws Exception {
		log.debug("┌──────────────────────────────");
		log.debug("│ bmiList()                    ");
		log.debug("└──────────────────────────────");
		
		List<Bmi> bmiList = bmiService.bmiList(bmiVO01.getUserNo());
		
		for(Bmi bmi : bmiList) {
			log.debug("bmi : " + bmi);
		}
		
		assertEquals(2, bmiList.size());
		
	}

	@After
	public void tearDown() throws Exception {
	}

	@Ignore
	@Test
	public void beans() {
		log.debug("┌──────────────────────────────");
		log.debug("│ beans()                      ");
		log.debug("└──────────────────────────────");
		log.debug("context:" + context);
		log.debug("bmiService:" + bmiService);

		assertNotNull(context);
		assertNotNull(bmiService);

	}

}
