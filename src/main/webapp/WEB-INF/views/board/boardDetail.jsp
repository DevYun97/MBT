<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판상세</title>
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
     
      <!--  -->
      <div class="w-100 d-flex justify-content-between align-items-center mx-0 mt-3 border p-2" style="height: 56px;">
        <div class="pl-2 my-2" onclick="history.back('-1');" style="cursor: pointer;">
          <i class="bi bi-chevron-left mr-1" ></i>이전화면
        </div>    
        <div>
          <input type="button" class="btn btn-primary" value="수정" style="height: 30px; font-size: 14px;">
          <input type="button" class="btn btn-primary" value="삭제" style="height: 30px; font-size: 14px;">
        </div>
      </div>  

      <div class="w-100 d-flex flex-column justify-content-between align-items-center mx-0 my-3 border p-3">
        
        <!-- 공지사항 제목 -->
        <div class="w-100 border-bottom pt-2 pb-3">
          <h5>게시글제목</h5>
          <div class="d-flex justify-content-between" style="font-size: 14px;">
            <div>작성자닉네임</div>
            <div>
              <small>조횟수 2</small> <small class="px-1"> | </small> <small>2022.03.00</small>             
            </div>
          </div>
        </div>

        <!-- 공지사항 내용 일반회원은 텍스트만 / 관리자는 수정가능하게 입력폼으로 보이게 변경하기-->
        <div class="w-100 mt-3 px-2 pb-3 text-left border-bottom">
          <textarea name="" id="" rows="10" class="w-100 px-2 py-2">게시글 내용</textarea>
       </div>

        <!-- 버튼 div -->
        <form action="" method="post" class="w-100 d-flex justify-content-between px-2">
          <input type="text" class="col-10 mt-3" id="" name="reply" placeholder="댓글을 달아주세요">
          <input type="submit" class="btn btn-primary btn-sm col-2 mt-3" value="작성">
        </form>
      </div>
      
      <!-- 댓글창 -->
      <div class="w-100 d-flex flex-column justify-content-between align-items-center mx-0 mt-1 border p-2">

        <div class="w-100 mt-2 pb-3 border-bottom">
          <h5>댓글창</h5>
          <small>댓글갯수 : 1</small>
        </div>

        <div class="w-100 d-flex flex-column justify-content-between align-items-start mt-4 pb-3 border-bottom text-body">
          <div class="w-100 d-flex justify-content-between">
            <h6 class="font-weight-bold mb-">댓글작성자닉네임</h6>
            <small class="text-right text-muted pr-1">2022.03.00</small>
          </div>
          <div class="w-100 border rounded" style="font-size: 14px; height: 50px;"> 댓글내용 불러오기</div>
        </div>

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