<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Home</title>
<%@ include file="/resources/include/header.jsp"%>
<link rel="stylesheet" type="text/css" href="${path}/resources/index/css/demo.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/index/css/style.css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>

<script>
$(document).ready(function(){
	
	$('#ei-slider').eislideshow({
		easing		: 'easeOutExpo',
		titleeasing	: 'easeOutExpo',
		titlespeed	: 1200
    });
	
	$('#close').click(function(){
		$(this).parent().toggleClass('closed');
	    $(this).prev().focus();
	});
	
	setTimeout(function() {
	    $('#close').click();
	}, 100);
	
});
</script>

<body>
<!-- Shop Area Start -->
        <div class="shopping-area section-padding" style="padding: 0;">
            <div class="container" style="padding: 0;margin-left: 12%;margin-right: 10%">
                <div class="row">
                    <div class="col-md-2 col-sm-3 col-xs-12" style="padding: 0;">
                        <div class="shop-widget">
                            <div class="shop-widget-top" style="padding-bottom: 0;">
                                <aside class="widget widget-categories">
                                    <h2 class="sidebar-title text-center">바로가기</h2>
                                    <ul class="sidebar-menu" style="font-size: 16px;">
                                    	<li>
                                            <a href="${path}/community/list.do">
                                              <i class="fa fa-angle-double-right"></i>
                                                	공지사항	
                                            </a>
                                        </li>
                                        <li>
                                            <a href="${path}/tmouse/list.do">
                                               <i class="fa fa-angle-double-right"></i>
                                                	마우스 
                                            </a>
                                        </li>
                                        <li>
                                            <a href="${path}/keyboard/list.do">
                                               <i class="fa fa-angle-double-right"></i>
                                                	키보드
                                            </a>
                                        </li>
                                        <li>
                                            <a href="${path}/login/login.do">
                                               <i class="fa fa-angle-double-right"></i>
                                              	  	로그인
                                            </a>
                                        </li>
                                        <li>
                                            <a href="${path}/gallery/list.do">
                                               <i class="fa fa-angle-double-right"></i>
                                                	갤러리
                                            </a>
                                        </li>
                                        
                                        <li>
                                             
                                        </li>
                                    </ul>
                                </aside>                   
                            </div>
                        </div>
                    </div>
                    <div class="col-md-9 col-sm-9 col-xs-12" style="padding: 0;">
                       <!-- slider Area Start -->
         <div class="container" style="padding: 0;">
			<div class="wrapper">
                <div id="ei-slider" class="ei-slider">
                    <ul class="ei-slider-large">
                        <li>
                            <img src="${path}/resources/index/170216-1.jpg" alt="image01" />
                            <div class="ei-title">
                                <h2>Comfortable</h2>
                                <h3>PressFit</h3>
                            </div>
                        </li>
                        <li>
                            <img src="${path}/resources/index/image (1).jpg" alt="image02" />
                            <div class="ei-title">
                                <h2>Unique</h2>
                                <h3>PressFit</h3>
                            </div>
                        </li>
                        <li>
                            <img src="${path}/resources/index/2629_HDR_1470936539328.jpg" alt="image03"/>
                            <div class="ei-title">
                                <h2>Creative</h2>
                                <h3>PressFit</h3>
                            </div>
                        </li>
                        <li>
                            <img src="${path}/resources/index/76924f7230d.jpg" alt="image04"/>
                            <div class="ei-title">
                                <h2>Special</h2>
                                <h3>PressFit</h3>
                            </div>
                        </li>
                    </ul><!-- ei-slider-large -->
                    <ul class="ei-slider-thumbs">
                        <li class="ei-slider-element">Current</li>
                        <li><a href="#">Slide 1</a><img src="${path}/resources/index/170216-1.jpg" alt="thumb01" /></li>
                        <li><a href="#">Slide 1</a><img src="${path}/resources/index/image (1).jpg" alt="thumb02" /></li>
                        <li><a href="#">Slide 3</a><img src="${path}/resources/index/2629_HDR_1470936539328.jpg" alt="thumb03" /></li>
                        <li><a href="#">Slide 4</a><img src="${path}/resources/index/76924f7230d.jpg" alt="thumb04" /></li>
                    </ul><!-- ei-slider-thumbs -->
                </div><!-- ei-slider -->
            </div><!-- wrapper -->
            <div>
            </div>
        </div>
		<!-- slider Area End-->
                    </div>
                </div>
            </div><hr>
        </div>
        <!-- Shop Area End -->
