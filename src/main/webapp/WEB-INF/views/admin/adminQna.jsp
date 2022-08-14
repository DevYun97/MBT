<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 QnA리스트</title>
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
      
	  <!-- 서브바 -->
      <div class="w-100 d-flex justify-content-around align-items-center mx-0 border p-2" style="height: 56px; margin-top:80px;">
        <a class="text-body" href="/admin/admin">사이트관리</a>
        <a class="text-body" href="/admin/adminQna">QnA관리</a>
        <a class="text-body" href="/admin/member">회원관리</a>       
      </div>
      
      <!-- 검색기능 넣기 -->
      <div class="w-100 d-flex justify-content-end align-items-center mt-4 mb-2">
        <form id="qnaFrm" name="qnaFrm" >
	        <select id="qnaType" name="qnaType">
	        	<option value="seq">전체문의</option>
	        	<option value="qnaNo">미답변</option>
	        	<option value="qnaOk">답변완료</option>
	        </select>
	         <select id="test" name="test">
	        	<option value="test1">1111</option>
	        	<option value="test2">2222</option>
	        	<option value="test3">3333</option>
	        </select> 
        </form> 
      </div>
      
      <div class="w-100 d-flex flex-column justify-content-between align-items-center mx-0 my-3 border p-3">
        <div id="qnaList" class="w-100">
        <c:forEach var="qna" items="${ getQnaList }">
        <a href="../customer/qnaDetail?qna_idx=${ qna.qna_idx }" class="w-100 d-flex justify-content-between align-items-center mt-3 pb-3 border-bottom text-body">
          <div>${ qna.qna_title }</div>
          <div class="text-right text-muted fontSize12" >
            <span class="pr-1">${ qna.qna_user }</span> ${ qna.qna_date }<i class="bi bi-chevron-right"></i>
          	<c:if test="${ qna.qna_reply_check eq '1'}">
          	[ 답변완료 ]            
          	</c:if> 
          </div>
        </a>
        </c:forEach>
        </div>
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