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
    <div class="container-sm container-fluid d-flex flex-column align-items-center justify-content-center border mx-auto" style="max-width: 520px;">
      
      <!-- 헤더 -->
      <div class="w-100 d-flex justify-content-between align-items-center font-weight-bold pl-3 my-2 w-100 pb-2 pt-3 text-black-50 pb-3 border-bottom" >
        <div style="cursor: pointer;" onclick="location.href='../user/mypage';">
          <i class="bi bi-chevron-left pr-2"></i>회원정보
        </div>
        <div>
          <input type="button" class="btn btn-primary btn-sm" value="수정" onclick="userInfoUpdate();">
          <input type="hidden" id="userUpdate" value="no">
          <input type="button" class="btn btn-primary btn-sm" value="비밀번호 변경" onclick="popupHideAndShow(target = 'userPwChange');">
        </div>
      </div>
      
      <!-- 유저 섬네일 / 아이디 -->
      <form action="userInfoAction?user_idx=${ user.user_idx }" method="post" style="width:320px;" onsubmit="return addressAdd();">
        <div class="w-100 d-flex flex-column justify-content-between align-items-center mx-0 mt-5 p-2 border rounded">
          <!-- 수정불가능한 영역 -->
          <div class="my-3 col-12 font-weight-bold form-group text-dark">닉네임
            <input type="text" class="form-control col-12 rounded font-weight-nomal nullcheck bg-white disabledChk" name="user_nick_name" value="${ user.user_nick_name }" disabled>
          </div>
          
          <div class="mt-3 col-12 font-weight-bold form-group text-dark">아이디           
            <input type="text" class="form-control col-12 rounded font-weight-nomal nullcheck bg-white mt-1 " value="${ user.user_id }" disabled>
          </div>

          <div class="mt-3 col-12 font-weight-bold form-group text-dark">이름          
            <input type="text" class="form-control col-12 rounded font-weight-nomal nullcheck bg-white mt-1 disabledChk" name="user_name" value="${ user.user_name}" disabled>
          </div>
          
          <!-- 이메일 -->
          <div class="mt-3 col-12 font-weight-bold form-group text-dark">이메일              
            <input type="email" class="form-control col-12 rounded font-weight-nomal nullcheck bg-white mt-1 disabledChk" name="user_email" value="${ user.user_email }" disabled>
          </div>
          <!-- 전화번호 -->
          <div class="mt-3 col-12 font-weight-bold form-group text-dark">전화번호
            <input type="text" class="form-control col-12 rounded font-weight-nomal nullcheck bg-white mt-1 disabledChk" name="user_phone" value="${ user.user_phone }" disabled>
          </div>
          <div class="mt-3 col-12 font-weight-bold form-group text-dark">주소
          <!-- 주소 노출창 --> 
          	<div style="display: block;" id="address1" class="font-weight-nomal mt-1">
          	${ user.user_address }
          	  <!-- <input type="text" class="form-control col-12 rounded font-weight-nomal nullcheck bg-white mt-1" value="" disabled> -->   
          	</div>
          <!-- 주소 수정창 -->	        	
          	<div style="display: none;" id="address2">
          	  <input type="text" class="d-inline col-9 form-control bg-white" name="sample6_postcode" id="sample6_postcode" placeholder="우편번호" readonly>
          	  <input type="button" class="btn btn-primary px-1" style="font-size: 12px; height: 30px; width: 55px;" value="주소찾기" onclick="sample6_execDaumPostcode()">
          	  <input type="text" class="col-12 form-control my-1 bg-white nullcheck" name="sample6_address" id="sample6_address" placeholder="주소를 입력해주세요" readonly>
          	  <input type="text" class="col-12 form-control nullcheck" name="sample6_detailAddress" id="sample6_detailAddress"  placeholder="상세주소를 입력해주세요">
          	  <!-- 주소찾기 기본 hidden버튼(삭제x) -->
          	  <input type="hidden" class="inputStyle1" id="sample6_extraAddress" placeholder="참고항목">                   
          	  <!-- 입력한 sample6_address 와 sample6_detailAddress를 js를 이용해 value값을 합쳐 user_address로 서버에 전송 -->
          	  <input type="hidden" id="user_address" name="user_address" value="" />
          	</div>
          </div>                               
        </div>
              
        <!-- 수정하기 button -->
          <div class="mt-5 mb-5 align-items-center text-center">
            <a href="mypage" class="btn btn-primary col-12 text-light form-control" style="display: block;" id="userInfoBtn1"> 확인 </a>
            <button type="submit" class="btn btn-primary col-12 text-light form-control" style="width: 300px; display: none;" id="userInfoBtn2"> 수정 </button>
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
        <form action="pwChangeAction?user_idx=${user.user_idx}" method="post" class="d-flex flex-column align-items-center col-12 mt-2">
          <input type="text" class="mt-2 mb-1 w-75 form-control" id="checkPw" placeholder="기존 비밀번호를 입력하세요">
          <input type="text" class="mt-2 mb-1 w-75 form-control" id="pw1" placeholder="새 비밀번호를 입력하세요">
          <input type="text" class="my-1 w-75 form-control" name="user_pw" id="pw2" placeholder="새 비밀번호 재확인">
          <input type="submit" class="btn btn-primary col-6 mt-3 mb-5" value="확인">
        </form>
      </div>
      
    </div>
    <!-- 카카오 주소 API -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>   
    <!-- bootstrap js -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
    <!-- main js -->
    <script src="/js/main.js"></script>
    
    <script>
    	function userInfoUpdate(){
    		
    		if( $('#userUpdate').val() =="no" ){ //정보 수정하기로 변경
    			
    			$('.disabledChk').removeAttr("disabled");
        		/* 주소 */
        		$('#address1').css('display','none');
        		$('#address2').css('display','block');
        		/* 버튼 */
        		$('#userInfoBtn1').css('display','none');
        		$('#userInfoBtn2').css('display','block');
        		/*  */
    			$('#userUpdate').val("ok");

    		} else { // 수정하기 취소상태로 변경     		   			
    			$('.disabledChk').attr("disabled");
        		/* 주소 */
        		$('#address1').css('display','block');
        		$('#address2').css('display','none');
        		/* 버튼 */
        		$('#userInfoBtn1').css('display','block');
        		$('#userInfoBtn2').css('display','none');
        		/*  */
    			$('#userUpdate').val("no");
    		}
    	}
    </script>
    <script>
    function addressAdd(){
    	const address1 = $('#sample6_address').val();
		const address2 = $('#sample6_detailAddress').val();
		$('#user_address').val( address1 + " " + address2 );
		return true;
    }
    </script>
     
  </body>
</html>