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
					                <tr>
<%-- 					                	<td name="cart_id"><input type="checkbox" id="check_id" name="check" value="${row.cart_id }" ></td>
					                	<td>${row.cart_id } --%><input type="hidden" id="cart_id" name="check" value="${row.cart_id}"/></td>
					                	
					                	
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
															<td colspan="3">Subtotal</td>
															<td></td>
														</tr>
														<tr>
															<td colspan="3">Shipping Handling (Flat Rate - Fixed)</td>
															<td><span class="check-price">$10.00</span></td>
														</tr>
														<tr>
															<td colspan="3"><strong>Grand Total</strong></td>
															<td><strong><span class="check-price">$387.00</span></strong></td>
														</tr>
													</tfoot>
												</table>
											</div>
											<div id="checkout-review-submit">
												<div class="cart-btn-3" id="review-buttons-container">
													<p class="left">Forgot an Item? <a href="#">Edit Your Cart</a></p>
													<button type="submit" title="Place Order" class="btn btn-default"><span>Place Order</span></button>
												</div>
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
											<form action="#" id="payment-form">
												<ul class="form-list">
													<li class="control">
														<input type="radio" class="radio" title="Check / Money order" name="payment[method]" id="p_method_checkmo">
														<label for="p_method_checkmo">Check / Money order </label>
													</li>
													<li class="control">
														<input type="radio" class="radio" title="Credit Card (saved)" name="payment[method]" id="p_method_ccsave">
														<label for="p_method_ccsave">Credit Card (saved) </label>
													</li>
												</ul>
											</form>
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
                    <div class="col-md-offset-1 col-md-3">
                        <div class="checkout-widget">
                            <h2 class="widget-title">YOUR CHECKOUT PROGRESS</h2>
                            <ul>
								<li><a href="#"><i class="fa fa-minus"></i> Billing Address</a></li>
								<li><a href="#"><i class="fa fa-minus"></i> Shipping Address</a></li>
								<li><a href="#"><i class="fa fa-minus"></i> Shipping Method</a></li>
								<li><a href="#"><i class="fa fa-minus"></i> Payment Method</a></li>
							</ul>
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
		            <div class="col-md-3">
		                <div class="single-team-member">
		                    <a href="#">
		                        <img src="img/about/team/1.jpg" alt="">
		                    </a>
		                    <div class="member-info">
		                        <a href="#">rokan tech</a>
		                        <p>WRITER</p>
		                    </div>
		                </div>
		            </div>
		            <div class="col-md-3">
		                <div class="single-team-member">
		                    <a href="#">
		                        <img src="img/about/team/2.jpg" alt="">
		                    </a>
		                    <div class="member-info">
		                        <a href="#">mirinda</a>
		                        <p>AUTHOR</p>
		                    </div>
		                </div>
		            </div>
		            <div class="col-md-3">
		                <div class="single-team-member">
		                    <a href="#">
		                        <img src="img/about/team/3.jpg" alt="">
		                    </a>
		                    <div class="member-info">
		                        <a href="#">jone doe</a>
		                        <p>WRITER</p>
		                    </div>
		                </div>
		            </div>
		            <div class="col-md-3">
		                <div class="single-team-member">
		                    <a href="#">
		                        <img src="img/about/team/4.jpg" alt="">
		                    </a>
		                    <div class="member-info">
		                        <a href="#">nick kon</a>
		                        <p>WRITER</p>
		                    </div>
		                </div>
		            </div>
		            <div class="col-md-3">
		                <div class="single-team-member">
		                    <a href="#">
		                        <img src="img/about/team/2.jpg" alt="">
		                    </a>
		                    <div class="member-info">
		                        <a href="#">mirinda</a>
		                        <p>AUTHOR</p>
		                    </div>
		                </div>
		            </div>
		            <div class="col-md-3">
		                <div class="single-team-member">
		                    <a href="#">
		                        <img src="img/about/team/1.jpg" alt="">
		                    </a>
		                    <div class="member-info">
		                        <a href="#">rokan tech</a>
		                        <p>WRITER</p>
		                    </div>
		                </div>
		            </div>
		        </div>
		        </div>
		    </div>
		</div>
		<!-- Our Team Area End -->
		<!-- Footer Area Start -->
		<footer>
		    <div class="footer-top-area">
		        <div class="container">
		            <div class="row">
		                <div class="col-md-3 col-sm-8">
		                    <div class="footer-left">
		                        <a href="index.html">
		                            <img src="img/logo-2.png" alt="">
		                        </a>
		                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.</p>
		                        <ul class="footer-contact">
		                            <li>
		                                <i class="flaticon-location"></i>
		                                450 fifth Avenue, 34th floor. NYC
		                            </li>
		                            <li>
		                                <i class="flaticon-technology"></i>
		                                (+800) 123 4567 890
		                            </li>
		                            <li>
		                                <i class="flaticon-web"></i>
		                                info@bookstore.com
		                            </li>
		                        </ul>
		                    </div>
		                </div>
		                <div class="col-md-2 col-sm-4">
		                    <div class="single-footer">
		                        <h2 class="footer-title">Information</h2>
		                        <ul class="footer-list">
		                            <li><a href="about.html">About Us</a></li>
		                            <li><a href="#">Delivery Information</a></li>
		                            <li><a href="#">Privacy & Policy</a></li>
		                            <li><a href="#">Terms & Conditions</a></li>
		                            <li><a href="#">Manufactures</a></li>
		                        </ul>
		                    </div>
		                </div>
		                <div class="col-md-2 hidden-sm">
		                    <div class="single-footer">
		                        <h2 class="footer-title">My Account</h2>
		                        <ul class="footer-list">
		                            <li><a href="my-account.html">My Account</a></li>
		                            <li><a href="account.html">Login</a></li>
		                            <li><a href="cart.html">My Cart</a></li>
		                            <li><a href="wishlist.html">Wishlist</a></li>
		                            <li><a href="checkout.html">Checkout</a></li>
		                        </ul>
		                    </div>
		                </div>
		                <div class="col-md-2 hidden-sm">
		                    <div class="single-footer">
		                        <h2 class="footer-title">Shop</h2>
		                        <ul class="footer-list">
		                            <li><a href="#">Orders & Returns</a></li>
		                            <li><a href="#">Search Terms</a></li>
		                            <li><a href="#">Advance Search</a></li>
		                            <li><a href="#">Affiliates</a></li>
		                            <li><a href="#">Group Sales</a></li>
		                        </ul>
		                    </div>
		                </div>
		                <div class="col-md-3 col-sm-8">
		                    <div class="single-footer footer-newsletter">
		                        <h2 class="footer-title">Our Newsletter</h2>
		                        <p>Consectetur adipisicing elit se do eiusm od tempor incididunt ut labore et dolore magnas aliqua.</p>
		                        <form action="#" method="post">
		                            <div>
		                                <input type="text" placeholder="email address">
		                            </div>
		                            <button class="btn btn-search btn-small" type="submit">SUBSCRIBE</button>
		                            <i class="flaticon-networking"></i>
		                        </form>
		                        <ul class="social-icon">
		                            <li>
		                                <a href="#">
		                                    <i class="flaticon-social"></i>
		                                </a>
		                            </li>
		                            <li>
		                                <a href="#">
		                                    <i class="flaticon-social-1"></i>
		                                </a>
		                            </li>
		                            <li>
		                                <a href="#">
		                                    <i class="flaticon-social-2"></i>
		                                </a>
		                            </li>
		                            <li>
		                                <a href="#">
		                                    <i class="flaticon-video"></i>
		                                </a>
		                            </li>
		                        </ul>
		                    </div>
		                </div>
		                <div class="col-md-2 col-sm-4 visible-sm">
		                    <div class="single-footer">
		                        <h2 class="footer-title">Shop</h2>
		                        <ul class="footer-list">
		                            <li><a href="#">Orders & Returns</a></li>
		                            <li><a href="#">Search Terms</a></li>
		                            <li><a href="#">Advance Search</a></li>
		                            <li><a href="#">Affiliates</a></li>
		                            <li><a href="#">Group Sales</a></li>
		                        </ul>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		    <div class="footer-bottom">
		        <div class="container">
		            <div class="row">
		                <div class="col-md-6">
                            <div class="footer-bottom-left pull-left">
                                <p>Copyright &copy; 2016 <span><a href="#">DevItems</a></span>. All Right Reserved.</p>
                            </div>
		                </div>
		                <div class="col-md-6">
		                    <div class="footer-bottom-right pull-right">
		                        <img src="img/paypal.png" alt="">
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		
		
		
		<!-- ====================================================================================================================================================================== -->
		<!-- ====================================================================================================================================================================== -->
		<!-- ====================================================================================================================================================================== -->
		<!-- Discount Area Start -->
        <div class="discount-area">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-sm-6">
                        <div class="discount-main-area">
                            <div class="discount-top">
                                <h3>DISCOUNT CODE</h3>
                                <p>Enter your coupon code if have one</p>
                            </div>
                            <div class="discount-middle">
                                <input type="text" placeholder="">
                                <a class="" href="#">APPLY COUPON</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-6">
                        <div class="subtotal-main-area">
                            <div class="subtotal-area">
                                <h2>선택상품 금액 합계 : <span id="chicemoney">0</span>￦</h2>
                            </div>
                            <div class="subtotal-area">
                                <h2>전체 주문금액<span>${map.allSum}￦</span></h2>
                            </div>
                            <input type="submit" id="order" name="order" value="결제하기"  />
                            <p>Checkout With Multiple Addresses</p>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Discount Area End -->
</form>
		<%@ include file="/resources/include/footer.jsp" %>
</body>
</html>