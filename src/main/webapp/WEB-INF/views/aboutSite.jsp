<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ABOUT</title>
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

      <!-- 사이트맵 메인 -->
      <div class="w-100 text-left mt-4 mb-3 d-flex">
        <h3 class="pr-3">M <small>y</small> </h3>
        <h3 class="pr-3">B <small>ack</small> </h3>
        <h3>D <small>ata</small> </h3>
      </div>
      <div>
        <h5>사이트소개</h5>
        <p>
          안녕하세요. MBD 사이트에 오신 것을 환영합니다.<br>
          MBD사이트는 저의 부족한 백엔드 공부를 복습하며, 팀 프로젝트를 보완해줄 서브 프로젝트를 목적으로 제작되었습니다.<br>
          많은 기능이 프로젝트는 아니지만, 적어도 이 프로젝트에 사용되는 기술들은 모두 이해하고 제 것으로 만들고자 기획했습니다.<br>
          감사합니다.
        </p>

        <h5 class="pt-4 pb-2">디자인 설정</h5>
        <p>
          백엔드 공부를 목적으로 설계한 프로젝트이기 때문에 디자인은 가볍고 심플하게 제작하기로 했습니다.<br>

          디자인을 참고한 사이트들은 :<br>
          배달의 민족, 지그재그 어플 디자인들을 많이 참고해서 모바일 친화적인 디자인으로 설계하였습니다.<br>
          메인컬러와 서브컬러, 포인트컬러 3개로 나눠서 적용시킬 계획<br>
        </p>

        <h5 class="pt-4 pb-2">사이트 작성과정</h5>
        <p>
          제작에 사용한 프로그램과 언어들 간단정리<br>
          디자인 : 카카오오븐<br>
          프론트엔드 :<br>
          백엔드 : 
        </p>

        <h5 class="pt-4 pb-2">작성자 소개</h5>
        <p class="pb-5">
          개발연혁 : ???<br>
          자격증 여부 :<br>
          블로그 링크 / 깃허브, 티스토리, 또 링크를 걸 곳이 있나?<br>
          대충 이력서에 들어갈 만한 내용
        </p>
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