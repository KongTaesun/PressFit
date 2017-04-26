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
 		
 		$("#btnWrite").click(
				function() {
					// 페이지 주소 변경(이동)
					location.href = "${path}/business/orderList.do?curPage="
							+ page
							+ "&searchOption=${map.searchOption}"
							+ "&keyword=${map.keyword}";
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
		    <div class="col-md-1"></div>
		    <div class="col-md-10">
		    	
			        <div class="row">
			        
			            <div class="col-md-12">
			            	
	                        <div class="wishlist-table-area table-responsive">
	                        
						        
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
                                <form name="frm" method="post" action="${path}/business/payment.do?searchOption=order" onsubmit="return order();">
                                <c:choose>
						        <c:when test="${map.listcount1 == 0}">
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
						                <c:forEach var="row1" items="${map.list1}" varStatus="i">
					              
					         			 <input type="hidden"  name="idx" value="${row1.idx}"> 
					         			 <input type="hidden"  name="kind" value="${row1.kind}"> 
						                <tr>
						                	<td name="cart_id"><input type="checkbox" id="check_id" name="check" value="${row1.cart_id }" ></td>
						                	<td>${row1.cart_id }<input type="hidden" id="cart_id" name="cart_id" value="${row1.cart_id}"/></td>
						                	
						                	
						                    <td>
						                    
						                        <a href="${path}/${row1.kind}/view.do?idx=${row1.idx}&curPage=1&searchOption=${map.searchOption}&keyword=${map.keyword}">
						                        ${row1.modelname}</a>
						                    
						                    </td>
						                    
						                    
						                    
						                    <td align="right">
						                        <fmt:formatNumber pattern="###,###,###" value="${row1.price}"/> 원
						                        <input type="hidden" name="price" value="${row1.price}">
						                    </td>
						                    <td align="right">
						                        ${row1.amount} 개
						                        <input type="hidden"  name="amount" value="${row1.amount}"/> 
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
						                    </td>
						                    <%-- <td>
						                        <a href="${path}/shop/cart/delete.do?cart_id=${row1.cart_id}">
						                        <input type="hidden" name="cart_id" value="${row1.cart_id}">삭제</a>
						                    </td> --%>
						                </tr>
						                </c:forEach>
	                                </tbody>
	                            </table>
	                            </c:otherwise>
							    </c:choose>
							    <!-- 처음페이지로 이동 : 현재 페이지가 1보다 크면  [처음]하이퍼링크를 화면에 출력--> 
									<c:if test="${map.boardPager1.curBlock > 1}">
										<a href="javascript:list('1')">[처음]</a>
									</c:if> 
									<!-- 이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 --> 
									<c:if test="${map.boardPager1.curBlock > 1}">
										<a href="javascript:list('${map.boardPager1.prevPage}')">[이전]</a>
									</c:if> <!-- **하나의 블럭 시작페이지부터 끝페이지까지 반복문 실행 --> 
									<c:forEach var="num" begin="${map.boardPager1.blockBegin}" end="${map.boardPager1.blockEnd}">
									<!-- 현재페이지이면 하이퍼링크 제거 -->
									<c:choose>
										<c:when test="${num == map.boardPager1.curPage}">
											<span style="color: red">${num}</span>&nbsp;
						                </c:when>
										<c:otherwise>
											<a href="javascript:list('${num}')">${num}</a>&nbsp;
						                </c:otherwise>
										</c:choose>
										</c:forEach> <!-- 다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
										<c:if test="${map.boardPager1.curBlock <= map.boardPager1.totBlock}">
											<a href="javascript:list('${map.boardPager1.nextPage}')">[다음]</a>
										</c:if> <!-- 끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 --> 
										<c:if test="${map.boardPager.curPage <= map.boardPager1.totPage}">
											<a href="javascript:list('${map.boardPager1.totPage}')">[끝]</a>
										</c:if>
	                            <div class="shopingcart-bottom-area">
	                        	<input type="submit" id="order" name="order" value="배송시작"
	                            style="background:#32b5f3 none repeat scroll 0 0;border-radius: 20px;color: #ffffff;display: inline-block;font-weight: 500;padding: 10px 25px;
	                            text-transform: uppercase;float: right !important;"/>
	                            
	                        </div>
	                        </form>
                                </div>
                                
                                <div role="tabpanel" class="tab-pane" id="data">
                                <form name="frm" method="post" action="${path}/business/payment.do?searchOption=refund" onsubmit="return order();">
                                <c:choose>
						        <c:when test="${map.listcount2 == 0}">
						           	환불내역이 없습니다.
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
						                <c:forEach var="row2" items="${map.list2}" varStatus="i">
						                 <input type="hidden" id="idx" name="idx" value="${row2.idx}"> 
					         			 <input type="hidden" id="kind" name="kind" value="${row2.kind}"> 
						                <tr>
						                	<td name="cart_id"><input type="checkbox" id="check_id" name="check" value="${row2.cart_id }" ></td>
						                	<td>${row2.cart_id }<input type="hidden" id="cart_id" name="cart_id" value="${row2.cart_id}"/></td>
						                	
						                	
						                    <td>
						                    
						                        <a href="${path}/${row2.kind}/view.do?idx=${row2.idx}&curPage=1&searchOption=${map.searchOption}&keyword=${map.keyword}">
						                        ${row2.modelname}</a>
						                   
						                    </td>
						                    
						                    
						                    
						                    <td align="right">
						                        <fmt:formatNumber pattern="###,###,###" value="${row2.price}"/> 원
						                        <input type="hidden" name="price" value="${row2.price}">
						                    </td>
						                    <td align="right">
						                        ${row2.amount} 개
						                        <input type="hidden"  name="amount" value="${row2.amount}"> 
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
						                    </td>
						                    <%-- <td>
						                        <a href="${path}/shop/cart/delete.do?cart_id=${row2.cart_id}">
						                        <input type="hidden" name="cart_id" value="${row2.cart_id}">삭제</a>
						                    </td> --%>
						                </tr>
						                </c:forEach>
	                                </tbody>
	                            </table>
	                            </c:otherwise>
							    </c:choose>
	                            <div class="shopingcart-bottom-area">
	                        	<input type="submit" id="order" name="order" value="환불승인"
	                            style="background:#32b5f3 none repeat scroll 0 0;border-radius: 20px;color: #ffffff;display: inline-block;font-weight: 500;padding: 10px 25px;
	                            text-transform: uppercase;float: right !important;"/>
	                            
	                        </div>
	                        </form>
                                </div>
                                <div role="tabpanel" class="tab-pane" id="reviews">
                                <form name="frm" method="post" action="${path}/business/payment.do?searchOption=exchange" onsubmit="return order();">
                                <c:choose>
						        <c:when test="${map.listcount3 == 0}">
						           	교환내역이 없습니다.
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
						                <c:forEach var="row3" items="${map.list3}" varStatus="i">
						                 <input type="hidden"  name="idx" value="${row3.idx}"> 
					         			 <input type="hidden"  name="kind" value="${row3.kind}"> 
						                <tr>
						                	<td name="cart_id"><input type="checkbox" id="check_id" name="check" value="${row3.cart_id }" ></td>
						                	<td>${row3.cart_id }<input type="hidden" id="cart_id" name="cart_id" value="${row3.cart_id}"/></td>
						                	
						                	
						                    <td>
						                    
						                        <a href="${path}/${row3.kind}/view.do?idx=${row3.idx}&curPage=1&searchOption=${map.searchOption}&keyword=${map.keyword}">
						                        ${row3.modelname}</a>
						                     
						                    </td>
						                    
						                    
						                    
						                    <td align="right">
						                        <fmt:formatNumber pattern="###,###,###" value="${row3.price}"/> 원
						                        <input type="hidden" name="price" value="${row3.price}">
						                    </td>
						                    <td align="right">
						                        ${row3.amount} 개
						                        <input type="hidden"  name="amount" value="${row3.amount}"> 
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
						                    </td>
						                    <%-- <td>
						                        <a href="${path}/shop/cart/delete.do?cart_id=${row3.cart_id}">
						                        <input type="hidden" name="cart_id" value="${row3.cart_id}">삭제</a>
						                    </td> --%>
						                </tr>
						                </c:forEach>
	                                </tbody>
	                            </table>
	                            </c:otherwise>
							    </c:choose>
	                            <div class="shopingcart-bottom-area">
	                        	<input type="submit" id="order" name="order" value="교환승인"
	                            style="background:#32b5f3 none repeat scroll 0 0;border-radius: 20px;color: #ffffff;display: inline-block;font-weight: 500;padding: 10px 25px;
	                            text-transform: uppercase;float: right !important;"/>
	                            
	                        </div>
	                        </form>
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