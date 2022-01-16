package com.care.lms.mybatis;

import java.util.ArrayList;

import com.care.lms.dto.LectureDTO;

public interface LectureMyBatis {
	public int lectureInsert(LectureDTO dto);
	public ArrayList<LectureDTO> lectureList();
	public LectureDTO lectureInfo(int num);
	public int lectureUpdate(LectureDTO dto);
	public int lectureDelete(int num);
}
