package com.yun.project.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yun.project.dao.IqnaDAO;
import com.yun.project.dto.Qna;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	@Autowired
	IqnaDAO qnaDao;
	
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
	  //@ResponseBody 
	  public String qnaAjax(	  
			  @RequestParam Map <String, Object> map,
			  HttpSession session, Model model ){	  
		  
		  	ArrayList<Qna> getQnaList = qnaDao.getQnaList(map);
			model.addAttribute("getQnaList", getQnaList);
			return "admin/qnaList";
			
	  }
}
