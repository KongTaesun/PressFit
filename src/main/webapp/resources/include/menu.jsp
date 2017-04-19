<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- context 경로 -->
<c:set var="path" value="${pageContext.request.contextPath}"/>
    <div style="text-align: center;">
	    <c:if test="${msg == 'success'}">
	    	<h2>${sessionScope.name}(${sessionScope.Id})님 환영합니다.</h2>
	    </c:if>
		<c:if test="${msg != 'success'}">
	    	<a href="${path}/member/login.do">로그인</a>
	    </c:if>
	    <c:if test="${msg == 'success'}">
		    <a href="${path}/member/logout.do">로그아웃</a>
		    <a href="${path}/member/.do">개인페이지</a>
	    </c:if>
	    <a href="${path}/community/list.do">커뮤니티 게시판</a>
	    <a href="${path}/servicecenter/list.do">고객센터 게시판</a>
	    <a href="${path}/gallery/list.do">갤러리 게시판</a>
	    <a href="${path}/tmouse/list.do">마우스 게시판</a>
	</div>
    <hr>
