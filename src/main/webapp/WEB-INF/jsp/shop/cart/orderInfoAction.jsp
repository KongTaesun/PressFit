<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
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
</style>
<%@ include file="/resources/include/header.jsp" %>
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
                        <div class="shopingcart-bottom-area">
                            <a class="left-shoping-cart" href="${path}/tmouse/list.do">CONTINUE SHOPPING</a>
                            <div class="shopingcart-bottom-area pull-right">
                            
								<a class="right-shoping-cart" href="#">UPDATE SHOPPING CART</a>
							</div>
                        </div>	                
		            </div>
		        </div>
		    </div>
		</div>
		<!-- Cart Area End -->
		
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