<!-- Online Banner Area Start -->    
		<div class="online-banner-area">
		        <div class="row">
		            <div class="banner-list">
		                <div class="col-md-2"  ></div>
		                <div class="col-md-4" >
		                    <div class="single-banner" >
		                        <a href="${path}/tmouse/view.do?idx=10&curPage=1&searchOption=gamingmouse&keyword=">
		                            <img src="${path}/resources/upload//2017/04/11/4436952_1.jpg" alt="">
		                        </a>
		                        <div class="banner-bottom text-center" style="height: 17%;">
		                            <a href="${path}/tmouse/view.do?idx=10&curPage=1&searchOption=gamingmouse&keyword=" style="font-size: 20px;">
		                            RIZUM G-FACTOR Z8 Pro Gaming Optical Mouse (블랙) <br/>30850원</a>
		                        </div>
		                    </div>
		                </div>
		                <div class="col-md-2"  >
		                    <div class="single-banner" >
		                        <a href="${path}/keyboard/view.do?idx=3&curPage=1&searchOption=title&keyword=">
		                            <img src="${path}/resources/upload//2017/04/11/4169366_1.jpg" alt="">
		                        </a>
		                        <div class="banner-bottom text-center" style="height: 8%;">
		                            <a href="${path}/keyboard/view.do?idx=3&curPage=1&searchOption=title&keyword=" style="font-size: 12px;">
		                            MAXTILL TRON G60 RGB ILLUMINATION <br/>18800원</a>
		                        </div>
		                    </div>
		                    <div class="single-banner" >
		                        <a href="${path}/tmouse/view.do?idx=7&curPage=1&searchOption=gamingmouse&keyword=">
		                            <img src="${path}/resources/upload//2017/04/11/2810216_1.jpg" alt="">
		                        </a>
		                        <div class="banner-bottom text-center" style="height: 8%;">
		                            <a href="${path}/tmouse/view.do?idx=7&curPage=1&searchOption=gamingmouse&keyword=" style="font-size: 12px;">
		                            ABKO HACKER K610 레인보우 액션 LED (블랙, 청축) <br/>44000원</a>
		                        </div>
		                    </div>
		                </div>
		                <div class="col-md-2"  >
		                    <div class="single-banner" >
		                        <a href="${path}/keyboard/view.do?idx=3&curPage=1&searchOption=title&keyword=">
		                            <img src="${path}/resources/upload//2017/04/11/4169366_1.jpg" alt="">
		                        </a>
		                        <div class="banner-bottom text-center" style="height: 8%;">
		                            <a href="${path}/keyboard/view.do?idx=3&curPage=1&searchOption=title&keyword=" style="font-size: 12px;">
		                            ABKO HACKER K610 레인보우 액션 LED (블랙, 청축) <br/>44000원</a>
		                        </div>
		                    </div>
		                    <div class="single-banner" >
		                        <a href="${path}/keyboard/view.do?idx=7&curPage=1&searchOption=title&keyword=">
		                            <img src="${path}/resources/upload//2017/04/11/4051242_1.jpg" alt="">
		                        </a>
		                        <div class="banner-bottom text-center" style="height: 8%;">
		                            <a href="${path}/keyboard/view.do?idx=7&curPage=1&searchOption=title&keyword=" style="font-size: 12px;">
		                            	제닉스 STORMX TITAN MARK X (청축) <br/>74900원</a>
		                        </div>
		                    </div>
		                </div>
		            </div>
		        </div>
		        <div class="row">
		       		<div class="col-md-2"></div>
		       		<div class="col-md-2" >
		               <div class="single-banner" >
		                  <a href="${path}/tmouse/view.do?idx=63&curPage=1&searchOption=wristtunnelsyndrome&keyword=">
		                  <img src="${path}/resources/upload//2017/04/11/3523497_1.jpg" alt="">
		                  </a>
		                  <div class="banner-bottom text-center" style="height: 10%;">
		                     <a href="${path}/tmouse/view.do?idx=63&curPage=1&searchOption=wristtunnelsyndrome&keyword=" style="font-size: 12px;">
		                    	 디비닷컴 Clicker CKW2 [휴]休2 인체공학 버티컬 무선마우스<br/>30050원</a>
		                  </div>
		               </div>
		           </div>
		           <div class="col-md-2" >
		               <div class="single-banner" >
		                  <a href="${path}/keyboard/view.do?idx=62&curPage=1&searchOption=keyboardform&keyword=">
		                  <img src="${path}/resources/upload//2017/04/11/3427959_1.jpg" alt="">
		                  </a>
		                  <div class="banner-bottom text-center" style="height: 10%;">
		                      <a href="${path}/keyboard/view.do?idx=62&curPage=1&searchOption=keyboardform&keyword=" style="font-size: 12px;">
		                      	로지텍 K380 블루투스 키보드 (정품)<br/>29900원</a>
		                  </div>
		               </div>
		           </div>
		           <div class="col-md-2" >
		               <div class="single-banner" >
		                  <a href="${path}/tmouse/view.do?idx=4&curPage=1&searchOption=title&keyword=">
		                  <img src="${path}/resources/upload//2017/04/11/2077778_1.jpg" alt="">
		                  </a>
		                  <div class="banner-bottom text-center" style="height: 10%;">
		                      <a href="${path}/tmouse/view.do?idx=4&curPage=1&searchOption=title&keyword=" style="font-size: 12px;">
		                      로지텍 G100s 게이밍 마우스 (벌크)<br/>12820원</a>
		                  </div>
		               </div>
		           </div>
		           <div class="col-md-2" >
		               <div class="single-banner" >
		                  <a href="${path}/keyboard/view.do?idx=61&curPage=1&searchOption=keyboardform&keyword=">
		                  <img src="${path}/resources/upload//2017/04/11/2800393_1.jpg" alt="">
		                  </a>
		                  <div class="banner-bottom text-center" style="height: 10%;">
		                      <a href="${path}/keyboard/view.do?idx=61&curPage=1&searchOption=keyboardform&keyword=" style="font-size: 12px;">
		                      	로지텍 블루투스 멀티 디바이스 키보드 K480 (블랙, 정품) <br/>34570원</a>
		                  </div>
		               </div>
		           </div>
		        </div>
		    </div>
		<!-- Online Banner Area End -->   
	
