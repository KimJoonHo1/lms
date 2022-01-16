package com.care.lms.admin;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.care.lms.member.MemberDTO;


public class ManagerInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		MemberDTO dto = (MemberDTO) session.getAttribute("loginUser");
		if(dto == null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>alert('잘못된 접근입니다.');"
					+ "location.href = '"+request.getContextPath() + "/login';</script>");
			return false;
		}
		return true;
	}

	
	
}