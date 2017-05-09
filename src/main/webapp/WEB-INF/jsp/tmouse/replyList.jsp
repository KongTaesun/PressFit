<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
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


</style>
</head>
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
					<input type="button" id="btnModify" value="수정"
						onclick="showReplyModify('${boardno}/${row.idx}')">
					<input type="button" id="btnModify" value="답글달기"
						onclick="showReplyCmtModify('${boardno}/${row.idx}')">
				</c:if>
			</div>
			</div>
		</c:forEach>
	</div>





	<%--     <table style="width:700px">
        <!-- 댓글 목록 -->
        <c:forEach var="row" items="${list}">
        <tr>    
            <td>
                ${row.replayer}(<fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/>)123123123123123123123123123123123123123
                <br>
                ${row.idx}
                <br>
                ${row.replytext}
                <br>
                <!-- 본인 댓글만 수정버튼 생성되도록 처리 -->
                <input type="button" id="btnModify" value="댓글보기" onclick="showReplyModify('${boardno}/${row.idx}')">
                <c:if test="${sessionScope.id == row.replayer}">
                    <input type="button" id="btnModify" value="수정" onclick="showReplyModify('${boardno}/${row.idx}')">
                    <input type="button" id="btnModify" value="답글달기" onclick="showReplyCmtModify('${boardno}/${row.idx}')">
                </c:if>
                <hr>
            </td>
        </tr>
        </c:forEach> --%>
	<%-- <table style="width:700px">
        <!-- 댓글 목록 -->
        <c:forEach var="row" items="${list}">
        <tr>   
        	<td style="width:70px">
				<div class="thumbnail">
					<img class="img-responsive user-photo"
						src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
				</div>
        	</td> 
            <td>
                ${row.replayer}(<fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/>)123123123123123123123123123123123123123
                <br>
                ${row.idx}
                <br>
                ${row.replytext}
                <br>
                <!-- 본인 댓글만 수정버튼 생성되도록 처리 -->
                <input type="button" id="btnModify" value="댓글보기" onclick="showReplyModify('${boardno}/${row.idx}')">
                <c:if test="${sessionScope.id == row.replayer}">
                    <input type="button" id="btnModify" value="수정" onclick="showReplyModify('${boardno}/${row.idx}')">
                    <input type="button" id="btnModify" value="답글달기" onclick="showReplyCmtModify('${boardno}/${row.idx}')">
                </c:if>
                <hr>
            </td>
        </tr>
        </c:forEach> --%>



	<!-- 페이징 -->
	<%--         <tr style="text-align: center;">
            <td>
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
            </td>
        </tr>
    </table> --%>

	<!-- 댓글 수정 영역-->
	<div id="modifyReply"></div>
</body>
</html>
