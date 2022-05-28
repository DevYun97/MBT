<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 헤더 -->
      <div class="font-weight-bold pl-3 d-flex my-2 w-100 pb-2 py-3 border-bottom">
        <div class="dropdown">
          <span class=" dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-expanded="false">사이트맵</span>
          <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            <div class="text-black-50 pl-3 mt-3 mb-2 fontSize12" >유저정보</div>
            <!-- 회원정보 마이페이지 이동 _ 유저 정보 나오기 -->
            <c:if test="${ empty user_id }">    
            <a href="../user/login" class="dropdown-item">로그인</a>
            <a href="../user/join" class="dropdown-item">회원가입</a>
            </c:if>
            <c:if test="${ not empty user_id }">
            <p class="dropdown-item">[ ${ user_id } ] 님 </p>
            <a href="../user/mypage" class="dropdown-item">마이페이지</a>
            </c:if>            
            <!-- 컨텐츠 이동 -->
            <div class="dropdown-divider"></div>
            <div class="text-black-50 pl-3 mt-3 mb-2 fontSize12" >페이지</div>
            <a href="../main" class="dropdown-item">메인</a>
            <a href="../aboutSite" class="dropdown-item">사이트소개</a>
            <a href="../board/board" class="dropdown-item">게시판</a>
            <div class="dropdown-divider"></div>
            <!-- 고객센터 -->
            <div class="text-black-50 pl-3 mt-3 mb-2 fontSize12" >고객센터</div>
            <a href="../notuce/notice" class="dropdown-item">공지사항</a>
            <a href="../customer/faq" class="dropdown-item">FAQ</a>
            <a href="../customer/qna" class="dropdown-item">QnA</a>
          </div>
        </div>
      </div>
