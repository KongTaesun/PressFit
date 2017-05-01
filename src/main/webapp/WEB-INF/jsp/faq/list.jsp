<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jstl 시간 출력 태그 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 목록</title>
<%@ include file="/resources/include/header.jsp"%>
<style>
.breadcrumbs-area {
	background-image:
		url('${path}/resources/writer/img/bigpicture/q&a_img.png');
}
</style>
<script>

</script>

<script>
	$(document).ready(
			function() {
				$("#btnWrite").click(function() {
					// 페이지 주소 변경(이동)
					location.href = "${path}/faq/write.do";
				});
				$("#btnWrite").click(
						function() {
							// 페이지 주소 변경(이동)
							location.href = "${path}/faq/list.do?curPage="
									+ page
									+ "&searchOption=${map.searchOption}"
									+ "&keyword=${map.keyword}";
						});
			});
	// 원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해 
	function list(page) {
		location.href = "${path}/faq/list.do?curPage=" + page 
				+ "&searchOption=${map.searchOption}"
				+ "&keyword=${map.keyword}";
	}

</script>
</head>
<body>
	<!-- Breadcrumbs Area Start -->
	<div class="breadcrumbs-area">
		<div class="container">

			<div class="row">
				<div class="col-md-12">

					<div class="breadcrumbs">

						<h2>FAQ</h2>
						<ul class="breadcrumbs-list">
							<li><a title="Return to Home" href="index.html">Home</a></li>
							<li>FAQ</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
		<!-- About Us Area Start -->
<<<<<<< HEAD
	<div class="about-us-area section-padding">
		<div class="container">
			<div class="about-inner">
				<div class="about-title1">
					<h2>FAQ</h2>
										<div class="row">
											<div class="col-md-11">
												<div class="wishlist-table-area1 table-responsive1">

								<c:choose>
									<c:when test="${fn:length(map.list)>0 }">
										<div class="panel-group" id="accordion" role="tablist"
											aria-multiselectable="true">
											<c:forEach var="row" items="${map.list}" varStatus="status">


												<div class="panel panel-default">
													<div class="panel-heading" role="tab" id="headingOne">
														<h4 class="panel-title">
															<a data-toggle="collapse" data-parent="#accordion"
																href="#collapse${status.index}" aria-expanded="true"
																aria-controls="collapseOne"> 
																번호 ${row.idx}  등록일 ${row.regdate}
																<ul class>
																	<li class>
																	제목
																${row.title}
																	
																	
																	</li>
																	
																</ul>
																
																
																	
																	<button type="button" class="btn btn-default btn-xs btnReply"
											title="관리자 답변" data-toggle="popover" data-placement="right"
											data-content="">답변보기</button>
																	
																	<td><c:choose>
			<c:when test="${a.replyCount==0}">
				<button type="button" class="btn btn-default btn-xs btnReplyAdd"
					value="${a.qid}">답변쓰기</button>
			</c:when>
			<c:otherwise>
				<button type="button" class="btn btn-default btn-xs btnReplyModify"
					value="${a.qid}">답변수정</button>
			</c:otherwise>
		</c:choose></td>
																	
															</a>
														</h4>
													</div>
													<div id="collapse${status.index}"
														class="${status.index eq 0 ? 'panel-collapse collapse in':'panel-collapse collapse ${i}'} "
														role="tabpanel" aria-labelledby="headingOne">
														<div class="panel-body">
															내용 "${row.content}"

															<c:out escapeXml="false"
																value="${fn:replace(row.content,ENTER,'<br>')}" />



														</div>
													</div>
												</div>
											</c:forEach>
										</div>
									</c:when>
									
								</c:choose>

							</tbody>
						</table>

						<div class="searchbar1">
							<form name="form1" method="post" action="${path}/faq/list.do">
								<select name="searchOption">
									<!-- 검색조건을 검색처리후 결과화면에 보여주기위해  c:out 출력태그 사용, 삼항연산자 -->
									<option value="all"
										<c:out value="${map.searchOption == 'all'?'selected':''}"/>>제목+이름+제목</option>
									<option value="name"
										<c:out value="${map.searchOption == 'writer'?'selected':''}"/>>이름</option>
									<option value="content"
										<c:out value="${map.searchOption == 'content'?'selected':''}"/>>내용</option>
									<option value="title"
										<c:out value="${map.searchOption == 'title'?'selected':''}"/>>제목</option>
								</select> <input name="keyword" value="${map.keyword}"> <input
									type="submit" class="btn-default" value="조회">
								<!-- 로그인한 사용자만 글쓰기 버튼을 활성화 -->
								<c:if test="${sessionScope.id != null}">
									<button type="button" id="btnWrite">글쓰기</button>
								</c:if>
							</form>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>

	
	<script>
