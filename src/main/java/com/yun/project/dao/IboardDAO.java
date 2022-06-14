package com.yun.project.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.yun.project.dto.Board;

@Mapper
public interface IboardDAO {
	
	//게시글 리스트 불러오기
	public ArrayList<Map<String, Object>> getBoardList(Map<String, Object> map);
	
	//게시글 상세보기
	public Board getBoardDetail(int board_idx);
	
	//게시글 작성
	public int insertBoard(Map<String, Object> map);
	
	//게시글 삭제
	public int deleteBoard(int board_idx);
	
	//조횟수 상승 기능
	public int updateBoardHit(int board_idx);

	//게시글 수정
	public int updateBoard(Board board);

	//게시글 갯수 불러오기
	public int boardCount(Map<String, Object> map);

}
