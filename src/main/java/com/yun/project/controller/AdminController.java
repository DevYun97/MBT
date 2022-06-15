package com.yun.project.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		
		String user_rank = (String) session.getAttribute("user_rank");
		
		if( user_rank == "관리자" || user_rank == "매니저" ) {
			
			ArrayList<Qna> getQnaList = qnaDao.getQnaList(map);
			model.addAttribute("getQnaList", getQnaList);
			return "admin/adminQna";
		}
		
			return "../main";		
	}
	
	@RequestMapping("qnaAjax")
	public String qnaAjax(
			@RequestParam Map <String, Object> map,
			HttpSession session, Model model){
		
		String user_rank = (String) session.getAttribute("user_rank");
		
		if( user_rank == "관리자" || user_rank == "매니저" ) {
			
			ArrayList<Qna> getQnaList = qnaDao.getQnaList(map);
			
			model.addAttribute("getQnaList", getQnaList);
			return "admin/qnaList";
		}
		
			return "../main";		
	}

}
