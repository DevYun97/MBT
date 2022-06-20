<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

        <div id="memList" class="w-100">
	       <c:forEach var="mem" items="${ member }">
	        <a href="../admin/memberInfo?user_idx=${ mem.user_idx }" class="w-100 d-flex justify-content-between align-items-center mt-3 pb-3 border-bottom text-body">
	          <div>${ mem.user_id }</div>
	          <div class="text-right" >
	            <span class="pr-3 ">${ mem.user_rank }</span>
	            <span class="pr-2 text-muted fontSize12"> [ ${ mem.useYN } ] </span>
	            <span class="pr-1 fontSize12 text-muted">
	            상세조회 <i class="bi bi-chevron-right"></i>
	            </span>      	
	          </div>
	        </a>
	        </c:forEach>
        </div>
