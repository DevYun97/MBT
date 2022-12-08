package com.yun.project.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.yun.project.dao.IboardDAO;
import com.yun.project.dao.IreplyDAO;

@Service
public class BoardService {
	
	@Autowired
	IboardDAO boardDao;
	@Autowired
	IreplyDAO replyDao;
	@Autowired
	pageNation pagenation;
	
	public String boardWrite(Map<String, Object> map) {
		int result = boardDao.insertBoard(map);
		if(result==1) {
			return "<script>alert('작성 성공');location.href='/MBT/board/board';</script>";
		}else {
			return "<script>alert('error: 작성 실패');history.back(-1);</script>";
		}	
	}
	
	public String replyWrite(Map<String, Object> map) {
		int result = replyDao.insertReply(map);
		if(result==1) {
			return "<script>alert('작성 성공');location.href='/MBT/board/board';</script>";
		}else {
			return "<script>alert('error: 작성 실패');history.back(-1);</script>";
		}	
	}

}