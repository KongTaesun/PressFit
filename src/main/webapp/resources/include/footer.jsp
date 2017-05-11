<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> -->
<link rel="stylesheet" type="text/css" href="${path}/resources/writer/KakaoFriends1.css">
<style>
/* .footer-top-area1 {
	background: #ffffff none repeat scroll 0 0;
	color: #d4d4d4;
	padding: 20px;
	border-top: 1px solid;
	border-bottom: 1px solid;
}

.footer-bottom1 .footer-bottom-left {
	padding: 5px;
}

.footer-bottom1 .footer-bottom-right {
	float: left;
	font-size: 10px;
	color: #000000;
	padding: 10px;
}

.footer-bottom1 {
	background: #ffffff none repeat scroll 0 0;
	color: #ffffff;
	line-height: 1;
	padding: 5px 0;
}

.footer-top-area1 {
	background: #ffffff none repeat scroll 0 0;
	color: #d4d4d4;
	border-top: 2px solid;
}

.footer-top-area1 .row .utilmenu {
	position: relative;
	width: 100%;
	height: 23px;
	padding: 5px 0 15px 0;
	font-size: 13px;
}

.footer-top-area1 .container .row .utilmenu li {
	position: relative;
	float: left;
	margin: 0;
	padding: 0 12px 0 8px;
	display: inline-block;
	vertical-align: middle;
}
.footer-top-area1 .row .utilmenu li.pressfitfriends {
padding: 0 12px 0 8px;
vertical-align: middle;
display: inline-block;
}
.footer-top-area1 .row .utilmenu li a {
	color: #666;
	letter-spacing: -0.9px;
}

ul li {
	list-style-type: none !important;
}

.footer-top-area1 .container .row .utilmenu .info:after {
	position: absolute;
	top: 0;
	right: 0;
	width: 1px;
	height: 14px;
	background: #d8d8d8;
	content: '';
}

a {
	text-decoration: none;
} */
</style>
</head>

<!-- favicon -->
<link rel="shortcut icon" type="image/x-icon"
	href="resources/writer/img/favicon.ico">
<!-- Place favicon.ico in the root directory -->
<!-- Google Fonts -->
<link
	href='https://fonts.googleapis.com/css?family=Poppins:400,700,600,500,300'
	rel='stylesheet' type='text/css'>


<!-- Footer Area Start -->
<footer>
<div id="kakaopay_layer" style="display: none"></div>

<!-- <div id="cEtc">

