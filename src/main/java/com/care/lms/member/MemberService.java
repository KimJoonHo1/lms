package com.care.lms.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.care.lms.mybatis.MemberMyBatis;

@Service
public class MemberService {
	@Autowired
	MemberMyBatis mapper;
	
	public MemberDTO idcheck(String id) {
		return mapper.idcheck(id);
	}
	
	public MemberDTO emailcheck(String email) {
		return mapper.emailCheck(email);
	}
	public int membership(HttpServletRequest req) {
		MemberDTO dto = new MemberDTO();
		dto.setId(req.getParameter("id"));
		dto.setPwd(req.getParameter("pwd"));
		dto.setName(req.getParameter("name"));
		dto.setDepartment(req.getParameter("department"));
		dto.setEmail(req.getParameter("email"));
		dto.setStatus("0");
		return mapper.membership(dto);
	}
	public int loginCheck(String id, String pwd, HttpServletRequest req) {
		MemberDTO dto = new MemberDTO();
		HttpSession session = req.getSession();
		session.setMaxInactiveInterval(60*60);
		dto.setId(id);
		dto.setPwd(pwd);
		MemberDTO loginDto = mapper.loginCheck(dto);
		
		if(loginDto == null) {
			return 0;
		}
		if(loginDto.getId().equals("admin")) {
			session.setAttribute("loginUser", loginDto);
			return 3;
		}
		if(loginDto.getStatus().equals("1")) {
			session.setAttribute("loginUser", loginDto);
			return 2;
		}
		return 1;
		
	}
}
