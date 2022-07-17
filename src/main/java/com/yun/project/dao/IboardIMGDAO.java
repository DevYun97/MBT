package com.yun.project.dao;

import org.apache.ibatis.annotations.Mapper;

import com.yun.project.dto.BoardIMG;

@Mapper
public interface IboardIMGDAO {
	
	//이미지 올리기
	public int boardFile(BoardIMG boardImg);

	//이미지 파일 불러오기
	public BoardIMG getBoardImgFile(int board_idx);
	
	//이미지 파일 확인
	public String checkBoardIMG(int board_idx);
	
	//이미지 수정
	public int updateBoardImg(BoardIMG boardImg);

	//이미지 삭제
	public int deleteBoardImg(int board_idx);

}
