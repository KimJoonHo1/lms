package com.care.lms.admin;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.lms.dto.LectureDTO;
import com.care.lms.dto.SubjectDTO;
import com.care.lms.member.MemberDTO;
import com.care.lms.mybatis.LectureMyBatis;
import com.care.lms.mybatis.MemberMyBatis;
import com.care.lms.mybatis.SubjectMyBatis;

@Service
public class ManagerService {
	@Autowired
	MemberMyBatis memberMapper;
	
	@Autowired
	SubjectMyBatis subjectMapper;
	
	@Autowired
	LectureMyBatis lectureMapper;
	
	public void selectAllUser(Model model, String search) {
		ArrayList<MemberDTO> list = memberMapper.selectAllUser(search);
		for(MemberDTO dto : list) {
			if(dto.getDepartment().equals("Engineering")) {
				dto.setDepartmentStr("공학과");
			} else if(dto.getDepartment().equals("Literature")) {
				dto.setDepartmentStr("문헌정보학과");
			} else if(dto.getDepartment().equals("Japanese")) {
				dto.setDepartmentStr("일어문학과");
			} else if(dto.getDepartment().equals("관리")) {
				dto.setDepartmentStr("관리");
			}
		}
		model.addAttribute("list", list);
	}
	
	public void selectNewUser(Model model, String search) {
		ArrayList<MemberDTO> list = memberMapper.selectNewUser(search);
		for(MemberDTO dto : list) {
			if(dto.getDepartment().equals("Engineering")) {
				dto.setDepartmentStr("공학과");
			} else if(dto.getDepartment().equals("Literature")) {
				dto.setDepartmentStr("문헌정보학과");
			} else if(dto.getDepartment().equals("Japanese")) {
				dto.setDepartmentStr("일어문학과");
			}
		}
		model.addAttribute("list", list);
	}
	
	public int approvalUser(String id) {
		return memberMapper.approvalUser(id);
	}
	
	public int subjectInsert(HttpServletRequest req) {
		SubjectDTO dto = new SubjectDTO();
		dto.setName(req.getParameter("subname"));
		dto.setDepartment(req.getParameter("department"));
		dto.setScore(Integer.parseInt(req.getParameter("score")));
		dto.setLectureTime(Integer.parseInt(req.getParameter("time")));
		dto.setContent(req.getParameter("comment"));
		return subjectMapper.subjectInsert(dto);
	}
	
	public void subjectList(Model model) {
		ArrayList<SubjectDTO> list = subjectMapper.subjectList();
		for(SubjectDTO dto : list) {
			if(dto.getDepartment().equals("Engineering")) {
				dto.setDepartmentStr("공학과");
			} else if(dto.getDepartment().equals("Literature")) {
				dto.setDepartmentStr("문헌정보학과");
			} else if(dto.getDepartment().equals("Japanese")) {
				dto.setDepartmentStr("일어문학과");
			}
		}
		model.addAttribute("list", list);
	}
	
	public void subjectInfo(Model model, HttpServletRequest req) {
		int num = Integer.parseInt(req.getParameter("num"));
		SubjectDTO dto = subjectMapper.subjectInfo(num);
		if(dto.getDepartment().equals("Engineering")) {
			dto.setDepartmentStr("공학과");
		} else if(dto.getDepartment().equals("Literature")) {
			dto.setDepartmentStr("문헌정보학과");
		} else if(dto.getDepartment().equals("Japanese")) {
			dto.setDepartmentStr("일어문학과");
		}
		model.addAttribute("dto", dto);
	}
	
	public int subjectUpdate(HttpServletRequest req) {
		SubjectDTO dto = new SubjectDTO();
		dto.setNum(Integer.parseInt(req.getParameter("num")));
		dto.setName(req.getParameter("subname"));
		dto.setDepartment(req.getParameter("department"));
		dto.setScore(Integer.parseInt(req.getParameter("score")));
		dto.setLectureTime(Integer.parseInt(req.getParameter("time")));
		dto.setContent(req.getParameter("comment"));
		return subjectMapper.subjectUpdate(dto);
	}
	
