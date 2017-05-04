<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Home</title>
<style>
.search-bar {
  -moz-transition: all 0.5s cubic-bezier(0.7, 0.03, 0.17, 0.97) 0.25s;
  -o-transition: all 0.5s cubic-bezier(0.7, 0.03, 0.17, 0.97) 0.25s;
  -webkit-transition: all 0.5s cubic-bezier(0.7, 0.03, 0.17, 0.97);
  -webkit-transition-delay: 0.25s;
  transition: all 0.5s cubic-bezier(0.7, 0.03, 0.17, 0.97) 0.25s;
  position: relative;
  width: 300px;
  height: 50px;
  margin: 0 auto;
}
.search-bar input {
  outline: none;
  box-shadow: none;
  height: 50px;
  line-height: 50px;
  width: 100%;
  padding: 0 1em;
  box-sizing: border-box;
  background: transparent;
  color: black;
  border: 4px solid black;
  border-radius: 50px;
}
.search-bar .toggle {
  -moz-transition: all 0.5s cubic-bezier(0.98, 0.02, 0.46, 0.99) 0.25s;
  -o-transition: all 0.5s cubic-bezier(0.98, 0.02, 0.46, 0.99) 0.25s;
  -webkit-transition: all 0.5s cubic-bezier(0.98, 0.02, 0.46, 0.99);
  -webkit-transition-delay: 0.25s;
  transition: all 0.5s cubic-bezier(0.98, 0.02, 0.46, 0.99) 0.25s;
  position: absolute;
  width: 50px;
  height: 50px;
  cursor: pointer;
  right: 0;
  top: 0;
  border-radius: 50px;
}
.search-bar .toggle .toggle:after, .search-bar .toggle .toggle:before {
  border-color: black;
}
.search-bar .toggle:after, .search-bar .toggle:before {
  -moz-transition: all 1s;
  -o-transition: all 1s;
  -webkit-transition: all 1s;
  transition: all 1s;
  content: '';
  display: block;
  position: absolute;
  right: 0;
  width: 0;
  height: 25px;
  border-left: 4px solid black;
  border-radius: 4px;
  top: 0;
}
.search-bar .toggle:before {
  -moz-animation: close-one-reverse 0.85s 1 normal cubic-bezier(1, 0.01, 0.46, 1.48);
  -webkit-animation: close-one-reverse 0.85s 1 normal cubic-bezier(1, 0.01, 0.46, 1.48);
  animation: close-one-reverse 0.85s 1 normal cubic-bezier(1, 0.01, 0.46, 1.48);
  -moz-transform: translate(-25px, 12.5px) rotate(45deg);
  -ms-transform: translate(-25px, 12.5px) rotate(45deg);
  -webkit-transform: translate(-25px, 12.5px) rotate(45deg);
  transform: translate(-25px, 12.5px) rotate(45deg);
}
.search-bar .toggle:after {
  -moz-animation: close-two-reverse 0.85s 1 normal cubic-bezier(1, 0.01, 0.46, 1.48);
  -webkit-animation: close-two-reverse 0.85s 1 normal cubic-bezier(1, 0.01, 0.46, 1.48);
  animation: close-two-reverse 0.85s 1 normal cubic-bezier(1, 0.01, 0.46, 1.48);
  -moz-transform: translate(-25px, 12.5px) rotate(-45deg);
  -ms-transform: translate(-25px, 12.5px) rotate(-45deg);
  -webkit-transform: translate(-25px, 12.5px) rotate(-45deg);
  transform: translate(-25px, 12.5px) rotate(-45deg);
}
.search-bar.closed {
  width: 50px;
}
.search-bar.closed input {
  color: black;
}
.search-bar.closed .toggle:before {
  -moz-animation: close-one 0.85s 1 normal cubic-bezier(1, 0.01, 0.46, 1.48);
  -webkit-animation: close-one 0.85s 1 normal cubic-bezier(1, 0.01, 0.46, 1.48);
  animation: close-one 0.85s 1 normal cubic-bezier(1, 0.01, 0.46, 1.48);
  height: 0px;
  -moz-transform: translate(-8px, 8px) rotate(45deg);
  -ms-transform: translate(-8px, 8px) rotate(45deg);
  -webkit-transform: translate(-8px, 8px) rotate(45deg);
  transform: translate(-8px, 8px) rotate(45deg);
}
.search-bar.closed .toggle:after {
  -moz-animation: close-two 0.85s 1 normal cubic-bezier(1, 0.01, 0.46, 1.48);
  -webkit-animation: close-two 0.85s 1 normal cubic-bezier(1, 0.01, 0.46, 1.48);
  animation: close-two 0.85s 1 normal cubic-bezier(1, 0.01, 0.46, 1.48);
  height: 25px;
  -moz-transform: translate(0, 37.5px) rotate(-45deg);
  -ms-transform: translate(0, 37.5px) rotate(-45deg);
  -webkit-transform: translate(0, 37.5px) rotate(-45deg);
  transform: translate(0, 37.5px) rotate(-45deg);
}

