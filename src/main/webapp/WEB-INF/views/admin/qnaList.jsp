<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

	<div id="qnaList" class="w-100">
	<c:forEach var="qna" items="${ getQnaList }">
        <a href="../customer/qnaDetail?qna_idx=${ qna.qna_idx }" class="w-100 d-flex justify-content-between align-items-center mt-3 pb-3 border-bottom text-body">
          <div>${ qna.qna_title }</div>
          <div class="text-right text-muted fontSize12" >
            <span class="pr-1">${ qna.qna_user }</span> ${ qna.qna_date }<i class="bi bi-chevron-right"></i>
          	<c:if test="${ qna.qna_reply_check eq '1'}">
          	[ 답변완료 ]            
          	</c:if>
          </div>
		</a>
	</c:forEach>
	</div>
    