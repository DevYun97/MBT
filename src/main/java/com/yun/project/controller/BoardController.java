package com.yun.project.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
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
import org.springframework.web.multipart.MultipartFile;
import com.yun.project.dao.IboardDAO;
import com.yun.project.dao.IboardIMGDAO;
import com.yun.project.dao.IreplyDAO;
import com.yun.project.dao.IuserDAO;
import com.yun.project.dto.Board;
import com.yun.project.dto.BoardIMG;
import com.yun.project.dto.Reply;
import com.yun.project.dto.pageDTO;
import com.yun.project.service.BoardService;
import com.yun.project.service.FileUploadService;
import com.yun.project.service.pageNation;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping("board")
public class BoardController {
	@Autowired
	IboardDAO boardDao;
	@Autowired
	IboardIMGDAO boardIMGDao;
	@Autowired
	BoardService boardService;
	@Autowired
	IreplyDAO replyDao;
	@Autowired
	IuserDAO userDao;	
	@Autowired
	pageNation pagenation;
	@Autowired
	FileUploadService fileUploadService ;
	
	@RequestMapping("board")
	public String board( 
			@RequestParam Map<String, Object> map,
			Model model ) {
		
		if(map.isEmpty()) {
			map.put("pageNo", 1);
			map.put("listSize", 5);
		}
		
		int count = boardDao.boardCount(map);
		int curPage = Integer.parseInt(map.get("pageNo").toString()); 

		pageDTO page = new pageDTO(count, curPage);
		
		ArrayList<Map<String, Object>> boardList = boardDao.getBoardList(map);
		
		model.addAttribute("board",boardList);
		model.addAttribute("page", page);
		model.addAttribute("sch", map);
		return "board/board";
	}
	
	@RequestMapping("boardDetail")
	public String boardDetail(			
			@RequestParam ("board_idx") int board_idx, 
			Model model) {
	
		//????????? ????????????
		boardDao.updateBoardHit(board_idx);
		Board getBoardDetail = boardDao.getBoardDetail(board_idx);		
		model.addAttribute("board", getBoardDetail);
		
		//????????? ????????? ????????????
		BoardIMG boardImg = boardIMGDao.getBoardImgFile(board_idx);
		model.addAttribute("bImg", boardImg);
				
		//?????? ????????????
		List<Reply> getReplyList = replyDao.getReplyList(board_idx);		
		model.addAttribute("getReplyList", getReplyList);
		
		//?????? ?????? ??????
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
			@RequestParam("filename") MultipartFile file,
			HttpSession session, Model model ) throws UnsupportedEncodingException {
		
		// ????????? ??? ?????? ?????????.
		int board_idx = boardDao.OnePlusBoardCount();
		if( file.isEmpty() == false ) {
			//????????? ?????? ?????? 
			String board_img = fileUploadService.uploadFile(file);
			BoardIMG boardImg = BoardIMG.builder().board_idx(board_idx).board_img(board_img).build();
			int fileInsert = boardIMGDao.boardFile(boardImg);
			System.out.println("?????? ?????? ??????");
		} else {
			System.out.println("?????? ?????? ??????");
		}
		
		String user_id = (String) session.getAttribute("user_id");
		if( user_id.isEmpty() ) {
			return "<script>alert('????????? ????????? ?????? ??????????????????.'); location.href='../main';</script>";
		}
		map.put("user_id", user_id);
		
		String result = boardService.boardWrite(map);
		return result;
	}
	
	@RequestMapping("boardUpdate")
	public String boardUpdate(@RequestParam ("board_idx") int board_idx, Model model) throws UnsupportedEncodingException {
		
		Board getBoardDetail = boardDao.getBoardDetail(board_idx);
		model.addAttribute("board", getBoardDetail);
		
		//????????? ????????? ????????????
		BoardIMG boardImg = boardIMGDao.getBoardImgFile(board_idx);
		model.addAttribute("bImg", boardImg);
	
		return "board/boardWrite";
	}
	
	@RequestMapping("boardUpdateAction")
	@ResponseBody
	public String boardUpdateAction(
				@ModelAttribute Board board,
				int board_idx,
				@RequestParam("filename") MultipartFile file ) throws UnsupportedEncodingException {
		
		if( file.isEmpty()) {
			log.info("????????? ?????? ??????");
		} else {
			
			String board_img = fileUploadService.uploadFile(file);
			BoardIMG boardImg = BoardIMG.builder().board_idx(board_idx).board_img(board_img).build();
			
			int boardImgs = boardIMGDao.updateBoardImg(boardImg);
			System.out.println("????????? ??????");
		}
				
		int result = boardDao.updateBoard(board);
		if(result == 1) {
			return "<script>alert('?????? ??????'); location.href='/board/board';</script>";
		}
		else {
			return "<script>alert('?????? ??????'); location.href='/board/boardWrite';</script>";
		}			
	}
	
	//
	public static final String FILE_PATH = "/Users/yundahye/Documents/GitHub/MBT/src/main/resources/static";
	
	@RequestMapping("boardDeleteAction")
	@ResponseBody
	public String boardDeleteAction(@RequestParam ("board_idx") int board_idx) {
		
		String boardImg = boardIMGDao.checkBoardIMG(board_idx);
		
		if( boardImg == null) { // ????????? ?????? ?????? ??????
			log.info("????????? ????????? ????????? ???????????? ??????");
		} else {
			
			String path = FILE_PATH;
			File deleteFile = new File(path+boardImg);
			
	        deleteFile.delete(); // ?????? ??? ?????? ??????
	        System.out.println("?????? ??? ?????? ?????? ??????");
			// DB ?????? ??????
			int deleteBoardImg = boardIMGDao.deleteBoardImg(board_idx);
			if(deleteBoardImg ==1) {  
				System.out.println("DB ?????? ??????");
			} else {
				System.out.println("DB ?????? ??????");
			}

		}
				
		int result = boardDao.deleteBoard(board_idx);
		
		if(result == 1) {
			return "<script>alert('?????? ??????'); location.href='/board/board';</script>";
		}
		else {
			return "<script>alert('?????? ??????'); location.href='/board/board';</script>";
		}			
	}
	
	@PostMapping("replyWriteAction")
	@ResponseBody
	public String replyWriteAction(
			@RequestParam Map<String, Object> map,
			HttpSession session) {
		
		String user_id = (String) session.getAttribute("user_id");
		if( user_id.isEmpty()  ) {
			return "<script>alert('????????? ????????? ?????? ??????????????????.'); location.href='../main';</script>";
		}		
		map.put("user_id", user_id);
		String result = boardService.replyWrite(map);
		return result;
	}

}