@-moz-keyframes close-one {
  0% {
    height: 25px;
    -moz-transform: translate(-25px, 12.5px) rotate(45deg);
    transform: translate(-25px, 12.5px) rotate(45deg);
  }
  10% {
    height: 25px;
    -moz-transform: translate(-25px, 12.5px) rotate(45deg);
    transform: translate(-25px, 12.5px) rotate(45deg);
  }
  60% {
    height: 0px;
    -moz-transform: translate(-8px, 8px) rotate(45deg);
    transform: translate(-8px, 8px) rotate(45deg);
  }
  100% {
    height: 0px;
    -moz-transform: translate(-8px, 8px) rotate(45deg);
    transform: translate(-8px, 8px) rotate(45deg);
  }
}
@-webkit-keyframes close-one {
  0% {
    height: 25px;
    -webkit-transform: translate(-25px, 12.5px) rotate(45deg);
    transform: translate(-25px, 12.5px) rotate(45deg);
  }
  10% {
    height: 25px;
    -webkit-transform: translate(-25px, 12.5px) rotate(45deg);
    transform: translate(-25px, 12.5px) rotate(45deg);
  }
  60% {
    height: 0px;
    -webkit-transform: translate(-8px, 8px) rotate(45deg);
    transform: translate(-8px, 8px) rotate(45deg);
  }
  100% {
    height: 0px;
    -webkit-transform: translate(-8px, 8px) rotate(45deg);
    transform: translate(-8px, 8px) rotate(45deg);
  }
}
@keyframes close-one {
  0% {
    height: 25px;
    -moz-transform: translate(-25px, 12.5px) rotate(45deg);
    -ms-transform: translate(-25px, 12.5px) rotate(45deg);
    -webkit-transform: translate(-25px, 12.5px) rotate(45deg);
    transform: translate(-25px, 12.5px) rotate(45deg);
  }
  10% {
    height: 25px;
    -moz-transform: translate(-25px, 12.5px) rotate(45deg);
    -ms-transform: translate(-25px, 12.5px) rotate(45deg);
    -webkit-transform: translate(-25px, 12.5px) rotate(45deg);
    transform: translate(-25px, 12.5px) rotate(45deg);
  }
  60% {
    height: 0px;
    -moz-transform: translate(-8px, 8px) rotate(45deg);
    -ms-transform: translate(-8px, 8px) rotate(45deg);
    -webkit-transform: translate(-8px, 8px) rotate(45deg);
    transform: translate(-8px, 8px) rotate(45deg);
  }
  100% {
    height: 0px;
    -moz-transform: translate(-8px, 8px) rotate(45deg);
    -ms-transform: translate(-8px, 8px) rotate(45deg);
    -webkit-transform: translate(-8px, 8px) rotate(45deg);
    transform: translate(-8px, 8px) rotate(45deg);
  }
}
@-moz-keyframes close-two {
  0% {
    height: 25px;
    -moz-transform: translate(-25px, 12.5px) rotate(-45deg);
    transform: translate(-25px, 12.5px) rotate(-45deg);
  }
  60% {
    height: 2px;
    -moz-transform: translate(-6px, 37.5px) rotate(-45deg);
    transform: translate(-6px, 37.5px) rotate(-45deg);
  }
  70% {
    height: 2px;
    -moz-transform: translate(-6px, 37.5px) rotate(-45deg);
    transform: translate(-6px, 37.5px) rotate(-45deg);
  }
  100% {
    height: 25px;
    -moz-transform: translate(0, 37.5px) rotate(-45deg);
    transform: translate(0, 37.5px) rotate(-45deg);
  }
}
@-webkit-keyframes close-two {
  0% {
    height: 25px;
    -webkit-transform: translate(-25px, 12.5px) rotate(-45deg);
    transform: translate(-25px, 12.5px) rotate(-45deg);
  }
  60% {
    height: 2px;
    -webkit-transform: translate(-6px, 37.5px) rotate(-45deg);
    transform: translate(-6px, 37.5px) rotate(-45deg);
  }
  70% {
    height: 2px;
    -webkit-transform: translate(-6px, 37.5px) rotate(-45deg);
    transform: translate(-6px, 37.5px) rotate(-45deg);
  }
  100% {
    height: 25px;
    -webkit-transform: translate(0, 37.5px) rotate(-45deg);
    transform: translate(0, 37.5px) rotate(-45deg);
  }
}
@keyframes close-two {
  0% {
    height: 25px;
    -moz-transform: translate(-25px, 12.5px) rotate(-45deg);
    -ms-transform: translate(-25px, 12.5px) rotate(-45deg);
    -webkit-transform: translate(-25px, 12.5px) rotate(-45deg);
    transform: translate(-25px, 12.5px) rotate(-45deg);
  }
  60% {
    height: 2px;
    -moz-transform: translate(-6px, 37.5px) rotate(-45deg);
    -ms-transform: translate(-6px, 37.5px) rotate(-45deg);
    -webkit-transform: translate(-6px, 37.5px) rotate(-45deg);
    transform: translate(-6px, 37.5px) rotate(-45deg);
  }
  70% {
    height: 2px;
    -moz-transform: translate(-6px, 37.5px) rotate(-45deg);
    -ms-transform: translate(-6px, 37.5px) rotate(-45deg);
    -webkit-transform: translate(-6px, 37.5px) rotate(-45deg);
    transform: translate(-6px, 37.5px) rotate(-45deg);
  }
  100% {
    height: 25px;
    -moz-transform: translate(0, 37.5px) rotate(-45deg);
    -ms-transform: translate(0, 37.5px) rotate(-45deg);
    -webkit-transform: translate(0, 37.5px) rotate(-45deg);
    transform: translate(0, 37.5px) rotate(-45deg);
  }
}
@-moz-keyframes close-one-reverse {
  0% {
    height: 0px;
    -moz-transform: translate(-8px, 8px) rotate(45deg);
    transform: translate(-8px, 8px) rotate(45deg);
  }
  40% {
    height: 0px;
    -moz-transform: translate(-8px, 8px) rotate(45deg);
    transform: translate(-8px, 8px) rotate(45deg);
  }
  80% {
    height: 25px;
    -moz-transform: translate(-25px, 12.5px) rotate(45deg);
    transform: translate(-25px, 12.5px) rotate(45deg);
  }
  100% {
    height: 25px;
    -moz-transform: translate(-25px, 12.5px) rotate(45deg);
    transform: translate(-25px, 12.5px) rotate(45deg);
  }
}
@-webkit-keyframes close-one-reverse {
  0% {
    height: 0px;
    -webkit-transform: translate(-8px, 8px) rotate(45deg);
    transform: translate(-8px, 8px) rotate(45deg);
  }
  40% {
    height: 0px;
    -webkit-transform: translate(-8px, 8px) rotate(45deg);
    transform: translate(-8px, 8px) rotate(45deg);
  }
  80% {
    height: 25px;
    -webkit-transform: translate(-25px, 12.5px) rotate(45deg);
    transform: translate(-25px, 12.5px) rotate(45deg);
  }
  100% {
    height: 25px;
    -webkit-transform: translate(-25px, 12.5px) rotate(45deg);
    transform: translate(-25px, 12.5px) rotate(45deg);
  }
}
@keyframes close-one-reverse {
  0% {
    height: 0px;
    -moz-transform: translate(-8px, 8px) rotate(45deg);
    -ms-transform: translate(-8px, 8px) rotate(45deg);
    -webkit-transform: translate(-8px, 8px) rotate(45deg);
    transform: translate(-8px, 8px) rotate(45deg);
  }
  40% {
    height: 0px;
    -moz-transform: translate(-8px, 8px) rotate(45deg);
    -ms-transform: translate(-8px, 8px) rotate(45deg);
    -webkit-transform: translate(-8px, 8px) rotate(45deg);
    transform: translate(-8px, 8px) rotate(45deg);
  }
  80% {
    height: 25px;
    -moz-transform: translate(-25px, 12.5px) rotate(45deg);
    -ms-transform: translate(-25px, 12.5px) rotate(45deg);
    -webkit-transform: translate(-25px, 12.5px) rotate(45deg);
    transform: translate(-25px, 12.5px) rotate(45deg);
  }
  100% {
    height: 25px;
    -moz-transform: translate(-25px, 12.5px) rotate(45deg);
    -ms-transform: translate(-25px, 12.5px) rotate(45deg);
    -webkit-transform: translate(-25px, 12.5px) rotate(45deg);
    transform: translate(-25px, 12.5px) rotate(45deg);
  }
}
@-moz-keyframes close-two-reverse {
  0% {
    height: 25px;
    -moz-transform: translate(0, 37.5px) rotate(-45deg);
    transform: translate(0, 37.5px) rotate(-45deg);
  }
  40% {
    height: 2px;
    -moz-transform: translate(-6px, 40.5px) rotate(-45deg);
    transform: translate(-6px, 40.5px) rotate(-45deg);
  }
  50% {
    height: 2px;
    -moz-transform: translate(-6px, 40.5px) rotate(-45deg);
    transform: translate(-6px, 40.5px) rotate(-45deg);
  }
  100% {
    height: 25px;
    -moz-transform: translate(-25px, 12.5px) rotate(-45deg);
    transform: translate(-25px, 12.5px) rotate(-45deg);
  }
}
@-webkit-keyframes close-two-reverse {
  0% {
    height: 25px;
    -webkit-transform: translate(0, 37.5px) rotate(-45deg);
    transform: translate(0, 37.5px) rotate(-45deg);
  }
  40% {
    height: 2px;
    -webkit-transform: translate(-6px, 40.5px) rotate(-45deg);
    transform: translate(-6px, 40.5px) rotate(-45deg);
  }
  50% {
    height: 2px;
    -webkit-transform: translate(-6px, 40.5px) rotate(-45deg);
    transform: translate(-6px, 40.5px) rotate(-45deg);
  }
  100% {
    height: 25px;
    -webkit-transform: translate(-25px, 12.5px) rotate(-45deg);
    transform: translate(-25px, 12.5px) rotate(-45deg);
  }
}
@keyframes close-two-reverse {
  0% {
    height: 25px;
    -moz-transform: translate(0, 37.5px) rotate(-45deg);
    -ms-transform: translate(0, 37.5px) rotate(-45deg);
    -webkit-transform: translate(0, 37.5px) rotate(-45deg);
    transform: translate(0, 37.5px) rotate(-45deg);
  }
  40% {
    height: 2px;
    -moz-transform: translate(-6px, 40.5px) rotate(-45deg);
    -ms-transform: translate(-6px, 40.5px) rotate(-45deg);
    -webkit-transform: translate(-6px, 40.5px) rotate(-45deg);
    transform: translate(-6px, 40.5px) rotate(-45deg);
  }
  50% {
    height: 2px;
    -moz-transform: translate(-6px, 40.5px) rotate(-45deg);
    -ms-transform: translate(-6px, 40.5px) rotate(-45deg);
    -webkit-transform: translate(-6px, 40.5px) rotate(-45deg);
    transform: translate(-6px, 40.5px) rotate(-45deg);
  }
  100% {
    height: 25px;
    -moz-transform: translate(-25px, 12.5px) rotate(-45deg);
    -ms-transform: translate(-25px, 12.5px) rotate(-45deg);
    -webkit-transform: translate(-25px, 12.5px) rotate(-45deg);
    transform: translate(-25px, 12.5px) rotate(-45deg);
  }
}
</style>
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
            <div class="container" style="padding: 0;margin-left: 10%;margin-right: 10%">
                <div class="row">
                    <div class="col-md-3 col-sm-3 col-xs-12" style="padding: 0;">
                        <div class="shop-widget">
                            <div class="shop-widget-top" style="padding-bottom: 0;">
                                <aside class="widget widget-categories">
                                    <h2 class="sidebar-title text-center">CATEGORY</h2>
                                    <ul class="sidebar-menu">
                                        <li>
                                            <a href="#">
                                               <i class="fa fa-angle-double-right"></i>
                                                LEARNING
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                               <i class="fa fa-angle-double-right"></i>
                                                LEARNING
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                               <i class="fa fa-angle-double-right"></i>
                                                LEARNING
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                               <i class="fa fa-angle-double-right"></i>
                                                LIGHTING
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                              <i class="fa fa-angle-double-right"></i>
                                               LIVING ROOMS
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                               <i class="fa fa-angle-double-right"></i>
                                                LAMP
                                            </a>
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
		        <div class="banner-title text-center" style="margin:0">
					<div id="search-bar" class="search-bar">
					    <input type="text" />
					    <div id="close" class="toggle"></div>
					</div>
		       	</div>
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
<!-- Blog Area Start -->
		<div class="blog-area section-padding">
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
<%@ include file="/resources/include/footer.jsp"%>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
<script type="text/javascript" src="${path}/resources/index/js/jquery.eislideshow.js"></script>
<script type="text/javascript" src="${path}/resources/index/js/jquery.easing.1.3.js"></script>
</body>
</html>


