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
	  <c:import url="../header.jsp"></c:import>

      <!-- 메인 -->
      <!-- 서브바 -->
      <div class="w-100 d-flex justify-content-between align-items-center mx-0 mt-3 border p-2" style="height: 56px;">
        <h6 class="m-0 font-weight-bold">게시판 리스트</h6>
        <div>
        <c:if test="${ not empty user_id }">
        	<a href="/board/boardWrite" class="btn btn-primary fontSize14" style="height: 30px; ">글작성</a>
        </c:if>                   
        </div>
      </div>
	
	 <form action="board" method="get" class="w-100 d-flex justify-content-end align-items-center mx-0 mt-2 p-2">
		 <select id="schType" name="schType" style="height: 30px; ">
		 	<option value="sel">선택</option>
		 	<option value="name">작성자</option>
		 	<option value="title">제목</option>
		 </select>
		 <input type="text" id="schText" name="schText" placeholder="검색내용을 입력해주세요." />
		 <input type="submit" value="검색" class="btn btn-primary fontSize14 mb-1" style="width: 60px; height: 30px;" >
	 </form>	

      <div class="w-100 d-flex flex-column justify-content-between align-items-center mx-0 my-3 border p-3">
        <!-- 게시판 불러오기 -->
        <c:forEach var="board" items="${ board }">
        <a href="../board/boardDetail?board_idx=${ board.board_idx }" class="w-100 d-flex justify-content-between align-items-center mt-3 pb-3 border-bottom text-body">
          <div>${board.board_title}</div>
          <div class="text-right">
            <small class="pr-2">${ board.board_user }</small>
            <small>${board.board_data}</small>
          </div>
        </a>
        </c:forEach>
        
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
      <%-- <div class="mt-4 mb-3">
        <nav aria-label="Page navigation example">
          <ul class="pagination">
            <li class="page-item"><a class="page-link" href="goPage('1)">start</a></li>
            <li class="page-item"><a class="page-link" href="goPage('${ page.prevPage }')">start</a></li>
            
            <c:forEach var="num" begin="${ page.blockBegin }" end="${ page.blockEnd }">
            	<c:choose>
            		<c:when test="${ num == page.curPage }" >
            			<span> ${ num } </span> &nbsh;
            		</c:when>
            		<c:otherwise>
            			<a onclick="goPage('${num}')"> ${ num } </a>&nbsh;
            		</c:otherwise>
            	</c:choose>
            </c:forEach>
            
            <li class="page-item"><a class="page-link" href="goPage('${ page.nextPage }')">Next</a></li>
            <li class="page-item"><a class="page-link" href="goPage('${ page.totPage }')">end</a></li>
          </ul>
        </nav>
      </div>   --%>
      
      
      <div class="container row my-3 mx-auto">
		<nav class="mx-auto">
		        <ul class="pagination justify-content-center ">
					<!-- 현재 페이지가 페이지표시기의 페이지 표시 수 보다 작으면 뒤로가기버튼 disable -->
		          <li class="page-item <c:if test="${ pages.curPage <= 5 }">disabled</c:if>">
		            <a class="page-link" href="board?curPage=${ pages.beginPageBlock - 1}">&lang;</a>
		          </li>
				  <c:forEach var="page" begin="${ pages.beginPageBlock }" end="${ pages.endPageBlock }" step="1">
		          <li class="page-item <c:if test="${ pages.curPage == page }">active</c:if>">
		            <a class="page-link" href="board?curPage=${ page }">${ page }</a>
		          </li>
		          </c:forEach>
		          <!-- 마지막페이지까지 표시되면 앞으로 가기 표시 안됨 -->
		          <li class="page-item <c:if test="${ pages.countOfPage eq pages.beginPageBlock }">disabled</c:if>">
		            <a class="page-link" href="board?curPage=${ pages.endPageBlock+1}">&rang;</a>
		          </li>
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