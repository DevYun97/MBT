<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Qna 글 작성</title>
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
      <form action="qnaWriteAction" method="post" class="w-100" onsubmit="return nullChecker();">
        <!-- 서브바 -->
        <div class="w-100 d-flex justify-content-end align-items-center mx-0 border p-2" style="margin-top:80px;">          
          <div class="d-flex flex-column mx-1">
            <small>게시판 선택</small>
            <select name="qna_cat" id="" class="mt-1">
              <option value="0">문의하기</option>
              <option value="1">1대1문의하기</option>
            </select>
          </div>
        </div>

        <div class="w-100 d-flex flex-column justify-content-between align-items-center mx-0 my-3 border p-3">
            <!-- 문의하기 제목 -->
            <div class="w-100 border-bottom pt-2 pb-3">
              <input type="text" name="qna_title" id="qna_title" class="col-12 form nullcheck" placeholder="문의사항 제목을 작성해주세요.">
            </div>
            <!-- -->
            <div class="w-100 mt-3 px-0 pb-3 text-left border-bottom">
              <textarea name="qna_contents" id="qna_contents" rows="10" class="w-100 px-2 py-2 nullcheck" placeholder="문의사항 내용을 작성해주세요."></textarea>
            </div>
            <!-- 버튼 div -->
            <div class="w-100 d-flex justify-content-center">
              <input type="hidden" name="user_id" value="${ user_id }"/>
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