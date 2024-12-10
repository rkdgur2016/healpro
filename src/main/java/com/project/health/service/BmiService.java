package com.project.health.service;

import java.sql.SQLException;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.health.domain.Bmi;
import com.project.health.essential.PLog;
import com.project.health.mapper.BmiMapper;

@Service("bmiService")
public class BmiService implements BmiServiceInterface, PLog{
	
	@Autowired
	BmiMapper bmiMapper;
	
	public BmiService() {};

	@Override
	public List<Bmi> bmiList(int inVO) throws Exception {
		
		List<Bmi> bmiList = bmiMapper.bmiList(inVO);
		
		for(Bmi bmi : bmiList) {
			log.debug("inVO : " + bmi);
		}
		
		return bmiList;
	}

	@Override
	public int bmiRecord(Bmi inVO) throws Exception {
		
		log.debug("inVO : " + inVO);
		
		int flag = bmiMapper.bmiRecord(inVO);
		log.debug("flag : " + flag);
		
		return flag;
	}
	
}
