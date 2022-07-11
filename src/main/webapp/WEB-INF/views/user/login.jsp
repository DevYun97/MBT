<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/custom.css">
    <!-- 부트아이콘 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
  </head>
  <body>

    <!-- 컨텐츠 div -->
    <div class="container-sm container-fluid d-flex flex-column align-items-center justify-content-start border mx-auto pb-5" style="max-width: 520px; height: 800px;">

		<!-- 뒤로가기 아이콘 -->
      	<div class="w-100 my-3" style="width: 30px; height: 30px;" >
        	<i class="bi bi-chevron-left pr-2" onclick="location.href='../main'"></i>
      	</div>

	    <h3 class="text-center font-italic" style="margin-top:100px;">LOGIN</h3>
        <p class="mb-4 fontSize12" >로그인 시 다양한 기능을 이용하실 수 있습니다.</p>
        <div class="d-flex justify-content-center">
          <form action="loginAction" method="post" style="width: 250px;" onsubmit="return nullChecker();">
            <input type="text" class="d-block col-12 form my-2 nullcheck" id="user_id" name="user_id" placeholder="아이디">
            <input type="password" class="d-block col-12 form my-2 nullcheck" id="user_pw" name="user_pw" placeholder="비밀번호">
            <div class="d-flex justify-content-center">
              <button class="btn btn-primary col-12 my-2">로그인</button>
            </div>
          </form>    
        </div>
        <!-- 로그인 버튼 div -->
         
        
        <!-- 회원가입 묶음 div -->
        <div class="mt-3 mb-5 text-right">
          <span class="pointer" onclick="popupHideAndShow(target ='idFind');">아이디찾기</span>
          <span class="px-2" > | </span>
          <span class="pointer" onclick="popupHideAndShow(target ='pwFind');">비밀번호찾기</span>
          <span class="px-2" > | </span>
          <a href="../user/join" class="text-decoration-none text-body">회원가입</a>
        </div>
    <!-- Content div 종료 -->
    </div>

    <!-- 아이디찾기팝업창_ 팝업창 좌표는 화면 정가운데 고정시킴 -->
    <!-- 아이디 찾기 팝업창 - 클래스에 기본값으로 포지션 속성 등 부여 | d-none : 화면에서 숨기기 / 배경화면 흰색 / 테두리, 테두리 색 회색, 테두리 둥굴게 -->
    <div class="container-sm container-fluid position-absolute d-none flex-column justify-content-center bg-white border border-dark-50 rounded" style="top:50%; left: 50%; transform:translate(-50%, -50%); width:340px;" id="idFind">
      <!-- 캔슬 아이콘 -->
      <div class="w-100 d-flex flex-row justify-content-end my-2">
        <i class="bi bi-x-lg" width="30px" height="30px" onclick="popupHideAndShow(target = 'idFind');"></i>
      </div>
      <!-- MainDiv -->
      <div class="w-100 d-flex flex-column justify-content-center align-items-center">
        <h6 class="">아이디 찾기</h6>
        <form action="idFindAction" method="post" class="d-flex flex-column align-items-center col-12 mt-2">
          <input type="text" class="mt-2 mb-1 w-75 form" name="user_name" id="user_name" placeholder="이름">
          <input type="text" class="my-1 w-75 form" name="user_email" id="user_email" placeholder="이메일">
          <input type="submit" class="btn btn-primary col-6 mt-3 mb-5" value="확인">
        </form>
      </div>
    </div>

    <!-- 비밀번호찾기 팝업창 -->
    <div class="container-sm container-fluid col-12 position-absolute d-none flex-column justify-content-center bg-white border border-dark-50 rounded" style="top:50%; left: 50%; transform:translate(-50%, -50%); width:340px;" id="pwFind">
      <!-- 캔슬 아이콘 -->
      <div class="w-100 d-flex flex-row justify-content-end my-2">
        <i class="bi bi-x-lg" width="30px" height="30px" onclick="popupHideAndShow(target = 'pwFind');"></i>
      </div>
      <!-- MainDiv -->
      <div class="w-100 d-flex flex-column justify-content-center align-items-center">
        <h6 class="">비밀번호찾기</h6>
        <form action="pwFindAction" method="post" class="d-flex flex-column align-items-center col-12 mt-2">
          <input type="text" class="mt-2 mb-1 w-75 form" name="user_name" id="user_name" placeholder="이름">
          <input type="text" class="my-1 w-75 form" name="user_id" id="user_id" placeholder="아이디">
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