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
	  <c:import url="../header.jsp"></c:import>

      <!-- 메인 -->
     
      <!--  -->
      <div class="w-100 d-flex justify-content-between align-items-center mx-0 mt-3 border p-2" style="height: 56px;">
        <div class="pl-2 my-2 pointer" onclick="history.back('-1');" >
          <i class="bi bi-chevron-left mr-1" ></i>이전화면
        </div>    
        <div>
        <c:if test="${ user_id eq board.board_user }">
          <input type="button" class="btn btn-primary fontSize14" value="수정" style="height: 30px;" onclick="location.href=''">
          <a href="boardDeleteAction?board_idx=${ board.board_idx }" class="btn btn-primary fontSize14" style="height: 30px;">삭제</a>
        </c:if>
        </div>
      </div>  

      <div class="w-100 d-flex flex-column justify-content-between align-items-center mx-0 my-3 border p-3">
        
        <!-- 공지사항 제목 -->
        <div class="w-100 border-bottom pt-2 pb-3">
          <h5>${ board.board_title }</h5>
          <div class="d-flex justify-content-between fontSize14" >
            <div>${ board.board_user }</div>
            <div>
              <small>조횟수 : ${ board.board_hit }</small> <small class="px-1"> | </small> <small>${ board.board_data }</small>             
            </div>
          </div>
        </div>

        <!-- 공지사항 내용 일반회원은 텍스트만 / 관리자는 수정가능하게 입력폼으로 보이게 변경하기-->
        <div class="w-100 mt-3 px-2 pb-3 text-left border-bottom" style="height:200px;">
          ${ board.board_content }
       </div>

        <!-- 버튼 div -->
        <form action="replyWriteAction?board_idx=${ board.board_idx }&&user_idx=${ user_idx }" method="post" class="w-100 d-flex justify-content-between px-2">
          <input type="text" class="col-10 mt-3" id="reply_content" name="reply_content" placeholder="댓글을 달아주세요">
          <input type="submit" class="btn btn-primary btn-sm col-2 mt-3" value="작성">
        </form>
        
      </div>
      
      <!-- 댓글창 -->
      <div class="w-100 d-flex flex-column justify-content-between align-items-center border mx-0 mt-1 mb-5 p-2">

        <div class="w-100 mt-2 pb-3 border-bottom">
          <h5>댓글창</h5>
          <small> 댓글갯수 : ${ reCount } </small>
        </div>

        <div class="w-100 d-flex flex-column justify-content-between align-items-start mt-2 pb-3 text-body">
          <c:forEach var="re" items="${ getReplyList }">
          <div class="w-100 d-flex justify-content-between mt-2">
            <h6 class="font-weight-bold mb-">${ re.reply_user }</h6>
            <small class="text-right text-muted pr-1">${ re.reply_data }</small>
          </div>
          <div class="w-100 border-bottom rounded fontSize14" style=" height: 50px;"> ${ re.reply_content }</div>
          </c:forEach>
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