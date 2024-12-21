package com.project.health.service;

import java.util.List;

import com.project.health.domain.Exercise;
import com.project.health.domain.ExerciseCategory;
import com.project.health.domain.ExercisePart;

public interface ExerciseServiceInterface {

	public List<ExerciseCategory> selectCategory() throws Exception;
	
	public List<ExercisePart> selectPart(int id) throws Exception;
	
	public List<Exercise> selectExercise(int id) throws Exception;
	
}