	public int subjectDelete(HttpServletRequest req) {
		int num = Integer.parseInt(req.getParameter("num"));
		return subjectMapper.subjectDelete(num);
	}
	
	public int lectureInsert(HttpServletRequest req) {
		SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd");
		
		LectureDTO dto = new LectureDTO();
		int num = Integer.parseInt(req.getParameter("subname"));
		SubjectDTO subDto = subjectMapper.subjectInfo(num);
		dto.setLecturemaxperso(Integer.parseInt(req.getParameter("perso")));
		dto.setLectureperso(0);
		String lectureWeek = req.getParameter("lectureWeek");
		Date date1 = null;
		Date date2 = null;
		try {
			 date1 = new Date(sm.parse(req.getParameter("startDate")).getTime());
			 date2 = new Date(sm.parse(req.getParameter("endDate")).getTime());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Calendar cal1 = Calendar.getInstance();
		Calendar cal2 = Calendar.getInstance();
		cal1.setTime(date1);
		cal2.setTime(date2);
		
		
		if(lectureWeek.equals("1")) {
			dto.setLectureweek("월요일");
		} else if(lectureWeek.equals("2")) {
			dto.setLectureweek("화요일");
		} else if(lectureWeek.equals("3")) {
			dto.setLectureweek("수요일");
		} else if(lectureWeek.equals("4")) {
			dto.setLectureweek("목요일");
		} else if(lectureWeek.equals("5")) {
			dto.setLectureweek("금요일");
		}
		String lectureDate = req.getParameter("lectureDate");
		int endTime = 0;
		if(lectureDate.equals("1")) {
			dto.setLectureDate("AM 09:00");
			cal1.add(Calendar.HOUR, 9);
			endTime = 9 + subDto.getLectureTime();
		} else if(lectureDate.equals("2")) {
			dto.setLectureDate("AM 10:00");
			cal1.add(Calendar.HOUR, 10);
			endTime = 10 + subDto.getLectureTime();
		} else if(lectureDate.equals("3")) {
			dto.setLectureDate("PM 01:00");
			cal1.add(Calendar.HOUR, 13);
			endTime = 13 + subDto.getLectureTime();
		} else if(lectureDate.equals("4")) {
			dto.setLectureDate("PM 02:00");
			cal1.add(Calendar.HOUR, 14);
			endTime = 14 + subDto.getLectureTime();
		} else if(lectureDate.equals("5")) {
			dto.setLectureDate("PM 03:00");
			cal1.add(Calendar.HOUR, 15);
			endTime = 15 + subDto.getLectureTime();
		} else if(lectureDate.equals("6")) {
			dto.setLectureDate("PM 04:00");
			cal1.add(Calendar.HOUR, 16);
			endTime = 16 + subDto.getLectureTime();
		}
		cal2.add(Calendar.HOUR, endTime);
		
		date1 = cal1.getTime();
		date2 = cal2.getTime();
		
		Timestamp startDate = new Timestamp(date1.getTime());
		Timestamp endDate = new Timestamp(date2.getTime());
		dto.setStartdate(startDate);
		dto.setEndDate(endDate);
		dto.setDepartment(subDto.getDepartment());
		dto.setSubjectname(subDto.getName());
		return lectureMapper.lectureInsert(dto);
	}
	
	public void lectureList(Model model) {
		ArrayList<LectureDTO> list = lectureMapper.lectureList();
		for(LectureDTO dto : list) {
			if(dto.getDepartment().equals("Engineering")) {
				dto.setDepartmentStr("공학과");
			} else if(dto.getDepartment().equals("Literature")) {
				dto.setDepartmentStr("문헌정보학과");
			} else if(dto.getDepartment().equals("Japanese")) {
				dto.setDepartmentStr("일어문학과");
			}
		}
		model.addAttribute("list", list);
	}
	
	public void lectureInfo(Model model, HttpServletRequest req) {
		int num = Integer.parseInt(req.getParameter("num"));
		LectureDTO dto = lectureMapper.lectureInfo(num);
		if(dto.getDepartment().equals("Engineering")) {
			dto.setDepartmentStr("공학과");
		} else if(dto.getDepartment().equals("Literature")) {
			dto.setDepartmentStr("문헌정보학과");
		} else if(dto.getDepartment().equals("Japanese")) {
			dto.setDepartmentStr("일어문학과");
		}
		model.addAttribute("dto", dto);
	}
	
	public int lectureUpdate(HttpServletRequest req) {
		LectureDTO dto = new LectureDTO();
		SubjectDTO subDto = subjectMapper.subjectInfo2(req.getParameter("subname"));
		dto.setNum(Integer.parseInt(req.getParameter("num")));
		dto.setLecturemaxperso(Integer.parseInt(req.getParameter("perso")));
		String lectureWeek = req.getParameter("lectureWeek");
		SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd");
		Date date1 = null;
		Date date2 = null;
		try {
			 date1 = new Date(sm.parse(req.getParameter("startDate")).getTime());
			 date2 = new Date(sm.parse(req.getParameter("endDate")).getTime());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(lectureWeek.equals("1")) {
			dto.setLectureweek("월요일");
		} else if(lectureWeek.equals("2")) {
			dto.setLectureweek("화요일");
		} else if(lectureWeek.equals("3")) {
			dto.setLectureweek("수요일");
		} else if(lectureWeek.equals("4")) {
			dto.setLectureweek("목요일");
		} else if(lectureWeek.equals("5")) {
			dto.setLectureweek("금요일");
		}
		String lectureDate = req.getParameter("lectureDate");
		int endTime = 0;
		Calendar cal1 = Calendar.getInstance();
		Calendar cal2 = Calendar.getInstance();
		cal1.setTime(date1);
		cal2.setTime(date2);
		if(lectureDate.equals("1")) {
			dto.setLectureDate("AM 09:00");
			cal1.add(Calendar.HOUR, 9);
			endTime = 9 + subDto.getLectureTime();
		} else if(lectureDate.equals("2")) {
			dto.setLectureDate("AM 10:00");
			cal1.add(Calendar.HOUR, 10);
			endTime = 10 + subDto.getLectureTime();
		} else if(lectureDate.equals("3")) {
			dto.setLectureDate("PM 01:00");
			cal1.add(Calendar.HOUR, 13);
			endTime = 13 + subDto.getLectureTime();
		} else if(lectureDate.equals("4")) {
			dto.setLectureDate("PM 02:00");
			cal1.add(Calendar.HOUR, 14);
			endTime = 14 + subDto.getLectureTime();
		} else if(lectureDate.equals("5")) {
			dto.setLectureDate("PM 03:00");
			cal1.add(Calendar.HOUR, 15);
			endTime = 15 + subDto.getLectureTime();
		} else if(lectureDate.equals("6")) {
			dto.setLectureDate("PM 04:00");
			cal1.add(Calendar.HOUR, 16);
			endTime = 16 + subDto.getLectureTime();
		}
		cal2.add(Calendar.HOUR, endTime);
		
		date1 = cal1.getTime();
		date2 = cal2.getTime();
		
		Timestamp startDate = new Timestamp(date1.getTime());
		Timestamp endDate = new Timestamp(date2.getTime());
		dto.setStartdate(startDate);
		dto.setEndDate(endDate);
		return lectureMapper.lectureUpdate(dto);
	}
	
	public int lectureDelete(HttpServletRequest req) {
		int num = Integer.parseInt(req.getParameter("num"));
		return lectureMapper.lectureDelete(num);
	}
}
