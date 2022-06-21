<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 유저관리페이지</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/custom.css">
    <!-- 부트아이콘 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
  
  </head>
  <body>

    <!-- 컨텐츠 div -->
    <div class="container-sm container-fluid d-flex flex-column align-items-center justify-content-center border mx-auto" style="max-width: 520px;">

      <!-- 헤더 -->
	  <c:import url="../header.jsp"></c:import>
     
	  <!-- 서브바 -->
      <div class="w-100 d-flex justify-content-around align-items-center mx-0 mt-3 border p-2" style="height: 56px;">
        <a class="text-body" href="/admin/admin">사이트관리</a>
        <a class="text-body" href="/admin/adminQna">QnA관리</a>
        <a class="text-body" href="/admin/member">회원관리</a>       
      </div>
      
      <!-- 검색기능 넣기 -->
      <div class="w-100 d-flex justify-content-end align-items-center mt-4 mb-2">
        <form id="memFrm" name="memFrm" >
	        <select id="useType" name="useType">
	        	<option value="all">전체조회</option>
	        	<option value="useY">회원</option>
	        	<option value="useN">탈퇴회원</option>
	        </select> 
        </form> 
      </div>
      
      <!-- 메인 -->
	 <div class="w-100 d-flex flex-column justify-content-between align-items-center mx-0 my-3 border p-3">
        <div id="memList" class="w-100">
	       <c:forEach var="mem" items="${ member }">
	        <a href="../admin/memberInfo?user_idx=${ mem.user_idx }" class="w-100 d-flex justify-content-between align-items-center mt-3 pb-3 border-bottom text-body">
	          <div>${ mem.user_id }</div>
	          <div class="text-right" >
	            <span class="pr-3 ">${ mem.user_rank }</span>
	            <span class="pr-2 text-muted fontSize12"> [ ${ mem.useYN } ] </span>
	            <span class="pr-1 fontSize12 text-muted">
	            상세조회 <i class="bi bi-chevron-right"></i>
	            </span>      	
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