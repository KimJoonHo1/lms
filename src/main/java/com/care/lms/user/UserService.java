package com.care.lms.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.lms.member.MemberDTO;
import com.care.lms.mybatis.MemberMyBatis;

@Service
public class UserService {
	@Autowired
	MemberMyBatis memberMapper;
	
	public void my(String id, Model model) {
		MemberDTO dto = memberMapper.idcheck(id);
		if(dto.getDepartment().equals("Engineering")) {
			dto.setDepartmentStr("공학과");
		} else if(dto.getDepartment().equals("Literature")) {
			dto.setDepartmentStr("문헌정보학과");
		} else if(dto.getDepartment().equals("Japanese")) {
			dto.setDepartmentStr("일어문학과");
		}
		
		model.addAttribute("dto", dto);
	}
}
