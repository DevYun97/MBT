<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판리스트</title>
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

      <!-- 메인 -->
      <!-- 서브바 -->
      <div class="w-100 d-flex justify-content-between align-items-center mx-0 mt-3 border p-2" style="height: 56px;">
        <h6 class="m-0 font-weight-bold">게시판 리스트</h6>
        <!-- 관리자용 -->
        <div>          
          <a href="/board/boardWrite" class="btn btn-primary" style="height: 30px; font-size: 14px;">글작성</a>
        </div>
      </div>

      <div class="w-100 d-flex flex-column justify-content-between align-items-center mx-0 my-3 border p-3">
        <!-- 공지사항 불러오기 -->
        <a href="../board/boardDetail" class="w-100 d-flex justify-content-between align-items-center mt-3 pb-3 border-bottom text-body">
          <div>게시판 제목</div>
          <div class="text-right">
            <small class="pr-2">작성자 이름</small>
            <small>2022.03.00</small>
          </div>
        </a>
        <a href="../board/boardDetail" class="w-100 d-flex justify-content-between align-items-center mt-3 pb-3 border-bottom text-body">
          <div>게시판 제목</div>
          <div class="text-right">
            <small class="pr-2">작성자 이름</small>
            <small>2022.03.00</small>
          </div>
        </a>
        <a href="../board/boardDetail" class="w-100 d-flex justify-content-between align-items-center mt-3 pb-3 border-bottom text-body">
          <div>게시판 제목</div>
          <div class="text-right">
            <small class="pr-2">작성자 이름</small>
            <small>2022.03.00</small>
          </div>
        </a>
        
      </div>
      <!-- Content div 종료 -->
      <!-- 쪽수메기기 -->
      <div class="mt-4 mb-3">
        <nav aria-label="Page navigation example">
          <ul class="pagination">
            <li class="page-item"><a class="page-link" href="#">Previous</a></li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">Next</a></li>
          </ul>
        </nav>
      </div>    
    </div>

    <!-- bootstrap js -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
    <!-- main js -->
    <script src="/js/main.js"></script>
  </body>
</html>