package com.care.lms.member;

public class MemberDTO {
	private String id;
	private String pwd;
	private String name;
	private String department;
	private String departmentStr;
	private String email;
	private String status;
	
	public String getDepartmentStr() {
		return departmentStr;
	}
	public void setDepartmentStr(String departmentStr) {
		this.departmentStr = departmentStr;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
}
