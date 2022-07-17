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
	
		//게시글 상세보기
		boardDao.updateBoardHit(board_idx);
		Board getBoardDetail = boardDao.getBoardDetail(board_idx);		
		model.addAttribute("board", getBoardDetail);
		
		//게시글 이미지 불러오기
		BoardIMG boardImg = boardIMGDao.getBoardImgFile(board_idx);
		model.addAttribute("bImg", boardImg);
				
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
			@RequestParam("filename") MultipartFile file,
			HttpSession session, Model model ) throws UnsupportedEncodingException {
		
		// 게시글 총 갯수 가져옴.
		int board_idx = boardDao.OnePlusBoardCount();
		if( file.isEmpty() == false ) {
			//업로드 파일 처리 
			String board_img = fileUploadService.uploadFile(file);
			BoardIMG boardImg = BoardIMG.builder().board_idx(board_idx).board_img(board_img).build();
			int fileInsert = boardIMGDao.boardFile(boardImg);
			System.out.println("파일 등록 성공");
		} else {
			System.out.println("파일 등록 실패");
		}
		
		String user_id = (String) session.getAttribute("user_id");
		if( user_id.isEmpty() ) {
			return "<script>alert('로그인 정보를 다시 확인해주세요.'); location.href='../main';</script>";
		}
		map.put("user_id", user_id);
		
		String result = boardService.boardWrite(map);
		return result;
	}
	
	@RequestMapping("boardUpdate")
	public String boardUpdate(@RequestParam ("board_idx") int board_idx, Model model) throws UnsupportedEncodingException {
		
		Board getBoardDetail = boardDao.getBoardDetail(board_idx);
		model.addAttribute("board", getBoardDetail);
		
		//게시글 이미지 불러오기
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
			log.info("이미지 변경 없음");
		} else {
			
			String board_img = fileUploadService.uploadFile(file);
			BoardIMG boardImg = BoardIMG.builder().board_idx(board_idx).board_img(board_img).build();
			
			int boardImgs = boardIMGDao.updateBoardImg(boardImg);
			System.out.println("이미지 변경");
		}
				
		int result = boardDao.updateBoard(board);
		if(result == 1) {
			return "<script>alert('수정 성공'); location.href='/board/board';</script>";
		}
		else {
			return "<script>alert('수정 실패'); location.href='/board/boardWrite';</script>";
		}			
	}
	
	//
	public static final String FILE_PATH = "/Users/yundahye/Documents/GitHub/MBT/src/main/resources/static";
	
	@RequestMapping("boardDeleteAction")
	@ResponseBody
	public String boardDeleteAction(@RequestParam ("board_idx") int board_idx) {
		
		String boardImg = boardIMGDao.checkBoardIMG(board_idx);
		
		if( boardImg == null) { // 삭제할 파일 유무 확인
			log.info("삭제할 이미지 파일이 존재하지 않음");
		} else {
			
			String path = FILE_PATH;
			File deleteFile = new File(path+boardImg);
			
	        deleteFile.delete(); // 서버 내 파일 삭제
	        System.out.println("서버 내 파일 삭제 성공");
			// DB 파일 삭제
			int deleteBoardImg = boardIMGDao.deleteBoardImg(board_idx);
			if(deleteBoardImg ==1) {  
				System.out.println("DB 삭제 성공");
			} else {
				System.out.println("DB 삭제 실패");
			}

		}
				
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