$(".btnReplyAdd").click(function() {
	//부모 글번호를 hidden 태그에 저장하는 액션 추가
	//replyqaboardinsert.it
	var qid = $(this).val();
	$("#replyQABoardInsertForm #qid").val(qid);
	//textarea는 text(), html()이 아닌 val() 사용할 것.
	$("#replyQABoardInsertForm #content").val("");
	$("#replyQABoardInsertForm").modal();
});


//답변수정 버튼에 대한 이벤트 등록
$(".btnReplyModify").click(function() {
	//문제)
	//부모 글번호를 hidden 태그에 저장하는 액션 추가
	//기존 답변을 서버에 요청(Ajax)해서 그 결과를 가지고,
	//기존 답변을 모달창 내부의 입력폼에 보여주는 액션 추가
	//action 속성의 주소를 동적으로 지정
	//replyqaboardupdate.it
	var qid = $(this).val();
	
	var result;
 	//Ajax 동기 방식 요청
	$.ajax({
		url : "ajaxreplycontent.it",
		data : {qid : qid},
		success : function(data) {
			result = data;
		} ,
		async : false 
	});	
	$("#replyQABoardInsertForm #qid").val(qid);
	$("#replyQABoardInsertForm form").attr("action", "replyqaboardupdate.it");
	//text(), html()이 아닌 val() 사용할 것.
	$("#replyQABoardInsertForm #content").val(result);
	$("#replyQABoardInsertForm").modal();
});
	</script>


<!-- 답변쓰기 Modal -->
<div id="replyQABoardInsertForm" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">문의에 대한 답변</h4>
			</div>
			<div class="modal-body">

				<form role="form" action="replyqaboardinsert.it" method="post">
					<input type="hidden" id="qid" name="qid" value="">
					<div class="form-group">
						<label for="content">내용:</label>
						<textarea class="form-control" rows="5" id="content"
							name="content"
							placeholder="내용 (1000자 이내)" maxlength="1000"
							required="required"></textarea>
					</div>
					<button type="submit" class="btn btn-default btn-sm">Submit</button>
				</form>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default btn-sm"
					data-dismiss="modal">Close</button>
			</div>
