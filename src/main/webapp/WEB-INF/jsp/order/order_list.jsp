<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@ include file="/resources/include/header.jsp"%>
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
		        <div class="row">
		            <div class="col-md-12">
                        <div class="wishlist-table-area table-responsive">
                            <table>
                                <thead>
                                    <tr>
                                        <th class="order_date">주문일자</th>
                                        <th class="order_name">주문 상품 정보</th>
                                        <th class="order_count">상품금액(수량)</th>
                                        <th class="order_customer">배송비(판매자)</th>
                                        <th class="order_state">주문상태</th>                                     
                                        <th class="order_comform">확인/취소/리뷰</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="order_date">
                                            <a href="<!-- 카트페이지 결제내역 -->">
                                                <i class="flaticon-delete"></i>
                                            </a>
                                        </td>
                                        <td class="product-image">
                                            <a href="#">
                                                <img src="img/shop/1.jpg" alt="">
                                            </a>
                                        </td>
                                        <td class="t-product-name">
                                            <h3>
                                                <a href="#">Cold mountain</a>
                                            </h3>
                                        </td>
                                        <td class="product-edit">
                                            <p>
                                                <a href="#">Edit</a>
                                            </p>
                                        </td>
                                        <td class="product-unit-price">
                                            <p>$ 100</p>
                                        </td>
                                        <td class="product-quantity product-cart-details">
											<input type="number" value="1">
										</td>
                                        <td class="product-quantity">
											<p>$ 100</p>
										</td>
                                    </tr>
                                    <tr>
                                        <td class="product-remove">
                                            <a href="#">
                                                <i class="flaticon-delete"></i>
                                            </a>
                                        </td>
                                        <td class="product-image">
                                            <a href="#">
                                                <img src="img/shop/2.jpg" alt="">
                                            </a>
                                        </td>
                                        <td class="t-product-name">
                                            <h3>
                                                <a href="#">East of eden</a>
                                            </h3>
                                        </td>
                                        <td class="product-edit">
                                            <p>
                                               <a href="#">Edit</a>
                                            </p>
                                        </td>
                                        <td class="product-unit-price">
                                            <p>$ 100</p>
                                        </td>
                                        <td class="product-quantity product-cart-details">
											<input type="number" value="1">
										</td>
                                        <td class="product-quantity">
											<p>$ 100</p>
										</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>	
                        <div class="shopingcart-bottom-area">
                            <a class="left-shoping-cart" href="#">CONTINUE SHOPPING</a>
                            <div class="shopingcart-bottom-area pull-right">
								<a class="right-shoping-cart" href="#">CLEAR SHOPPING CART</a>
								<a class="right-shoping-cart" href="#">UPDATE SHOPPING CART</a>
							</div>
                        </div>	                
		            </div>
		        </div>
		    </div>
		</div>
		<!-- Cart Area End -->
		
	 <!-- Shop Area Start -->
        <div class="shopping-area section-padding">
            <div class="container">
                <div class="row">       
                    <div class="col-md-9 col-sm-9 col-xs-12">
                        <div class="wishlist-right-area table-responsive">
                            <table class="wish-list-table">
                                <thead>
                                    <tr>
                                       
                                        </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="row" items="${list}"> 
                                    <tr>
                                        <td class="order_date">
                                            <a>
                                                ${row.order_date}
                                            </a>
                                        </td>
                                        <td class="order_name">
                                         <a> ${row.order_name}</a>
                                        </td>
                                        <td class="order_count">
                                         <a> ${row.order_count}</a>
                                        </td>
                                        
                                         <td class="order_customer">
                                         <a> ${row.order_customer}</a>
                                        </td>
                                        
                                         <td class="order_state">
                                         <a> ${row.order_state}</a>
                                        </td>
                                        
                                         <td class="order_comform">
                                         <a> ${row.order_comform}</a>
                                        </td>
                             
                                    </tr>                               
                                  </c:forEach>                                   
                                </tbody>
                            </table>
                        </div>
                        <div class="wishlist-bottom-link">
                            <a class="wishlist-single-link" href="index.html">
                                <i class="fa fa-angle-double-left"></i>
                                Back
                            </a>
                                <a href="#" class="right-shoping-cart">SHARE WISHLIST</a>
                                <a href="#" class="right-shoping-cart">ADD ALL TO CART</a>
                                <a href="#" class="right-shoping-cart">UPDATE WISHLIST</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


</body>
</html>