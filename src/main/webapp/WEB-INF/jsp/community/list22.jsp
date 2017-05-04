<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 목록</title>
<%@ include file="/resources/include/header.jsp"%>
<style>
.breadcrumbs-area {
	background-image:
		url('${path}/resources/writer/img/bigpicture/office_img.png');
}
</style>



</head>
<body>
	<%@ include file="/resources/include/mobile.jsp"%>
	<!-- Breadcrumbs Area Start -->
	<div class="breadcrumbs-area">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="breadcrumbs">
						<h2>NOTICE</h2>
						<ul class="breadcrumbs-list">
							<li><a title="Return to Home" href="index.html">Home</a></li>
							<li>NOTICE</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumbs Area Start -->
	<!-- About Us Area Start -->
	<div class="about-us-area section-padding">
		<div class="container">
			<div class="row">
				<div class="about-top-inner1">
					<div class="col-md-3 col-sm-3 col-xs-12">
						<div class="about-inner">
							<div class="about-title1">
								<h2>공지사항</h2>
								<!-- Cart Area Start -->
								<div class="shopping-cart-area section-padding1">
									<div class="container">
										<div class="row">
											<div class="col-md-11">
												<div class="wishlist-table-area1 table-responsive1">
													<!-- 레코드 갯수 출력 -->
													<div class="countlist">${map.count}개의 게시물이 있습니다.</div>
													<table class="type08">
														<thead>
															<tr>
																<th style="width: 5%;">번 호</th>
																<th style="width: 25%;">제 목</th>
																<th style="width: 10%;">작 성 자</th>
																<th style="width: 15%;">등 록 일</th>
																<th style="width: 5%;">조 회 수</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach var="row" items="${map.list}">
																<tr>
																	<td>${row.idx}</td>
																	<td class="title-text-align"><a
																		href="${path}/community/view.do?idx=${row.idx}&curPage=${map.boardPager.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}">${row.title}
																			<!-- ** 댓글이 있으면 게시글 이름 옆에 출력하기  <c:if
																				test="${row.recnt >= 0}">
																				<span style="color: red;">(${row.recnt}) </span>
																			</c:if>-->
																	</a></td>
																	<td>${row.writer}</td>
																	<td>${row.regdate}</td>
																	<td>${row.viewcnt}</td>
																</tr>
															</c:forEach>
														</tbody>
													</table>
												</div>
												<br />
												<div class="shopingcart-bottom-area1">
													<div class="shopingcart-bottom-area1 pull-right">
														<tr>
															<td colspan="10">
																<!-- 처음페이지로 이동 : 현재 페이지가 1보다 크면  [처음]하이퍼링크를 화면에 출력--> <c:if
																	test="${map.boardPager.curBlock > 1}">
																	<a href="javascript:list('1')">[처음]</a>
																</c:if> <!-- 이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 -->
																<c:if test="${map.boardPager.curBlock > 1}">
																	<a href="javascript:list('${map.boardPager.prevPage}')">[이전]</a>
																</c:if> <!-- **하나의 블럭 시작페이지부터 끝페이지까지 반복문 실행 --> <c:forEach
																	var="num" begin="${map.boardPager.blockBegin}"
																	end="${map.boardPager.blockEnd}">
																	<!-- 현재페이지이면 하이퍼링크 제거 -->
																	<c:choose>
																		<c:when test="${num == map.boardPager.curPage}">
																			<span style="color: red">${num}</span>&nbsp;
                        </c:when>
																		<c:otherwise>
																			<a href="javascript:list('${num}')">${num}</a>&nbsp;
                        </c:otherwise>
																	</c:choose>
																</c:forEach> <!-- 다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
																<c:if
																	test="${map.boardPager.curBlock <= map.boardPager.totBlock}">
																	<a href="javascript:list('${map.boardPager.nextPage}')">[다음]</a>
																</c:if> <!-- 끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
																<c:if
																	test="${map.boardPager.curPage <= map.boardPager.totPage}">
																	<a href="javascript:list('${map.boardPager.totPage}')">[끝]</a>
																</c:if>
															</td>
														</tr>
														<br> <br />
														<div class="searchbar1">
														<form name="form1" method="post"
															action="${path}/community/list.do">
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
																type="submit" value="조회">
															<!-- 로그인한 사용자만 글쓰기 버튼을 활성화 -->
															<c:if test="${sessionScope.id != null}">
																<button type="button" id="btnWrite">글쓰기</button>
															</c:if>
														</form>
														</div>
														<br /> 
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
	</div>
	<%@ include file="/resources/include/footer.jsp"%>
</body>
</html>