<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jstl 시간 출력 태그 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- context 경로 -->
<c:set var="path" value="${pageContext.request.contextPath}"/>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<script>
    $(document).ready(function(){
    	 console.log(document.form1);
        $("#btnLogin").click(function(){
           alert("asdasd");
        	
            var id = $("#id").val();
            var pw = $("#pw").val();
            document.form1.action="loginCheck.do" 
            document.form1.submit();
        });
    });
    </script>
</head> 

   <!-- favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="resources/writer/img/favicon.ico">
        <!-- Place favicon.ico in the root directory -->
        <!-- Google Fonts -->
		<link href='https://fonts.googleapis.com/css?family=Poppins:400,700,600,500,300' rel='stylesheet' type='text/css'>

		<!-- all css here -->
		<!-- bootstrap v3.3.6 css --> 
        <link rel="stylesheet" href="${path}/resources/writer/css/bootstrap.min.css">
		<!-- animate css -->
        <link rel="stylesheet" href="${path}/resources/writer/css/animate.css"> 
		<!-- jquery-ui.min css --> 
        <link rel="stylesheet" href="${path}/resources/writer/css/jquery-ui.min.css">
		<!-- meanmenu css -->
        <link rel="stylesheet" href="${path}/resources/writer/css/meanmenu.min.css">
		<!-- Font-Awesome css -->
        <link rel="stylesheet" href="${path}/resources/writer/css/font-awesome.min.css">
		<!-- pe-icon-7-stroke css -->
        <link rel="stylesheet" href="${path}/resources/writer/css/pe-icon-7-stroke.css">
		<!-- Flaticon css -->
        <link rel="stylesheet" href="${path}/resources/writer/css/flaticon.css">
		<!-- venobox css -->
        <link rel="stylesheet" href="${path}/resources/writer/venobox/venobox.css" type="text/css" media="screen" />
		<!-- nivo slider css -->
		<link rel="stylesheet" href="${path}/resources/writer/lib/css/nivo-slider.css" type="text/css" />
		<link rel="stylesheet" href="${path}/resources/writer/lib/css/preview.css" type="text/css" media="screen" />
		<!-- owl.carousel css -->
        <link rel="stylesheet" href="${path}/resources/writer/css/owl.carousel.css">
		<!-- style css -->
		<link rel="stylesheet" href="${path}/resources/writer/style.css">
		<!-- responsive css -->
        <link rel="stylesheet" href="${path}/resources/writer/css/responsive.css">
		<!-- modernizr css -->
        <script src="${path}/resources/writer/js/vendor/modernizr-2.8.3.min.js"></script>
        <style>
        @font-face{font-family: 'Connoisseurs';src: url('${path}/resources/font/Connoisseurs.ttf')}
        </style>
          <style>
        .login-form{
        padding:15px 15px 0 15px;
        }
        .string{
        	color: #333;
        }
        </style>
        
         
  <!--Header Area Start-->
        <div class="header-area">
            <div class="container" style="font-size: 15px;">
                <div class="row">
                    <div class="col-md-2 col-sm-6 col-xs-6">
                        <div class="header-logo">
                            <a href="${path}/index.jsp">
                            	<img src="${path}/resources/writer/img/logo/logo.png" alt="">
                            </a> 
                        </div>
                    </div>
                    <div class="col-md-1 col-sm-6 visible-sm  col-xs-6">
                        <div class="header-right">
                            <ul>
                            <li class="dropdown">
    <a href="#"<%-- "${path}/login/login.do"  --%> data-toggle="dropdown"> <i class="flaticon-people"></i></a>  
                                <div class="dropdown-menu login-form">
								<form name="form1" method="post" accept-charset="UTF-8" action="${path}/login/loginCheck.do">
									<input type="text" name="id" id="id" placeholder="ID">
									<input type="password" name="pw" id="pw" placeholder="Password">
					<!-- 				<input type="checkbox" name="remember-me" id="remember-me" value="1">
									<label class="string optional" for="user_remember_me"> 기억하기</label>
					 -->				<input class="btn btn-primary btn-block" type="submit" id="btnLogin" value="로그인">
					<!-- 			        <button type="submit" class="btn btn-block"><i class="icon-google-plus"></i> 구글 로그인</button>
									<button type="submit" class="btn btn-block"><i class="icon-twitter"></i> 트위터 로그인</button> -->
								</form>
								</div> 

                                </li>
                                <li class="shoping-cart">
                                    <a href="${path}/shop/cart/cartList.do">   
                                        <i class="flaticon-shop"></i>
                                        <span>2</span>
                                    </a>
                                    <div class="add-to-cart-product">
                                        <div class="cart-product">
                                            <div class="cart-product-image">
                                                <a href="resources/writer/single-product.html">
                                                    <img src="${path}/resources/writer/img/shop/1.jpg" alt="">
                                                </a>
                                            </div>
                                            <div class="cart-product-info">
                                                <p>
                                                    <span>1</span>
                                                    x
                                                    <a href="${path}/resources/writer/single-product.html">East of eden</a>
                                                </p>
                                                <a href="single-product.html">S, Orange</a>
                                                <span class="cart-price">$ 140.00</span>
                                            </div>
                                            <div class="cart-product-remove"> 
                                                <i class="fa fa-times"></i>
                                            </div>
                                        </div>
                                        <div class="cart-product">
                                            <div class="cart-product-image">
                                                <a href="resources/writer/single-product.html">
                                                    <img src="${path}/resources/writer/img/shop/1.jpg" alt="">
                                                </a>
                                            </div>
                                            <div class="cart-product-info">
                                                <p>
                                                    <span>1</span>
                                                    x
                                                    <a href="${path}/resources/writer/single-product.html">East of eden</a>
                                                </p>
                                                <a href="single-product.html">S, Orange</a>
                                                <span class="cart-price">$ 140.00</span>
                                            </div>
                                            <div class="cart-product-remove">
                                                <i class="fa fa-times"></i>
                                            </div>
                                        </div>
                                        <div class="total-cart-price">
                                            <div class="cart-product-line fast-line">
                                                <span>Shipping</span>
                                                <span class="free-shiping">$10.50</span>
                                            </div>
                                            <div class="cart-product-line">
                                                <span>Total</span>
                                                <span class="total">$ 140.00</span>
                                            </div>
                                        </div> 
                                        <div class="cart-checkout">
                                            <a href="resources/writer/checkout.html">
                                                Check out
                                                <i class="fa fa-chevron-right"></i>
                                            </a>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>                    
                  
                    <div class="col-md-9 col-sm-12 hidden-xs">
                        <div class="mainmenu text-center">
					<nav>


						<ul id="nav">
							<li><a href="${path}/index.jsp">HOME</a></li>
							<li><a href="#">CATEGORY</a>
								<ul class="sub-menu">
									<li><a href="${path}/tmouse/list.do">MOUSE</a></li>
									<li><a href="${path}/keyboard/list.do">KEYBOARD</a></li>
								</ul> <c:choose>
									<c:when test="${empty sessionScope.id }">
										<li><a href="#">MYPAGE</a>
											<ul class="sub-menu">
												<li><a href="${path}/login/login.do">로그인</a></li>
												<li><a href="${path}/member/mypage.do?id=${id}">마이페이지</a></li> 
												<li><a href="${path}/order/orderList.do">주문내역</a></li> 
												<li><a href="about.html">취소및교환</a></li> 
												<li><a href="${path}/order/orderList.do">1:1문의</a></li> 
											</ul></li> 
									</c:when>
									<c:when test="${ kind  eq 'business'}">
										<li><a href="#">BUSINESS</a>
											<ul class="sub-menu">
											<li><a href="${path}/business/mouseList.do?searchOption=id">마우스</a></li>
											<li><a href="${path}/business/keyboardList.do?searchOption=id">키보드</a></li>
											<li><a href="${path}/business/orderList.do">주문상품</a></li>
											<li><a href="${path}/login/logout.do">로그아웃</a></li>
											</ul>
										</li>
									</c:when> 
									<c:otherwise>  
										<li><a href="#">MYPAGE</a> 
											<ul class="sub-menu">
												<li><a href="${path}/login/logout.do">로그아웃</a></li>
													<li><a href="${path}/member/mypage.do?id=${id}">마이페이지</a></li>
												<li><a href="${path}/order/orderList.do">주문내역</a></li>
												<li><a href="about.html">취소및교환</a></li>
												<li><a href="about.html">1:1문의</a></li>
											</ul></li>
									</c:otherwise>
								</c:choose>
							<li><a href="${path}/gallery/list.do">GALLERY</a></li>
							<li><a href="#">SERVICE CENTER</a>
								<ul class="sub-menu">

									<li><a href="${path}/community/list.do">공지사항</a></li>
									<li><a href="${path}/faq/list.do">FAQ</a></li>
									

								</ul>
							<li><a href="#">MYPAGE</a>
								<ul class="sub-menu">
									<li><a href="about.html">About Us</a></li>
									<li><a href="cart.html">Cart Page</a></li>
									<li><a href="checkout.html">Check Out</a></li>
									<li><a href="contact.html">Contact</a></li>
									<li><a href="login.html">Login</a></li>
									<li><a href="my-account.html">My Account</a></li>
									<li><a href="shop.html">Shopping Page</a></li>
									<li><a href="single-product.html">Single Shop Page</a></li>
									<li><a href="wishlist.html">Wishlist Page</a></li>
									<li><a href="404.html">404 Page</a></li>
									<li><a href="contact.html">CONTACT</a></li>
								</ul></li>
							<li><a href="#">BUSINESS</a>
								<ul class="sub-menu"> 
									<li><a href="${path}/business/mouseList.do?searchOption=id">마우스</a></li>
									<li><a href="${path}/business/keyboardList.do?searchOption=id">키보드</a></li>
									<li><a href="${path}/business/orderList.do">주문상품</a></li>
									<li><a href="${path}/login/logout.do">로그아웃</a></li>
									
								</ul></li>
						</ul>
					</nav>
				</div>                        
                    </div> 
                  
                  <%--   <c:if test="${not empty sessionScope.id }" >
						<span class="c_container" style="float:right;margin-right:10px;">
						
							[ ${sessionScope.id } 접속중 ]  <a href="${path}/${sessionScope.kind}/view.do?id=${sessionScope.id}">CONTACT</a>
							 <a href="${path}/${sessionScope.kind }/list.do">memberlist</a>
						</span>
	    			</c:if> --%>
	    			   
	    			   
	    			   
                    <div class="col-md-1 hidden-sm">  
                        <div class="header-right">
                            <ul>
                            <li class="dropdown">
                      <a href="#"<%-- "${path}/login/login.do"  --%>class="dropdown-toggle" data-toggle="dropdown"> <i class="flaticon-people"></i></a>  
                                <div class="dropdown-menu login-form">
								<form name="form1" method="post" accept-charset="UTF-8" action="${path}/login/loginCheck.do">
									<input type="text" name="id" id="id" placeholder="ID">
									<input type="password" name="pw" id="pw" placeholder="Password">
					<!-- 				<input type="checkbox" name="remember-me" id="remember-me" value="1">
									<label class="string optional" for="user_remember_me"> 기억하기</label>
					 -->				<input class="btn btn-primary btn-block" type="submit" id="btnLogin" value="로그인">
					<!-- 			        <button type="submit" class="btn btn-block"><i class="icon-google-plus"></i> 구글 로그인</button>
									<button type="submit" class="btn btn-block"><i class="icon-twitter"></i> 트위터 로그인</button> -->
								</form>
								</div>  
                                      
                                                               
                                </li>
                                <li class="shoping-cart">
                                   <a href="${path}/shop/cart/cartList.do">
                                        <i class="flaticon-shop"></i>
                                        <span>2</span>
                                    </a>
                                    <div class="add-to-cart-product">
                                        <div class="cart-product">
                                            <div class="cart-product-image">
                                                <a href="single-product.html">
                                                    <img src="resources/writer/img/shop/1.jpg" alt="">
                                                </a>
                                            </div>
                                            <div class="cart-product-info">
                                                <p>
                                                    <span>1</span>
                                                    x
                                                    <a href="single-product.html">East of eden</a>
                                                </p>
                                                <a href="single-product.html">S, Orange</a>
                                                <span class="cart-price">$ 140.00</span>
                                            </div>
                                            <div class="cart-product-remove">
                                                <i class="fa fa-times"></i>
                                            </div>
                                        </div>
                                        <div class="cart-product">
                                            <div class="cart-product-image">
                                                <a href="resources/writer/single-product.html">
                                                    <img src="resources/writer/img/shop/1.jpg" alt="">
                                                </a>
                                            </div>
                                            <div class="cart-product-info">
                                                <p>
                                                    <span>1</span>
                                                    x
                                                    <a href="single-product.html">East of eden</a>
                                                </p>
                                                <a href="single-product.html">S, Orange</a>
                                                <span class="cart-price">$ 140.00</span>
                                            </div>
                                            <div class="cart-product-remove">
                                                <i class="fa fa-times"></i>
                                            </div>
                                        </div>
                                        <div class="total-cart-price">
                                            <div class="cart-product-line fast-line">
                                                <span>Shipping</span>
                                                <span class="free-shiping">$10.50</span>
                                            </div>
                                            <div class="cart-product-line">
                                                <span>Total</span>
                                                <span class="total">$ 140.00</span>
                                            </div>
                                        </div>
                                        <div class="cart-checkout">
                                            <a href="checkout.html">
                                                Check out
                                                <i class="fa fa-chevron-right"></i>
                                            </a>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Header Area End-->