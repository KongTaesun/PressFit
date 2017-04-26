<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문내역</title>
<%@ include file="/resources/include/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script>
	$(document).ready(function() {
		$("#clear").click(function() {
			// 장바구니 비우기
			alldelete();
		});

		
		$("#allCheck").click(function(){
			
			if($("#allCheck").prop("checked")){
				$("input[type=checkbox]").prop("checked", true);
			}
			else{
				$("input[type=checkbox]").prop("checked", false);
			}
		})
		
		
		$('input[type=checkbox]').click(function() {
			var ischecked = $(this).is(":checked");
			if (ischecked) {
				var a = Number($(this).parents('tr').children('td[name="price"]').children('input').val());
				var b = Number($('#chicemoney').text());
				$('#chicemoney').html(a+b);
			}
			if (!ischecked) {
				var a = Number($(this).parents('tr').children('td[name="price"]').children('input').val());
				var b = Number($('#chicemoney').text());
				$('#chicemoney').html(b-a);
			}
		});
		
		
 		$("#order").click(function(){
 			order();
		});
		
	});

	
 	function order() {
 		var idx = document.getElementsByName("check");
 		for (var i = 0; i < idx.length; i++) {
			if (idx[i].checked == true) {
				var list = new Array(idx[i].value);
				alert(list);
			}
		}
 		 list;
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
		    <!-- <div class="col-md-1"></div> -->
		    <div class="col-md-12">
		    	<form name="frm" method="post" action="${path}/business/payment.do?searchOption=order" onsubmit="return order();">
			        <div class="row">
			            <div class="col-md-12">
			            	
	                        <div class="wishlist-table-area table-responsive">
	                        <c:choose>
						        <c:when test="${map.count == 0}">
						           	주문들어온 내역이 없습니다.
						        </c:when>
						        <c:otherwise>
						        
						        <div class="row">
					<div class="col-md-12">
                        <div class="p-details-tab-content">
                            <div class="p-details-tab">
                                <ul class="p-details-nav-tab" role="tablist">
                                    <li role="presentation" class="active"><a href="#more-info" aria-controls="more-info" role="tab" data-toggle="tab">주문내역</a></li>
                                    <li role="presentation"><a href="#data" aria-controls="data" role="tab" data-toggle="tab">환불내역</a></li>
                                    <li role="presentation"><a href="#reviews" aria-controls="reviews" role="tab" data-toggle="tab">교환내역</a></li>
                                </ul>
                            </div>
                            <div class="clearfix"></div>
                            <div class="tab-content review">
                                <div role="tabpanel" class="tab-pane active" id="more-info">
									<table>
	                                <thead>
						                 <tr>
						                	<th><input type="checkbox" id="allCheck"/></th>
						                	<th>상품번호</th>
						                    <th>상품명</th>
						                    <th>단가</th>
						                    <th>수량</th>
						                    <th>금액</th>
						                    <th>구매자</th>
						                   	<th>주문날짜</th>
						                   	<th><select value="상태"><option></option></select></th>
	
						                    <!-- <th>취소</th> -->
						                </tr>
	                                </thead>
	                                <tbody>
						                <c:forEach var="row1" items="${map.list1}" varStatus="i">
						                <tr>
						                	<td name="cart_id"><input type="checkbox" id="check_id" name="check" value="${row1.cart_id }" ></td>
						                	<td>${row1.cart_id }<input type="hidden" id="cart_id" name="cart_id" value="${row1.cart_id}"/></td>
						                	
						                	
						                    <td>
						                    <div class='image'>
						                    <a href="${path}/${row1.kind}/view.do?idx=${row1.idx}&curPage=1&searchOption=${map.searchOption}&keyword=${map.keyword}">
						                    <img src="${path}/resources/upload${row1.fullName}" width="10px" height="100px"></a>
						                     
						                    
						                     
						                   	</div> &nbsp; &nbsp;
						                    
						                    
						                   	<div class='title'>
						                        <a href="${path}/${row1.kind}/view.do?idx=${row1.idx}&curPage=1&searchOption=${map.searchOption}&keyword=${map.keyword}">
						                        ${row1.modelname}</a>
						                     </div>
						                    </td>
						                    
						                    
						                    
						                    <td align="right">
						                        <fmt:formatNumber pattern="###,###,###" value="${row1.price}"/> 원
						                        <input type="hidden" name="price" value="${row1.price}">
						                    </td>
						                    <td align="right">
						                        ${row1.amount} 개
						                         
						                    </td>
						                    
						                    <td name="price" align="right">
						                    	<input type="hidden" value="${row1.money}"/>
						                        <fmt:formatNumber pattern="###,###,###" value="${row1.money}"/>
						                    </td>
						                    <td>
						                    	${row1.user_id} 
						                    </td>
						                    <td>
						                    	<c:if test="${row1.shippingStatus eq 0}">
						                    		결제확인
						                    	</c:if>
						                    	<c:if test="${row1.shippingStatus eq 1}">
						                    		배송중
						                    	</c:if>
						                    	<c:if test="${row1.shippingStatus eq 2}">
						                    		배송완료
						                    	</c:if>
						                    	<c:if test="${row1.shippingStatus eq 3}">
						                    		환불신청
						                    	</c:if>
						                    	<c:if test="${row1.shippingStatus eq 4}">
						                    		환불완료
						                    	</c:if>
						                    	<c:if test="${row1.shippingStatus eq 5}">
						                    		교환신청
						                    	</c:if>
						                    	<c:if test="${row1.shippingStatus eq 6}">
						                    		교환중
						                    	</c:if>
						                    	<c:if test="${row1.shippingStatus eq 7}">
						                    		교환완료
						                    	</c:if>
						                    </td>
						                    <td>
						                   		 ${row1.orderdate}
						                   		 ${row1.kind}
						                    </td>
						                    <%-- <td>
						                        <a href="${path}/shop/cart/delete.do?cart_id=${row1.cart_id}">
						                        <input type="hidden" name="cart_id" value="${row1.cart_id}">삭제</a>
						                    </td> --%>
						                </tr>
						                </c:forEach>
	                                </tbody>
	                            </table>
	                            <div class="shopingcart-bottom-area">
	                        	<input type="submit" id="order" name="order" value="배송시작"
	                            style="background:#32b5f3 none repeat scroll 0 0;border-radius: 20px;color: #ffffff;display: inline-block;font-weight: 500;padding: 10px 25px;
	                            text-transform: uppercase;float: right !important;"/>
	                            
	                        </div>
                                </div>
                                <div role="tabpanel" class="tab-pane" id="data">
                                    <table>
	                                <thead>
						                 <tr>
						                	<th><input type="checkbox" id="allCheck"/></th>
						                	<th>상품번호</th>
						                    <th>상품명</th>
						                    <th>단가</th>
						                    <th>수량</th>
						                    <th>금액</th>
						                    <th>구매자</th>
						                   	<th>주문날짜</th>
						                   	<th><select value="상태"><option></option></select></th>
	
						                    <!-- <th>취소</th> -->
						                </tr>
	                                </thead>
	                                <tbody>
						                <c:forEach var="row2" items="${map.list2}" varStatus="i">
						                <tr>
						                	<td name="cart_id"><input type="checkbox" id="check_id" name="check" value="${row2.cart_id }" ></td>
						                	<td>${row2.cart_id }<input type="hidden" id="cart_id" name="cart_id" value="${row2.cart_id}"/></td>
						                	
						                	
						                    <td>
						                    <div class='image'>
						                    <a href="${path}/${row2.kind}/view.do?idx=${row2.idx}&curPage=1&searchOption=${map.searchOption}&keyword=${map.keyword}">
						                    <img src="${path}/resources/upload${row2.fullName}" width="10px" height="100px"></a>
						                     
						                    
						                     
						                   	</div> &nbsp; &nbsp;
						                    
						                    
						                   	<div class='title'>
						                        <a href="${path}/${row2.kind}/view.do?idx=${row2.idx}&curPage=1&searchOption=${map.searchOption}&keyword=${map.keyword}">
						                        ${row2.modelname}</a>
						                     </div>
						                    </td>
						                    
						                    
						                    
						                    <td align="right">
						                        <fmt:formatNumber pattern="###,###,###" value="${row2.price}"/> 원
						                        <input type="hidden" name="price" value="${row2.price}">
						                    </td>
						                    <td align="right">
						                        ${row2.amount} 개
						                         
						                    </td>
						                    
						                    <td name="price" align="right">
						                    	<input type="hidden" value="${row2.money}"/>
						                        <fmt:formatNumber pattern="###,###,###" value="${row2.money}"/>
						                    </td>
						                    <td>
						                    	${row2.user_id} 
						                    </td>
						                    <td>
						                    	<c:if test="${row2.shippingStatus eq 0}">
						                    		결제확인
						                    	</c:if>
						                    	<c:if test="${row2.shippingStatus eq 1}">
						                    		배송중
						                    	</c:if>
						                    	<c:if test="${row2.shippingStatus eq 2}">
						                    		배송완료
						                    	</c:if>
						                    	<c:if test="${row2.shippingStatus eq 3}">
						                    		환불신청
						                    	</c:if>
						                    	<c:if test="${row2.shippingStatus eq 4}">
						                    		환불완료
						                    	</c:if>
						                    	<c:if test="${row2.shippingStatus eq 5}">
						                    		교환신청
						                    	</c:if>
						                    	<c:if test="${row2.shippingStatus eq 6}">
						                    		교환중
						                    	</c:if>
						                    	<c:if test="${row2.shippingStatus eq 7}">
						                    		교환완료
						                    	</c:if>
						                    </td>
						                    <td>
						                   		 ${row2.orderdate}
						                   		 ${row2.kind}
						                    </td>
						                    <%-- <td>
						                        <a href="${path}/shop/cart/delete.do?cart_id=${row2.cart_id}">
						                        <input type="hidden" name="cart_id" value="${row2.cart_id}">삭제</a>
						                    </td> --%>
						                </tr>
						                </c:forEach>
	                                </tbody>
	                            </table>
	                            <div class="shopingcart-bottom-area">
	                        	<input type="submit" id="order" name="order" value="환불승인" formaction="${path}/business/payment.do?searchOption=refund"
	                            style="background:#32b5f3 none repeat scroll 0 0;border-radius: 20px;color: #ffffff;display: inline-block;font-weight: 500;padding: 10px 25px;
	                            text-transform: uppercase;float: right !important;"/>
	                            
	                        </div>
                                </div>
                                <div role="tabpanel" class="tab-pane" id="reviews">
                                    <table>
	                                <thead>
						                 <tr>
						                	<th><input type="checkbox" id="allCheck"/></th>
						                	<th>상품번호</th>
						                    <th>상품명</th>
						                    <th>단가</th>
						                    <th>수량</th>
						                    <th>금액</th>
						                    <th>구매자</th>
						                   	<th>주문날짜</th>
						                   	<th><select value="상태"><option></option></select></th>
	
						                    <!-- <th>취소</th> -->
						                </tr>
	                                </thead>
	                                <tbody>
						                <c:forEach var="row3" items="${map.list3}" varStatus="i">
						                <tr>
						                	<td name="cart_id"><input type="checkbox" id="check_id" name="check" value="${row3.cart_id }" ></td>
						                	<td>${row3.cart_id }<input type="hidden" id="cart_id" name="cart_id" value="${row3.cart_id}"/></td>
						                	
						                	
						                    <td>
						                    <div class='image'>
						                    <a href="${path}/${row3.kind}/view.do?idx=${row3.idx}&curPage=1&searchOption=${map.searchOption}&keyword=${map.keyword}">
						                    <img src="${path}/resources/upload${row3.fullName}" width="10px" height="100px"></a>
						                     
						                    
						                     
						                   	</div> &nbsp; &nbsp;
						                    
						                    
						                   	<div class='title'>
						                        <a href="${path}/${row3.kind}/view.do?idx=${row3.idx}&curPage=1&searchOption=${map.searchOption}&keyword=${map.keyword}">
						                        ${row3.modelname}</a>
						                     </div>
						                    </td>
						                    
						                    
						                    
						                    <td align="right">
						                        <fmt:formatNumber pattern="###,###,###" value="${row3.price}"/> 원
						                        <input type="hidden" name="price" value="${row3.price}">
						                    </td>
						                    <td align="right">
						                        ${row3.amount} 개
						                         
						                    </td>
						                    
						                    <td name="price" align="right">
						                    	<input type="hidden" value="${row3.money}"/>
						                        <fmt:formatNumber pattern="###,###,###" value="${row3.money}"/>
						                    </td>
						                    <td>
						                    	${row3.user_id} 
						                    </td>
						                    <td>
						                    	<c:if test="${row3.shippingStatus eq 0}">
						                    		결제확인
						                    	</c:if>
						                    	<c:if test="${row3.shippingStatus eq 1}">
						                    		배송중
						                    	</c:if>
						                    	<c:if test="${row3.shippingStatus eq 2}">
						                    		배송완료
						                    	</c:if>
						                    	<c:if test="${row3.shippingStatus eq 3}">
						                    		환불신청
						                    	</c:if>
						                    	<c:if test="${row3.shippingStatus eq 4}">
						                    		환불완료
						                    	</c:if>
						                    	<c:if test="${row3.shippingStatus eq 5}">
						                    		교환신청
						                    	</c:if>
						                    	<c:if test="${row3.shippingStatus eq 6}">
						                    		교환중
						                    	</c:if>
						                    	<c:if test="${row3.shippingStatus eq 7}">
						                    		교환완료
						                    	</c:if>
						                    </td>
						                    <td>
						                   		 ${row3.orderdate}
						                   		 ${row3.kind}
						                    </td>
						                    <%-- <td>
						                        <a href="${path}/shop/cart/delete.do?cart_id=${row3.cart_id}">
						                        <input type="hidden" name="cart_id" value="${row3.cart_id}">삭제</a>
						                    </td> --%>
						                </tr>
						                </c:forEach>
	                                </tbody>
	                            </table>
	                            <div class="shopingcart-bottom-area">
	                        	<input type="submit" id="order" name="order" value="교환승인" formaction="${path}/business/payment.do?searchOption=exchange"
	                            style="background:#32b5f3 none repeat scroll 0 0;border-radius: 20px;color: #ffffff;display: inline-block;font-weight: 500;padding: 10px 25px;
	                            text-transform: uppercase;float: right !important;"/>
	                            
	                        </div>
                                </div>
                            </div>
                        </div>
					</div>
				</div>  
						        
	                            
	                            </c:otherwise>
							    </c:choose>
	                        </div>	
	                        	                
			            </div>
			        </div>
		        </form>
		    </div>
		</div>
		
		<!-- Cart Area End -->
		
        <!-- Discount Area Start -->
        <div class="discount-area">
            <div class="container">
                <div class="row">
                   
                </div>
            </div>
        </div>
        <!-- Discount Area End -->
        
		<%@ include file="/resources/include/footer.jsp" %>
    </body>
</html>