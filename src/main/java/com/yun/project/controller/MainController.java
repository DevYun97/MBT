package com.yun.project.controller;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yun.project.dao.IboardDAO;
import com.yun.project.dao.InoticeDAO;
import com.yun.project.dto.Notice;

import lombok.extern.slf4j.Slf4j;

@Slf4j // 로깅에 대한 추상 레이어를 제공하는 인터페이스의 모음. 자동으로 log 변수 선언 / 변수명이 log로 고정 

//인터페이스를 사용하여 로깅을 구현하게 되면 좋은 점은 추후에 필요로 의해 로깅 라이브러리를 변경할 때 코드의 변경 없이 가능
//	log.trace("가장 디테일한 로그");    
//	log.warn("경고");
//	log.info("정보성 로그");
//	log.debug("디버깅용 로그");
//	log.error("에러",e);
@Controller
public class MainController {
	
	@Autowired
	IboardDAO boardDao;

	@Autowired
	InoticeDAO noticeDao;
	
	@RequestMapping("")
	public String root() {
		return "redirect:main";
	}
	
	@RequestMapping("main")
	public String main(
			@RequestParam Map<String, Object> map,
			Model model) {
		
		ArrayList<Notice> notice = noticeDao.mainNoticeShow();
		model.addAttribute("notice", notice);
		// 게시판
		if(map.isEmpty()) {
			map.put("pageNo", 1);
			map.put("listSize", 3);
		}
		ArrayList<Map<String, Object>> boardList = boardDao.getBoardList(map);
		model.addAttribute("board", boardList);
		return "main";
	}
			
}
