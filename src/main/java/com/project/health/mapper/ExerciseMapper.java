package com.project.health.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.health.domain.Exercise;
import com.project.health.domain.ExerciseCategory;
import com.project.health.domain.ExercisePart;
import com.project.health.essential.WorkDiv;

@Mapper
public interface ExerciseMapper extends WorkDiv<ExerciseMapper> {
	
	public List<ExerciseCategory> selectCategory() throws Exception;
	
	public List<ExercisePart> selectPart(int id) throws Exception;
	
	public List<Exercise> selectExercise(int id) throws Exception;
}
