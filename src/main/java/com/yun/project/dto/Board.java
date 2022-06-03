package com.yun.project.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Component
@NoArgsConstructor
@Data
public class Board {
	private int board_idx;
	private String board_user;
	private String board_title;
	private String board_content;
	private int board_hit;
	private Date board_data;
	
	@Builder
	public Board(int board_idx, String board_user, String board_title, String board_content, int board_hit,
			Date board_data) {
		super();
		this.board_idx = board_idx;
		this.board_user = board_user;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_hit = board_hit;
		this.board_data = board_data;
	}
}
