<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jstl 시간 출력 태그 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="path" value="${pageContext.request.contextPath}" />
<title>PressFit</title>
</head>
<style>
button {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	color: #616161;
	padding: 9px 20px;
	background: -moz-linear-gradient(top, #ffffff 0%, #ffffff);
	background: -webkit-gradient(linear, left top, left bottom, from(#ffffff),
		to(#ffffff));
	-moz-border-radius: 0px;
	-webkit-border-radius: 0px;
	border-radius: 0px;
	border: 1px solid #dbe2ff;
	box-shadow: 0px 1px 3px rgba(000, 000, 000, 0.3), inset 0px 0px 2px
		rgba(255, 255, 255, 0);
}
.row_box{
padding-bottom: 20px;
margin-bottom: 20px;
border-bottom: 1px dotted #BDBDBD;
width:58%;
}

.panel-default1 >.panel-heading {
    margin-left: 140px;
    padding: 0px;
}

.panel1 {
padding-bottom:20px;
}

.btnstyle {
border: 0px;
background-color: #fff;
}
</style>
<body>
	<!-- 댓글 목록 -->
	<div class="row">
		<c:forEach var="row" items="${list}">
		<div class="row_box">
			<!-- 프로필사진 -->
			
			<div class="col-sm-5" style="float:none; width:100%;">
			<div class="col-sm-2" style="float:left; padding:0px;">
				<div class="thumbnail" style="margin-bottom:0px; border:0px;">
					<img class="img-responsive user-photo" src="${path}/resources/upload/${row.cpicture}"
					style="height: 90px; width: 90px; border-radius: 100px;"> 
				</div>
			</div>
				<div class="panel1 panel-default1">
					<div class="panel-heading">
						<strong>${row.replayer}</strong> <span class="text-muted">(<fmt:formatDate
								value="${row.regdate}" pattern="yyyy-MM-dd HH:mm:ss" />)
						</span>
					</div>
					<div class="panel-body" style="margin-left: 140px; margin-top: 15px; padding:0px;">${row.replytext}</div>
					
				</div>
			</div>
			<div style="margin-left: 550px;"> 
				<!-- 본인 댓글만 수정버튼 생성되도록 처리 -->
				<c:if test="${sessionScope.id == row.replayer}">
					<input class="btnstyle" type="button" id="btnModify" value="수정"
						onclick="showReplyModify('${boardno}/${row.idx}')">
					<input class="btnstyle" type="button" id="btnModify" value="답글달기"
						onclick="showReplyCmtModify('${boardno}/${row.idx}')">
				</c:if>
			</div>
			</div>
		</c:forEach>
	</div>

	<!-- 페이징 -->
<div style="text-align:center; width:58%">
                <!-- 현재 페이지 블럭이 1보다 크면 처음페이지로 이동 -->
                <c:if test="${replyPager.curBlock > 1}">
                    <a href="javascript:listReply('1')">[처음]</a>
                </c:if>
                <!-- 현재 페이지 블럭이 1보다 크면 이전 페이지 블럭으로 이동 -->
                <c:if test="${replyPager.curBlock > 1}">
                    <a href="javascript:listReply('${replyPager.prevPage}')">[이전]</a>
                </c:if>
                <!-- 페이지 블럭 처음부터 마지막 블럭까지 -->
                <c:forEach var="num" begin="${replyPager.blockBegin}" end="${replyPager.blockEnd}">
                    <c:choose>
                        <c:when test="${num == replyPager.curPage}">
                            ${num}&nbsp;
                        </c:when>
                        <c:otherwise>
                            <a href="javascript:listReply('${num}')">${num}</a>&nbsp;
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <!-- 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 다음페이지로 이동 -->
                <c:if test="${replyPager.curBlock <= replyPager.totBlock}">
                    <a href="javascript:listReply('${replyPager.nextPage}')">[다음]</a>
                </c:if>
                <!-- 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 끝으로 이동 -->
                <c:if test="${replyPager.curBlock <= replyPager.totBlock}">
                    <a href="javascript:listReply('${replyPager.totPage}')">[끝]</a>
                </c:if>
</div>
    <!-- 댓글 수정 영역-->
    <div id="modifyReply"></div>
</body>
</html>
