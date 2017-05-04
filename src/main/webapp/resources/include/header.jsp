<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jstl 시간 출력 태그 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- context 경로 -->
<c:set var="path" value="${pageContext.request.contextPath}" />
<head>
<style>
.flaticon-people{
content: "\f108";
font-size: 30px;
}

[class^="flaticon-"]:before, [class*=" flaticon-"]:before, [class^="flaticon-"]:after, [class*=" flaticon-"]:after {
    font-family: Flaticon;
    font-style: normal;
}

bootstrap.min.css:2
*:before, *:after {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box; 
    box-sizing: border-box;
}

.header-right{
height: 95px;
}

.login-light1{
    display: block;
    float: left;
    width: 130px;
    height: 95px;
    /* border: 1px solid; */
    padding: 25px 26px 7px 0;
    text-align: right;
    font-size: 30px;
}
.cart-left1{
    display: block;
    float: left;
    width: 130px;
    height: 95px;
    /* border: 1px solid; */
    padding: 25px 26px 7px 0;
    text-align: right;
    font-size: 30px;
}

</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

</head>

<!-- Google Fonts -->
<link
	href='https://fonts.googleapis.com/css?family=Poppins:400,700,600,500,300'
	rel='stylesheet' type='text/css'>

<!-- all css here -->
<!-- bootstrap v3.3.6 css -->
<link rel="stylesheet"
	href="${path}/resources/writer/css/bootstrap.min.css">
<!-- animate css -->
<link rel="stylesheet" href="${path}/resources/writer/css/animate.css">
<!-- jquery-ui.min css -->
<link rel="stylesheet"
	href="${path}/resources/writer/css/jquery-ui.min.css">
<!-- meanmenu css -->
<link rel="stylesheet"
	href="${path}/resources/writer/css/meanmenu.min.css">
<!-- Font-Awesome css -->
<link rel="stylesheet"
	href="${path}/resources/writer/css/font-awesome.min.css">
<!-- pe-icon-7-stroke css -->
<link rel="stylesheet"
	href="${path}/resources/writer/css/pe-icon-7-stroke.css">
<!-- Flaticon css -->
<link rel="stylesheet" href="${path}/resources/writer/css/flaticon.css">
<!-- venobox css -->
<link rel="stylesheet"
	href="${path}/resources/writer/venobox/venobox.css" type="text/css"
	media="screen" />
<!-- nivo slider css -->
<link rel="stylesheet"
	href="${path}/resources/writer/lib/css/nivo-slider.css" type="text/css" />
<link rel="stylesheet"
	href="${path}/resources/writer/lib/css/preview.css" type="text/css"
	media="screen" />
<!-- owl.carousel css -->
<link rel="stylesheet"
	href="${path}/resources/writer/css/owl.carousel.css">
<!-- style css -->
<link rel="stylesheet" href="${path}/resources/writer/style.css">
<!-- responsive css -->
<link rel="stylesheet"
	href="${path}/resources/writer/css/responsive.css">
<!-- modernizr css -->
<script src="${path}/resources/writer/js/vendor/modernizr-2.8.3.min.js"></script>
<style>
@font-face {
	font-family: 'Connoisseurs';
	src: url('${path}/resources/font/Connoisseurs.ttf')
}
</style>
<style>
.login-form {
	padding: 15px 15px 0 15px;
}

.string {
	color: #333;
}
</style>


