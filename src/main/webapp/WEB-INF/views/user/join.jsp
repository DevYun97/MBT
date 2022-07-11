<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/custom.css">
     <!-- 부트아이콘 -->
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
  </head>
  <body>

    <!-- 컨텐츠 div -->
    <div class="container-sm container-fluid d-flex flex-column align-items-center justify-content-center border mx-auto" style="max-width: 520px; max-height: 800px; overflow: auto;">

      <!-- 뒤로가기 아이콘 -->
      <div class="w-100 mt-3 mb-1" style="width: 30px; height: 30px;" >
        <i class="bi bi-chevron-left pr-2" onclick="history.back(-1);"></i>
      </div>
     
      <!-- 메인클레스 -->
      
      <div class="font-weight-bold mb-3">회원가입</div>
      <form action="../user/joinAction" method="post" onsubmit="return nullChecker();">
        <div class="mt-3 pb-3" style="width:250px;">
          <!-- id 중복체크 div -->
          <div class="d-flex justify-content-between align-items-center flex-wrap col-12 my-2 px-0">
            <input type="text" class="col-9 form-control nullcheck" name="user_id" id="user_id" placeholder="아이디를 입력해주세요">
            <input type="button" class="btn btn-primary px-1 fontSize12" value="중복체크" style="height: 30px; width: 55px;" onclick="idCheck();">
            <input type="hidden" name="isIDChecked" id="isIDChecked" value='no'>
            <div id="al1" style="color: red; display: none;" >*사용할 수 없는 아이디 입니다.*</div>
	        <div id="al2" style="color: green; display: none;" >*가입 가능한 아이디입니다*</div>
          </div>          
          <input type="password" class="d-block col-12 my-2 form-control nullcheck" name="user_pw" id="user_pw" placeholder="비밀번호를 입력해주세">                    
        </div>

        <!-- 고객정보 모음 -->
        <div class="mt-3 pb-3" style="width:250px;">
          <input type="text" class="d-block col-12 my-2 form-control nullcheck" name="user_name" id="user_name" placeholder="이름을 입력해주세요">
          <input type="text" class="d-block col-12 my-2 form-control nullcheck" name="user_phone" id="user_phone" placeholder="전화번호를 입력해주세요">
          <input type="email" class="d-block col-12 my-2 form-control nullcheck" name="user_email" id="user_email" placeholder="이메일을 입력해주세요">
          
          <!-- 주소 추가 -->	  
		  <input type="text" class="d-inline col-9 form-control bg-white" name="sample6_postcode" id="sample6_postcode" placeholder="우편번호" readonly>
          <input type="button" class="btn btn-primary px-1 fontSize12" style="height: 30px; width: 55px;" value="주소찾기" onclick="sample6_execDaumPostcode()">
          <input type="text" class="col-12 form-control my-1 bg-white nullcheck" name="sample6_address" id="sample6_address" placeholder="주소를 입력해주세요" readonly>
          <input type="text" class="col-12 form-control nullcheck" name="sample6_detailAddress" id="sample6_detailAddress"  placeholder="상세주소를 입력해주세요">
          <!-- 주소찾기 기본 hidden버튼(삭제x) -->
          <input type="hidden" class="inputStyle1" id="sample6_extraAddress" placeholder="참고항목">                   
          <!-- 입력한 sample6_address 와 sample6_detailAddress를 js를 이용해 value값을 합쳐 user_address로 서버에 전송 -->
          <input type="hidden" id="user_address" name="user_address" value="" />
        </div>

        <!-- 회원가입 동의 체크박스 -->
        <div class="text-center pt-3 mb-3">- 회원가입 약관동의 -</div>
        <div class="mt-2 mb-5">
            <!-- disabled : 사용자의 input 타입의 수정 막기  -->
            <input type="checkbox" class="my-2 mr-1 nullcheck" id="joinCk1" disabled><span class="pointer" onclick="popupHideAndShow(target ='joinCkPop1');">[필수] 회원가입약관</span> <br>
            <input type="checkbox" class="my-2 mr-1 nullcheck" id="joinCk2" disabled><span class="pointer" onclick="popupHideAndShow(target ='joinCkPop2');">[필수] 개인정보 처리방침안내</span>
        </div>
        <input type="button" class="btn btn-primary col-12 mb-5" value="회원가입" onclick="joinCheckAll();">       
      </form>
      
    <!-- Content div 종료 -->
    </div>

    <!-- 회원약관동의 내용 팝업창 -->
    <div class="container-sm container-fluid col-12 position-absolute d-none flex-column justify-content-center bg-white border border-dark-50 rounded" style="top:50%; left: 50%; transform:translate(-50%, -50%); max-width:340px;" id="joinCkPop1">
      <!-- 캔슬 아이콘 -->
      <div class="w-100 d-flex flex-row justify-content-end my-2">
      	<i class="bi bi-x-lg" width="30px" height="30px" onclick="popupHideAndShow(target = 'joinCkPop1');"></i>
      </div>
      <!-- MainDiv -->
      <div class="w-100 d-flex flex-column justify-content-center align-items-center mb-5">
        <h6 class="mb-4">회원가입약관</h6>
        <!-- resize: none : 사이즈 변경을 못하게 막음
             readonly: 읽기 전용 필드 _ 사용자가 수정 못하게 막음 -->
        <textarea name="" id="" cols="30" rows="10" style="resize: none;" readonly>
          제1조(목적) 이 약관은 회사가 온라인으로 제공하는 디지털콘텐츠(이하 "콘텐츠"라고 한다) 및 제반서비스의 이용과 관련하여 회사와 이용자와의 권리, 의무 및 책임사항 등을 규정함을 목적으로 합니다.
        </textarea>
        <input type="button" class="btn btn-primary col-4 mt-3" value="동의" onclick="joinCheck(joinCheckBox = 'joinCk1');">
      </div>
    </div>

    <!-- 개인정보 처리방침안내 내용 팝업창 -->
    <div class="container-sm container-fluid col-12 position-absolute d-none flex-column justify-content-center bg-white border border-dark-50 rounded" style="top:50%; left: 50%; transform:translate(-50%, -50%); max-width:340px;" id="joinCkPop2">
      <!-- 캔슬 아이콘 -->
      <div class="w-100 d-flex flex-row justify-content-end my-2">
      <i class="bi bi-x-lg" width="30px" height="30px" onclick="popupHideAndShow(target = 'joinCkPop2');"></i>
      </div>
      <!-- MainDiv -->
      <div class="w-100 d-flex flex-column justify-content-center align-items-center mb-5">
        <h6 class="mb-4">개인정보 처리방침안내</h6>
        <textarea name="" id="" cols="30" rows="10" style="resize: none;" readonly>
          제1조 (개인정보의 처리 목적) ① 개인정보보호위원회는 개인정보를 다음의 목적을 위해 처리합니다. 처리한 개인정보는 다음의 목적이외의 용도로는 사용되지 않으며 이용 목적이 변경되는 경우에는 개인정보 보호법 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.
        </textarea>
        <input type="button" class="btn btn-primary col-4 mt-3" value="동의" onclick="joinCheck(joinCheckBox = 'joinCk2');">
      </div>
    </div>
<!-- 카카오 주소 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- bootstrap js -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
<!-- main js -->
<script src="/js/main.js"></script>
</body>
</html>