package com.yun.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.yun.project.dto.Reply;

@Mapper
public interface IreplyDAO {
public List<Reply> getReplyList(int board_idx);
	
	public int insertReply(Reply reply);

}
