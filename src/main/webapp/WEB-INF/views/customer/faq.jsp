<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	  <c:import url="../header.jsp"></c:import>

      <!-- 메인 -->
      <!-- 서브바 -->
      <div class="w-100 d-flex justify-content-around align-items-center mx-0 mt-3 border p-2" style="height: 56px;">
        <a class="text-body" href="/customer/faq">FAQ</a>
        <a class="text-body" href="/customer/qna">QnA</a>
        <a class="text-body" href="/customer/oneToOne">1:1문의</a>
      </div>

      <!-- 관리자용 faq 글작성 버튼-->
      <div class="w-100 d-flex justify-content-end mt-3">
      <c:if test="${ user_rank eq '관리자' || user_rank eq '매니저' }">
      	<input type="button" class="btn btn-primary btn-sm" value="faq 작성" onclick="popupHideAndShow(target ='faqWrite');">
      </c:if>       
      </div>

      <div class="w-100 d-flex flex-column justify-content-between align-items-center mx-0 my-3 border p-3">
        <!-- FAQ 부트스트랩 아코디언  -->
        <div class="w-100 accordion" id="accordionExample">
        <!-- 백엔드 적용 -->
			<c:forEach var="dto" items="${ getFaqList }">
			<div class="card">
              <div class="card-header px-0 bg-white" id="headingTwo">
                <h2 class="mb-0">
                <!-- data-target 의 값과 숨겨진 아코디언의 아이디가 일치해야 함. -->
                  <button class="btn btn-link btn-block text-left text-body collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo_${dto.faq_idx}" aria-expanded="false" aria-controls="collapseTwo">
                    ${ dto.faq_title }
                  </button>
                </h2>
               </div>
            </div>
            <!-- 숨겨진 아코디언 -->
            <div id="collapseTwo_${ dto.faq_idx }" class="collapse border" aria-labelledby="headingTwo" data-parent="#accordionExample">
              <div class="card-body p-3">
                ${ dto.faq_contents }
              </div>
              <c:if test="${ user_rank eq '관리자' || user_rank eq '매니저' }">
              <div class="w-100 d-flex justify-content-end p-2">              
                <a href="faqDeleteAction?faq_idx=${ dto.faq_idx }" class="btn btn-primary btn-sm">삭제</a>
              </div>
              </c:if>         
            </div>
			</c:forEach>
            
          </div>
          
        </div>
    <!-- Content div 종료 -->
    </div>
 	
 	<!-- 질문작성 팝업창 -->
    <div class="container-sm container-fluid col-12 position-absolute d-none flex-column justify-content-center bg-white border border-dark-50 rounded" style="top:50%; left: 50%; transform:translate(-50%, -50%); width:340px;" id="faqWrite">
      <!-- 캔슬 아이콘 -->
      <div class="w-100 d-flex flex-row justify-content-end my-2">
        <i class="bi bi-x-lg" width="30px" height="30px" onclick="popupHideAndShow(target = 'faqWrite');"></i>
      </div>
      <!-- MainDiv -->
      <div class="w-100 d-flex flex-column justify-content-center align-items-center">
        <h6 class="">자주하는 질문 등록창</h6>
        <form action="faqWriteAction" method="post" class="d-flex flex-column align-items-center col-12 mt-2" onsubmit="return nullChecker();">
          <input type="text" class="mt-2 mb-1 w-100 form nullcheck" name="faq_title" id="faq_title" placeholder="FAQ 제목을 입력해주세요.">
          <textarea name="faq_contents" id="faq_contents" class="w-100 nullcheck" rows="5" style="resize: none;" placeholder="FAQ 내용을 입력해주세요."></textarea>
          <input type="submit" class="btn btn-primary col-6 mt-3 mb-5" value="확인">
        </form>
      </div>
    </div>
 
 
    <!-- bootstrap js -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
    <!-- main js -->
    <script src="/js/main.js"></script>
  </body>
</html>