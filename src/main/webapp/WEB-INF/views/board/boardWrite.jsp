<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta http-equiv=X-UA-Compatible content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글작성</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="/MBT/css/custom.css">
    <!-- 부트아이콘 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
  </head>
  <body>

    <!-- 컨텐츠 div -->
    <div class="container-sm container-fluid d-flex flex-column align-items-center justify-content-start border mx-auto" style="max-width: 520px; height: 800px; overflow: auto;">

      <!-- 헤더 -->
	  <c:import url="../header.jsp"></c:import>

      <!-- 메인 -->
          
      <div class="w-100">
        <!-- 서브바 -->
        <div class="w-100 d-flex justify-content-start align-items-center mx-0 border p-2" style="margin-top:80px;">          
          <div class="d-flex flex-column mx-1">
            <div class="pl-2 my-2 pointer" onclick="history.back('-1');" >
	          <i class="bi bi-chevron-left mr-1" ></i>이전화면
	        </div> 
          </div>          
        </div>
        
        <div class="w-100 d-flex flex-column justify-content-between align-items-center mx-0 my-3 border p-3">
	        <form id="boardFrm" method="post" class="w-100" onsubmit="return nullChecker();" enctype="multipart/form-data" accept-charset="UTF-8">
		        <!--제목 -->
		        <div class="w-100 border-bottom pt-2 pb-3">
		        	<input type="text" name="board_title" id="board_title" class="col-12 form nullcheck" value="${ board.board_title }" placeholder="제목을 작성해주세요.">
		        </div>
		        <!-- -->
		        <div class="w-100 mt-3 px-0 pb-3 text-left border-bottom">
		        	<textarea name="board_content" id="board_content" rows="10" class="w-100 px-2 py-2 " placeholder="내용을 작성해주세요.">${ board.board_content }</textarea>		     
		        	
		        	<div class="d-flex">
		        	<c:if test="${ not empty bImg.board_img }">
		        	<div class="mr-2">
		        		<img src="${ bImg.board_img }" class="img-fluid" style="width: 50px; height: 30px;">
		        	</div>
		        	</c:if>
		        	<input type="file" id="boardFiles" name="filename" value="${ bImg.board_img }" accept=".gif, .png, .jpg, .jpeg, bmp" onchange="fileCheck()" >		        
		        	</div>
		        	
		        	
		        	</div>
		        <input type="hidden" name="board_idx" value="${ board.board_idx }"/>
	        </form>
	                            
            <!-- 버튼 div -->
            <div class="w-100 d-flex justify-content-center">
              <c:if test="${ board.board_idx == null }">
              <input type="button" class="btn btn-primary col-5 mt-3 mr-1" value="확인" onclick="boardWriteBtn()">
              </c:if>
              <c:if test="${ board.board_idx != null }">
              <input type="button" class="btn btn-primary col-5 mt-3 mr-1" value="수정" onclick="boardUpdateBtn()">
              </c:if>
              <div class="btn btn-primary col-5 mt-3" onclick="history.back('-1');">취소</div>
            </div>
        </div>
      </div>
            
    <!-- Content div 종료 -->
    </div>


    <!-- bootstrap js -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
    <!-- main js -->
    <script src="/MBT/js/main.js"></script>
    
    <!-- testTool 하단 스크립트 추가 후 replace에 이름 넣어주면 text에디터? 사용 가능 -->
    <script src="https://cdn.ckeditor.com/4.15.1/standard/ckeditor.js"></script>
  	<script>CKEDITOR.replace('board_content');</script>
    
    <script>
    function fileCheck(){
		var ext = $("#boardFiles").val().split(".").pop().toLowerCase();
		
		if($.inArray(ext,["gif","jpg","jpeg","png","bmp"]) == -1) {
		    alert("이미지만 등록 가능합니다.");
		    $("#boardFiles").val("");
		    return;
		}
	}

    </script>
  
  </body>
</html>