<!--Header Area Start-->
<div class="header-area">
	<div class="container" style="font-size: 15px;">
		<div class="row">
			<div class="col-md-2 col-sm-6 col-xs-6">
				<div class="header-logo">
					<a href="${path}/"> <img
						src="${path}/resources/writer/img/logo/logo.png" alt="">
					</a>
				</div>
			</div>
			<div class="col-md-3 col-sm-6 visible-sm  col-xs-6">
				<div class="header-right"> 
					<ul>
						<li><a href="account.html"><i class="flaticon-people"></i></a>
						</li>
						<li class="shoping-cart"><a
							href="${path}/shop/cart/cartList.do"> <i
								class="flaticon-shop"></i> <span>2</span>
						</a>
							<div class="add-to-cart-product">
								<div class="cart-product">
									<div class="cart-product-image">
										<a href="resources/writer/single-product.html"> <img
											src="${path}/resources/writer/img/shop/1.jpg" alt="">
										</a>
									</div>
									<div class="cart-product-info">
										<p>
											<span>1</span> <a
												href="${path}/resources/writer/single-product.html">East
												of eden</a>
										</p>
										<a href="single-product.html">S, Orange</a> <span
											class="cart-price">$ 140.00</span>
									</div>
									<div class="cart-product-remove">
										<i class="fa fa-times"></i>
									</div>
								</div>
								<div class="cart-product">
									<div class="cart-product-image">
										<a href="resources/writer/single-product.html"> <img
											src="${path}/resources/writer/img/shop/1.jpg" alt="">
										</a>
									</div>
									<div class="cart-product-info">
										<p>
											<span>1</span> x <a
												href="${path}/resources/writer/single-product.html">East
												of eden</a>
										</p>
										<a href="single-product.html">S, Orange</a> <span
											class="cart-price">$ 140.00</span>
									</div>
									<div class="cart-product-remove">
										<i class="fa fa-times"></i>
									</div>
								</div>
								<div class="total-cart-price">
									<div class="cart-product-line fast-line">
										<span>Shipping</span> <span class="free-shiping">$10.50</span>
									</div>
									<div class="cart-product-line">
										<span>Total</span> <span class="total">$ 140.00</span>
									</div>
								</div>
								<div class="cart-checkout">
									<a href="resources/writer/checkout.html"> Check out <i
										class="fa fa-chevron-right"></i>
									</a>
								</div>
							</div></li>
					</ul>
				</div>
			</div>

			<div class="col-md-7 col-sm-12 hidden-xs">
				<div class="mainmenu text-center">
					<nav>


						<ul id="nav">
							<li><a href="${path}/">HOME</a></li>
							<li><a href="#">CATEGORY</a>
								<ul class="sub-menu">
									<li><a href="${path}/tmouse/list.do">MOUSE</a></li>
									<li><a href="${path}/keyboard/list.do">KEYBOARD</a></li>
								</ul> <c:choose>
									<c:when test="${empty sessionScope.id }">
										<li><a href="#">MYPAGE</a>
											<ul class="sub-menu">
												<li><a href="${path}/login/logout.do">로그아웃</a></li>
												<li><a
													href="${path}/member/mypage.do?id=${sessionScope.id}">마이페이지</a></li>
												<li><a href="${path}/order/orderList.do">주문내역</a></li>
												<li><a href="${path}/order/orderCancel.do">취소및교환</a></li>
												<li><a href="${path}/faq/list.do">1:1문의</a></li>
											</ul></li>
									</c:when>
									<c:when test="${ kind  eq 'business'}">
										<li><a href="#">BUSINESS</a>
											<ul class="sub-menu">
												<li><a
													href="${path}/business/mouseList.do?searchOption=id">마우스</a></li>
												<li><a
													href="${path}/business/keyboardList.do?searchOption=id">키보드</a></li>
												<li><a href="${path}/business/orderList.do">주문상품</a></li>
												<li><a href="${path}/login/logout.do">로그아웃</a></li>
											</ul></li>
									</c:when>
									<c:otherwise>
										<li><a href="#">MYPAGE</a>
											<ul class="sub-menu">
												<li><a href="${path}/login/logout.do">로그아웃</a></li>
												<li><a
													href="${path}/member/mypage.do?id=${sessionScope.id}">마이페이지</a></li>
												<li><a href="${path}/order/orderList.do">주문내역</a></li>
												<li><a href="${path}/order/orderCancel.do">취소및교환</a></li>
												<li><a href="${path}/faq/list.do">1:1문의</a></li>
											</ul></li>
									</c:otherwise>
								</c:choose>
							<li><a href="${path}/gallery/list.do">GALLERY</a></li>
							<li><a href="#">SERVICE CENTER</a>
								<ul class="sub-menu">

									<li><a href="${path}/community/list.do">공지사항</a></li>
									<li><a href="${path}/faq/list.do">FAQ</a></li>


								</ul>
					</nav>
				</div>
			</div>



			<div class="col-md-3 hidden-sm">
				<div class="header-right">
					<span class="login-light1">
					<c:if test="${sessionScope.id != null}">
								${sessionScope.id}
							</c:if>
					<c:if test="${sessionScope.id == null}">
								<a href="${path}/login/login.do"><i
								class="flaticon-people"></i></a>
							</c:if>
					</span>



				<c:if test="${sessionScope.id != null}">
				<ul>
						<li class="shoping-cart"><a
							href="${path}/shop/cart/cartList.do"> <i
								class="flaticon-shop"></i> <span>2</span>
						</a>
							<div class="add-to-cart-product">
								<div class="cart-product">
									<div class="cart-product-image">
										<a href="single-product.html"> <img
											src="resources/writer/img/shop/1.jpg" alt="">
										</a>
									</div>
									<div class="cart-product-info">
										<p>
											<span>1</span> x <a href="single-product.html">East of
												eden</a>
										</p>
										<a href="single-product.html">S, Orange</a> <span
											class="cart-price">$ 140.00</span>
									</div>
									<div class="cart-product-remove">
										<i class="fa fa-times"></i>
									</div>
								</div>
								<div class="cart-product">
									<div class="cart-product-image">
										<a href="resources/writer/single-product.html"> <img
											src="resources/writer/img/shop/1.jpg" alt="">
										</a>
									</div>
									<div class="cart-product-info">
										<p>
											<span>1</span> x <a href="single-product.html">East of
												eden</a>
										</p>
										<a href="single-product.html">S, Orange</a> <span
											class="cart-price">$ 140.00</span>
									</div>
									<div class="cart-product-remove">
										<i class="fa fa-times"></i>
									</div>
								</div>
								<div class="total-cart-price">
									<div class="cart-product-line fast-line">
										<span>Shipping</span> <span class="free-shiping">$10.50</span>
									</div>
									<div class="cart-product-line">
										<span>Total</span> <span class="total">$ 140.00</span>
									</div>
								</div>
								<div class="cart-checkout">
									<a href="checkout.html"> Check out <i
										class="fa fa-chevron-right"></i>
									</a>
								</div>
							</div></li></ul>
							</c:if>
						
							
							
							
				</div>
			</div>




























			<%-- 			<div class="col-md-3 hidden-sm">
				<div class="header-right">
					<ul>
						<li><a href="${path}/login/login.do"><i
								class="flaticon-people"></i></a>
						</li>
								
								
								
								
								
						<li class="shoping-cart"><a
							href="${path}/shop/cart/cartList.do"> <i
								class="flaticon-shop"></i> <span>2</span>
						</a>
							<div class="add-to-cart-product">
								<div class="cart-product">
									<div class="cart-product-image">
										<a href="single-product.html"> <img
											src="resources/writer/img/shop/1.jpg" alt="">
										</a>
									</div>
									<div class="cart-product-info">
										<p>
											<span>1</span> x <a href="single-product.html">East of
												eden</a>
										</p>
										<a href="single-product.html">S, Orange</a> <span
											class="cart-price">$ 140.00</span>
									</div>
									<div class="cart-product-remove">
										<i class="fa fa-times"></i>
									</div>
								</div>
								<div class="cart-product">
									<div class="cart-product-image">
										<a href="resources/writer/single-product.html"> <img
											src="resources/writer/img/shop/1.jpg" alt="">
										</a>
									</div>
									<div class="cart-product-info">
										<p>
											<span>1</span> x <a href="single-product.html">East of
												eden</a>
										</p>
										<a href="single-product.html">S, Orange</a> <span
											class="cart-price">$ 140.00</span>
									</div>
									<div class="cart-product-remove">
										<i class="fa fa-times"></i>
									</div>
								</div>
								<div class="total-cart-price">
									<div class="cart-product-line fast-line">
										<span>Shipping</span> <span class="free-shiping">$10.50</span>
									</div>
									<div class="cart-product-line">
										<span>Total</span> <span class="total">$ 140.00</span>
									</div>
								</div>
								<div class="cart-checkout">
									<a href="checkout.html"> Check out <i
										class="fa fa-chevron-right"></i>
									</a>
								</div>
							</div></li>
					</ul>
				</div>
			</div> --%>
		</div>
	</div>
</div>
<!--Header Area End-->