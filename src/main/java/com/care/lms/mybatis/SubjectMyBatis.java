package com.care.lms.mybatis;

import java.util.ArrayList;

import com.care.lms.dto.SubjectDTO;

public interface SubjectMyBatis {
	public int subjectInsert(SubjectDTO dto);
	public ArrayList<SubjectDTO> subjectList();
	public SubjectDTO subjectInfo(int num);
	public SubjectDTO subjectInfo2(String name);
	public int subjectUpdate(SubjectDTO dto);
	public int subjectDelete(int num);
}
