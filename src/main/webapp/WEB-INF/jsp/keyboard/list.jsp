<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 목록</title>
<%@ include file="/resources/include/header.jsp"%>
<style>
.left-item1 img {
	width: 200px;
	height: 200px;
}

.breadcrumbs-area {
	background-image:
		url('${path}/resources/writer/img/bigpicture/keyboard_img.jpg');
}

.product-description {
	left: 75%;
	margin-top: 15px; /* -22 */
	opacity: 0;
	position: absolute;
	top: 73%;
	transition: all 0.3s ease 0s;
	width: 20%;
}

.product-description1 {
	left: 25%;
	margin-top: 15px; /* -22 */
	opacity: 0;
	position: absolute;
	top: 40%;
	transition: all 0.3s ease 0s;
	width: 50%;
	color: #FFFFFF;
}

.single-banner:hover .product-description1 {
	opacity: 1;
}

.product-description1:hover {
	color: #000000;
}

.price1 {
	padding: 10px 10px 10px 10px;
}

.keyboard-solid{
	font-weight: bold;
    font-size: 20px;
    padding: 5px;
    width: 10%;
    float: left;
}

.paging_friends {
    width: 100%;
    padding-top: 30px;
    text-align: center;
}
.paging_friends .inner_paging {
    display: inline-block;
    margin-left: -5px;
    vertical-align: top;
}
.screen_out {
    position: absolute;
    width: 0;
    height: 0;
}
.paging_friends em.link_page {
    border-color: #d2d2d2;
    font-weight: 700;
    color: #1e1e1e;
}
.paging_friends .link_page {
    display: inline;
    float: left;
    min-width: 30px;
    height: 30px;
    margin-left: 5px;
    border: 1px solid #efefef;
    line-height: 30px;
    color: #666;
    text-align: center;
    }
