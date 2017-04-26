<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%@ include file="/resources/include/header.jsp" %> 
<style>
.image{
    height: 100px;
    width: 100px;
    display: inline-block;
    position: absolute;
} 
img{
width:100%
}
.title{
    height: 50px;
    width: 500px;
    display: inline-block;
    position: relative;
    margin-top: 50px;
    margin-left: 100px;
}
#aaa{
font-size : 14px;
}
#bbb{
text-align: left;
}
</style>


<body>
<!-- Breadcrumbs Area Start -->
<form name="frm2" method="post" action="${path}/shop/cart/payment.do">

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
		        <div class="row">
		            <div class="col-md-12">
                        <div class="wishlist-table-area table-responsive">
                        <c:choose>
					        <c:when test="${map.count == 0}">
					            장바구니가 비어있습니다.
					        </c:when>
					        <c:otherwise>
                            <table>
                                <thead>
					                 <tr>
					                	<!-- <th><input type="checkbox" id="allCheck"/></th>
					                	<th>상품번호</th> -->
					                    <th>상품명</th>
					                    <th>단가</th>
					                    <th>수량</th>
					                    <th>금액</th>
					                    <!-- <th>취소</th> -->
					                </tr>
                                </thead>
                                <tbody>
					                <c:forEach var="row" items="${map.list}" varStatus="i">
					                
					                <input type="hidden" id="cart_id" name="cart_id" value="${row.cart_id}"> 
					              
					         	 <input type="hidden" id="idx" name="idx" value="${row.idx}"> 
					         	 
					         	 <input type="hidden" id="kind" name="kind" value="${row.kind}"> 
					                <tr>
