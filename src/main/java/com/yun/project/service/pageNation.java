package com.yun.project.service;

import java.util.Map;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Component
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Builder
@ToString
public class pageNation {
	
	//페이지당 데이터(row) 갯수
    public static final int numberOfArticle = 15; // numberOfArticle : 한 페이지에서 보여줄 row 갯수
    public static final int blockNumber = 5;
	
	private String curPage; //	현재 페이지
	private int startNumOfRow;	//	시작 열 (시작 값)
	private int endNumOfRow;	// 끝 열 (끝 값)
	private int countOfPage;	//	
	private int beginPageBlock; //	
	private int endPageBlock;	//
	
	// countOfArticleAlldate : DB 테이블 안에 들어있는 데이터(row) 갯수 
	
	public pageNation pagenation(String curPage, int countOfArticleAlldate) {
		System.out.println("page curPage"+curPage);
		
		curPage = "1"; 
		/*
		 * if(curPage == null || curPage.equals("")) { //초기값 세팅 curPage = "1"; }
		 */
		//총 페이지 갯수 구하기 
		int countOfPage = countOfArticleAlldate % numberOfArticle == 0 ?
				countOfArticleAlldate / numberOfArticle : countOfArticleAlldate / numberOfArticle +1;
		// 끝 row 값
		int endNumOfRow = countOfArticleAlldate - (Integer.parseInt(curPage) -1)*numberOfArticle;
		//시작값
		int startNumOfRow = (endNumOfRow - numberOfArticle +1) <= 0?1 : endNumOfRow - numberOfArticle +1;
		//pageNation 시작값
		int beginPageBlock = Integer.parseInt(curPage) % blockNumber == 0 ?
				(Integer.parseInt(curPage)) - blockNumber + 1 : ((Integer.parseInt(curPage))/ blockNumber) * blockNumber +1;
		//pageNation 끝 값
		int endPageBlock;
		if(Integer.parseInt(curPage)%blockNumber == 0) {
			endPageBlock = Integer.parseInt(curPage);
		} else if(Integer.parseInt(curPage)/blockNumber == numberOfArticle/blockNumber ) {
			endPageBlock = countOfPage;
		} else {
			endPageBlock = ((Integer.parseInt(curPage)/blockNumber)+1)*blockNumber;
		}
		
		pageNation pagenation = pageNation.builder()
								.curPage(curPage)
								.startNumOfRow(startNumOfRow)
								.endNumOfRow(endNumOfRow)
								.countOfPage(countOfPage)
								.beginPageBlock(beginPageBlock)
								.endPageBlock(endPageBlock)
								.build();
		return pagenation;
	}

}
