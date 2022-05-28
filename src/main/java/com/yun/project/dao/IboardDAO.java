package com.yun.project.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.yun.project.dto.Board;

@Mapper
public interface IboardDAO {
	public ArrayList<Board> getBoardList();
	
	public Board getBoardDetail(int board_idx);
	
	public ArrayList<Board> getBoardUserID();
	
	public int insertBoard(Board board);
	
	public int deleteBoard(int board_idx);
	
	public int updateBoardHit(int board_idx);

}
