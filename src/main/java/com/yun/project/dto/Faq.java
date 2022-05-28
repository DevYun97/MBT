package com.yun.project.dto;

import org.springframework.stereotype.Component;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Component
@NoArgsConstructor
// 이유는 모르겠지만 빌더를 사용하기 위해서 저 두 컴포넌트를 넣어야 작동이 됨. 아니면 에러발생
// 근데 데이타에 저 두 컴포넌트가 포함되어 있다고 하지않았나..?? 아직 이유를 잘 모르곘음 ?.?
@Data
public class Faq {
	private int faq_idx;
	private String faq_title;
	private String faq_contents;
	
	@Builder
	public Faq(int faq_idx, String faq_title, String faq_contents) {
		super();
		this.faq_idx = faq_idx;
		this.faq_title = faq_title;
		this.faq_contents = faq_contents;
	}
}
