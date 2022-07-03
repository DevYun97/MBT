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
  </head>
  <body>

    <!-- 컨텐츠 div -->
    <div class="container-sm container-fluid d-flex flex-column align-items-center justify-content-center border mx-auto" style="max-width: 520px; max-height: 800px; overflow: auto;">
      
      <!-- 헤더 -->
      <div class="w-100 d-flex justify-content-between align-items-center font-weight-bold pl-3 my-2 w-100 pb-2 pt-3 text-black-50 pb-3 border-bottom" >
        <div class="pointer" style="cursor: pointer;" onclick="location.href='../admin/member';">
          <i class="bi bi-chevron-left pr-2"></i>관리자페이지
        </div>
      </div>
      <div class="w-75 d-flex flex-column justify-content-between align-items-start mx-0 mt-2 mb-5 py-4 px-3 border rounded">             
      	
      	<h5>회원정보 상세보기</h5>       
      	<div class="mt-2 mb-2 col-12 font-weight-bold form-group text-dark">아이디              
        	<input type="text" class="form-control col-12 rounded font-weight-nomal nullcheck bg-white mt-1 disabledChk" value="${ mem.user_id }" disabled>
       	</div>
       	<div class="mt-1 mb-2 col-12 font-weight-bold form-group text-dark">이름              
           	<input type="text" class="form-control col-12 rounded font-weight-nomal nullcheck bg-white mt-1 disabledChk" value="${ mem.user_name }" disabled>
       	</div>
       	<div class="mt-1 mb-2 col-12 font-weight-bold form-group text-dark">전화번호              
           	<input type="text" class="form-control col-12 rounded font-weight-nomal nullcheck bg-white mt-1 disabledChk" value="${ mem.user_phone }" disabled>
       	</div>
       	<div class="mt-1 mb-2 col-12 font-weight-bold form-group text-dark">가입일              
           	<input type="text" class="form-control col-12 rounded font-weight-nomal nullcheck bg-white mt-1 disabledChk" value="${ mem.user_join }" disabled>
       	</div>
       	<div class="mt-1 mb-2 col-12 font-weight-bold form-group text-dark">주소              
           	<input type="text" class="form-control col-12 rounded font-weight-nomal nullcheck bg-white mt-1 disabledChk" value="${ mem.user_address }" disabled>
       	</div>
       	<div class="mt-1 mb-2 col-12 font-weight-bold form-group text-dark">등급              
           	<input type="text" class="form-control col-12 rounded font-weight-nomal nullcheck bg-white mt-1 disabledChk" value="${ mem.user_rank }" disabled>
       	</div>
       	<div class="mt-1 mb-2 col-12 font-weight-bold form-group text-dark">상태              
           	<input type="text" class="form-control col-12 rounded font-weight-nomal nullcheck bg-white mt-1 disabledChk" value="${ mem.useYN }" disabled>
       	</div>
       	<div class="w-100 d-flex justify-content-center mt-3 mb-3" >
        	<c:if test="${ mem.useYN eq '탈퇴' }">
        	<input type="button" class=" btn btn-primary col-4 mx-2 pl-2" value="회원정보 복구" onclick="restoreUser()" />
        	<input type="button" class=" btn btn-primary col-3 mx-2" value="영구탈퇴" onclick="realQuit()" />
        	</c:if>
        	<input type="button" class=" btn btn-primary col-3 mx-2" value="확인" onclick="history.back(-1);" />
        </div>
        	           
      </div>
                   
     <!-- Content div 종료 -->
     </div>

    <!-- bootstrap js -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
    <!-- main js -->
    <script src="/js/main.js"></script>
    <script>
 	// 관리자_ 회원 계정 복구 - main.js 에 넣을 시 동작하지 않음.
    function restoreUser(){
        	 
        var message = "회원정보를 복구 하시겠습니까?";
        result = window.confirm(message);
        if(result == true ){
        	location.href = '../admin/memUseUpdate?user_idx=${mem.user_idx}&&useYN=Y';
        } else {
    	}
    }
 // 관리자_ 회원의 영구 탈퇴 이벤트
    function realQuit(){
        var message = "회원정보를 영구 삭제하시겠습니까? 삭제된 정보는 복구가 불가능합니다.";  	
        result = window.confirm(message);
        if(result == true ){
        	location.href = '../admin/realQuit?user_idx=${mem.user_idx}';
        } else {
        }
    }
    </script>
  </body>
</html>