<%-- 					                	<td name="cart_id"><input type="checkbox" id="check_id" name="check" value="${row.cart_id }" ></td>
					                	<td>${row.cart_id } --%>
					                	
					                	
					                    <td>
					                    <div class='image'>
					                    <a href="${path}/${row.kind}/view.do?idx=${row.idx}&curPage=1&searchOption=${map.searchOption}&keyword=${map.keyword}">
					                    <img src="${path}/resources/upload${row.fullName}" width="10px" height="100px"></a>
					                     
					                    
					                     
					                   	</div> &nbsp; &nbsp;
					                    
					                    
					                   	<div class='title'>
					                        <a href="${path}/${row.kind}/view.do?idx=${row.idx}&curPage=1&searchOption=${map.searchOption}&keyword=${map.keyword}">
					                        ${row.modelname}</a>
					                     </div>
					                    </td>
					                    
					                    
					                    
					                    <td style="width: 80px" align="center">
					                        <fmt:formatNumber pattern="###,###,###" value="${row.price}"/>원
					                        <%-- <input type="hidden" name="price" value="${row.price}"> --%>
					                    </td>
					                    
					                     <td style="width:80px" align="center">
					                        <input type="text" style="width:15px; border:none;" name="amount" value="${row.amount}" min="1" readonly="readonly" >개
					                        <%-- <input type="hidden" id="amount" name="amount" value="${row.amount}"> --%>
					                    </td>
					                    
					                    <td name="price" style="width: 100px" align="center">
					                    	<%-- <input type="hidden" value="${row.money}"/> --%>
					                        <fmt:formatNumber pattern="###,###,###" value="${row.money}"/>원
					                    </td> 
					                    <%-- <td>
					                        <a href="${path}/shop/cart/delete.do?cart_id=${row.cart_id}">
					                        <input type="hidden" name="cart_id" value="${row.cart_id}">삭제</a>
					                    </td> --%>
					                </tr>
					                </c:forEach>
                                </tbody>
                            </table>
                            </c:otherwise>
						    </c:choose>
                        </div>	
		            </div>
		        </div>
		    </div>
		</div>
		<!-- Cart Area End -->
		<!-- ====================================================================================================================================================================== -->
		<!-- ====================================================================================================================================================================== -->
		<!-- ====================================================================================================================================================================== -->
        <!-- Check Out Area Start -->
        <div class="check-out-area section-padding">
            <div class="container">
                <div class="row">
                    <div class="col-md-8">
                        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                            <div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingTwo">
									<h4 class="panel-title">
										<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
										   <span>1</span>
										   배송 정보
										</a>
									</h4>
								</div>
								<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
									<div class="panel-body">
										<div class="row">
											<c:forEach var="row" items="${map.memberInfo}">
											<div class="col-md-12"><p>
													받으시는 분 : <input type="text" value="${row.name}" style="border:0" readonly="readonly">
													</p>
											</div><br/>
											<div class="col-md-12"><p>
													주소 : <input type="text" value="${row.address}" style="border:0" readonly="readonly">
													</p>
											</div>
											<div class="col-md-12"><p>
													휴대전화 : <input type="text" value="${row.hp}" style="border:0" readonly="readonly">
													</p>
											</div>
											<div class="col-md-12"><p>
													e-mail : <input type="text" value="${row.email}" style="border:0" readonly="readonly">
													</p>
											</div>
											</c:forEach>									
										</div>
									</div>
								</div>
                            </div>
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingFive">
									<h4 class="panel-title">
										<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
										   <span>2</span>
										   주문 금액
										</a>
									</h4>
								</div>
								<div id="collapseFive" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFive">
									<div class="panel-body no-padding">
										<div class="order-review" id="checkout-review">    
											<div class="table-responsive" id="checkout-review-table-wrapper">
												<table class="data-table" id="checkout-review-table">
													<thead>
														<tr>
															<th rowspan="1" style="width:50%">상품명</th>
															<th colspan="1" style="width:25%">주문금액</th>
															<th rowspan="1" style="width:25%">수량 합계 금액</th>
														</tr>
													</thead>
													<tbody>
													<c:forEach var="row" items="${map.list}">
														<tr>
															<td id="aaa">${row.modelname}</td>
															<td id="aaa"><fmt:formatNumber pattern="###,###,###" value="${row.price}"/>원</td>
															<td id="aaa"><fmt:formatNumber pattern="###,###,###" value="${row.money}"/>원</td>
														</tr>
													</c:forEach>
													</tbody>
													<tfoot id="bbb">
														<tr>
															<td colspan="2">전체 합계 금액 : </td>
															<td><fmt:formatNumber pattern="###,###,###" value="${map.sumMoney}"/>원</td>
															<td></td>
														</tr>
														<tr>
															<td colspan="2">배송비 (10만원 이상 배송비 무료)</td>
															<td><span class="check-price"><fmt:formatNumber pattern="###,###,###" value="${map.fee}"/>원</span></td>
														</tr>
														<tr>
															<td colspan="2"><strong>총 결제 금액 (전체 합계 금액 + 배송비)</strong></td>
															<td><strong><fmt:formatNumber pattern="###,###,###" value="${map.allSum }"/>원</strong></td>
														</tr>
													</tfoot>
												</table>
											</div>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingFour">
									<h4 class="panel-title">
										<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
										   <span>3</span>
										   결제 정보
										</a>
									</h4>
								</div>
								<div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
									<div class="panel-body no-padding">
										<div class="payment-met">
											
												<ul class="form-list">
													<li class="control">
														<input type="radio" class="radio" name="methodpayment" id="methodpayment" value="무통장입금">
														<label for="p_method_checkmo">무통장입금</label>
													</li>
													<li class="control">
														<input type="radio" class="radio" name="methodpayment" id="methodpayment" value="신용카드">
														<label for="p_method_ccsave">신용카드</label>
													</li>
												</ul>
										
											<div class="buttons-set">
												<button class="btn btn-default">CONTINUE</button>
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
        <!-- Check Out Area End -->
		<!-- Our Team Area Start -->
		<div class="our-team-area">
		    <h2 class="section-title">OUR WRITER</h2>
		    <div class="container">
		        <div class="row">
		        <div class="team-list indicator-style">
		        	<c:forEach var="row" items="${map.list}" varStatus="i">
		            <div class="col-md-3">
		                <div class="single-team-member">
		                    <a href="${path}/${row.kind}/view.do?idx=${row.idx}&curPage=1&searchOption=${map.searchOption}&keyword=${map.keyword}">
					                    <img src="${path}/resources/upload${row.fullName}" width="10px" height="100px"></a>
		                    <div class="member-info">
		                        <a href="${path}/${row.kind}/view.do?idx=${row.idx}&curPage=1&searchOption=${map.searchOption}&keyword=${map.keyword}">
					                        ${row.modelname}</a>
		                        <p>${crea_id}</p>
		                    </div>
		                </div>
		            </div>
		            <div class="col-md-3">
		                <div class="single-team-member">
		                    <a href="${path}/${row.kind}/view.do?idx=${row.idx}&curPage=1&searchOption=${map.searchOption}&keyword=${map.keyword}">
					                    <img src="${path}/resources/upload${row.fullName}" width="10px" height="100px"></a>
		                    <div class="member-info">
		                        <a href="${path}/${row.kind}/view.do?idx=${row.idx}&curPage=1&searchOption=${map.searchOption}&keyword=${map.keyword}">
					                        ${row.modelname}</a>
		                        <p>${crea_id}</p>
		                    </div>
		                </div>
		            </div>
		            <div class="col-md-3">
		                <div class="single-team-member">
		                    <a href="${path}/${row.kind}/view.do?idx=${row.idx}&curPage=1&searchOption=${map.searchOption}&keyword=${map.keyword}">
					                    <img src="${path}/resources/upload${row.fullName}" width="10px" height="100px"></a>
		                    <div class="member-info">
		                        <a href="${path}/${row.kind}/view.do?idx=${row.idx}&curPage=1&searchOption=${map.searchOption}&keyword=${map.keyword}">
					                        ${row.modelname}</a>
		                        <p>${crea_id}</p>
		                    </div>
		                </div>
		            </div>
		            <div class="col-md-3">
		                <div class="single-team-member">
		                    <a href="${path}/${row.kind}/view.do?idx=${row.idx}&curPage=1&searchOption=${map.searchOption}&keyword=${map.keyword}">
					                    <img src="${path}/resources/upload${row.fullName}" width="10px" height="100px"></a>
		                    <div class="member-info">
		                        <a href="${path}/${row.kind}/view.do?idx=${row.idx}&curPage=1&searchOption=${map.searchOption}&keyword=${map.keyword}">
					                        ${row.modelname}</a>
		                        <p>${crea_id}</p>
		                    </div>
		                </div>
		            </div>
		            <div class="col-md-3">
		                <div class="single-team-member">
		                    <a href="${path}/${row.kind}/view.do?idx=${row.idx}&curPage=1&searchOption=${map.searchOption}&keyword=${map.keyword}">
					                    <img src="${path}/resources/upload${row.fullName}" width="10px" height="100px"></a>
		                    <div class="member-info">
		                        <a href="${path}/${row.kind}/view.do?idx=${row.idx}&curPage=1&searchOption=${map.searchOption}&keyword=${map.keyword}">
					                        ${row.modelname}</a>
		                        <p>${crea_id}</p>
		                    </div>
		                </div>
		            </div>
		            <div class="col-md-3">
		                <div class="single-team-member">
		                    <a href="${path}/${row.kind}/view.do?idx=${row.idx}&curPage=1&searchOption=${map.searchOption}&keyword=${map.keyword}">
					                    <img src="${path}/resources/upload${row.fullName}" width="10px" height="100px"></a>
		                    <div class="member-info">
		                        <a href="${path}/${row.kind}/view.do?idx=${row.idx}&curPage=1&searchOption=${map.searchOption}&keyword=${map.keyword}">
					                        ${row.modelname}</a>
		                        <p>${crea_id}</p>
		                    </div>
		                </div>
		            </div>
		            </c:forEach>
		        </div>
		        </div>
		    </div>
		</div>
		<!-- Our Team Area End -->
		<!-- ====================================================================================================================================================================== -->
		<!-- ====================================================================================================================================================================== -->
		<!-- ====================================================================================================================================================================== -->
</form>
		<%@ include file="/resources/include/footer.jsp" %>
</body>
</html>