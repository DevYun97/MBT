<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원정보 상세페이지</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/custom.css">
    <!-- 부트아이콘 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <!-- @import url("https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css"); -->
  </head>
  <body>

    <!-- 컨텐츠 div -->
    <div class="container-sm container-fluid d-flex flex-column align-items-center justify-content-center border mx-auto" style="max-width: 520px;">
      
      <!-- 헤더 -->
      <div class="w-100 d-flex justify-content-between align-items-center font-weight-bold pl-3 my-2 w-100 pb-2 pt-3 text-black-50 pb-3 border-bottom" >
        <div style="cursor: pointer;" onclick="location.href='../member/mypage.html';">
          <i class="bi bi-chevron-left pr-2"></i>회원정보
        </div>
        <div>
          <input type="button" class="btn btn-primary btn-sm" value="비밀번호 변경" onclick="popupHideAndShow(target = 'userPwChange');">
        </div>
   
      </div>
      
      <!-- 유저 섬네일 / 아이디 -->
      <form action="userInfoAction" method="post">
        <div class="w-100 d-flex flex-column justify-content-center align-items-center mx-0 mt-4 py-3 border rounded">
          <div class="my-3 col-12 font-weight-bold form-group text-dark">
            <input type="text" class="form-control col-12 rounded font-weight-nomal nullcheck" name="user_nick_name" value="${ user_nick_name }">
          </div>
        </div>


        <div class="w-100 d-flex flex-column justify-content-between align-items-center mx-0 mt-5 p-2 border rounded">
          <!-- 수정불가능한 영역 -->
          <div class="mt-3 col-12 font-weight-bold form-group text-dark">아이디           
            <input type="text" class="form-control col-12 rounded font-weight-nomal nullcheck bg-white mt-1" name="user_id" value="${ user_id }" disabled>
          </div>

          <div class="mt-3 col-12 font-weight-bold form-group text-dark">이름          
            <input type="text" class="form-control col-12 rounded font-weight-nomal nullcheck mt-1" name="user_name" value="${ user_name}">
          </div>
          
          <!-- 이메일 -->
          <div class="mt-3 col-12 font-weight-bold form-group text-dark">이메일              
            <input type="email" class="form-control col-12 rounded font-weight-nomal nullcheck mt-1" name="user_email" value="${ user_email }">
          </div>
          <!-- 전화번호 -->
          <div class="mt-3 col-12 font-weight-bold form-group text-dark">전화번호
            <input type="text" class="form-control col-12 rounded font-weight-nomal nullcheck mt-1" name="user_phone" value="${ user_phone }">
          </div>            
        </div>    
        <!-- 수정하기 button -->
          <div class="mt-5 mb-5 align-items-center text-center">
            <a href="mypage" class="btn btn-primary col-5 text-light form-control"> 확인 </a>
            <button type="submit" class="btn btn-primary col-5 text-light form-control" style="width: 300px;" id="submitButton"> 수정 </button>
          </div>
       </form>
     <!-- Content div 종료 -->
     </div>

    <!-- 비밀번호변경 팝업창 -->
    <div class="container-sm container-fluid col-12 position-absolute d-none flex-column justify-content-center bg-white border border-dark-50 rounded" style="top:50%; left: 50%; transform:translate(-50%, -50%); width:340px;" id="userPwChange">
      <!-- 캔슬 아이콘 -->
      <div class="w-100 d-flex flex-row justify-content-end my-2">
        <i class="bi bi-x-lg" width="30px" height="30px" onclick="popupHideAndShow(target = 'userPwChange');"></i>
      </div>
      <!-- MainDiv -->
      <div class="w-100 d-flex flex-column justify-content-center align-items-center">
        <h6 class="">비밀번호 변경하기</h6>
        <form action="pwChangeAction" method="get" class="d-flex flex-column align-items-center col-12 mt-2">
          <input type="text" class="mt-2 mb-1 w-75 form" id="checkPw" placeholder="기존 비밀번호를 입력하세요">
          <input type="text" class="mt-2 mb-1 w-75 form" id="pw1" placeholder="새 비밀번호를 입력하세요">
          <input type="text" class="my-1 w-75 form" name="user_pw" id="pw2" placeholder="새 비밀번호 재확인">
          <input type="submit" class="btn btn-primary col-6 mt-3 mb-5" value="확인">
        </form>
      </div>
    </div>


    <!-- bootstrap js -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
    <!-- main js -->
    <script src="/js/main.js"></script>
  </body>
</html>