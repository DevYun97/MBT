<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 페이지</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="/MBT/css/custom.css">
    <!-- 부트아이콘 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
  
  </head>
  <body>

    <!-- 컨텐츠 div -->
    <div class="container-sm container-fluid d-flex flex-column align-items-center justify-content-start border mx-auto" style="max-width: 520px; height: 800px; overflow: auto;">

      <!-- 헤더 -->
	  <c:import url="../header.jsp"></c:import>
          
	  <!-- 서브바 -->
      <div class="w-100 d-flex justify-content-around align-items-center mx-0 border p-2" style="height: 56px; margin-top:80px;">
        <a class="text-body" href="/MBT/admin/admin">사이트관리</a>
        <a class="text-body" href="/MBT/admin/adminQna">QnA관리</a>
        <a class="text-body" href="/MBT/admin/member">회원관리</a>       
      </div>
      <!-- 메인 -->       
	  <div class="w-100 d-flex flex-column justify-content-between align-items-center mx-0 my-3 p-3">     
	  	<div class="w-100 d-flex flex-column justify-content-between align-items-center mx-0 my-3 border p-3">
	        <div>
		        <span> 접속한 관리자 ID : </span><span> ${ user_id } </span>		        
	        </div>
	        <div>
		        <span> 관리자 등급 : </span><span> ${ user_rank } </span>		        
	        </div>        
	  	</div>      
	    <div class="w-100 d-flex flex-column justify-content-between align-items-center mx-0 my-3 border p-3">
	        <div class="w-100 text-right border-bottom pb-1">
	       		<a class="noDeco pointer text-dark fontSize11" onclick="location.href='../board/board';">게시판 더보기 > </a>
	        </div> 
	        <div class=" py-2">
		        <span> 등록된 총 게시물 수 : </span><span> ${ bCount } </span>		        
	        </div>        
	      </div>      
      </div>
      
	</div>
 
    <!-- bootstrap js -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
    <!-- main js -->
    <script src="/MBT/js/main.js"></script>
 
  </body>
</html>