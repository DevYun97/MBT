package com.yun.project.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yun.project.dao.IqnaDAO;
import com.yun.project.dao.IuserDAO;
import com.yun.project.dto.Qna;
import com.yun.project.dto.User;
import com.yun.project.service.UserService;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	@Autowired
	IqnaDAO qnaDao;
	@Autowired
	IuserDAO userDao;
	@Autowired
	UserService userService;
	
	@RequestMapping("admin")
	public String admin(
				@RequestParam Map <String, Object> map,
				HttpSession session, Model model ){
		
				
			ArrayList<User> memList = userDao.userList(map);
			model.addAttribute("member", memList);
			return "admin/admin";
	}
	
	@RequestMapping("adminQna")
	public String adminQna(
			@RequestParam Map <String, Object> map,
			HttpSession session, Model model){
		
		/*
		 * String user_rank; try { user_rank = (String)
		 * session.getAttribute("user_rank"); } catch (NullPointerException e) {
		 * user_rank = null; } if( user_rank == null) { return
		 * "<script>location.href='../main';</script>"; } if( user_rank.equals("관리자") ||
		 * user_rank.equals("매니저") ) {
		 * 
		 * ArrayList<Qna> getQnaList = qnaDao.getQnaList(map);
		 * model.addAttribute("getQnaList", getQnaList); return
		 * "<script>location.href='adminQna';</script>"; } return
		 * "<script>location.href='../main';</script>";
		 */
			
			ArrayList<Qna> getQnaList = qnaDao.getQnaList(map);
			model.addAttribute("getQnaList", getQnaList);
			return "admin/adminQna";
	}
		
	  @RequestMapping("qnaAjax")	  
	  public String qnaAjax(	  
			  @RequestParam Map <String, Object> map,
			  HttpSession session, Model model ){	  
		  
		  	ArrayList<Qna> getQnaList = qnaDao.getQnaList(map);
			model.addAttribute("getQnaList", getQnaList);
			return "admin/qnaList";
			
	  }
	  
	  //회원 리스트 불러오기
	  @RequestMapping("member")
		public String member(
					@RequestParam Map <String, Object> map, Model model ){
					
				ArrayList<User> memList = userDao.userList(map);
				model.addAttribute("member", memList);
				return "admin/member";
		}
	  
	  //memberList Ajax
	  @RequestMapping("memAjax")	  
	  public String memAjax(	  
			  @RequestParam Map <String, Object> map,
			  Model model ){	  
		  	ArrayList<User> memList = userDao.userList(map);
			model.addAttribute("member", memList);
			return "admin/memList";
			
	  }
	  
	  //회원정보 상세보기
	  @RequestMapping("memberInfo")
		public String memberInfo( int user_idx, Model model ){
		  		User memInfo = userDao.getMemberInfo(user_idx);
		  		model.addAttribute("mem", memInfo);
				return "admin/memberInfo";
		}
	  
	  //관리자용 회원관리 (회원정보 복구)
	  @RequestMapping("memUseUpdate")
		@ResponseBody
		public String quitAction(
				@RequestParam ("user_idx") int user_idx,
				@RequestParam ("useYN") String useYN,
					HttpSession session, HttpServletRequest request ) {
			String result = userService.quit(user_idx, useYN);
			return result;
		
		}
	  
	  @RequestMapping("realQuit")
		@ResponseBody
		public String realQuit(
				@RequestParam ("user_idx") int user_idx,
					HttpSession session, HttpServletRequest request ) {
			String result = userService.realQuit(user_idx);
			return result;
		
		}
	  
}
