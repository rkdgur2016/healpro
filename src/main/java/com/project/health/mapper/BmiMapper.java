package com.project.health.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.health.domain.Bmi;
import com.project.health.essential.WorkDiv;

@Mapper
public interface BmiMapper extends WorkDiv<Bmi>{
	
	public List<Bmi> bmiList(int inVO) throws Exception;
	
	public int bmiRecord(Bmi inVO) throws Exception;
}
