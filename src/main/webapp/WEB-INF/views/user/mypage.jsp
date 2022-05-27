<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/custom.css">
  </head>
  <body>

    <!-- 컨텐츠 div -->
    <div class="container-sm container-fluid d-flex flex-column align-items-center justify-content-center border mx-auto" style="max-width: 520px;">

      <!-- 헤더 -->
      <div class="font-weight-bold pl-3 d-flex my-2 w-100 pb-2 py-3 border-bottom">
        <div class="dropdown">
          <span class=" dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-expanded="false">사이트맵</span>
          <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            <!-- 회원정보 마이페이지 이동 _ 유저 정보 나오기 -->     
            <a href="../user/login" class="dropdown-item">로그인</a>
            <a href="../user/join" class="dropdown-item">회원가입</a>
            <a href="../user/mypage" class="dropdown-item">마이페이지</a>
            <!-- 컨텐츠 이동 -->
            <div class="dropdown-divider"></div>
            <div class="text-black-50 pl-3 mt-3 mb-2" style="font-size: 12px;">페이지</div>
            <a href="../main" class="dropdown-item">메인</a>
            <a href="../aboutSite" class="dropdown-item">사이트소개</a>
            <a href="../board/board" class="dropdown-item">게시판</a>
            <div class="dropdown-divider"></div>
            <!-- 고객센터 -->
            <div class="text-black-50 pl-3 mt-3 mb-2" style="font-size: 12px;">고객센터</div>
            <a href="../customer/notice" class="dropdown-item">공지사항</a>
            <a href="../customer/faq" class="dropdown-item">FAQ</a>
            <a href="../customer/qna" class="dropdown-item">QnA</a>
          </div>
        </div>
      </div>

      <!-- mainContent -->
      <div class="container-fluid container-sm shadow border rounded my-5 mx-2" style="width:320px;">
        <div class="d-flex flex-column">
          <div class="w-100 text-center font-weight-bold d-flex py-2" style="height: 100px;">
            <div style="width: 100px; height: 100px;">
              <img src="" alt="유저섬네일 이미지" class="img-fluid">
            </div>
            <div class="pl-2 pt-2">
              <!-- 나타내고싶은 회원정보 -->
              ${user_id}님
            </div>
          </div>
          <!-- 회원정보 보기 링크 -->
          <div class="border-top w-100 container-fluid" style="height:40px;">
            <a href="../user/userInfo" class="text-dark" style="text-decoration: none;">
              <div class="col-11 text-left pl-2 mx-0 d-flex align-items-center pt-2" style="float: left;">회원정보보기</div>
              <div class="mt-1"> > </div>
            </a>
          </div>
        </div>
        <!-- box div -->
      </div>
  
      <!-- 고객센터 -->
      <div class="w-100 ml-0 mr-0 border p-2">
        <div class="text-black-50 my-2" style="font-size: 12px;">고객센터</div>
        <a href="../customer/notice" class="d-block text-dark pl-2 my-1"> 공지사항 </a>      
        <a href="../customer/faq" class="d-block text-dark pl-2 my-1">FAQ</a>
        <a href="../customer/qna" class="d-block text-dark pl-2 my-1">QnA</a>
      </div>
      <!-- 로그아웃 -->
      <div class="w-100 ml-0 mr-0 border p-2">
        <a href="../user/logoutAction" class="text-dark pl-2 my-1"> 로그아웃</a>
      </div>
      <!-- 회원탈퇴 -->
      <div class="w-100 ml-0 mr-0 border p-2 mb-5">
        <a href="../user/quit" class="text-dark pl-2 my-1">회원탈퇴</a>         
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