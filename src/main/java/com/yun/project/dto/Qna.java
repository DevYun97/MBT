package com.yun.project.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Component
@NoArgsConstructor
@Data
public class Qna {
	
	private int qna_idx;
	private int user_idx;
	private int qna_cat;
	private String qna_title;
	private String qna_contents;
	private Date qna_date;
	private int qna_reply_check;
	private String qna_reply;
	private Date qna_reply_date;
	
	@Builder
	public Qna(int qna_idx, int user_idx, int qna_cat, String qna_title, String qna_contents, Date qna_date,
			int qna_reply_check, String qna_reply, Date qna_reply_date) {
		super();
		this.qna_idx = qna_idx;
		this.user_idx = user_idx;
		this.qna_cat = qna_cat;
		this.qna_title = qna_title;
		this.qna_contents = qna_contents;
		this.qna_date = qna_date;
		this.qna_reply_check = qna_reply_check;
		this.qna_reply = qna_reply;
		this.qna_reply_date = qna_reply_date;
	}

}
