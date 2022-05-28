package com.yun.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yun.project.dao.IboardDAO;
import com.yun.project.dao.IreplyDAO;
import com.yun.project.dto.Board;
import com.yun.project.dto.Reply;

@Service
public class BoardService {
	
	@Autowired
	IboardDAO boardDao;
	@Autowired
	IreplyDAO replyDao;
	
	public String boardWrite(Board board) {
		int result = boardDao.insertBoard(board);
		if(result==1) {
			return "<script>alert('작성 성공');location.href='/board/board';</script>";
		}else {
			return "<script>alert('error: 작성 실패');history.back(-1);</script>";
		}	
	}
	
	public String replyWrite(Reply reply) {
		int result = replyDao.insertReply(reply);
		if(result==1) {
			return "<script>alert('작성 성공');location.href='/board/board';</script>";
		}else {
			return "<script>alert('error: 작성 실패');history.back(-1);</script>";
		}	
	}

}