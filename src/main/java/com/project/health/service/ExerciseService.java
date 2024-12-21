package com.project.health.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.health.domain.Exercise;
import com.project.health.domain.ExerciseCategory;
import com.project.health.domain.ExercisePart;
import com.project.health.essential.PLog;
import com.project.health.mapper.ExerciseMapper;

@Service("ExerciseService")
public class ExerciseService implements ExerciseServiceInterface, PLog {

	
	@Autowired
	ExerciseMapper exerciseMapper;
	
	public ExerciseService() {};
	
	
	@Override
	public List<ExerciseCategory> selectCategory() throws Exception {
		
		List<ExerciseCategory> categoryList = exerciseMapper.selectCategory();
		
		for(ExerciseCategory category : categoryList) {			
			log.debug(category);
		}
		
		return categoryList; 
	}


	@Override
	public List<ExercisePart> selectPart(int id) throws Exception {
		List<ExercisePart> partList = exerciseMapper.selectPart(id);
		
		for(ExercisePart part : partList) {			
			log.debug(part);
		}
		
		return partList; 
	}


	@Override
	public List<Exercise> selectExercise(int id) throws Exception {
		
		List<Exercise> exerciseList = exerciseMapper.selectExercise(id);
		
		for(Exercise exercise : exerciseList) {			
			log.debug(exercise);
		}
		
		return exerciseList; 
	}

}
