package com.care.lms.admin;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

@Controller
public class ManagerController {
	@Autowired
	ManagerService service;
	
	@RequestMapping("admin/userlist")
	public String userList(Model model, HttpServletRequest req) {
		String search = (String) req.getParameter("search");
		if(search == null) {
			search = "";
		}
		service.selectAllUser(model, search);
		return "/admin/user/list";
	}
	@RequestMapping(value= "admin/newuserlist")
	public String newUserList(Model model, HttpServletRequest req) {
		String search = (String) req.getParameter("search");
		if(search == null) {
			search = "";
		}
		service.selectNewUser(model, search);
		return "/admin/user/newUserList";
	}
	@RequestMapping(value="admin/approvaluser", method=RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map approvalUser(@RequestBody Map dto) {
		String id = (String) dto.get("id");
		service.approvalUser(id);
		return dto;
	}
	
	@RequestMapping(value="admin/subjectinsert")
	public String subjectInsert() {
		return "/admin/subject/insert";
	}
	
	@RequestMapping(value="admin/subjectinsert-1", method=RequestMethod.POST)
	public void subjectInsertCode(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html; charset=utf-8"); // 응답 설정 변경
		PrintWriter out = resp.getWriter(); // 화면에 출력할 스트림
		int result = service.subjectInsert(req);
		if(result == 0) {
			out.print("<script>alert('문제가 발생했습니다.');location.href='subjectinsert';</script>");
		} else {
			out.print("<script>alert('과목이 새로 추가되었습니다.');location.href='subjectlist';</script>");
		}
	}
	
	@RequestMapping("admin/subjectlist")
	public String subjectList(Model model) {
		service.subjectList(model);
		return "/admin/subject/list";
	}
	
	@RequestMapping("admin/subjectinfo")
	public String subjectInfo(Model model, HttpServletRequest req) {
		service.subjectInfo(model, req);
		return "/admin/subject/info";
	}
	
	@RequestMapping("admin/subjectupdate")
	public String subjectUpdate(Model model, HttpServletRequest req) {
		service.subjectInfo(model, req);
		return "admin/subject/update";
	}
	
	@RequestMapping(value="admin/subjectupdate-1", method=RequestMethod.POST)
	public void subjectUpdateCode(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html; charset=utf-8"); // 응답 설정 변경
		PrintWriter out = resp.getWriter(); // 화면에 출력할 스트림
		int result = service.subjectUpdate(req);
		if(result == 0) {
			out.print("<script>alert('문제가 발생했습니다.');location.href='subjectinsert';</script>");
		} else {
			out.print("<script>alert('과목 수정이 완료되었습니다.');location.href='subjectlist';</script>");
		}
	}
	
	@RequestMapping(value="admin/subjectinfo-2")
	public void subjectDelete(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html; charset=utf-8"); // 응답 설정 변경
		PrintWriter out = resp.getWriter(); // 화면에 출력할 스트림
		int result = service.subjectDelete(req);
		if(result == 0) {
			out.print("<script>alert('문제가 발생했습니다.');location.href='subjectinsert';</script>");
		} else {
			out.print("<script>alert('과목이 삭제되었습니다.');location.href='subjectlist';</script>");
		}
	}
	
	@RequestMapping("admin/lectureinsert")
	public String lectureInsert(Model model) {
		service.subjectList(model);
		return "admin/lecture/insert";
	}
	
	@RequestMapping(value="admin/lectureinsert-1", method=RequestMethod.POST)
	public void lectureInsertCode(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		int result = service.lectureInsert(req);
		if(result == 0) {
			out.print("<script>alert('문제가 발생했습니다.');location.href='lectureinsert';</script>");
		} else {
			out.print("<script>alert('강의가 개설되었습니다.');location.href='lecturelist';</script>");
		}
	}
	
	@RequestMapping(value="admin/lecturelist")
	public String lectureList(Model model) {
		service.lectureList(model);
		return "admin/lecture/list";
	}
	
	@RequestMapping(value="admin/lectureinfo")
	public String lectureList(Model model, HttpServletRequest req) {
		service.lectureInfo(model, req);
		return "/admin/lecture/info";
	}
	
	@RequestMapping(value="admin/lectureupdate")
	public String lectureUpdate(Model model, HttpServletRequest req) {
		service.lectureInfo(model, req);
		return "admin/lecture/update";
	}
	
	@RequestMapping(value="admin/lectureupdate-1", method=RequestMethod.POST)
	public void lectureUpdateCode(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		int result = service.lectureUpdate(req);
		if(result == 0) {
			out.print("<script>alert('문제가 발생했습니다.');location.href='lecturelist';</script>");
		} else {
			out.print("<script>alert('강의가 수정되었습니다.');location.href='lecturelist';</script>");
		}
	}
	
	@RequestMapping(value="admin/lecturedelete", method=RequestMethod.POST)
	public void lectureDelete(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		int result = service.lectureDelete(req);
		if(result == 0) {
			out.print("<script>alert('문제가 발생했습니다.');location.href='lecturelist';</script>");
		} else {
			out.print("<script>alert('강의가 폐강되었습니다.');location.href='lecturelist';</script>");
		}
	}
	
	@RequestMapping(value="admin/testinsert")
	public String testInsert(Model model) {
		service.lectureList(model);
		return "admin/test/insert";
	}
	
	@RequestMapping(value="admin/imgUp", produces="application/json; charset=utf-8", method=RequestMethod.POST)
	@ResponseBody
	public String imgUp(@RequestParam("file")MultipartFile file,HttpServletRequest req) {

		JsonObject json = new JsonObject();
		String root = "C:/lmsimg/";
		String originalname = file.getOriginalFilename();
		String savename = UUID.randomUUID()+originalname;
		File target = new File(root+savename);
		InputStream is;
		try {
			is = file.getInputStream();
			FileUtils.copyInputStreamToFile(is, target);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		json.addProperty("url", savename);
		String result = json.toString();
		return result;
	}
	
	@RequestMapping(value="admin/noticeinsert")
	public String noticeInsert() {
		return "admin/notice/insert";
	}
	
	@RequestMapping(value="admin/noticeinsert-1", method=RequestMethod.POST)
	public void noticeInsertCode(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		int result = service.noticeInsert(req);
		if(result == 0) {
			out.print("<script>alert('문제가 발생했습니다.');location.href='noticelist';</script>");
		} else {
			out.print("<script>alert('공지가 작성되었습니다.');location.href='noticelist';</script>");
		}
	}
	
	@RequestMapping(value="admin/noticelist")
	public String noticeList(HttpServletRequest req, Model model) {
		service.noticeList(req, model);
		return "admin/notice/list";
	}
	
	@RequestMapping(value="admin/noticeinfo")
	public String noticeInfo(HttpServletRequest req, Model model) {
		service.noticeInfo(req, model);
		return "admin/notice/info";
	}
	
	@RequestMapping(value="admin/noticeupdate")
	public String noticeUpdate(HttpServletRequest req, Model model, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		service.noticeInfo(req, model);
		if(model.getAttribute("dto") == null) {
			out.print("<script>alert('잘못된 접근입니다.');location.href='noticelist'</script>");
			return null;
		}
		return "admin/notice/update";
	}
	
	@RequestMapping(value="admin/noticeupdate-1", method=RequestMethod.POST)
	public void noticeUpdateCode(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		int result = service.noticeUpdate(req);
		if(result == 0) {
			out.print("<script>alert('문제가 발생했습니다.');location.href='noticelist';</script>");
		} else {
			out.print("<script>alert('공지가 수정되었습니다.');location.href='noticelist';</script>");
		}
	}
	@RequestMapping(value="admin/noticeinfo-2")
	public void noticeDelete(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		int result = service.noticeDelete(req);
		if(result == 0) {
			out.print("<script>alert('문제가 발생했습니다.');location.href='noticelist';</script>");
		} else {
			out.print("<script>alert('공지가 삭제되었습니다.');location.href='noticelist';</script>");
		}
	}
}
