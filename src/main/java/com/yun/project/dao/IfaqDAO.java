package com.yun.project.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.yun.project.dto.Faq;

@Mapper
public interface IfaqDAO {
	//자주하는 질문리스트 불러오기
		public ArrayList<Faq> getFaqList();
		//자주하는 질문 작성
		public int insertFaq(Faq faq); 
		//자주하는 질문 수정 
		//자주하는 질문 삭제
		public int deleteFaq(int faq_idx);

}
