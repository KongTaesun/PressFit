<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@ include file="/resources/include/header.jsp"%>
<style>
.breadcrumbs-area {
 background-image: url('${path}/resources/writer/img/bigpicture/mouse_img2.png');
}

.orderlist_scroll{
overflow-y:scroll; width:100%; height:400px; 
}

.btn-default{
background:#32b5f3 none repeat scroll 0 0;
border-radius: 20px;
color: #ffffff;
display: inline-block;
font-weight: 500;
padding: 10px 25px;
text-transform: uppercase;
float: right !important;
}

.p-details-tab ul.p-details-nav-tab li.active a {
    color: #444444;
    display: block;
    position: relative;
}

.p-details-tab ul.p-details-nav-tab li a {
    color: #c8c8c8;
    display: block;
    font-size: 20px;
    font-weight: 700;
    line-height: 1;
    margin-bottom: 25px;
    padding-bottom: 10px;
    position: relative;
    text-transform: capitalize;
}
.desc_total {
    padding: 0 0 7px;
    font-size: 18px;
    color: #666;
}
.emph_total {
    font-weight: 700;
    color: #222;
}
.list_basket {
    overflow: hidden;
    margin-top: 27px;
}
.list_basket li {
    position: relative;
    float: left;
    width: 100%;
    padding: 25px 0 30px;
    border-bottom: 1px solid #efefef;
}
.choice_basket {
    float: left;
    width: 34px;
    height: 120px;
    margin-top: 5px;
}
.list_basket .link_thumb {
    overflow: hidden;
    position: relative;
    float: left;
    width: 120px;
    height: 120px;
    margin: 5px 50px 0 0;
}
.thumb_g {
    display: block;
    width: 100%;
    height: auto;
}
.list_basket .desc_basket {
    overflow: hidden;
}
.list_basket .desc_basket .tit_product {
    display: block;
    padding-right: 50px;
    font-size: 20px;
    line-height: 22px;
}
.list_basket .desc_basket .list_append {
    overflow: hidden;
    float: left;
    width: 335px;
    margin-top: 46px;
    font-size: 16px;
    color: #222;
    line-height: 24px;
}
.list_basket .list_append li {
    padding: 0;
    border-bottom: 0 none;
    text-align: right;
}
.list_basket .list_append .tit_append {
    float: left;
    color: #999;
}
.list_basket .desc_basket .list_append1 {
    overflow: hidden;
    float: left;
    width: 335px;
    margin-top: 46px;
    margin-left: 150px;
    font-size: 16px;
    color: #222;
    line-height: 24px;
}
.list_basket .list_append1 li {
    padding: 0;
    border-bottom: 0 none;
    text-align: right;
}
.list_basket .list_append1 .tit_append {
    float: left;
    color: #999;
}
.productRemove {
    color: #666666;
    font-size: 25px;
    position: absolute;
    right: 0;
    bottom: 30px;
}
.info_price {
    overflow: hidden;
    width: 100%;
    margin: 0 auto;
    padding: 72px 0 46px;
    border-bottom: 1px solid #b5b5b5;
}
.info_price .list_price {
    float: left;
    width: 450px;
    font-size: 18px;
    color: #999;
    line-height: 31px;
}
.list_price dt {
    float: left;
}
.list_price dd {
    overflow: hidden;
    color: #222;
    text-align: right;
}
.info_price .price_total {
    float: right;
    width: 450px;
    margin-top: 30px;
    font-size: 20px;
    color: #1e1e1e;
}
.desc_nodata {
    padding: 151px 0 138px;
    border-bottom: 1px solid #222;
    font-size: 18px;
    color: #666;
    text-align: center;
}
button {
    font-family: Arial, Helvetica, sans-serif;
    font-size: 14px;
    color: #616161;
    padding: 9px 20px;
    background: -moz-linear-gradient(top, #ffffff 0%, #ffffff);
    background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#ffffff));
    -moz-border-radius: 0px;
    -webkit-border-radius: 0px;
    border-radius: 0px;
    border: 1px solid #dbe2ff;
    box-shadow: 0px 1px 3px rgba(000,000,000,0.3), inset 0px 0px 2px rgba(255,255,255,0);
}
button.hover {
    font-weight: bold;
    color: #000000;
    border: 1px solid #879fff;
}
.inner_basket {
    width: 100%;
    height: 40px;
    margin: 20px auto;
}
.cart_atag {
    font-family: Arial, Helvetica, sans-serif;
    font-size: 14px;
    color: #616161;
    padding: 9px 20px;
    background: -moz-linear-gradient(top, #ffffff 0%, #ffffff);
    background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#ffffff));
    -moz-border-radius: 0px;
    -webkit-border-radius: 0px;
    border-radius: 0px;
    border: 1px solid #dbe2ff;
    box-shadow: 0px 1px 3px rgba(000,000,000,0.3), inset 0px 0px 2px rgba(255,255,255,0);
}
.cart_atag.hover {
    font-weight: bold;
    color: #000000;
    border: 1px solid #879fff;
}
.desc_nodata {
    padding: 151px 0 138px;
    font-size: 18px;
    color: #666;
    text-align: center;
}
</style>
</head>


        
         

<body>
        <!-- Breadcrumbs Area Start -->
        <div class="breadcrumbs-area">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
					    <div class="breadcrumbs">
					       <h2>취소 및 교환</h2> 
					      <!-- <ul class="breadcrumbs-list">
						         <li>
						            <a title="Return to Home" href="index.html">Home</a>
						        </li> 
						        <li>Shopping Cart</li>
						    </ul>-->
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
		            <div class="p-details-tab" style="margin-top: 30px;">
                                <ul class="p-details-nav-tab">
                                    <li role="presentation"><a href="${path}/member/mypage.do?id=${sessionScope.id}" id="btnone">마이페이지</a></li>
                                    <li role="presentation"><a href="${path}/member/updatepage.do?id=${vo.id}" id="btntwo">내정보관리</a></li>
                                    <li role="presentation"><a href="${path}/order/orderList.do" id="btnthree">내주문관리</a></li>
                                    <li role="presentation" class="active"><a href="${path}/order/orderCancel.do" id="btnthree">취소및교환</a></li>
                                  <!--   <li role="presentation"><a href="#" id="btnthree">1대1문의</a></li> -->                         
                                </ul> 
                            </div>
                           
                        <div class="wishlist-table-area table-responsive">   
                             <ul class="list_basket">
											<c:forEach var="row" items="${map.list}" varStatus="i">
												<li class="check_on">
													<a href="${path}/${row.kind}/view.do?idx=${row.idx}&curPage=1&searchOption=${map.searchOption}&keyword=${map.keyword}" class="link_thumb">
														<img src="${path}/resources/upload${row.fullName}" class="thumb_g" alt="">
													</a>
													<div class="desc_basket">
														주분번호 ${row.cart_id }<input type="hidden" id="cart_id" name="cart_id" value="${row.cart_id}"/>
														<strong class="tit_product">
															<a href="${path}/${row2.kind}/view.do?idx=${row2.idx}&curPage=1&searchOption=${map.searchOption}&keyword=${map.keyword}" class="link_product">
																${row.modelname}
															</a>
														</strong>
														<ul class="list_append">
															<%-- <li>
																<em class="tit_append">주분번호 :</em>
																<span class="product_price">
																	<input type="text" style="width: 10px; border: none;" name="amount" value="${row.cart_id}" readonly="readonly">
																</span>
																
															</li> --%>
															<li name="price">
																<em class="tit_append">주문일자 :</em>
																<span class="product_price">
							                        				 <fmt:formatDate pattern="yyyy.MM.dd" value="${row.orderdate}"/>
																</span>
															</li>
															<%-- <li>
																<em class="tit_append">주분상품정보 :</em>
																<span class="product_price">
																	<input type="text" style="width: 10px; border: none;" name="amount" value="${row.modelname}" readonly="readonly">
																</span>
													
															</li> --%>
															<li>
																<em class="tit_append">상품수량 :</em>
																<span class="product_price">
																	<input type="text" style="width: 10px; border: none;" name="amount" value="${row.amount}" readonly="readonly">
																</span>개
															</li>
															<li name="price">
																<em class="tit_append">금액 :</em>
																<span class="product_price">
							                        				<fmt:formatNumber pattern="###,###,###" value="${row.money}"/>
																</span>원
																<input type="hidden" value="${row.money}"/>
															</li>
														</ul>
														<ul class="list_append1">
														
															<li>
																<em class="tit_append">판매자 :</em>
																<span class="product_price">
																	${row.crea_id}
																</span>
															</li>
															<li>
														<em class="tit_append">주문상태 :</em>
																<span class="order_state">
																	
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
														 
												</span>
											</li>
											<li>
										<em class="tit_append">확인 :</em>
											<span class="product_price">
									
                                    	   <a class="commit" href="${path}/order/orderCancelaction.do?cart_id=${row.cart_id}">환불신청</a>
      										</span>
      										</li>
      				              </ul> 
                           		</div>
                       	    	</li>	
                          		   </c:forEach>          
                            </ul>
                         </div>
                    </div>
                </div>
            </div>
        </div>                          		                        		
				    <%--  														   
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
                                        
                                         <td class="order_comform">
                                         
                                       <a class="commit" href="${path}/order/orderCancelaction.do?cart_id=${row.cart_id}">반품신청</a>
      
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
                        </div> --%>
         


		<%@ include file="/resources/include/footer.jsp" %>
</body>
</html>