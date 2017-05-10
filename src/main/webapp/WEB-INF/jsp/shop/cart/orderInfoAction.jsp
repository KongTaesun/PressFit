<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%@ include file="/resources/include/header.jsp"%>
<link rel="stylesheet" type="text/css" href="${path}/resources/writer/KakaoFriends1.css">


<style>
.btn_check_1_img{
 background:url('${path}/resources/writer/icon/real_button_b.png');
 width:
 
}

#btn_check_1 {
    float: right;
    padding-right: 26px;
    padding-bottom: 12px; 
    border: 0px;
}

</style>
<script type="text/javascript">
 function gopayment(){
	 document.ini.submit();
 }
</script>

<body> 

	<div id="kakaoContent" class="cont_order" role="main">
		<div id="cMain">
<div id="mArticle">
	<div class="p-details-tab" style="margin-top: 30px;">
	            	<ul class="p-details-nav-tab">
	                	<li role="presentation" class="active"><a href="#" id="btnone">주문하기</a></li>
	                </ul>
	      		</div>
	<form id="ini" name="ini" method="post" action="${path}/shop/cart/payment.do">

		
		 
		<fieldset>
			<legend class="screen_out">주문하기 양식</legend>
			<div class="info_delivery">
				<h3 class="tit_sub">주문/배송정보</h3>
				<dl class="list_delivery">
				<c:forEach var="row" items="${map.memberInfo}">

					<dt><label for="oaName">주문자명</label><span class="ico_friends ico_star">필수입력</span></dt>
					<dd>
						<div class="box_input"><input class="tf_g" id="oaName" name="oaName" type="text" value="${row.name}" readonly="readonly" >
						</div>
					</dd>
					<dt><label for="oaEmail">이메일</label><span class="ico_friends ico_star">필수입력</span></dt>
					<dd>
						<div class="box_input"><input class="tf_g" id="oaEmail" name="oaEmail" type="text" value="${row.email}" readonly="readonly"></div>
					</dd>
					<dt><label for="oaPhone">연락처</label><span class="ico_friends ico_star">필수입력</span></dt>
					<dd>
						<div class="box_input"><input class="tf_g" id="oaPhone" name="oaPhone" type="text" max="12" value="${row.hp}" readonly="readonly"></div>
					</dd>
					<dt><label for="orderPostal">우편번호</label><span class="ico_friends ico_star">필수입력</span></dt> 
					<dd>
						<div class="box_input box_postal"><input class="tf_g" id="orderPostal" name="oaZoneCode_txt" type="text" maxlength="5" value="${row.post }" readonly="readonly"></div>
					</dd>
					<dt><label for="orderAddress1">주소</label><span class="ico_friends ico_star">필수입력</span></dt>
					<dd>
						<div class="box_input"><input class="tf_g" id="orderAddress1" name="oaAddr1_txt" type="text" maxlength="100" value="${row.basic_addr }" readonly="readonly"></div>
					</dd>
					<dt><label for="orderAddress2">상세주소</label><span class="ico_friends ico_star">필수입력</span></dt>
					<dd>
						<div class="box_input"><input class="tf_g" id="orderAddress2" name="oaAddr2" type="text" value="${row.detail_addr}" readonly="readonly"></div>
					</dd>
					</c:forEach>
				</dl>
			</div>
			<div class="product_area">
				<div class="info_product">
					<h3 class="tit_sub">상품리스트 (1)</h3>
					<ul class="list_item">
					<c:forEach var="row" items="${map.list}">
						<input type="hidden" name="amount" value="${row.amount}">
						<input type="hidden" id="cart_id" name="cart_id" value="${row.cart_id}"> 
						<input type="hidden" id="idx" name="idx" value="${row.idx}"> 
						<input type="hidden" id="kind" name="kind" value="${row.kind}">
							<li>
							<span class="wrap_thumb">
								<img class="thumb_g" src="${path}/resources/upload${row.fullName}">
							</span>
								<div class="desc_product">
									<strong class="tit_product">${row.modelname}</strong>
									<input name="h_prname" type="hidden" value="슬리브아이스컵-무지">
									<ul class="list_append">
										<li><em class="tit_append">금액 :</em>
											${row.price}
											</li><li><em class="tit_append">수량 :</em>${row.amount} 개</li>
										<li><em class="tit_append">옵션 :</em></li>
										<li><em class="tit_append">내용 :</em></li> <!-- 하트라이언 -->
									</ul>
								</div>
							</li>
					</c:forEach>
						</ul>
					<dl class="list_price">
						<dt>장바구니 합계 :</dt>
						<dd><fmt:formatNumber pattern="###,###,###"
																	value="${map.checksumMoney}" />원</dd>
						<dt>배송비 :</dt>
						<dd><fmt:formatNumber pattern="###,###,###"
																	value="${map.fee}" />원</dd>
						<dt class="txt_total">총 결제금액</dt>
						<dd id="total_price" class="txt_total">
							<fmt:formatNumber pattern="###,###,###"
																	value="${map.allSum}" />원</dd>
					</dl>
				</div>
				<div class="info_pay">
					<h3 class="tit_sub">결제수단</h3>
					<ul class="list_pay">
						<li>
							<span class="choice_g choice_radio">
								<input name="methodpayment" class="inp_g" id="ptid_onlycard" value="신용카드" type="radio">
								<label class="lab_g" for="ptid_onlycard">
									<span class="ico_friends ico_radio"></span>
									신용카드
								</label>
							</span>
						</li>
						<li>
							<span class="choice_g choice_radio">
								<input name="methodpayment" class="inp_g" id="ptid_onlybank" value="무통장입금" type="radio">
								<label class="lab_g" for="ptid_onlybank">
									<span class="ico_friends ico_radio"></span>
									무통장입금
									</label>
							</span>
						</li> 
					</ul>
					<strong class="screen_out">약관동의</strong>
			
					<ul class="list_agree">
						<li>
							<span class="choice_g choice_check">
								<label class="lab_g" for="checkAgree2"> 
								
										<input type="button" id="btn_check_1" class="btn_check_1_img"> 
								
								
								회원 이용 약관에 동의함</label>
								<a class="link_view" href="${path}/resources/agreement/provision.jsp" target="_blank">자세히 보기</a>
							</span>
						</li>
					</ul>
				</div><!--// 결제수단 -->
			</div> 
			<div class="order_btn">
				<button type="button" class="btn_order btn_payment" onclick="gopayment()"><span class="txt_g">결제하기</span></button>
			</div>
			
		</fieldset> 
	</form>
</div>
<div id="kakaopay_layer" style="display: none"></div>
 <div id="cEtc"></div>

</div></div>


	<%@ include file="/resources/include/footer.jsp"%>
</body>
	<script>
 
$(function() {
	var f=0;
	 $("#btn_check_1").click(function() {
		 if(f==0){
		 $("#btn_check_1").css({'background':"url('${path}/resources/writer/icon/real_button.png')"});f=1; }
		 else{
			 $("#btn_check_1").css({'background':"url('${path}/resources/writer/icon/real_button_b.png')"}); f=0;}
	})
})
 

</script>  
</html>