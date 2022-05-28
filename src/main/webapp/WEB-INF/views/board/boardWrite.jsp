<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글작성</title>
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

      <!-- 메인 -->
          
      <form action="boardWriteAction" method="post" class="w-100" onsubmit="return nullChecker();">
        <!-- 서브바 -->
        <div class="w-100 d-flex justify-content-start align-items-center mx-0 mt-3 border p-2">          
          <div class="d-flex flex-column mx-1">
            <div class="pl-2 my-2" onclick="history.back('-1');" style="cursor: pointer;">
	          <i class="bi bi-chevron-left mr-1" ></i>이전화면
	        </div> 
          </div>
        </div>

        <div class="w-100 d-flex flex-column justify-content-between align-items-center mx-0 my-3 border p-3">
            <!--제목 -->
            <div class="w-100 border-bottom pt-2 pb-3">
              <input type="text" name="board_title" id="board_title" class="col-12 form nullcheck" placeholder="제목을 작성해주세요.">
            </div>
            <!-- -->
            <div class="w-100 mt-3 px-0 pb-3 text-left border-bottom">
              <textarea name="board_content" id="board_content" rows="10" class="w-100 px-2 py-2 nullcheck" placeholder="내용을 작성해주세요."></textarea>
            </div>
            
            <!-- 이미지 기능 추가 시 사용하기
	        <form action="" method="get">
	          <div class="border rounded p-2 mt-2 d-flex justify-content-center border-dark" style="width: 42px; cursor: pointer;" onclick="">
	            <i class="bi bi-camera"></i>
	          </div>
	        </form> -->
        
            <!-- 버튼 div -->
            <div class="w-100 d-flex justify-content-center">
              <input type="hidden" name="user_idx" value="${ user_idx }"/>
              <input type="submit" class="btn btn-primary col-5 mt-3 mr-1" value="확인">
              <div class="btn btn-primary col-5 mt-3" onclick="history.back('-1');">취소</div>
            </div>
        </div>
      </form>
            
    <!-- Content div 종료 -->
    </div>


    <!-- bootstrap js -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
    <!-- main js -->
    <script src="/js/main.js"></script>
  </body>
</html>