package com.yun.project.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yun.project.dao.IboardDAO;
import com.yun.project.dao.IreplyDAO;
import com.yun.project.dao.IuserDAO;
import com.yun.project.dto.Board;
import com.yun.project.dto.Reply;
import com.yun.project.service.BoardService;
import com.yun.project.service.pageNation;

@Controller
@RequestMapping("board")
public class BoardController {
	@Autowired
	IboardDAO boardDao;
	@Autowired
	BoardService boardService;
	@Autowired
	IreplyDAO replyDao;
	@Autowired
	IuserDAO userDao;
	
	@Autowired
	pageNation pagenation;
	
	@RequestMapping("board")
	public String board( 
			@RequestParam Map<String, Object> map,
			Model model ) {
		
		if( map.isEmpty() ) {	// 값 초기화 세팅 
			map.put("startNumOfRow", 1);
			map.put("endNumOfRow", 15);
		}
		
		int total = boardDao.boardCount(map);
		int curPage = Integer.parseInt(map.get("total").toString()); 
		pagenation.pagenation(curPage, total);
		//ArrayList<Board> getBoardList = boardDao.getBoardList(map);
		ArrayList<Map<String, Object>> boardList = boardDao.getBoardUserID(map);
		
//		model.addAttribute("getBoardList", getBoardList);	
		
		  /*if(map.isEmpty()) { map.put("pageNo", 1); map.put("listSize", 5); } 
		   * int count = boardDao.boardCount(map);
		  String curPage = map.get("pageNo").toString();
		
		  model.addAttribute("board", boardList);*/	
		
		//ArrayList<Map<String, Object>> boardList = boardDao.getBoardUserID(map);
		//model = boardService.board(map, curPage, model);
		//model.addAttribute("board",getBoardList);
		model.addAttribute("board",boardList);
		model.addAttribute("page", pagenation);
		return "board/board";
	}
	
	@RequestMapping("boardDetail")
	public String boardDetail(			
			@RequestParam ("board_idx") int board_idx, 
			Model model) {
	
		//게시글 상세보기
		boardDao.updateBoardHit(board_idx);
		Board getBoardDetail = boardDao.getBoardDetail(board_idx);		
		model.addAttribute("board", getBoardDetail);
		System.out.println(getBoardDetail);
		
		//댓글 불러오기
		List<Reply> getReplyList = replyDao.getReplyList(board_idx);		
		model.addAttribute("getReplyList", getReplyList);
		
		//댓글 갯수 조회
		int ReplyCount = replyDao.getReplyIdx(board_idx);
		model.addAttribute("reCount", ReplyCount);
				
		return "board/boardDetail";
	}
	
	@RequestMapping("boardWrite")
	public String boardWrite() {
		
		return "board/boardWrite";
	}
	
	@PostMapping("boardWriteAction")
	@ResponseBody
	public String boardWriteAction(
			@RequestParam Map<String, Object> map,
			HttpSession session, Model model ) {
		
		String user_id = (String) session.getAttribute("user_id");
		if( user_id.isEmpty() ) {
			return "<script>alert('로그인 정보를 다시 확인해주세요.'); location.href='../main';</script>";
		}
		map.put("user_id", user_id);  
		String result = boardService.boardWrite(map);
		return result;
	}
	
	@RequestMapping("boardUpdate")
	public String boardUpdate(@RequestParam ("board_idx") int board_idx, Model model) {
		Board getBoardDetail = boardDao.getBoardDetail(board_idx);
		model.addAttribute("board", getBoardDetail);
		return "board/boardWrite";
	}
	
	@RequestMapping("boardUpdateAction")
	@ResponseBody
	public String boardUpdateAction(@ModelAttribute Board board) {
		int result = boardDao.updateBoard(board);
		if(result == 1) {
			return "<script>alert('수정 성공'); location.href='/board/board';</script>";
		}
		else {
			return "<script>alert('수정 실패'); location.href='/board/boardWrite';</script>";
		}			
	}
	
	@RequestMapping("boardDeleteAction")
	@ResponseBody
	public String boardDeleteAction(@RequestParam ("board_idx") int board_idx) {
		int result = boardDao.deleteBoard(board_idx);
		if(result == 1) {
			return "<script>alert('삭제 성공'); location.href='/board/board';</script>";
		}
		else {
			return "<script>alert('삭제 실패'); location.href='/board/board';</script>";
		}			
	}
	
	@PostMapping("replyWriteAction")
	@ResponseBody
	public String replyWriteAction(
			@RequestParam Map<String, Object> map,
			HttpSession session) {
		
		String user_id = (String) session.getAttribute("user_id");
		if( user_id.isEmpty()  ) {
			return "<script>alert('로그인 정보를 다시 확인해주세요.'); location.href='../main';</script>";
		}		
		map.put("user_id", user_id);
		String result = boardService.replyWrite(map);
		return result;
	}

}
