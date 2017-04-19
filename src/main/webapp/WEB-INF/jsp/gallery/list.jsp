<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 목록</title>
<%@ include file="/resources/include/header.jsp"%>
<script>
	$(document).ready(
			function() {
				$("#btnWrite").click(function() {
					// 페이지 주소 변경(이동)
					location.href = "${path}/gallery/write.do";
				});
				$("#btnWrite").click(
						function() {
							// 페이지 주소 변경(이동)
							location.href = "${path}/gallery/list.do?curPage="
									+ page
									+ "&searchOption=${map.searchOption}"
									+ "&keyword=${map.keyword}";
						});
			});
	// 원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해 
	function list(page) {
		location.href = "${path}/gallery/list.do?curPage=" + page
				+ "&searchOption=${map.searchOption}"
				+ "&keyword=${map.keyword}";
	}
</script>
</head>

<body>

	<%@ include file="/resources/include/mobile.jsp"%>



	<div class="breadcrumbs-area">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="breadcrumbs">


						<h2>GALLERY</h2>
						<ul class="breadcrumbs-list">

							<li>GALLERY</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>




	<%-- <div class="featured-product-area section-padding">
		<h2 class="section-title">FEATURED PRODUCTS</h2>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="tab-menu"></div>
				</div>
			</div>


			<div class="row">
				<div class="col-md-4">
					<a href="갤러리.jpg" class="thumbnail">

						<p>이미지1</p> <img src="${path}/resources/upload/city1.jpg" alt="city1"
						style="width: 150px; height: 150px">

					</a>

				</div>

				<div class="col-md-4">
					<a href="city2.jpg" class="thumbnail">
						<p>시티이미지2</p> <img src="${path}/resources/upload/city2.jpg" alt="city1"
						style="width: 150px; height: 150px">
					</a>
				</div>
				<div class="col-md-4">

					<a href="city3.jpg" class="thumbnail">
						<p>시티이미지3</p> <img src="${path}/resources/upload/city3.jpg" alt="city1"
						style="width: 150px; height: 150px">
					</a>
				</div>
			</div>
		</div>

		<form name="form1" method="post" action="${path}/gallery/list.do">
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
		<!-- 레코드의 갯수를 출력 -->
		${map.count}개의 게시물이 있습니다.
		<table border="1">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>이름</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<c:forEach var="row" items="${map.list}">
				<tr>
					<td>${row.idx}</td>
					<!-- 게시글 상세보기 페이지로 이동시 게시글 목록페이지에 있는 검색조건, 키워드, 현재페이지 값을 유지하기 위해 -->
					<td><a
						href="${path}/gallery/view.do?idx=${row.idx}&curPage=${map.boardPager.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}">${row.title}
							<!-- ** 댓글이 있으면 게시글 이름 옆에 출력하기 --> <c:if test="${row.recnt >= 0}">
								<span style="color: red;">(${row.recnt}) </span>
							</c:if>
					</a></td>
					<td>${row.writer}</td>
					<td>
						<!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 --> <fmt:formatDate
							value="${row.regdate}" pattern="yyyy-MM-dd HH:mm:ss" />
					</td>
					<td>${row.viewcnt}</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="5">
					<!-- 처음페이지로 이동 : 현재 페이지가 1보다 크면  [처음]하이퍼링크를 화면에 출력--> <c:if
						test="${map.boardPager.curBlock > 1}">
						<a href="javascript:list('1')">[처음]</a>
					</c:if> <!-- 이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 --> <c:if
						test="${map.boardPager.curBlock > 1}">
						<a href="javascript:list('${map.boardPager.prevPage}')">[이전]</a>
					</c:if> <!-- **하나의 블럭 시작페이지부터 끝페이지까지 반복문 실행 --> <c:forEach var="num"
						begin="${map.boardPager.blockBegin}"
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
					<c:if test="${map.boardPager.curBlock <= map.boardPager.totBlock}">
						<a href="javascript:list('${map.boardPager.nextPage}')">[다음]</a>
					</c:if> <!-- 끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 --> <c:if
						test="${map.boardPager.curPage <= map.boardPager.totPage}">
						<a href="javascript:list('${map.boardPager.totPage}')">[끝]</a>
					</c:if>
				</td>
			</tr>
		</table>

	</div> --%>

	<div class="shopping-area section-padding">
      <div class="container">
         <!-- 레코드의 갯수를 출력 -->
         ${map.count}개의 게시물이 있습니다.
         <!-- Shop Area Start -->
         <div class="row" >
            
            <div class="col-md-9 col-sm-9 col-xs-12" style="width:100%">
               <div class="shop-tab-area">
                  
                  <div class="tab-content">
                     <div class="row tab-pane fade in active" id="home">
                        <div class="shop-single-product-area">
                           <c:forEach var="row" items="${map.list}">
                              <div class="col-md-4 col-sm-6">
                                 <div class="single-banner">
                                    <div class="product-wrapper">
                                       <a
                                          href="${path}/gallery/view.do?idx=${row.idx}&curPage=${map.boardPager.curPage}&searchOption=${map.searchOption}&keyword=${map.gallery}"
                                          class="single-banner-image-wrapper"> <img alt=""
                                          src="${path}/resources/upload/${row.fullName}" style="width:270 ;height:280 ">
                                          
                                       </a>
                                       
                                    </div>
                                    <div class="banner-bottom text-center">
                                       <div class="banner-bottom-title">
                                          <a href="${path}/gallery/view.do?idx=${row.idx}&curPage=${map.boardPager.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}">${row.title} <c:if
                                                test="${row.recnt >= 0}">
                                                <span style="color: red;">(${row.recnt}) </span>
                                             </c:if>
                                          </a>
                                       </div>
                                       <div>
                                             ${row.writer}</div>
                                       <div>
                                             ${row.regdate}</div>
                                       
                                    </div>
                                 </div>
                              </div>
                           </c:forEach>

                        </div>
                     </div>
                     
                     <div id="menu1" class="tab-pane fade">
                        <div class="row">
                           <div class="single-shop-product">
                           
                              <div class="col-xs-12 col-sm-5 col-md-4">
                                 <div class="left-item">
                                    <a href="single-product.html" title="Lone some dove"> <img
                                       src="/resources/writer/img/featured/4.jpg" alt="">
                                    </a>
                                 </div>
                              </div>
                              <div class="col-xs-12 col-sm-7 col-md-8">
                                 <div class="deal-product-content">
                                    <h4>
                                       <a href="single-product.html" title="Lone some dove">Lone
                                          some dove</a>
                                    </h4>
                                    <div class="product-price">
                                       <span class="new-price">$ 140.00</span> <span
                                          class="old-price">$ 120.00</span>
                                    </div>
                                    <div class="list-rating-icon">
                                       <i class="fa fa-star icolor"></i> <i
                                          class="fa fa-star icolor"></i> <i
                                          class="fa fa-star icolor"></i> <i class="fa fa-star"></i>
                                       <i class="fa fa-star"></i>
                                    </div>
                                    <p>Faded short sleeves t-shirt with high neckline. Soft
                                       and stretchy material for a comfortable fit. Accessorize
                                       with a straw hat and you're ready for summer!</p>
                                    <div class="availability">
                                       <span>In stock</span> <span><a href="cart.html">Add
                                             to cart</a></span>
                                    </div>
                                 </div>
                              </div>
                              
                           </div>
                        </div>
                     </div>
                     
                  </div>
                  <div class="shop-tab-list" >
                     
                     <div class="shop-tab-pill pull-right">
                        <ul>
                           
                           <li class="product-size-deatils">
                              <div class="show-label">
                                 <label><i class="fa fa-sort-amount-asc"></i>Sort by :
                                 </label> <select>
                                    <option value="position" selected="selected">Position</option>
                                    <option value="Name">Name</option>
                                    <option value="Price">Price</option>
                                 </select>
                              </div>
                           </li>
                           <!-- 처음페이지로 이동 : 현재 페이지가 1보다 크면  [처음]하이퍼링크를 화면에 출력--> 
                           <c:if test="${map.boardPager.curBlock > 1}">
                              <a href="javascript:list('1')">[처음]</a>
                           </c:if> 
                           <!-- 이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 --> 
                           <c:if test="${map.boardPager.curBlock > 1}">
                              <a href="javascript:list('${map.boardPager.prevPage}')">[이전]</a>
                           </c:if> <!-- **하나의 블럭 시작페이지부터 끝페이지까지 반복문 실행 --> 
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
                              </c:forEach> <!-- 다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
                              <c:if test="${map.boardPager.curBlock <= map.boardPager.totBlock}">
                                 <a href="javascript:list('${map.boardPager.nextPage}')">[다음]</a>
                              </c:if> <!-- 끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 --> 
                              <c:if test="${map.boardPager.curPage <= map.boardPager.totPage}">
                                 <a href="javascript:list('${map.boardPager.totPage}')">[끝]</a>
                              </c:if>
                           <c:if test="${sessionScope.id != null}">
                              <button type="button" id="btnWrite">글쓰기</button>
                           </c:if>                     
                           </ul>
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