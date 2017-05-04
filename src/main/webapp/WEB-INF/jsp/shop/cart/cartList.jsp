<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품장바구니</title>
<%@ include file="/resources/include/header.jsp"%>
<style>
.breadcrumbs-area {
	background-image:
		url('${path}/resources/writer/img/bigpicture/buket_img1.png');
}
</style>
<style>
.image {
	height: 100px;
	width: 100px;
	display: inline-block;
	position: absolute;
}

img {
	width: 100%
}

.title {
	height: 50px;
	width: 500px;
	display: inline-block;
	position: relative;
	margin-top: 50px;
	margin-left: 100px;
}

.buttonimg {
	background: #32b5f3 none repeat scroll 0 0;
	border-radius: 20px;
	color: #ffffff;
	display: inline-block;
	font-weight: 500;
	text-transform: uppercase;
	text-decoration: none;
}
.buttonimg:HOVER{
background: #444444 none repeat scroll 0 0;
}

.info_basket {
    position: relative;
    width: 100%;
    margin: 30px auto 0;
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

.info_basket .list_basket {
    overflow: hidden;
    margin-top: 27px;
}
.info_basket .list_basket li {
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
.info_basket .list_basket .link_thumb {
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
.info_basket .list_basket .desc_basket {
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
				var sum = ${map.allSum};
				var b = Number($('#chicemoney').text());
				$('#chicemoneysum').html(Number(sum));
			}
			else{
				$("input[type=checkbox]").prop("checked", false);
				$('#chicemoneysum').html(0);
			}
		})
		
		$('input[type=checkbox]').click(function() {
			var ischecked = $(this).is(":checked");
			if (ischecked) {
				var a = Number($(this).parents('li[class="check_on"]').children('div[class="desc_basket"]').children('ul[class="list_append"]').children('li[name="price"]').children('input').val());
				var b = Number($('#chicemoney').text());
				$('#chicemoney').html(a+b);
				if((a+b)==0){
					$('#shipFee').html(0);
				} else if((a+b)>=100000){
					$('#shipFee').html(0);
				} else{
					$('#shipFee').html(2500);
				}
				var c = Number($('#shipFee').text());
				$('#chicemoneysum').html(a+b+c);
			}
			if (!ischecked) {
				var a = Number($(this).parents('li[class="check_on"]').children('div[class="desc_basket"]').children('ul[class="list_append"]').children('li[name="price"]').children('input').val());
				var b = Number($('#chicemoney').text());
				$('#chicemoney').html(b-a);
				if((b-a)==0){
					$('#shipFee').html(0);
				} else if((b-a)>=100000){
					$('#shipFee').html(0);
				} else{
					$('#shipFee').html(2500);
				}
				var c = Number($('#shipFee').text());
				$('#chicemoneysum').html(b-a+c);
			}
		});
		
		
 		$("#order").click(function(){
 			order();
		});
 		$("#continue").click(function(){
 			ontinueShopping();
		});
		
	});

	
 	function order() {
 		var idx = document.getElementsByName("check");
 		for (var i = 0; i < idx.length; i++) {
			if (idx[i].checked == true) {
				var list = new Array(idx[i].value);
			}
		}
 		 list;
	}
 	
 	
 	
	function alldelete() {

		if (confirm("정말로 장바구니를 비우시겠습니까?")) {
			location.href = "${path}/shop/cart/alldelete.do";
		} else {
			return;
		}
	}
	
	function continueShopping() {
		location.href = "${path}/tmouse/list.do";
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
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumbs Area End -->
	<!-- Cart Area Start -->
	<div class="shopping-cart-area section-padding">
		<form name="frm" method="post" action="${path}/shop/cart/orderInfoAction.do" onsubmit="return order();">
			<div class="container">
				<div class="p-details-tab" style="margin-top: 30px;">
	            	<ul class="p-details-nav-tab">
	                	<li role="presentation" class="active"><a href="#" id="btnone">장바구니</a></li>
	                </ul>
	      		</div>
		      		
	      		<div class="info_basket">
	      			<p class="desc_total">총 <em class="emph_total">${map.count}개</em> 의 상품이 조회되었습니다.</p>
	      			<c:choose>
	      				<c:when test="${map.count == 0}">
					       <p class="desc_nodata">장바구니에 담긴 상품이 없습니다.</p>     	
						</c:when>
						<c:otherwise>
							<span class="choice_g choice_all">
								<input type="checkbox" id="allCheck" />
								<label for="checkAll" class="lab_g">
									전체 선택
								</label>
							</span>
							<ul class="list_basket">
								<c:forEach var="row" items="${map.list}" varStatus="i">
									<li class="check_on">
										<span class="choice_g choice_basket">
											<input type="checkbox" id="check_id" name="check" value="${row.cart_id }">
										</span>
										<a href="${path}/${row.kind}/view.do?idx=${row.idx}&curPage=1&searchOption=${map.searchOption}&keyword=${map.keyword}" class="link_thumb">
											<img src="${path}/resources/upload${row.fullName}" class="thumb_g" alt="">
										</a>
										<div class="desc_basket">
											상품번호 ${row.cart_id }<input type="hidden" id="cart_id" name="cart_id" value="${row.cart_id}" />
											<strong class="tit_product">
												<a href="${path}/${row.kind}/view.do?idx=${row.idx}&curPage=1&searchOption=${map.searchOption}&keyword=${map.keyword}" class="link_product">
													${row.modelname}
												</a>
											</strong>
											<ul class="list_append">
												<li>
													<em class="tit_append">단가 :</em>
													<span class="product_price">
														<fmt:formatNumber pattern="###,###,###" value="${row.price}" />
													</span>원
												</li>
												<li>
													<em class="tit_append">수량 :</em>
													<span class="product_price">
														<input type="text" style="width: 10px; border: none;" name="amount" value="${row.amount}" readonly="readonly">
													</span>개
													<input type="hidden" name="amount" value="${row.amount}">
												</li>
												<li name="price">
													<em class="tit_append">금액 :</em>
													<span class="product_price">
														<fmt:formatNumber pattern="###,###,###" value="${row.money}" />
													</span>원
													<input type="hidden" name="price" id="price" value="${row.money}" />
												</li>
											</ul>
										</div>
										<a href="${path}/shop/cart/delete.do?cart_id=${row.cart_id}" class="productRemove">
			                            	<i class="flaticon-delete"></i>
			                            </a>
									</li>
								</c:forEach>
							</ul>
							<div class="info_price">
								<dl class="list_price">
									<dt>장바구니 합계 :</dt>
									<dd><span id="chicemoney">0</span>원</dd>
									<dt>배송비 :</dt>
									<dd><span id="shipFee">0</span>원</dd>
								</dl>
								<dl class="list_price price_total">
									<dt>총 결제금액</dt>
									<dd><strong><span id="chicemoneysum">0</span>원</strong></dd>
								</dl>
							</div>
						</c:otherwise>
	      			</c:choose>
				</div>
					
				<div class="inner_basket">
					<div class="buy_btn">
						<c:if test="${map.count ne 0}">
							<a id="clear" style="float:right;margin-right:5px" class="cart_atag">장바구니 비우기</a>				
							<button style="float:right;margin-right:5px" type="submit" name="order">주문하기</button>		
						</c:if>
						<a href="${path}/tmouse/list.do" style="float:left;" class="cart_atag">쇼핑계속하기</a>				
					</div>
				</div>
			</div>
		</form>
	</div>				

	<%@ include file="/resources/include/footer.jsp"%>
</body>
</html>