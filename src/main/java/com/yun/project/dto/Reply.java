package com.yun.project.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Component
@NoArgsConstructor
@Data
public class Reply {
	
	private int reply_idx;	
	private int user_idx;
	private int board_idx;
	private String reply_content;
	private int reply_hit;
	private Date reply_data;
	
	@Builder
	public Reply(int reply_idx, int user_idx, int board_idx, String reply_content, int reply_hit, Date reply_data) {
		super();
		this.reply_idx = reply_idx;
		this.user_idx = user_idx;
		this.board_idx = board_idx;
		this.reply_content = reply_content;
		this.reply_hit = reply_hit;
		this.reply_data = reply_data;
	}

}
