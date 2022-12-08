<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<header style="width: 100%;">
	<!-- 헤더 -->
      <div class="font-weight-bold pl-3 d-flex my-2 w-100 pb-2 py-3 border-bottom bg-white" style="max-width: 490px; height: 60px; position:fixed; top: 0; z-index:1500;">
        <div class="dropdown">
          <span class=" dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-expanded="false">사이트맵</span>
          <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            <div class="text-black-50 pl-3 mt-3 mb-2 fontSize12" >유저정보</div>
            <!-- 회원정보 마이페이지 이동 _ 유저 정보 나오기 -->
            <c:if test="${ empty user_id }">    
            <a href="/MBT/user/login" class="dropdown-item">로그인</a>
            <a href="/MBT/user/join" class="dropdown-item">회원가입</a>
            </c:if>
            <c:if test="${ not empty user_id }">
            <p class="dropdown-item">[ ${ user_id } ] 님 </p>
            <a href="/MBT/user/mypage" class="dropdown-item">마이페이지</a>
            </c:if>            
            <!-- 컨텐츠 이동 -->
            <div class="dropdown-divider"></div>
            <div class="text-black-50 pl-3 mt-3 mb-2 fontSize12" >페이지</div>
            <a href="/MBT/main" class="dropdown-item">메인</a>
            <a href="/MBT/board/board" class="dropdown-item">게시판</a>
            <div class="dropdown-divider"></div>
            <!-- 고객센터 -->
            <div class="text-black-50 pl-3 mt-3 mb-2 fontSize12" >고객센터</div>
            <a href="/MBT/customer/notice" class="dropdown-item">공지사항</a>
            <a href="/MBT/customer/faq" class="dropdown-item">FAQ</a>
            <a href="/MBT/customer/qna" class="dropdown-item">QnA</a>
          </div>
        </div>
        <c:if test="${ user_rank eq '관리자' || user_rank eq '매니저' }">
        <div class="mx-4 pointer">
        	<a onclick="location.href='/MBT/admin/admin'" >관리자 페이지</a>
        </div> 
        </c:if>
      </div>
     </header>
