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
		    <div class="col-md-1"></div>
		    <div class="col-md-10">
		    	<form name="frm" method="post" action="${path}/business/payment.do" onsubmit="return order();">
			        <div class="row">
			            <div class="col-md-12">
			            	<h3>주문내역</h3>
	                        <div class="wishlist-table-area table-responsive">
	                        <c:choose>
						        <c:when test="${map.count == 0}">
						           	주문들어온 내역이 없습니다.
						        </c:when>
						        <c:otherwise>
						        
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
						                <c:forEach var="row" items="${map.list}" varStatus="i">
						                <tr>
						                	<td name="cart_id"><input type="checkbox" id="check_id" name="check" value="${row.cart_id }" ></td>
						                	<td>${row.cart_id }<input type="hidden" id="cart_id" name="cart_id" value="${row.cart_id}"/></td>
						                	
						                	
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
						                    
						                    
						                    
						                    <td align="right">
						                        <fmt:formatNumber pattern="###,###,###" value="${row.price}"/> 원
						                        <%-- <input type="hidden" name="price" value="${row.price}"> --%>
						                    </td>
						                    <td align="right">
						                        ${row.amount} 개
						                         
						                    </td>
						                    
						                    <td name="price" align="right">
						                    	<%-- <input type="hidden" value="${row.money}"/> --%>
						                        <fmt:formatNumber pattern="###,###,###" value="${row.money}"/>
						                    </td>
						                    <td>
						                    	${row.user_id} 
						                    </td>
						                    <td>
						                    	<c:if test="${row.shippingStatus eq 0}">
						                    		결제확인
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
						                    		배송중
						                    	</c:if>
						                    	<c:if test="${row.shippingStatus eq 6}">
						                    		배송중
						                    	</c:if>
						                    </td>
						                    <td>
						                   		 ${row.orderdate}
						                   		 ${row.kind}
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
	                        	<input type="submit" id="order" name="order" value="배송시작"
	                            style="background:#32b5f3 none repeat scroll 0 0;border-radius: 20px;color: #ffffff;display: inline-block;font-weight: 500;padding: 10px 25px;
	                            text-transform: uppercase;float: right !important;"/>
	                            
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