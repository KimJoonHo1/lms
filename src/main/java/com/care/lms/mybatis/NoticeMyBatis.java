package com.care.lms.mybatis;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.care.lms.dto.NoticeDTO;

public interface NoticeMyBatis {
	public int noticeInsert(NoticeDTO dto);
	public ArrayList<NoticeDTO> noticelist(@Param("s")int start, @Param("e")int end, @Param("search")String search);
	public int noticeCount(String search);
	public NoticeDTO noticeInfo(int num);
	public int noticeUpdate(NoticeDTO dto);
	public int noticeDelete(int num);
}
