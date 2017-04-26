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
		<div class="shopping-cart-area section-padding">
		    <div class="container">
		        <div class="row">
		            <div class="col-md-12">
                        <div class="wishlist-table-area table-responsive">
                        <c:choose>
					        <c:when test="${map.count == 0}">
					           	주문들어온 내역이 없습니다.
					        </c:when>
					        <c:otherwise>
					        
                            <table>
                                <thead>
					                 <tr>
					                				                  
                                        <th class="order_id">상품번호</th>
                                        <th class="order_date">주문일자</th>
                                        <th class="order_name">주문 상품 정보</th>
                                        <th class="order_count">상품수량</th>
                                        <th class="order_price">금액</th>
                                        <th class="order_customer">판매자</th>
                                        <th class="order_state">주문상태</th>
                                        <th class="order_check">확인</th> 
                                        <th class="order_confirm">리뷰</th> 
                                                                            

                             </tr>
                                </thead>
                                <tbody>
					                <c:forEach var="row" items="${map.list}" varStatus="i">
                                    <tr>
					                	
					                	<td class="order_id">
                                        
					                	<a>${row.cart_id }</a>
					                	</td>
                                        <td class="order_date">
                                           <a> ${row.orderdate}
                                           </a>  
                                        </td>
                                        <td class="order_name">
                                         <a> ${row.modelname}</a>
                                        </td>
                                        <td class="order_count">
                                         <a> ${row.amount}</a>
                                        </td>
                                        
                                         <td class="order_price">
                                         <a> ${row.price}</a>
                                        </td>
                                        <td class="order_customer">
                                         <a> ${row.crea_id}</a> 
                                        </td>
                                         <td class="order_state">

                                         <a>  
                                         <c:if test="${row.shippingStatus eq 0}">
                                         	배송전
                                         </c:if>
                                         <c:if test="${row.shippingStatus eq 1}">
                                         	배송중
                                         </c:if>
                                         <c:if test="${row.shippingStatus eq 2}">
                                         	배송완료
                                         </c:if>                                         
                                         <c:if test="${row.shippingStatus eq 3}">
                                         	환불신청
                                         </c:if> 
                                         <c:if test="${row.shippingStatus eq 4}">
                                         	환불완료
                                         </c:if> 
                                          <c:if test="${row.shippingStatus eq 5}">
                                         	교환신청
                                         </c:if> 
                                         
                                         </a>
                                         </td>
                                      <td class="order_check">
                                                          
       								 <a class="commit" href="${path}/order/orderConfirm.do?cart_id=${row.cart_id}">상품확인</a>
       								
       								 <a class="cancle" href="${path}/order/orderCancel.do">반품신청</a>
       								 </td>
       								 
       								 <td class=order_confirm>
                        			  <a class="revers" href="http://localhost:8080/pressfit/write.do">상품평 쓰기</a>
       								 </td>
       								 
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



		<%@ include file="/resources/include/footer.jsp" %>
</body>
</html>