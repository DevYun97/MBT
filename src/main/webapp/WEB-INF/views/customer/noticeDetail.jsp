<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항상세</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/custom.css">
    <!-- 부트아이콘 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
  </head>
  <body>

    <!-- 컨텐츠 div -->
    <div class="container-sm container-fluid d-flex flex-column align-items-center justify-content-start border mx-auto" style="max-width: 520px; height: 800px; overflow: auto;">

      <!-- 헤더 -->
	  <c:import url="../header.jsp"></c:import>

      <!-- 메인 -->
     
      <!-- 관리자용 -->
      <div class="w-100 d-flex justify-content-between align-items-center mx-0 border p-2" style="height: 56px; margin-top:80px;">
        <div>
        <!-- notice_show 가 on일 때 checked로 설정하기 -->
        <c:if test="${ dto.notice_show eq 'on' }">
        	<input type="checkbox" name="notice_show" id="noticeCheck" checked disabled><label for="noticeCheck" class="m-0 pl-2">중요공지</label>
        </c:if>
        <c:if test="${ dto.notice_show eq null }">
        	<input type="checkbox" name="notice_show" id="noticeCheck" disabled><label for="noticeCheck" class="m-0 pl-2">중요공지</label>
        </c:if>
          
        </div>     
        <div>
         <c:if test="${ user_rank eq '관리자' || user_rank eq '매니저' }">         
          <a href="noticeModify?notice_idx=${ dto.notice_idx }" class="btn btn-primary fontSize14" style="height: 30px;">수정</a>
          <a href="noticeDeleteAction?notice_idx=${ dto.notice_idx }" class="btn btn-primary fontSize14" style="height: 30px; ">삭제</a>
          </c:if>
        </div>
      </div>

      <div class="w-100 d-flex flex-column justify-content-between align-items-center mx-0 my-3 border p-3">
        <!-- 공지사항 제목 -->
        <div class="w-100 border-bottom pt-2 pb-3">
        
          <h5>${ dto.notice_title }</h5>
          <div class="d-flex justify-content-between fontSize14" >
            <div>관리자</div>
            <div>
              <small>${ dto.notice_date }</small>             
            </div>
          </div>
        </div>
        <!-- 공지사항 내용 일반회원은 텍스트만 / 관리자는 수정가능하게 입력폼으로 보이게 변경하기-->
        <div class="w-100 mt-3 px-2 pb-3 text-left border-bottom" style="height:200px;">
          ${ dto.notice_contents }
        </div>
        <!-- 버튼 div -->
        <input type="button" class="btn btn-primary mt-3" value="확인" onclick="location.href='../customer/notice';" style="width:100px; height:40px;" />
      </div>
      
    <!-- Content div 종료 -->
    </div>


    <!-- bootstrap js -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
    <!-- main js -->
    <script src="/js/main.js"></script>
  </body>
</html>