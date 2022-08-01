package com.yun.project.dto;

import org.springframework.stereotype.Component;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Component
@NoArgsConstructor
@Data
public class Salt {

	private int user_idx;
	private String salt_pass;
	
	@Builder
	public Salt(int user_idx, String salt_pass) {
		super();
		this.user_idx = user_idx;
		this.salt_pass = salt_pass;
	}	
	
}