<!-- Blog Area Start -->
		<div class="blog-area section-padding" style="padding: 0">
            <h2 class="section-title">LATEST BLOG</h2>
            <p>The Latest Blog post for the biggest Blog for the books Library.</p>
		    <div class="container">
		        <div class="row">
		            <div class="blog-list indicator-style">
		                <div class="col-md-3">
		                    <div class="single-blog">
		                        <a href="single-#">
		                            <img src="img/blog/1.jpg" alt="">
		                        </a>
		                        <div class="blog-info text-center">
		                            <a href="#"><h2>Modern Book Reviews</h2></a>
		                            <div class="blog-info-bottom">
		                                <span class="blog-author">BY: <a href="#">LATEST BLOG</a></span>
		                                <span class="blog-date">19TH JAN 2016</span>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		                <div class="col-md-3">
		                    <div class="single-blog">
		                        <a href="single-#">
		                            <img src="img/blog/2.jpg" alt="">
		                        </a>
		                        <div class="blog-info text-center">
		                            <a href="#"><h2>Modern Book Reviews</h2></a>
		                            <div class="blog-info-bottom">
		                                <span class="blog-author">BY: <a href="#">ZARIF SUNI</a></span>
		                                <span class="blog-date">19TH JAN 2016</span>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		                <div class="col-md-3">
		                    <div class="single-blog">
		                        <a href="single-#">
		                            <img src="img/blog/3.jpg" alt="">
		                        </a>
		                        <div class="blog-info text-center">
		                            <a href="#"><h2>Modern Book Reviews</h2></a>
		                            <div class="blog-info-bottom">
		                                <span class="blog-author">BY: <a href="#">ZARIF SUNI</a></span>
		                                <span class="blog-date">19TH JAN 2016</span>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		                <div class="col-md-3">
		                    <div class="single-blog">
		                        <a href="single-#">
		                            <img src="img/blog/4.jpg" alt="">
		                        </a>
		                        <div class="blog-info text-center">
		                            <a href="#"><h2>Modern Book Reviews</h2></a>
		                            <div class="blog-info-bottom">
		                                <span class="blog-author">BY: <a href="#">ZARIF SUNI</a></span>
		                                <span class="blog-date">19TH JAN 2016</span>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		                <div class="col-md-3">
		                    <div class="single-blog">
		                        <a href="single-#">
		                            <img src="img/blog/1.jpg" alt="">
		                        </a>
		                        <div class="blog-info text-center">
		                            <a href="#"><h2>Modern Book Reviews</h2></a>
		                            <div class="blog-info-bottom">
		                                <span class="blog-author">BY: <a href="#">ZARIF SUNI</a></span>
		                                <span class="blog-date">19TH JAN 2016</span>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		                <div class="col-md-3">
		                    <div class="single-blog">
		                        <a href="single-#">
		                            <img src="img/blog/2.jpg" alt="">
		                        </a>
		                        <div class="blog-info text-center">
		                            <a href="#"><h2>Modern Book Reviews</h2></a>
		                            <div class="blog-info-bottom">
		                                <span class="blog-author">BY: <a href="#">ZARIF SUNI</a></span>
		                                <span class="blog-date">19TH JAN 2016</span>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
		<!-- Blog Area End -->
		<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
	       <div class="single-banner">
	       <a href="${path}/keyboard/list.do">
	        	<img src="${path}/resources/index/ad2_LW_Gaming_109890_170329.jpg" alt="" style="width: 100%">
		    </a>
	 		</div>
		</div>
	</div>
		<!-- Address Information Area Start -->
	<div class="address-info-area section-padding">
		<div class="container">
			<div class="row">
				<div class="col-md-4 hidden-sm">
					<div class="address-single">
						<div class="all-adress-info">
							<div class="icon">
								<span><i class="fa fa-user-plus"></i></span>
							</div>
							<div class="info">
								<h3>PHONE</h3>
								<p>010-7106-5135</p>
								<p>010-9927-8895</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4 col-sm-6" onclick="panTo()">
					<div class="address-single">
						<div class="all-adress-info">
							<div class="icon">
								<span><i class="fa fa-map-marker"></i></span>
							</div>
							<div class="info" >
								<h3>ADDRESS</h3>
								<p>서울 서초구 서초대로</p>
								<p>74길 33 비트빌3층</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4 col-sm-6" onclick="location.href='${path}'";>
					<div class="address-single no-margin">
						<div class="all-adress-info">
							<div class="icon">
								<i class="fa fa-envelope"></i>
							</div>
							<div class="info">
								<h3>E-MAIL</h3>
								<p>pressfit@gpressfit.com</p>
								<p>http://localhost:8080/pressfit</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Address Information Area End -->
	<!-- Map Area Start -->
	<div class="map-area">
		<div id="map" style="width: 100%; height: 445px;"></div>
		
		<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=cb3e3b4c8ce2e2d998fa2b1534a6b543"></script>
		<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new daum.maps.LatLng(37.4946571, 127.0276173), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
	
			var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			
			// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
			var mapTypeControl = new daum.maps.MapTypeControl();

			// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
			// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
			map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);
			
			// 지도 확대축소 막기
			map.setZoomable(false);
			// 지도 이동 막기
			map.setDraggable(false); 
			
			// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
			var zoomControl = new daum.maps.ZoomControl();
			map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
			
			function panTo() {
			    // 이동할 위도 경도 위치를 생성합니다 
			    var moveLatLon = new daum.maps.LatLng(37.4946571, 127.0276173);
			    
			    // 지도 중심을 부드럽게 이동시킵니다
			    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
			    map.panTo(moveLatLon);            
			} 
			
			// 마커가 표시될 위치입니다 
			var markerPosition  = new daum.maps.LatLng(37.4946571, 127.0276173); 

			// 마커를 생성합니다
			var marker = new daum.maps.Marker({
			    position: markerPosition
			});

			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);

			// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
			// marker.setMap(null);
			
			
		</script>
	</div>
	<!-- Map Area End -->

<%@ include file="/resources/include/footer.jsp"%>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
<script type="text/javascript" src="${path}/resources/index/js/jquery.eislideshow.js"></script>
<script type="text/javascript" src="${path}/resources/index/js/jquery.easing.1.3.js"></script>
</body>
</html>


