package com.yun.project.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yun.project.dao.IfaqDAO;
import com.yun.project.dao.InoticeDAO;
import com.yun.project.dao.IqnaDAO;
import com.yun.project.dao.IuserDAO;
import com.yun.project.dto.Faq;
import com.yun.project.dto.Notice;
import com.yun.project.dto.Qna;
import com.yun.project.service.CustomerService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("customer")
public class CustomerController {
	@Autowired
	IfaqDAO faqDao;
	@Autowired
	CustomerService customerService;
	@Autowired
	InoticeDAO noticeDao;
	@Autowired
	IqnaDAO qnaDao;
	@Autowired
	IuserDAO userDao;

	//자주하는 질문
	@RequestMapping("faq")
	public String faq(Model model) {
		
		ArrayList<Faq> getFaqList = faqDao.getFaqList();
		model.addAttribute("getFaqList", getFaqList);
		return "customer/faq";
	}
	
	@PostMapping("faqWriteAction")
	@ResponseBody
	public String faqWriteAction(@ModelAttribute Faq faq) {		
		String result = customerService.faqWrite(faq);
		return result;
	}
	
	@RequestMapping("faqDeleteAction")
	@ResponseBody
	public String faqDeleteAction(@RequestParam ("faq_idx") int faq_idx) {		
		int result = faqDao.deleteFaq(faq_idx);
		if(result == 1) {
			return "<script>alert('삭제 성공'); location.href='/customer/faq';</script>";
		}
		else {
			return "<script>alert('삭제 실패'); location.href='/customer/faq';</script>";
		}
	}
	
	// 공지사항
	@RequestMapping("notice")
	public String notice(Model model) {

		ArrayList<Notice> getNoticeList = noticeDao.getNoticeList();
		model.addAttribute("getNoticeList", getNoticeList);
		
		return "customer/notice";
	}
	
	@RequestMapping("noticeDetail")
	public String noticeDetail(@RequestParam ("notice_idx") int notice_idx, Model model) {
		Notice getNoticeDetail = noticeDao.getNoticeInfo(notice_idx);
		model.addAttribute("dto", getNoticeDetail);
		System.out.println(getNoticeDetail);
		return "customer/noticeDetail";
		
	}
	
	@RequestMapping("noticeWrite")
	public String noticeWrite() {
		return "customer/noticeWrite";
	}
	
	@PostMapping("noticeWriteAction")
	@ResponseBody
	public String noticeWriteAction(@ModelAttribute Notice notice) {
		String result = customerService.noticeWrite(notice);
		System.out.println(result);
		return result;
	}
	
	@RequestMapping("noticeModify")
	public String noticeModify(@RequestParam ("notice_idx") int notice_idx, Model model) {
		Notice getNoticeDetail = noticeDao.getNoticeInfo(notice_idx);
		model.addAttribute("notice", getNoticeDetail);
		return "customer/noticeWrite";
	}
	
	@PostMapping("noticeModifyAction")
	@ResponseBody
	public String noticeModifyAction(@ModelAttribute Notice notice) {
		String result = customerService.noticeUpdate(notice);
		System.out.println(result);
		return result;
	}
	
	@RequestMapping("noticeDeleteAction")
	@ResponseBody
	public String noticeDeleteAction(@RequestParam ("notice_idx") int notice_idx) {		
		int result = noticeDao.deleteNotice(notice_idx);
		if(result == 1) {
			return "<script>alert('삭제 성공'); location.href='/customer/notice';</script>";
		}
		else {
			return "<script>alert('삭제 실패'); location.href='/customer/notice';</script>";
		}
	}
		
	//문의하기
	@RequestMapping("qna")
	public String qna( Model model) {	
		ArrayList<Qna> getQnaList = qnaDao.getQnaListCat(0);
		model.addAttribute("getQnaList", getQnaList);
		
		return "customer/qna";
	}
	
	@RequestMapping("qnaDetail")
	public String qnaDetail(@RequestParam ("qna_idx") int qna_idx, Model model) {
		
		Qna getQnaDetail = qnaDao.getQnaDetail(qna_idx);
		model.addAttribute("qna", getQnaDetail);
		System.out.println(getQnaDetail);
		return "customer/qnaDetail";
	}
	
	@RequestMapping("qnaWrite")
	public String qnaWrite(Model model) {
		
		return "customer/qnaWrite";
	}
	
	//내 문의하기
	@RequestMapping("oneToOne")
	public String oneToOne( HttpSession session, Model model ) {
		String user_id;
		
		try {
			user_id = (String) session.getAttribute("user_id");
		} catch (Exception e) {
			log.error("{}",e);
			return "user/login";
		}
		
		ArrayList<Qna> getOneToList = qnaDao.getOneToList(user_id);
		model.addAttribute("getOneToList", getOneToList);
		return "customer/oneToOne";
	}
		
	@RequestMapping("oneToWrite")
	public String oneToWrite() {
		return "customer/oneToWrite";
	}
	
	@PostMapping("qnaWriteAction")
	@ResponseBody
	public String qnaWriteAction(
			@ModelAttribute Qna qna, 
			HttpSession session ) {
				
		try {
			String result = customerService.qnaWrite(qna);
			System.out.println(result);
			return result;
		} catch (Exception e) {
			log.error("로그인하지 않은 사용자.");
			return "<script>location.href='qnaWrite'</script>";
		}	
	}
	
	@PostMapping("qnaReplyAction")
	@ResponseBody
	public String qnaReplyAction( @ModelAttribute Qna qna ) {
		String result = customerService.qnaReply(qna);
		
		return result;
	}
	
	@RequestMapping("qnaDeleteAction")
	@ResponseBody
	public String qnaDeleteAction(@RequestParam ("qna_idx") int qna_idx) {		
		int result = qnaDao.deleteQna(qna_idx);
		if(result == 1) {
			return "<script>alert('삭제 성공'); location.href='/customer/qna';</script>";
		}
		else {
			return "<script>alert('삭제 실패'); location.href='/customer/qna';</script>";
		}
	}
	
}
