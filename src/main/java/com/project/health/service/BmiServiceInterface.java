package com.project.health.service;

import java.util.List;

import com.project.health.domain.Bmi;

public interface BmiServiceInterface{
	
	public List<Bmi> bmiList(int inVO) throws Exception;
	
	public int bmiRecord(Bmi inVO) throws Exception;
	
}
