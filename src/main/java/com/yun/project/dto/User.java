package com.yun.project.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Component
@NoArgsConstructor
@Data
public class User {	
	private int user_idx;
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_nick_name;
	private String user_email;
	private String user_phone;
	private String user_address;
	private Date user_join;
	
	@Builder
	public User(int user_idx, String user_id, String user_pw, String user_name, String user_nick_name,
			String user_email, String user_phone, String user_address, Date user_join) {
		super();
		this.user_idx = user_idx;
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_nick_name = user_nick_name;
		this.user_email = user_email;
		this.user_phone = user_phone;
		this.user_address = user_address;
		this.user_join = user_join;
	}	
}
