package com.project.health.domain;

public class Exercise {
	
	private int id;
	private int partId;
	private String name;
	
	public Exercise() {
		super();
	}
	
	public Exercise(int id, int partId, String name) {
		super();
		this.id = id;
		this.partId = partId;
		this.name = name;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPartId() {
		return partId;
	}
	public void setPartId(int partId) {
		this.partId = partId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "Exercise [id=" + id + ", partId=" + partId + ", name=" + name + ", toString()=" + super.toString()
				+ "]";
	}
	
}
