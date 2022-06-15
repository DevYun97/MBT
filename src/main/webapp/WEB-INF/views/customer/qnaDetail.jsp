<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Qna 상세보기</title>
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

      <div class="w-100 d-flex justify-content-between align-items-center mx-0 mt-3 border p-2" style="height: 56px;">
        <div class="pl-2 my-2 pointer" onclick="history.back('-1');" >
          <i class="bi bi-chevron-left mr-1" ></i>이전화면
        </div>    
        <div>
        <c:if test="${ user_id eq qna.qna_user }">
          <a href="qnaDeleteAction?qna_idx=${ qna.qna_idx }" class="btn btn-primary fontSize14" style="height: 30px; ">삭제</a>
        </c:if>
        </div>
      </div> 

      <div class="w-100 d-flex flex-column justify-content-between align-items-center mx-0 my-3 border p-3">
        
        <!-- 문의사항 제목 -->
        <div class="w-100 border-bottom pt-2 pb-3">
          <h5>${ qna.qna_title }</h5>
          <div class="d-flex justify-content-between fontSize14" >
            <div>${ qna.qna_user }</div>
            <div>
              <small>${ qna.qna_date }</small>             
            </div>
          </div>
        </div>

        <!-- 문의사항 내용 일반회원은 텍스트만 / 관리자는 수정가능하게 입력폼으로 보이게 변경하기-->
        <div class="w-100 mt-3 px-2 pb-5 text-left border-bottom">
          ${qna.qna_contents}
       </div>

        <!-- 버튼 div -->
        <c:if test="${ (user_rank eq '관리자' || user_rank eq '매니저') AND qna_reply_check eq 0 }"> 
        <form action="qnaReplyAction?qna_idx=${ qna.qna_idx }" method="post" class="w-100 d-flex justify-content-between px-2">
        	<input type="hidden" name="qna_reply_check" id="qna_reply_check" value="1" />
          	<input type="text" class="col-10 mt-3" id="qna_reply" name="qna_reply" placeholder="댓글을 달아주세요">
          	<input type="submit" class="btn btn-primary btn-sm col-2 mt-3" value="작성">
        </form>
        </c:if>
        
        <c:if test="${ qna_reply_check eq 1 }">
        <!-- 댓글창 -->
        <div class="w-100 d-flex flex-column justify-content-between align-items-start mt-4 pb-3 border-bottom text-body">
          <div class="w-100 d-flex justify-content-between">
            <h6 class="font-weight-bold mb-">관리자</h6>
            <small class="text-right text-muted pr-1"> ${ qna.qna_reply_date } </small>
          </div>
          <div class="w-100 border rounded fontSize14" style=" height: 50px;"> ${ qna.qna_reply }</div>
        </div>
        </c:if>         
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