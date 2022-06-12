package com.yun.project.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.yun.project.dto.Board;

@Mapper
public interface IboardDAO {
	public ArrayList<Board> getBoardList(Map<String, Object> map);
	
	public Board getBoardDetail(int board_idx);
	
	public ArrayList<Map<String, Object>> getBoardUserID(Map<String, Object> map);
	
	public int insertBoard(Map<String, Object> map);
	
	public int deleteBoard(int board_idx);
	
	public int updateBoardHit(int board_idx);

	public int updateBoard(Board board);

	public int boardCount(Map<String, Object> map);

}