</div>
 -->
	<hr class="hide">
	<div id="kakaoFoot" role="contentinfo">
		<div class="inner_footer">
			<h2 class="screen_out">서비스 이용정보</h2>
			<div class="service_info">
				<a href="" class="link_service">회사소개</a> <span class="txt_bar">|</span>
				<a href="${path}/resources/agreement/provision.jsp" class="link_service">이용약관</a> 
					<span class="txt_bar">|</span> 
				<a href="${path}/resources/agreement/Directions.jsp" class="link_service">오시는길</a>  
					<span class="txt_bar">|</span> 
				<a href="${path}/resources/agreement/helprule_private.jsp"  class="link_service">개인정보 처리방침</a> 
					<span class="rw_show txt_bar">|</span>
				<a href="" class="link_service">PressFit 소셜 친구들</a> 
			</div>
			
			<strong class="tit_copy">PressFit</strong> <small
				class="copy_info"> <span class="txt_copy txt_corp">Copyright
					© <a href="#none" class="link_copy">PressFit Corp.</a>
			</span> <span class="txt_copy"> <span class="txt_info">프레스핏 컴퍼니
						사업자등록번호 : 211-87-00620</span> <span class="txt_info">통신판매업 신고번호 :
						 01-1968</span>
			</span> <span class="txt_copy"> <span class="txt_info">대표이사 :
						프레스핏</span> <span class="txt_info">주소 : 서울시 종로구 대학로 12길 31 자유빌딩 5층(03086) <span class="txt_cont"><a
							href="mailto:store@kakaofriends.com" class="link_mail">pressfit@pressfit.com</a></span>
				</span> <span class="txt_info">고객센터 : 02-111-1111 <span
						class="txt_cont">평일 10시 ~ 18시</span></span>
			</span>
			</small>
		</div>
	</div>
 
	<%-- 		    <div class="footer-top-area1">
		        <div class="container">
		            <div class="row">  
		            <div class="col-md-12">
		            	<ul class="utilmenu">
		            		<li class="bizinfo info">
		            			<a href="${path}/resources/agreement/.jsp">회사소개</a>
		            		</li>
							<li class="waytocome info">
		            			<a href="${path}/resources/agreement/Directions.jsp">오시는길</a>
		            		</li>
		            		<li class="agreement info">
		            			<a href="${path}/resources/agreement/provision.jsp">이용약관</a>
		            		</li>
		            		<li class="privacy info">
		            			<a href="${path}/resources/agreement/helprule_private.jsp">개인정보 처리방침</a>
		            		</li>
							<li class="pressfitfriends last">
							<div>
								<a href="${path}/resources/agreement/helprule_private.jsp">PressFit 소셜 친구들</a>
								</div>
		            		</li>
		            	</ul>

		            </div>
		        </div>
		    </div>
		 </div>
		    <div class="footer-bottom1">
		        <div class="container">
		            <div class="row">
		                <div class="col-md-12">
                            <div class="footer-bottom-left pull-left">
                            <a href="${path}/index.jsp">
                            	<img src="${path}/resources/writer/img/bigpicture/bottom_Logo.png">
                            </a>
                            </div>
                            <div class="footer-bottom-right">
			                    (주)PressFit 서울시 종로구 대학로 12길 31 자유빌딩 5층(03086) 대표 최은희  사업자 등록번호 211-87-00620 통신판매업신고 제 01-1968호<br/>
			                    고객상담 010 6238 5615 이메일 osd0126@pressfit.com
                            </div>
		                </div>
		            </div>
		        </div>
		    </div> --%>
</footer>
<!-- Footer Area End -->
<!-- all js here -->
<!-- jquery latest version -->
<script src="${path}/resources/writer/js/vendor/jquery-1.12.0.min.js"></script>
<!-- bootstrap js -->
<script src="${path}/resources/writer/js/bootstrap.min.js"></script>
<!-- owl.carousel js -->
<script src="${path}/resources/writer/js/owl.carousel.min.js"></script>
<!-- jquery-ui js -->
<script src="${path}/resources/writer/js/jquery-ui.min.js"></script>
<!-- jquery Counterup js -->
<script src="${path}/resources/writer/js/jquery.counterup.min.js"></script>
<script src="${path}/resources/writer/js/waypoints.min.js"></script>
<!-- jquery countdown js -->
<script src="${path}/resources/writer/js/jquery.countdown.min.js"></script>
<!-- jquery countdown js -->
<script type="text/javascript"
	src="${path}/resources/writer/venobox/venobox.min.js"></script>
<!-- jquery Meanmenu js -->
<script src="${path}/resources/writer/js/jquery.meanmenu.js"></script>
<!-- wow js -->
<script src="${path}/resources/writer/js/wow.min.js"></script>
<script>
			new WOW().init();
		</script>
<!-- scrollUp JS -->
<script src="${path}/resources/writer/js/jquery.scrollUp.min.js"></script>
<!-- plugins js -->
<script src="${path}/resources/writer/js/plugins.js"></script>
<!-- Nivo slider js -->
<script src="${path}/resources/writer/lib/js/jquery.nivo.slider.js"
	type="text/javascript"></script>
<script src="${path}/resources/writer/lib/home.js"
	type="text/javascript"></script>
<!-- main js -->
<script src="${path}/resources/writer/js/main.js"></script>

