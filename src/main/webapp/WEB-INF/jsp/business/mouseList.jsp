<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/resources/include/header.jsp"%>
<script>
	
	// 원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해 
	function list(page) {
		location.href = "${path}/business/mouseList.do?curPage=" + page
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
					       <h2>SHOPPING CART</h2> 
					       <ul class="breadcrumbs-list">
						        <li>
						            <a title="Return to Home" href="index.html">Home</a>
						        </li>
						        <li>Shopping Cart</li>
						    </ul>
					    </div>
					</div>
				</div>
			</div>
		</div> 
		<!-- Breadcrumbs Area Start --> 
		<!-- Cart Area Start -->
		<div class="shopping-cart-area section-padding">
		
		    <div class="container">
		    ${map.count}개의 게시물이 있습니다.
		        <div class="row">
		            <div class="col-md-12">
                        <div class="wishlist-table-area table-responsive">
                        
							<div class="shopingcart-bottom-area">
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
	                            <div class="shopingcart-bottom-area pull-right">
									<a class="right-shoping-cart" href="${path}/tmouse/write.do">마우스 추가</a>
									<a class="right-shoping-cart" href="${path}/keyboard/write.do">키보드 추가</a>
								</div>
	                        </div>		
                            <table>
                                <thead>
                                    <tr>
                                        <th width="15%">Remove</th>
                                        <th width="15%">Image</th>
                                        <th class="t-product-name">Product Name</th>
                                        <th width="20%">Unit Price</th>
                                        <th width="15%">Quantity</th>
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="row" items="${map.list}">
                                    <tr>
                                        <td class="product-remove">
                                            <a href="${path}/business/mouseDelete.do?idx=${row.idx}">
                                                <i class="flaticon-delete"></i>
                                            </a>
                                        </td>
                                        <td class="product-image">
                                            <a href="${path}/tmouse/view.do?idx=${row.idx}&curPage=${map.boardPager.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}">
                                                <img src="${path}/resources/upload/${row.fullName}" style="width:100px" alt="">
                                            </a>
                                        </td>
                                        <td class="t-product-name">
                                            <h3>
                                                <a href="${path}/tmouse/view.do?idx=${row.idx}&curPage=${map.boardPager.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}">${row.modelname}</a>
                                            </h3>
                                        </td>
                                        <td class="product-unit-price">
                                            <p>$ ${row.price}</p>
                                        </td>
                                        <td class="product-quantity product-cart-details">
											${map.amount} 개
										</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>	
                        	                
		            </div>
		        </div>
		    </div>
		</div>
		<!-- Cart Area End -->
       
        <!-- Footer Area Start -->
		<%@ include file="/resources/include/footer.jsp"%>
		 <!-- Footer Area End -->
</body>
</html>