button {
    font-family: Arial, Helvetica, sans-serif;
    font-size: 14px;
    color: #616161;
    padding: 9px 20px;
    background: -moz-linear-gradient(top, #ffffff 0%, #ffffff);
    background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#ffffff));
    -moz-border-radius: 0px;
    -webkit-border-radius: 0px;
    border-radius: 0px;
    border: 1px solid #dbe2ff;
    box-shadow: 0px 1px 3px rgba(000,000,000,0.3), inset 0px 0px 2px rgba(255,255,255,0);
}
button.hover { 
    font-weight: bold;
    color: #000000;
    border: 1px solid #879fff;
}
</style>

<script>
	$(document).ready(
			function() {
				$("#btnWrite").click(function() {
					// 페이지 주소 변경(이동)
					location.href = "${path}/keyboard/write.do";
				});
				$("#btnWrite").click(
						function() {
							// 페이지 주소 변경(이동)
							location.href = "${path}/keyboard/list.do?curPage="
									+ page
									+ "&searchOption=${map.searchOption}"
									+ "&keyword=${map.keyword}";
						});
				$( "#slider-range" ).slider({
	                  range: true,
	                  min: 0, 
	                  max: 200000,
	                  values: [0, 200000],
	                  slide: function( event, ui ) {
	                  $( "#rangeamount" ).val( "$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ] );
	                  }
	                 });
	                 $( "#rangeamount" ).val( "$" + $( "#slider-range" ).slider( "values", 0 ) +
	                  " - $" + $( "#slider-range" ).slider( "values", 1 ) );  
	            $("#btnPrice").click(
	                  function(){
	                     var min = $( "#slider-range" ).slider( "values", 0 );
	                     var max = $( "#slider-range" ).slider( "values", 1 );
	               location.href="${path}/keyboard/list.do?searchOption=price&minPrice="+min+"&maxPrice="+max;
	            });
				
			
			});
				
				
	// 원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해 
	function list(page) {
		location.href = "${path}/keyboard/list.do?curPage=" + page
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
  
						<!-- <h2>키보드</h2> -->
						<!-- <ul class="breadcrumbs-list">
							<li><a title="Return to Home" href="index.html">Home</a></li>
							<li>NOTICE</li>
						</ul> -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumbs Area Start -->
	<div class="shopping-area section-padding">
		<div class="container">
			<!-- 레코드의 갯수를 출력 -->
			${map.count}개의 게시물이 있습니다.
			<!-- Shop Area Start -->
			<div class="row">
				<div class="col-md-3 col-sm-3 col-xs-12">
					<div class="shop-widget">
						<div class="shop-widget-top">
							<aside class="widget widget-categories">
								<h2 class="sidebar-title text-center">CATEGORY</h2>
								<ul class="sidebar-menu">
									<li><a
										href="${path}/keyboard/list.do?searchOption=contactsystem">
											<i class="fa fa-angle-double-right"></i> 기계식 키보드
									</a></li>
									<li><a
										href="${path}/keyboard/list.do?searchOption=functionkey">
											<i class="fa fa-angle-double-right"></i> 게이밍 키보드
									</a></li>
									<li><a
										href="${path}/keyboard/list.do?searchOption=keyboardform">
											<i class="fa fa-angle-double-right"></i> 텐키레스 키보드
									</a></li>
								</ul>
							</aside>
							<aside class="widget shop-filter">
								<h2 class="sidebar-title text-center">PRICE SLIDER</h2>
								<div class="info-widget">
									<div class="price-filter">
										<div id="slider-range"></div>
										<div class="price-slider-amount">
											<input type="text" id="rangeamount" name="price"
												placeholder="Add Your Price" />

											<div class="widget-buttom">
												<span class="btn-left"><input type="button"
													value="Filter" id="btnPrice" style="width: 112px;" /></span> <span
													class="btn-right"><input type="reset" value="CLEAR"
													style="width: 112px;" /></span>
											</div>
										</div>
									</div>
								</div>
							</aside>
						</div>
						<div class="shop-widget-bottom">
							<!-- <aside class="widget widget-tag">
								<h2 class="sidebar-title">POPULAR TAG</h2>
								<ul class="tag-list">
									<li><a href="#">e-book</a></li>
									<li><a href="#">writer</a></li>
									<li><a href="#">book’s</a></li>
									<li><a href="#">eassy</a></li>
									<li><a href="#">nice</a></li>
									<li><a href="#">author</a></li>
								</ul>
							</aside> -->
							<aside class="widget widget-seller">
								<h2 class="sidebar-title">TOP SELLERS</h2>
								<div class="single-seller">
									<div class="seller-img" style="border:1px solid #BDBDBD;">
										<img src="${path}/resources/upload/2017/04/11/4451353_1.jpg" alt="인기품목" style="width:100px; height:100px;"/> 
									</div>
									<div class="seller-details"     style="padding: 20px 20px 20px;">
										<a href="${path}/keyboard/view.do?idx=1&curPage=1&searchOption=title&keyword="><h5>MAXTILL TRON G100K (그레이, 청축)</h5></a>
										<h5>43,000원</h5>
									</div>
								</div>
								<div class="single-seller">
									<div class="seller-img" style="border:1px solid #BDBDBD;">
										<img src="${path}/resources/upload/2017/04/11/4292709_1.jpg" alt="인기품목" style="width:100px; height:100px;"/>
									</div>
									<div class="seller-details" style="padding: 20px 20px 20px;">
										<a href="${path}/keyboard/view.do?idx=4&curPage=1&searchOption=title&keyword="><h5>ABKO HACKER K600 하데스 리얼RGB 한영 이중사출 게이밍(블랙, 청축)</h5></a>
										<h5>65,000원</h5>
									</div>
								</div>
							</aside>
						</div>
					</div>
				</div>
				<div class="col-md-9 col-sm-9 col-xs-12">
					<div class="shop-tab-area">
						<div class="shop-tab-list">
						<div class="keyboard-solid">키보드 &nbsp;</div>
							<div class="shop-tab-pill pull-left">
								<ul>
									<li class="active" id="left"><a data-toggle="pill"
										href="#home"><i class="fa fa-th"></i><span>Grid</span></a></li>

									<li><a data-toggle="pill" href="#menu1"><i
											class="fa fa-th-list"></i><span>List</span></a></li>
								</ul>
							</div>
							<div class="shop-tab-pill pull-right">
								<ul>
									<li class="product-size-deatils">
										<!-- 	<div class="show-label">
											<label>Show : </label> <select>
												<option value="10" selected="selected">10</option>
												<option value="09">09</option>
												<option value="08">08</option>
												<option value="07">07</option>
												<option value="06">06</option>
											</select>
										</div> -->
									</li>
									<!-- <li class="product-size-deatils">
										<div class="show-label">
											<label><i class="fa fa-sort-amount-asc"></i>Sort by :
											</label> <select>
												<option value="position" selected="selected">Position</option>
												<option value="Name">Name</option>
												<option value="Price">Price</option>
											</select>
										</div>
									</li> -->
								<span class="paging_friends">
						<span class="inner_paging">
						<!-- 처음페이지로 이동 : 현재 페이지가 1보다 크면  [처음]하이퍼링크를 화면에 출력--> 
							<c:if test="${map.boardPager.curBlock > 1}">
							<a href="javascript:list('1')" class="link_page">[처음]</a>
						</c:if> 
						<!-- 이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 --> 
						<c:if test="${map.boardPager.curBlock > 1}">
							<a href="javascript:list('${map.boardPager.prevPage}')" class="link_page">[이전]</a>
						</c:if> <!-- **하나의 블럭 시작페이지부터 끝페이지까지 반복문 실행 --> 
						<c:forEach var="num" begin="${map.boardPager.blockBegin}" end="${map.boardPager.blockEnd}">
							<!-- 현재페이지이면 하이퍼링크 제거 -->
							<c:choose>
								<c:when test="${num == map.boardPager.curPage}">
					 				<span class="screen_out"></span><em class="link_page">${num}</em>
							    </c:when>
								<c:otherwise>
									<a href="javascript:list('${num}')" class="link_page">${num}</a>
							    </c:otherwise>
							</c:choose>
						</c:forEach>
						<!-- 다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
						<c:if test="${map.boardPager.curBlock <= map.boardPager.totBlock}">
							<a href="javascript:list('${map.boardPager.nextPage}')" class="link_page">[다음]</a>
						</c:if> <!-- 끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 --> 
						<c:if test="${map.boardPager.curPage <= map.boardPager.totPage}">
							<a href="javascript:list('${map.boardPager.totPage}')" class="link_page">[끝]</a>
						</c:if>
					</span>
					</span> 
									<%-- <c:if test="${sessionScope.id != null}">
										<button type="button" id="btnWrite">글쓰기</button>
									</c:if> --%>
								</ul>
							</div>
						</div>
						<div class="tab-content">
							<div class="row tab-pane fade in active" id="home">
								<div class="shop-single-product-area">
									<c:forEach var="row" items="${map.list}">
										<div class="col-md-4 col-sm-6">
											<div class="single-banner">

												<div class="product-wrapper"
													style="width: 260px; height: 260px;">
													<a
														href="${path}/keyboard/view.do?idx=${row.idx}&curPage=${map.boardPager.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}"
														class="single-banner-image-wrapper"> <img
														src="${path}/resources/upload/${row.fullName}"
														style="width: 260px; height: 260px;">
													</a> <a
														href="${path}/keyboard/view.do?idx=${row.idx}&curPage=${map.boardPager.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}">
														<div class="product-description1">
															<div style="text-align: center;">자세히보기</div>
														</div>
													</a>
													<div class="product-description">
														<div class="functional-buttons">
															<a
																href="${path}/shop/cart/insert.do?price=${row.price}&modelname=${row.modelname}&manufacturecompany=${row.manufacturecompany}&idx=${row.idx}&fullName=${row.fullName}&kind=keyboard&amount=1&crea_id=${row.crea_id}"
																title="Add to Cart"> <i class="fa fa-shopping-cart"></i>
															</a>
															<!-- <a href="#" title="Add to Wishlist"> <i
																class="fa fa-heart-o"></i>
															</a> <a href="#" title="Quick view" data-toggle="modal"
																data-target="#productModal"> <i
																class="fa fa-compress"></i>
															</a> -->
														</div>
													</div>
												</div>
												<div class="banner-bottom1 text-center">
													<div class="banner-bottom-title"
														style="width: 80%; height: 40px; overflow: hidden; top: 50%; margin-top: 15px; margin-bottom: 0px; margin-left: 25px; margin-right: 25px;">
														<a
															href="${path}/keyboard/view.do?idx=${row.idx}&curPage=${map.boardPager.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}">${row.modelname}
															<c:if test="${row.recnt >= 0}">
															</c:if>
														</a>
													</div>
													<div class="price1">${row.price}원</div>
													<input type="hidden" name="crea_id" id="crea_id"
														value="${row.crea_id}">
													<div style="display-table: table-cell"></div>
													<!-- <div class="rating-icon">
														<i class="fa fa-star icolor"></i> <i
															class="fa fa-star icolor"></i> <i
															class="fa fa-star icolor"></i> <i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
													</div> -->
												</div>
											</div>
										</div>
									</c:forEach>

								</div>
							</div>

							<div id="menu1" class="tab-pane fade">
								<div class="row">
									<div class="single-shop-product">





										<c:forEach var="row" items="${map.list}">
											<div class="col-xs-12 col-sm-5 col-md-4">
												<div class="left-item1">
													<a
														href="${path}/keyboard/view.do?idx=${row.idx}&curPage=${map.boardPager.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}"
														title="${row.modelname }"> <img
														src="${path}/resources/upload/${row.fullName}" />
													</a>
												</div>
											</div>
											<div class="col-xs-12 col-sm-7 col-md-8">
												<div class="deal-product-content">
													<h4>
														<a
															href="${path}/tmouse/view.do?idx=${row.idx}&curPage=${map.boardPager.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}"
															title="${row.modelname }"> ${row.modelname}</a>
													</h4>
													<div class="product-price">
														<span class="new-price">${row.price}￦</span>
													</div>
													<div class="list-rating-icon">
														<i class="fa fa-star icolor"></i> <i
															class="fa fa-star icolor"></i> <i
															class="fa fa-star icolor"></i> <i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
													</div>
													<p>글 내용을 바꿔야함</p>
													<div class="availability">
														<span>In stock</span> <span><a href="cart.html">Add
																to cart</a></span>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Shop Area End -->
	<!-- Footer Area Start -->
	<%@ include file="/resources/include/footer.jsp"%>
</body>
</html>