<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항작성</title>
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
     
      <div class="w-100 d-flex flex-column justify-content-between align-items-center mx-0 my-3 border p-3">
        <form action="noticeWriteAction" method="post" class="w-100" onsubmit="return nullChecker();">
          <!-- 공지사항 제목 -->
          <div class="w-100 border-bottom pt-2 pb-3">
            <div class="d-flex justify-content-between align-items-center mb-2 fontSize14" style="font-size: 14px;">                       
              <div>
                <input type="checkbox" name="notice_show" id="notice_show"><label for="notice_show" class="m-0 pl-2">중요공지</label>
              </div>            
            </div>
            <input type="text" name="notice_title" id="notice_title" class="col-12 form nullcheck" placeholder="공지사항 제목을 입력해주세요.">
          </div>
          <div class="w-100 mt-3 px-0 pb-3 text-left border-bottom">
            <textarea name="notice_contents" id="notice_contents" rows="10" class="w-100 px-2 py-2 nullcheck" placeholder="공지사항 내용을 입력해주세요."></textarea>
          </div>
          <!-- 버튼 div -->
          <div class="w-100 d-flex justify-content-center">
            <input type="submit" class="btn btn-primary col-5 mt-3 mr-1" value="확인">
            <a href="../notice/notice" class="btn btn-primary col-5 mt-3">취소</a>
          </div>          
        </form>
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