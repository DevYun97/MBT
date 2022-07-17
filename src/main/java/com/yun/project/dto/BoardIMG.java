package com.yun.project.dto;

import org.springframework.stereotype.Component;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Component
@NoArgsConstructor
@Data
@ToString
public class BoardIMG {

	private int board_idx;
	private String board_img;
	
	@Builder
	public BoardIMG(int board_idx, String board_img) {
		super();
		this.board_idx = board_idx;
		this.board_img = board_img;
	}
}
