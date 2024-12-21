package com.project.health.domain;

public class ExerciseFinal {
	
	//운동 종류, 운동부위, 운동명, 이미지 링크
	private String category;
	private String part;
	private String exercise;
	private String img_link;
	
	public ExerciseFinal() {}

	public ExerciseFinal(String category, String part, String exercise, String img_link) {
		super();
		this.category = category;
		this.part = part;
		this.exercise = exercise;
		this.img_link = img_link;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getPart() {
		return part;
	}

	public void setPart(String part) {
		this.part = part;
	}

	public String getExercise() {
		return exercise;
	}

	public void setExercise(String exercise) {
		this.exercise = exercise;
	}

	public String getImg_link() {
		return img_link;
	}

	public void setImg_link(String img_link) {
		this.img_link = img_link;
	}

	@Override
	public String toString() {
		return "Exercise [category=" + category + ", part=" + part + ", exercise=" + exercise + ", img_link=" + img_link
				+ "]";
	}
	
}
