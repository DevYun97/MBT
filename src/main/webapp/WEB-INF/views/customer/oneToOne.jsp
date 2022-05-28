<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>1대1문의</title>
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

      <!-- 글작성 버튼-->
      <div class="w-100 d-flex justify-content-end mt-3">
        <a href="qnaWrite" class="btn btn-primary btn-sm">글작성</a>
      </div>

      <div class="w-100 d-flex flex-column justify-content-between align-items-center mx-0 my-3 border p-3">
        <c:forEach var="dto" items="${ getOneToList }">
        <a href="../customer/qnaDetail?qna_idx=${ dto.qna_idx }" class="w-100 d-flex justify-content-between align-items-center mt-3 pb-3 border-bottom text-body">
          <div>${ dto.qna_title }</div>
          <div class="text-right text-muted fontSize12" >
          <c:if test="${ dto.qna_reply_check eq '1' }"></c:if>  
            <input type="button" class="btn btn-primary btn-sm" value="답변완료">           
          </div>
        </a>
        </c:forEach>                
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