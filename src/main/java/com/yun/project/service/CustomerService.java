package com.yun.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yun.project.dao.IfaqDAO;
import com.yun.project.dao.InoticeDAO;
import com.yun.project.dao.IqnaDAO;
import com.yun.project.dto.Faq;
import com.yun.project.dto.Notice;
import com.yun.project.dto.Qna;

@Service
public class CustomerService {
	@Autowired
	IfaqDAO faqDao;
	@Autowired
	InoticeDAO noticeDao;
	@Autowired
	IqnaDAO qnaDao;

	public String faqWrite(Faq faq) {
		
		int result = faqDao.insertFaq(faq);
		String returnString = "<script>alert('작성 실패'); location.href='/customer/faq'</script>";
		if (result == 1) {
			returnString = "<script>alert('작성 성공'); location.href='/customer/faq'</script>";
		}
		return returnString;
	}
	
	public String noticeWrite(Notice notice) {
		
		int result = noticeDao.insertNotice(notice);
		String returnString = "<script>alert('작성 실패'); location.href='/customer/notice'</script>";
		System.out.println(notice);
		if (result == 1) {
			returnString = "<script>alert('작성 성공'); location.href='/customer/notice'</script>";
		}
		return returnString;
	}
	
	public String noticeUpdate(Notice notice) {
		
		int result = noticeDao.updateNotice(notice);
		if(result==1) {
			return "<script>alert('공지사항 수정');location.href='../customer/notice';</script>";
		} else {
			return "<script>alert('error: 확인후 다시 시도해주세요.');history.back(-1);</script>";
		}
	}
	
	public String qnaWrite(Qna qna) {
	
		int result = qnaDao.insertQna(qna);
		String returnString = "<script>alert('작성 실패'); location.href='/customer/qna'</script>";
		System.out.println(qna);
		if (result == 1) {
			returnString = "<script>alert('작성 성공'); location.href='/customer/qna'</script>";
		}
		return returnString;
	}
	
	public String qnaReply(Qna qna) {
		int result = qnaDao.qnaReplyWrite(qna);
		if(result==1) {
			return "<script>alert('작성 성공');location.href='/customer/qna';</script>";
		}else {
			return "<script>alert('error: 작성 실패');history.back(-1);</script>";
		}	
	}
}