=======
		<div class="about-us-area section-padding">
		    <div class="container">
                <div class="row">
                    <div class="about-top-inner">
                        <div class="col-md-6">
                            <div class="about-inner">
                                <div class="about-title">
    <h2>FAQ</h2>
   
		<!-- Cart Area Start -->
		<div class="shopping-cart-area section-padding">
		    <div class="container">
		        <div class="row">
		            <div class="col-md-12">
                        <div class="wishlist-table-area table-responsive">
                            <table>
                                <thead>
                                    <tr>
                                
                                       
                                
                                        <th class="number">Number</th>
                                        <th class="title">Title</th>
                                        <th class="writer">Writer</th>
                                        <th class="regdate">Regdate</th>
                                        <th class="count">Count</th>
                                    </tr>
                                </thead>
                                <tbody>  
                                
                                 <c:forEach var="row" items="${map.list}"> 
                                    <tr>
                                    

                                         <td class="number">
                   <p>${row.idx}</p>                   
                                        </td>
                                        <td class="title">
                                            <p>
	  <a href="${path}/faq/view.do?idx=${row.idx}&curPage=${map.boardPager.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}">${row.title} 
                    <!-- ** 댓글이 있으면 게시글 이름 옆에 출력하기 -->
                    <c:if test="${row.recnt >= 0}">
                    <span style="color: red;">(${row.recnt})
                    </span>
                    </c:if>
                </a>  		 
	  		
	  		  			 </p>  
                                     </td> 
                                        <td class="writer">
                                            ${row.writer} 
               
                                        </td>
                                        <td class="regdate">
                                         ${row.regdate}
											</td>
                                        <td class="count">
									 	   ${row.viewcnt}
										</td>
                                    </tr> 
                            
                                     </c:forEach>
                                </tbody>                                
                            </table>
                        </div>	
                        
                        <div class="shopingcart-bottom-area">
                        <div class="shopingcart-bottom-area pull-right">
						
								 <tr>
            <td colspan="10">
                <!-- 처음페이지로 이동 : 현재 페이지가 1보다 크면  [처음]하이퍼링크를 화면에 출력-->
                <c:if test="${map.boardPager.curBlock > 1}">
                    <a href="javascript:list('1')">[처음]</a>
                </c:if>
                
                <!-- 이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 -->
                <c:if test="${map.boardPager.curBlock > 1}">
                    <a href="javascript:list('${map.boardPager.prevPage}')">[이전]</a>
                </c:if>
                
                <!-- **하나의 블럭 시작페이지부터 끝페이지까지 반복문 실행 -->
                <c:forEach var="num" begin="${map.boardPager.blockBegin}" end="${map.boardPager.blockEnd}">
                    <!-- 현재페이지이면 하이퍼링크 제거 -->
                    <c:choose>
                        <c:when test="${num == map.boardPager.curPage}">
                            <span style="color: red">${num}</span>&nbsp;
                        </c:when>
                        <c:otherwise>
                            <a href="javascript:list('${num}')">${num}</a>&nbsp;
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                
                <!-- 다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
                <c:if test="${map.boardPager.curBlock <= map.boardPager.totBlock}">
                    <a href="javascript:list('${map.boardPager.nextPage}')">[다음]</a>
                </c:if>
                
                <!-- 끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
                <c:if test="${map.boardPager.curPage <= map.boardPager.totPage}">
                    <a href="javascript:list('${map.boardPager.totPage}')">[끝]</a>
                </c:if>
            </td>
        </tr>
        
        <br>
        <form name="form1" method="post" action="${path}/faq/list.do">
        <select name="searchOption">
            <!-- 검색조건을 검색처리후 결과화면에 보여주기위해  c:out 출력태그 사용, 삼항연산자 -->
            <option value="all" <c:out value="${map.searchOption == 'all'?'selected':''}"/> >제목+이름+제목</option>
            <option value="name" <c:out value="${map.searchOption == 'writer'?'selected':''}"/> >이름</option>
            <option value="content" <c:out value="${map.searchOption == 'content'?'selected':''}"/> >내용</option>
            <option value="title" <c:out value="${map.searchOption == 'title'?'selected':''}"/> >제목</option>
        </select>

        <input name="keyword" value="${map.keyword}">
        <input type="submit" value="조회">



    <!-- 로그인한 사용자만 글쓰기 버튼을 활성화 -->
    <c:if test="${sessionScope.id != null}">
        <button type="button" id="btnWrite">글쓰기</button>


    </c:if>
    </form>
    <!-- 레코드의 갯수를 출력 -->

    ${map.count}개의 게시물이 있습니다. 
        
        </div>
        </div>
        </div> 
        </div>
        </div>
        </div> 
        </div>
       
							</div>
                        </div>	                
		            </div>
		        </div>
		    </div>
>>>>>>> origin/tesuk
		</div>

	</div>
</div>
	
	
	
</body>
<%@ include file="/resources/include/footer.jsp"%>
</html>