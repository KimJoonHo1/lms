package com.care.lms.dto;

public class SubjectDTO {
	private int num;
	private String name;
	private String department;
	private String departmentStr;
	private int score;
	private int lectureTime;
	private String content;
	
	public String getDepartmentStr() {
		return departmentStr;
	}
	public void setDepartmentStr(String departmentStr) {
		this.departmentStr = departmentStr;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public int getLectureTime() {
		return lectureTime;
	}
	public void setLectureTime(int lectureTime) {
		this.lectureTime = lectureTime;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
