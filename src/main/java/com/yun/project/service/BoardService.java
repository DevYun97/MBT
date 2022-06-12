package com.yun.project.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

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
	@Autowired
	pageNation pagenation;
	
	public Model board(Map<String, Object> map, String curPage, Model model) {
		
		int boardCount = boardDao.boardCount(map);
		pagenation = pagenation.pagenation(curPage, boardCount);
		
		ArrayList<Map<String, Object>> boardList = boardDao.getBoardUserID(map);
		model.addAttribute("board", boardList);
		//model.addAttribute("page", pagenation);
		
		return model;
	}
	
	public String boardWrite(Map<String, Object> map) {
		int result = boardDao.insertBoard(map);
		if(result==1) {
			return "<script>alert('작성 성공');location.href='/board/board';</script>";
		}else {
			return "<script>alert('error: 작성 실패');history.back(-1);</script>";
		}	
	}
	
	public String replyWrite(Map<String, Object> map) {
		int result = replyDao.insertReply(map);
		if(result==1) {
			return "<script>alert('작성 성공');location.href='/board/board';</script>";
		}else {
			return "<script>alert('error: 작성 실패');history.back(-1);</script>";
		}	
	}

}