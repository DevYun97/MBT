package com.yun.project.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.yun.project.dto.Notice;

@Mapper
public interface InoticeDAO {
	
	public ArrayList<Notice> getNoticeList();
	
	public Notice getNoticeInfo(int notice_idx);
	
	public int insertNotice(Notice notice);
	
	public int updateNotice(Notice notice);
	
	public int deleteNotice(int notice_idx);

}
