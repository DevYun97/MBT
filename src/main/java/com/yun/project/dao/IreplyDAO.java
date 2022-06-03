package com.yun.project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.yun.project.dto.Reply;

@Mapper
public interface IreplyDAO {
	
	public List<Reply> getReplyList(int board_idx);
	
	public int insertReply(Map<String, Object> map);

	public int getReplyIdx(int board_idx);

}
