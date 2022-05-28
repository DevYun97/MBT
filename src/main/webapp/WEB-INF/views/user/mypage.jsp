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
	  <c:import url="../header.jsp"></c:import>

      <!-- mainContent -->
      <div class="container-fluid container-sm shadow border rounded my-5 mx-2" style="width:320px;">
        <div class="d-flex flex-column">
          <div class="w-100 d-flex justify-content-center align-items-center text-center font-weight-bold py-2" style="height: 100px;">          
              ${user_id} 님           
          </div>
          <!-- 회원정보 보기 링크 -->
          <div class="border-top w-100 container-fluid" style="height:40px;">
            <a href="../user/userInfo?user_idx=${ user_idx }" class="text-dark noDeco" >
              <div class="col-11 text-left pl-2 mx-0 d-flex align-items-center pt-2" style="float: left;">회원정보보기</div>
              <div class="mt-1"> > </div>
            </a>
          </div>
        </div>
        <!-- box div -->
      </div>
  
      <!-- 고객센터 -->
      <div class="w-100 ml-0 mr-0 border p-2">
        <div class="text-black-50 my-2 fontSize12" >고객센터</div>
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
        <div class="text-dark pl-2 my-1" onclick="quit()">회원탈퇴</div>         
      </div>
    <!-- Content div 종료 -->
    </div>


    <!-- bootstrap js -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
    <!-- main js -->
    <script>
    function quit(){
    	var message = "회원탈퇴를 진행하시겠습니까?";
    	result = window.confirm(message);
    	if(result == true ){
    		location.href = '../user/quitAction?user_idx=${user_idx}';
    	} else {
    	}
     }  
    </script>
    <script src="/js/main.js"></script>
    
  </body>
</html>