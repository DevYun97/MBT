<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FAQ</title>
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
      <div class="w-100 d-flex justify-content-around align-items-center mx-0 mt-3 border p-2" style="height: 56px;">
        <a class="text-body" href="/customer/faq.html">FAQ</a>
        <a class="text-body" href="/customer/qna.html">QnA</a>
        <a class="text-body" href="/customer/oneToOne.html">1:1문의</a>
      </div>

      <!-- 관리자용 faq 글작성 버튼-->
      <div class="w-100 d-flex justify-content-end mt-3">
        <input type="button" class="btn btn-primary btn-sm" value="faq 작성" onclick="">
      </div>

      <div class="w-100 d-flex flex-column justify-content-between align-items-center mx-0 my-3 border p-3">
        <!-- FAQ 부트스트랩 아코디언  -->
        <div class="w-100 accordion" id="accordionExample">

            <div class="card">
              <div class="card-header px-0 bg-white" id="headingTwo">
                <h2 class="mb-0">
                  <button class="btn btn-link btn-block text-left text-body collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                    자주하는 질문1
                  </button>
                </h2>
               </div>
            </div>
            <div id="collapseTwo" class="collapse border" aria-labelledby="headingTwo" data-parent="#accordionExample">
              <div class="card-body p-3">
                자주하는 질문에 대한 답변입니다.
              </div>
              <div class="w-100 d-flex justify-content-end p-2">
                <input type="button" class="btn btn-primary btn-sm" value="삭제">
              </div>
            </div>

            <div class="card">
              <div class="card-header px-0 bg-white" id="headingThree">
                <h2 class="mb-0">
                  <button class="btn btn-link btn-block text-left text-body collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                    자주하는 질문2
                  </button>
                </h2>
              </div>
              <div id="collapseThree" class="collapse border" aria-labelledby="headingThree" data-parent="#accordionExample">
                <div class="card-body">
                  자주하는 질문에 대한 답변입니다.
                </div>
                <div class="w-100 d-flex justify-content-end p-2">
                  <input type="button" class="btn btn-primary btn-sm" value="삭제">
                </div> 
              </div>
            </div>
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