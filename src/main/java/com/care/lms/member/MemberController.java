package com.care.lms.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {
	@Autowired
	MemberService service;
	
	@RequestMapping("login")
	public String login() {
		return "member/login";
	}
	
	@RequestMapping("join")
	public String join() {
		return "member/membership";
	}
	@RequestMapping(value="idcheck", method=RequestMethod.POST, produces="application/json; charset=utf-8")
	@ResponseBody
	public Map idcheck(@RequestBody Map dto) {
		String id= (String)dto.get("id");
		Map map = new HashMap();
		map.put("idcheck", service.idcheck(id));
		return map;
	}
	@RequestMapping(value="emailcheck", method=RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map emailcheck(@RequestBody Map dto) {
		String email = (String)dto.get("email");
		Map map = new HashMap();
		map.put("emailcheck", service.emailcheck(email));
		return map;
	}
	
	@RequestMapping(value="membership", method=RequestMethod.POST)
	public void membership(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html; charset=utf-8"); // 응답 설정 변경
		PrintWriter out = resp.getWriter(); // 화면에 출력할 스트림
		int result = service.membership(req);
		if(result == 0) {
			out.print("<script> alert('에러가 발생했습니다.');"
					+"location.href='join'; </script>");
		} else {
			out.print("<script> alert('회원가입 신청이 완료되었습니다.\\n가입 승인까지 기달려주세요.');"
					+"location.href='login'; </script>");
		}
	}
	
	@RequestMapping(value="login/1", method=RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map loginCheck(@RequestBody Map dto, HttpServletRequest req) {
		String id = (String) dto.get("id");
		String pwd = (String) dto.get("pwd");
		Map map = new HashMap();
		int result = service.loginCheck(id, pwd, req);
		map.put("login", result);
		return map;
	}
	
	@RequestMapping(value="logout")
	public void logout(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html; charset=utf-8"); // 응답 설정 변경
		PrintWriter out = resp.getWriter(); // 화면에 출력할 스트림
		HttpSession session = req.getSession();
		session.invalidate();
		out.print("<script>alert('로그아웃 되었습니다.');location.href='login';</script>");
	}

}
