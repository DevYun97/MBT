package com.yun.project.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.yun.project.dto.Qna;

@Mapper
public interface IqnaDAO {
	
		//adminQnaList
		public ArrayList<Qna> getQnaList();
		
		//qna List
		public ArrayList<Qna> getQnaListCat(int qna_cat);
		
		//oneToOne List
		public ArrayList<Qna> getOneToList(String user_id);
		
		public int insertQna(Qna qna);
		
		public int insertQnaReply(Qna qna);
		
		//댓글달기
		public int qnaReplyWrite(Qna qna);
		
		public Qna getQnaDetail(int qna_idx);
		
		public int deleteQna(int qna_idx);

}
