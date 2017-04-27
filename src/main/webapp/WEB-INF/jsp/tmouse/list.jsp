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
</style>
<style>
.breadcrumbs-area {
 background-image: url('${path}/resources/writer/img/bigpicture/mouse_img1.png');
}

</style>
<script>
	$(document).ready(
			function() {
				$("#btnWrite").click(function() {
					// 페이지 주소 변경(이동)
					location.href = "${path}/tmouse/write.do";
				});
				$("#btnWrite").click(
						function() {
							// 페이지 주소 변경(이동)
							location.href = "${path}/tmouse/list.do?curPage="
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
	               location.href="${path}/tmouse/list.do?searchOption=price&minPrice="+min+"&maxPrice="+max;
	            });
	            
	            
	            
			
			});
	// 원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해 
	function list(page) {
		var link = location.href = "${path}/tmouse/list.do?curPage=" + page
		+ "&searchOption=${map.searchOption}"
		+ "&keyword=${map.keyword}";
		
        var tab = link.split('/').pop();
        $('a[href$='+tab+']').trigger("click");
		
		
		
		
		/* location.href = "${path}/tmouse/list.do?curPage=" + page
				+ "&searchOption=${map.searchOption}"
				+ "&keyword=${map.keyword}"; */
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
					      
					       <h2>NOTICE</h2> 
					       <ul class="breadcrumbs-list">
						        <li>
						            <a title="Return to Home" href="index.html">Home</a>
						        </li>
						        <li>NOTICE</li>
						    </ul>
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
						<li><a href="${path}/tmouse/list.do?searchOption=gamingmouse"> <i class="fa fa-angle-double-right"></i>
                                 게이밍 마우스 <span></span>
                           </a></li>
                           <li><a href="${path}/tmouse/list.do?searchOption=connectionmethod"> <i class="fa fa-angle-double-right"></i>
                                 무선/블루투스 <span></span>
                           </a></li>
                           <li><a href="${path}/tmouse/list.do?searchOption=wristtunnelsyndrome"> <i class="fa fa-angle-double-right"></i>
                                 손목보호 마우스 <span></span>
                           </a></li>
                           <li><a href="${path}/tmouse/list.do?searchOption=switch1"> <i class="fa fa-angle-double-right"></i>
                                 무소음 마우스 <span></span>
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
                                    <input type="button" value="Filter" id="btnPrice" />
                                     <input type="reset" value="CLEAR" />
                                 </div>
                              </div>
                           </div>
                        </div>
                     </aside>
						</div>
						<div class="shop-widget-bottom">
							<aside class="widget widget-tag">
								<h2 class="sidebar-title">POPULAR TAG</h2>
								<ul class="tag-list">
									<li><a href="#">e-book</a></li>
									<li><a href="#">writer</a></li>
									<li><a href="#">book’s</a></li>
									<li><a href="#">eassy</a></li>
									<li><a href="#">nice</a></li>
									<li><a href="#">author</a></li>
								</ul>
							</aside>
							<aside class="widget widget-seller">
								<h2 class="sidebar-title">TOP SELLERS</h2>
								<div class="single-seller">
									<div class="seller-img">
										<img src="img/shop/1.jpg" alt="" />
									</div>
									<div class="seller-details">
										<a href="shop.html"><h5>Cold mountain</h5></a>
										<h5>$ 50.00</h5>
										<ul>
											<li><i class="fa fa-star icolor"></i></li>
											<li><i class="fa fa-star icolor"></i></li>
											<li><i class="fa fa-star icolor"></i></li>
											<li><i class="fa fa-star icolor"></i></li>
											<li><i class="fa fa-star icolor"></i></li>
										</ul>
									</div>
								</div>
								<div class="single-seller">
									<div class="seller-img">
										<img src="img/shop/2.jpg" alt="" />
									</div>
									<div class="seller-details">
										<a href=""><h5>The historian</h5></a>
										<h5>$ 50.00</h5>
										<ul>
											<li><i class="fa fa-star icolor"></i></li>
											<li><i class="fa fa-star icolor"></i></li>
											<li><i class="fa fa-star icolor"></i></li>
											<li><i class="fa fa-star icolor"></i></li>
											<li><i class="fa fa-star icolor"></i></li>
										</ul>
									</div>
								</div>
							</aside>
						</div>
					</div>
				</div>
				<div class="col-md-9 col-sm-9 col-xs-12">
					<div class="shop-tab-area">
						<div class="shop-tab-list">
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
										<!-- <div class="show-label">
											<label>Show : </label> <select>
												<option value="10" selected="selected">10</option>
												<option value="09">09</option>
												<option value="08">08</option>
												<option value="07">07</option>
												<option value="06">06</option>
											</select>
										</div> -->
									</li>
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

						<div class="tab-content">
							<div class="row tab-pane fade in active" id="home">
								<div class="shop-single-product-area">
								
								<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
								<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
								<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
								<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
								
									<c:forEach var="row" items="${map.list}">
										<div class="col-md-4 col-sm-6">
											<div class="single-banner" >
												<div class="product-wrapper" style="width:260px; height:260px;">
													<a
														href="${path}/tmouse/view.do?idx=${row.idx}&curPage=${map.boardPager.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}"
														class="single-banner-image-wrapper">
														<img src="${path}/resources/upload/${row.fullName}" style="width:260px; height:260px;">
														<div class="price">
															<span>\</span>${row.price}<br />${row.crea_id}</div>
													</a>
													<div class="product-description">
														<div class="functional-buttons">
															<a href="${path}/shop/cart/insert.do?price=${row.price}&modelname=${row.modelname}&idx=${row.idx}&fullName=${row.fullName}&kind=tmouse&crea_id=${row.crea_id}&amount=1" title="Add to Cart"> <i
																class="fa fa-shopping-cart"></i>
															</a> <a href="#" title="Add to Wishlist"> <i
																class="fa fa-heart-o"></i>
															</a> <a href="#" title="Quick view" data-toggle="modal"
																data-target="#productModal"> <i
																class="fa fa-compress"></i>
															</a>
														</div>
													</div>
												</div>
												<div class="banner-bottom text-center">
													<div class="banner-bottom-title" style="width:100%; height:60px; overflow: hidden; top:50%; margin-top: 15px; margin-bottom: 0px;">
														<a href="${path}/tmouse/view.do?idx=${row.idx}&curPage=${map.boardPager.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}&crea_id=${row.crea_id}">${row.modelname} <c:if
																test="${row.recnt >= 0}">
																<span style="color: red;">(${row.recnt}) </span>
															</c:if>
														</a>
													</div>
												<div style="display-table:table-cell">
												</div> 
													<div class="rating-icon">
														<i class="fa fa-star icolor"></i> <i
															class="fa fa-star icolor"></i> <i
															class="fa fa-star icolor"></i> <i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>

								</div>
							</div>
							
							<div id="menu1" class="tab-pane fade">
								<div class="row">
									<div class="single-shop-product">
									
									<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
									<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
									<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
									<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
									<c:forEach var="row" items="${map.list}">
										<div class="col-xs-12 col-sm-5 col-md-4">   <!-- 12/5/4 -->
											<div class="left-item1">
												<a href="${path}/tmouse/view.do?idx=${row.idx}&curPage=${map.boardPager.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}" title="${row.modelname }">
												<img src="${path}/resources/upload/${row.fullName}" />
												</a>
											</div>
										</div>
										<div class="col-xs-12 col-sm-7 col-md-8">
											<div class="deal-product-content">
												<h4>
													<a href="${path}/tmouse/view.do?idx=${row.idx}&curPage=${map.boardPager.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}" title="${row.modelname }">
													${row.modelname}</a>
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
									
									<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
									<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
									<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
									<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
									
									
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