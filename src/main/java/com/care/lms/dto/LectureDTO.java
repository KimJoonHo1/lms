package com.care.lms.dto;

import java.sql.Timestamp;

public class LectureDTO {
	private int num;
	private String subjectname;
	private String department;
	private String departmentStr;
	private String lectureweek;
	private String lectureDate;
	private int lecturemaxperso;
	private int lectureperso;
	private Timestamp startdate;
	private Timestamp endDate;
	
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
	public String getSubjectname() {
		return subjectname;
	}
	public void setSubjectname(String subjectname) {
		this.subjectname = subjectname;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getLectureweek() {
		return lectureweek;
	}
	public void setLectureweek(String lectureweek) {
		this.lectureweek = lectureweek;
	}
	public String getLectureDate() {
		return lectureDate;
	}
	public void setLectureDate(String lectureDate) {
		this.lectureDate = lectureDate;
	}
	public int getLecturemaxperso() {
		return lecturemaxperso;
	}
	public void setLecturemaxperso(int lecturemaxperso) {
		this.lecturemaxperso = lecturemaxperso;
	}
	public int getLectureperso() {
		return lectureperso;
	}
	public void setLectureperso(int lectureperso) {
		this.lectureperso = lectureperso;
	}
	public Timestamp getStartdate() {
		return startdate;
	}
	public void setStartdate(Timestamp startdate) {
		this.startdate = startdate;
	}
	public Timestamp getEndDate() {
		return endDate;
	}
	public void setEndDate(Timestamp endDate) {
		this.endDate = endDate;
	}
	
}
