<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Main</title>
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
	<c:import url="header.jsp"></c:import>
	
	<!-- mainContent -->
      <div class="container-fluid container-sm border rounded my-5 mx-2" style="width:320px;">
        <div class="d-flex flex-column">
          <div class="w-100 d-flex flex-column justify-content-center align-items-center text-center font-weight-bold py-2" style="min-height: 115px;">          
              <c:if test="${ not empty user_id }">
              <p class="my-0">${user_id} 님 방문을 환영합니다</p>
              <div class="mt-3 mb-0 fontSize12" > 이동 >
              	<a href="user/mypage"class="text-decoration-none text-body">마이페이지</a>              	
              </div>              
              </c:if>
              <c:if test="${ empty user_id }">
              <p class="my-1"> [ 게스트 ] 고객님 환영합니다. </p>
              <small> 비로그인 상태일 경우 사이트 이용에 제한이 있습니다.</small>
              <div class="my-2 fontSize12" > 이동 >
              	<a href="user/login"class="text-decoration-none text-body px-1">로그인</a>
              	<small> | </small>
              	<a href="user/join" class="text-decoration-none text-body px-1">회원가입</a>
              </div>              
              </c:if>                      
          </div>
        </div>     
      </div>
      
      <!-- 게시판 일부 불러오기 -->
		<div class="w-100 d-flex flex-column justify-content-between align-items-center mx-0 my-3 border p-3">
        <div class="w-100 text-right border-bottom pb-1">
       		<a class="noDeco pointer text-dark fontSize11" onclick="location.href='board/board';">게시판 더보기 > </a>
        </div>    
        <c:forEach var="board" items="${ board }" >
        <a href="../board/boardDetail?board_idx=${ board.board_idx }" class="w-100 d-flex justify-content-between align-items-center mt-3 pb-3 border-bottom text-body">
          <div>${board.board_title}</div>
          <div class="text-right">
            <small class="pr-2">${ board.board_user }</small>
            <small>${board.board_data}</small>
          </div>
        </a>
        </c:forEach>
      </div>
      
    <!-- Content div 종료 -->
    <footer style="width: 100%">
        <!-- container -->
        <div class="w-100 container-fluid d-flex flex-column justify-content-center align-items-center px-0 " style="height: 175px;">
            <!-- footer div -->
            <div class="w-100 d-flex flex-column align-items-center text-center text-black-50 fontSize11 border-top pt-3 pb-2" >
                <!-- 사이트 소개 text -->
                <div> 
                    사이트 명 : MBT <br>
                    사이트 제작자 : 윤다혜 <br>
                                               
                </div>
                <!-- 링크 버튼 -->
                <div>
	                <p class="my-1">- 사이트 정보 -</p>
	                <span class="border border-dark-50 rounded-pill my-1 mr-1 px-2 font-small pointer" style="width: 90px; height: 22px; line-height: 22px;" onclick="location.href='#'">
	                	<i class="bi bi-github"></i> GitHub
	                </span>
	                <span class="border border-dark-50 rounded-pill my-1 ml-1 px-2 font-small pointer" style="width: 90px; height: 22px; line-height: 22px;" onclick="location.href='#'">
	                	<i class="bi bi-qr-code"></i> T-Story
	                </span>
                </div>           
                <!-- copyright -->
                <div>
                    Copyright © 2022 Backpackr All right reserved.
                </div>
            </div>
        </div>
    </footer>
    </div>


    <!-- bootstrap js -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
    <!-- main js -->
    <script src="/js/main.js"></script>
</body>
</html>