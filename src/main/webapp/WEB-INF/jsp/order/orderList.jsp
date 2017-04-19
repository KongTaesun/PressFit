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
                                        <th class="order_date">주문일자</th>
                                        <th class="order_name">주문 상품 정보</th>
                                        <th class="order_count">상품수량</th>
                                        <th class="order_customer">판매자</th>
                                        <th class="order_state">주문상태</th>                                     
                                        <th class="order_comform">확인/취소/리뷰</th>
                                 
                             </tr>
                                </thead>
                                <tbody>
					                <c:forEach var="row" items="${map.list}" varStatus="i">
                                    <tr>
                                        <td class="order_date">
                                            <a>
                                            </a>
                                        </td>
                                        <td class="order_name">
                                         <a> ${row.modelname}</a>
                                        </td>
                                        <td class="order_count">
                                         <a> ${row.amount}</a>
                                        </td>
                                        
                                         <td class="order_customer">
                                         <a> ${row.price}</a>
                                        </td>
                                        
                                         <td class="order_state">
                                         <a> </a>
                                        </td>
                                        
                                         <td class="order_comform">
                                         <a> </a>
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