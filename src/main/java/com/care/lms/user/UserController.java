package com.care.lms.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.care.lms.member.MemberDTO;

@Controller
public class UserController {
	@Autowired
	UserService service;
	
	@RequestMapping(value="user/home")
	public String home() {
		return "user/home/home";
	}
	
	@RequestMapping(value="user/my")
	public String my(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		MemberDTO dto = (MemberDTO) session.getAttribute("loginUser");
		service.my(dto.getId(), model);
		return "user/my/my";
	}
}
