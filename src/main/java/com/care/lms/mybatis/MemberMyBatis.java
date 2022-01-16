package com.care.lms.mybatis;

import java.util.ArrayList;

import com.care.lms.member.MemberDTO;

public interface MemberMyBatis {
	public MemberDTO idcheck(String id);
	public MemberDTO emailCheck(String email);
	public int membership(MemberDTO dto);
	public MemberDTO loginCheck(MemberDTO dto);
	public ArrayList<MemberDTO> selectAllUser(String search);
	public ArrayList<MemberDTO> selectNewUser(String search);
	public int approvalUser(String id);
}
