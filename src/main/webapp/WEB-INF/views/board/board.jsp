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
  <script>
	
		
	function goPage(num){

		$("#pageNo").val(num);
		$("#schBtn").click();

	}

  </script>
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
		<!-- 검색기능 사용시 페이징 초기값 -->
		<input type = "hidden" name ="pageNo" id="pageNo" value ="1">
		<input type = "hidden" name ="listSize" id ="listSize" value ="5"> 
		 <select id="schType" name="schType" style="height: 30px;">
		 	<option >선택</option>
		 	<option value="name" <c:if test="${ sch.schType == 'name' }" > selected </c:if> >작성자</option>
		 	<option value="title" <c:if test="${ sch.schType == 'title' }" > selected </c:if> >제목</option>
		 </select>
		 <input type="text" id="schText" name="schText" class="mx-2" value="${ sch.schText }" placeholder="검색내용을 입력해주세요." />
		 <input type="submit" id="schBtn" value="검색" class="btn btn-primary fontSize14 my-1" style="width: 60px; height: 30px;" >
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
      </div>
      <!-- Content div 종료 -->
      <!-- 페이지네브바 -->
      
		    <%-- <div class="container row my-3 mx-auto">
				<nav class="mx-auto">
				        <ul class="pagination justify-content-center ">
							<!-- 현재 페이지가 페이지표시기의 페이지 표시 수 보다 작으면 뒤로가기버튼 disable -->
				          <li class="page-item <c:if test="${ page.curPage <= 5 }">disabled</c:if>">
				            <a class="page-link" href="board?curPage=${ page.beginPageBlock - 1}">&lang;</a>
				          </li>
						  <c:forEach var="page" begin="${ pages.beginPageBlock }" end="${ pages.endPageBlock }" step="1">
				          <li class="page-item <c:if test="${ pages.curPage == page }">active</c:if>">
				            <a class="page-link" href="board?curPage=${ page }">${ page }</a>
				          </li>
				          </c:forEach>
				          <!-- 마지막페이지까지 표시되면 앞으로 가기 표시 안됨 -->
				          <li class="page-item <c:if test="${ page.countOfPage eq pages.beginPageBlock }">disabled</c:if>">
				            <a class="page-link" href="board?curPage=${ pages.endPageBlock+1}">&rang;</a>
				          </li>
				        </ul>
				</nav>
			</div> --%>
			 <div class="container row my-3 mx-auto">
				<nav class="mx-auto">
					<c:if test="${page.curBlock > 0}">
	                    <a onclick="goPage('1')">[처음]</a>
	                </c:if>
	                <!-- **이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 -->
	                <c:if test="${page.curBlock > 1}">
	                    <a onclick="goPage('${page.prevPage}')">[이전]</a>
	                </c:if>
	                <!-- **하나의 블럭에서 반복문 수행 시작페이지부터 끝페이지까지 -->
	                <c:forEach var="num" begin="${page.blockBegin}" end="${page.blockEnd}">
	                    <!-- **현재페이지이면 하이퍼링크 제거 -->
	                    <c:choose>
	                        <c:when test="${num == page.curPage}">
	                            <span style="color: red">${num}</span>
	                        </c:when>
	                        <c:otherwise>
	                            <a onclick="goPage('${num}')">${num}</a>
	                        </c:otherwise>
	                    </c:choose>
	                </c:forEach>	                
	                <!-- **다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
	                <c:if test="${page.curBlock <= page.totBlock}">
	                    <a onclick="goPage('${page.nextPage}')">[다음]</a>
	                </c:if>	                
	                <!-- **끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
	                <c:if test="${page.curPage <= page.totPage}">
	                    <a onclick="goPage('${page.totPage}')">[끝]</a>
	                </c:if>    
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