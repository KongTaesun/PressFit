<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Recommendation</title>
<%@ include file="/resources/include/header.jsp"%>
<style>
.breadcrumbs-area {
 background-image: url('${path}/resources/writer/img/bigpicture/recomain_img.jpg');
}

 .textcontainer {
  padding: 40px 0;
  text-align: center;
}
 .particletext {
  text-align: center;
  font-size: 48px;
  position: relative;
}
 .particletext.bubbles > .particle {
  opacity: 0;
  position: absolute;
  background-color: rgba(33, 150, 243, 0.5);
  -webkit-animation: bubbles 3s ease-in infinite;
          animation: bubbles 3s ease-in infinite;
  border-radius: 100%;
}
 .particletext.hearts > .particle {
  opacity: 0;
  position: absolute;
  background-color: #cc2a5d;
  -webkit-animation: hearts 3s ease-in infinite;
          animation: hearts 3s ease-in infinite;
}
 .particletext.hearts > .particle:before,  .particletext.hearts > .particle:after {
  position: absolute;
  content: '';
  border-radius: 100px;
  top: 0px;
  left: 0px;
  width: 100%;
  height: 100%;
  background-color: #cc2a5d;
}
 .particletext.hearts > .particle:before {
  -webkit-transform: translateX(-50%);
          transform: translateX(-50%);
}
 .particletext.hearts > .particle:after {
  -webkit-transform: translateY(-50%);
          transform: translateY(-50%);
}
 .particletext.lines > .particle {
  position: absolute;
  background-color: rgba(244, 67, 54, 0.5);
  -webkit-animation: lines 3s linear infinite;
          animation: lines 3s linear infinite;
}
 .particletext.confetti > .particle {
  opacity: 0;
  position: absolute;
  -webkit-animation: confetti 3s ease-in infinite;
          animation: confetti 3s ease-in infinite;
}
 .particletext.confetti > .particle.c1 {
  background-color: rgba(76, 175, 80, 0.5);
}
 .particletext.confetti > .particle.c2 {
  background-color: rgba(156, 39, 176, 0.5);
}
 .particletext.fire > .particle {
  position: absolute;
  background-color: rgba(255, 193, 7, 0.5);
  border-radius: 40px;
  border-top-right-radius: 0px;
  -webkit-animation: fires 0.8s linear infinite;
          animation: fires 0.8s linear infinite;
  -webkit-transform: rotate(-45deg);
          transform: rotate(-45deg);
  opacity: 0;
}
 .particletext.fire > .particle:before {
  position: absolute;
  content: '';
  top: 60%;
  left: 40%;
  -webkit-transform: translate(-50%, -50%);
          transform: translate(-50%, -50%);
  width: 50%;
  height: 50%;
  border-radius: 40px;
  border-top-right-radius: 0px;
  background-color: rgba(251, 140, 0, 0.5);
}
 .particletext.sunbeams > .particle {
  position: absolute;
  background-color: rgba(253, 216, 53, 0.5);
  -webkit-animation: sunbeams 3s linear infinite;
          animation: sunbeams 3s linear infinite;
}

@-webkit-keyframes bubbles {
  0% {
    opacity: 0;
  }
  20% {
    opacity: 1;
    -webkit-transform: translate(0, -20%);
            transform: translate(0, -20%);
  }
  100% {
    opacity: 0;
    -webkit-transform: translate(0, -1000%);
            transform: translate(0, -1000%);
  }
}

@keyframes bubbles {
  0% {
    opacity: 0;
  }
  20% {
    opacity: 1;
    -webkit-transform: translate(0, -20%);
            transform: translate(0, -20%);
  }
  100% {
    opacity: 0;
    -webkit-transform: translate(0, -1000%);
            transform: translate(0, -1000%);
  }
}
@-webkit-keyframes hearts {
  0% {
    opacity: 0;
    -webkit-transform: translate(0, 0%) rotate(45deg);
            transform: translate(0, 0%) rotate(45deg);
  }
  20% {
    opacity: 0.8;
    -webkit-transform: translate(0, -20%) rotate(45deg);
            transform: translate(0, -20%) rotate(45deg);
  }
  100% {
    opacity: 0;
    -webkit-transform: translate(0, -1000%) rotate(45deg);
            transform: translate(0, -1000%) rotate(45deg);
  }
}
@keyframes hearts {
  0% {
    opacity: 0;
    -webkit-transform: translate(0, 0%) rotate(45deg);
            transform: translate(0, 0%) rotate(45deg);
  }
  20% {
    opacity: 0.8;
    -webkit-transform: translate(0, -20%) rotate(45deg);
            transform: translate(0, -20%) rotate(45deg);
  }
  100% {
    opacity: 0;
    -webkit-transform: translate(0, -1000%) rotate(45deg);
            transform: translate(0, -1000%) rotate(45deg);
  }
}
@-webkit-keyframes lines {
  0%, 50%, 100% {
    -webkit-transform: translateY(0%);
            transform: translateY(0%);
  }
  25% {
    -webkit-transform: translateY(100%);
            transform: translateY(100%);
  }
  75% {
    -webkit-transform: translateY(-100%);
            transform: translateY(-100%);
  }
}
@keyframes lines {
  0%, 50%, 100% {
    -webkit-transform: translateY(0%);
            transform: translateY(0%);
  }
  25% {
    -webkit-transform: translateY(100%);
            transform: translateY(100%);
  }
  75% {
    -webkit-transform: translateY(-100%);
            transform: translateY(-100%);
  }
}
@-webkit-keyframes confetti {
  0% {
    opacity: 0;
    -webkit-transform: translateY(0%) rotate(0deg);
            transform: translateY(0%) rotate(0deg);
  }
  10% {
    opacity: 1;
  }
  35% {
    -webkit-transform: translateY(-800%) rotate(270deg);
            transform: translateY(-800%) rotate(270deg);
  }
  80% {
    opacity: 1;
  }
  100% {
    opacity: 0;
    -webkit-transform: translateY(2000%) rotate(1440deg);
            transform: translateY(2000%) rotate(1440deg);
  }
}
@keyframes confetti {
  0% {
    opacity: 0;
    -webkit-transform: translateY(0%) rotate(0deg);
            transform: translateY(0%) rotate(0deg);
  }
  10% {
    opacity: 1;
  }
  35% {
    -webkit-transform: translateY(-800%) rotate(270deg);
            transform: translateY(-800%) rotate(270deg);
  }
  80% {
    opacity: 1;
  }
  100% {
    opacity: 0;
    -webkit-transform: translateY(2000%) rotate(1440deg);
            transform: translateY(2000%) rotate(1440deg);
  }
}
@-webkit-keyframes fires {
  0% {
    -webkit-transform: rotate(-70deg) translateY(0%);
            transform: rotate(-70deg) translateY(0%);
  }
  25% {
    -webkit-transform: rotate(-20deg) translateY(-5%);
            transform: rotate(-20deg) translateY(-5%);
    opacity: 1;
  }
  50% {
    -webkit-transform: rotate(-70deg) translateY(-10%);
            transform: rotate(-70deg) translateY(-10%);
  }
  75% {
    -webkit-transform: rotate(-20deg) translateY(-20%);
            transform: rotate(-20deg) translateY(-20%);
  }
  100% {
    -webkit-transform: rotate(-70deg) translateY(-40%);
            transform: rotate(-70deg) translateY(-40%);
    opacity: 1;
  }
}
@keyframes fires {
  0% {
    -webkit-transform: rotate(-70deg) translateY(0%);
            transform: rotate(-70deg) translateY(0%);
  }
  25% {
    -webkit-transform: rotate(-20deg) translateY(-5%);
            transform: rotate(-20deg) translateY(-5%);
    opacity: 1;
  }
  50% {
    -webkit-transform: rotate(-70deg) translateY(-10%);
            transform: rotate(-70deg) translateY(-10%);
  }
  75% {
    -webkit-transform: rotate(-20deg) translateY(-20%);
            transform: rotate(-20deg) translateY(-20%);
  }
  100% {
    -webkit-transform: rotate(-70deg) translateY(-40%);
            transform: rotate(-70deg) translateY(-40%);
    opacity: 1;
  }
}
@-webkit-keyframes sunbeams {
  0% {
    -webkit-transform: translateY(40%) rotate(0deg);
            transform: translateY(40%) rotate(0deg);
  }
  50% {
    -webkit-transform: translateY(-40%) rotate(180deg);
            transform: translateY(-40%) rotate(180deg);
  }
  100% {
    -webkit-transform: translateY(40%) rotate(360deg);
            transform: translateY(40%) rotate(360deg);
  }
  0%,14%,17%,43%,53%,71%,80%,94%,100% {
    opacity: 0;
  }
  6%,15%,24%,28%,48%,55%,78%,82%,99% {
    opacity: 1;
  }
}
@keyframes sunbeams {
  0% {
    -webkit-transform: translateY(40%) rotate(0deg);
            transform: translateY(40%) rotate(0deg);
  }
  50% {
    -webkit-transform: translateY(-40%) rotate(180deg);
            transform: translateY(-40%) rotate(180deg);
  }
  100% {
    -webkit-transform: translateY(40%) rotate(360deg);
            transform: translateY(40%) rotate(360deg);
  }
  0%,14%,17%,43%,53%,71%,80%,94%,100% {
    opacity: 0;
  }
  6%,15%,24%,28%,48%,55%,78%,82%,99% {
    opacity: 1;
  }
}
</style>
<script>

function initparticles() {
   bubbles();
   lines();
   fire();
}
function bubbles() {
   $.each($(".particletext.bubbles"), function(){
      var bubblecount = ($(this).width()/50)*10;
      for(var i = 0; i <= bubblecount; i++) {
         var size = ($.rnd(40,80)/10);
         $(this).append('<span class="particle" style="top:' + $.rnd(20,80) + '%; left:' + $.rnd(0,95) + '%;width:' + size + 'px; height:' + size + 'px;animation-delay: ' + ($.rnd(0,30)/10) + 's;"></span>');
      }
   });
}

function lines() {
   $.each($(".particletext.lines"), function(){
      var linecount = ($(this).width()/50)*10;
      for(var i = 0; i <= linecount; i++) {
         $(this).append('<span class="particle" style="top:' + $.rnd(-30,30) + '%; left:' + $.rnd(-10,110) + '%;width:' + $.rnd(1,3) + 'px; height:' + $.rnd(20,80) + '%;animation-delay: -' + ($.rnd(0,30)/10) + 's;"></span>');
      }
   });
}

function fire() {
   $.each($(".particletext.fire"), function(){
      var firecount = ($(this).width()/50)*20;
      for(var i = 0; i <= firecount; i++) {
         var size = $.rnd(8,12);
         $(this).append('<span class="particle" style="top:' + $.rnd(40,70) + '%; left:' + $.rnd(-10,100) + '%;width:' + size + 'px; height:' + size + 'px;animation-delay: ' + ($.rnd(0,20)/10) + 's;"></span>');
      }
   });
}
$(document).ready(function() {
	jQuery.rnd = function(m,n) {
	      m = parseInt(m);
	      n = parseInt(n);
	      return Math.floor( Math.random() * (n - m + 1) ) + m;
	}
	initparticles();
	$('#close').click(function(){
		$(this).parent().toggleClass('closed');
	    $(this).prev().focus();
	});
	$('#q').keyup(function(e) {
	    if (e.keyCode == 13){
	    	if($('#q').val() != ''){
		    	document.searchgo.submit();
	    	}else{
	    		alert('검색어를 입력하라');
	    	}
	    }
	});
	setTimeout(function() {
	    $('#close').click();
	}, 100);
	setTimeout(function() {
	    $('#close').click();
	}, 1000);
	});
</script>
</head>
<body>	
	
	<!-- Breadcrumbs Area Start -->
	<div class="breadcrumbs-area">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="breadcrumbs">
					</div>
				</div>
			</div>
		</div>
	</div>
        <!-- About Us Area Start -->
		<div class="about-us-area section-padding">
		    <div class="container">
		    <div class="row">
            	<div class="col-md-2 col-sm-3 col-xs-6"></div>
		            <div class="col-md-2 col-sm-3 col-xs-6">
						<div class="single-counter wow" data-wow-duration="1.5s" data-wow-delay=".4s">
							<div class="counter-info" style="text-align: center;">
								<span class="fcount">
									<span class="counter">3725</span>
								</span>
								<h3>검색 누적</h3>								
							</div>
						</div>		                
		            </div>
		            <div class="col-md-2 col-sm-3 col-xs-6">
						<div class="single-counter wow" data-wow-duration="1.5s" data-wow-delay=".4s">
							<div class="counter-info" style="text-align: center;">
								<span class="fcount">
									<span class="counter">950</span>
								</span>
								<h3>오늘의 검색</h3>								
							</div>
						</div>		                
		            </div>
		            <div class="col-md-2 col-sm-3 col-xs-6">
						<div class="single-counter wow" data-wow-duration="1.5s" data-wow-delay=".4s">
							<div class="counter-info" style="text-align: center;">
								<span class="fcount">
									<span class="counter">60</span>%
								</span>
								<h3>분석후 구매율</h3>								
							</div>
						</div>		                
		            </div>
		            <div class="col-md-2 col-sm-3 col-xs-6">
						<div class="single-counter wow" data-wow-duration="1.5s" data-wow-delay=".4s">
							<div class="counter-info" style="text-align: center;">
								<span class="fcount">
									<span class="counter">2978</span>
								</span>
								<h3>분석 리뷰</h3>								
							</div>
						</div>		                
		            </div>
		        </div>
		    <div class="row">
			    <div class="col-md-12" style="text-align: center;">
				    <div class="textcontainer">
				    <hr>
					   <span class="particletext lines">RECOMMENDATION</span>
			    	<hr>
					</div>
			    	<div class="col-md-3"></div>
			    	<div id="wrap" class="col-md-6" style="padding: 25px">
						<div class="d5">
							<form class="d5s" method="get" action="${path}/search/answer.do" >
							  <input type="text" id="q" name="q" placeholder="뭘 찾으세요?? 추천해드려요~!">
							  <button type="submit"></button>
							</form>	
						</div>	
					</div>
			    </div>
		    </div>
                <div class="row">
                    <div class="about-top-inner">
                        <div class="col-md-6">
                            <div class="about-inner">
                                <div class="about-title">
	                                <div class="textcontainer">
									   <h2><span class="particletext fire">Done</span></h2>
									</div>
                                </div>
                                <div class="about-content">
                                    <p></p>
                                    <p></p>
                               </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="about-image">
                                <img src="${path}/resources/recommendation/recommendation.jpg" alt="">
                            </div>
                        </div>
                    </div>
                    <div class="about-bottom-inner">
                        <div class="col-md-6">
                            <div class="about-image">
                                <img src="${path}/resources/recommendation/reco1.jpg" alt="">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="about-inner">
                                <div class="about-title">
                                    <div class="textcontainer">
									   <h2><span class="particletext bubbles">Big</span></h2>
									</div>
                                </div>
                                <div class="about-content">
                                   	<p></p>
                                    <p></p>
                               </div>
                            </div>
                        </div>
                    </div>
                </div>
		    </div>
		</div>
		<!-- About Us Area End -->
		<!-- Our Team Area Start -->
		<div class="our-team-area">
		    <h2 class="section-title">대표 리뷰</h2>
		    <div class="container">
		        <div class="row">
		        <div class="team-list indicator-style">
		            <div class="col-md-3">
		                <div class="single-team-member">
		                    <a href="http://blog.naver.com/PostView.nhn?blogId=ph664lsm&logNo=220907983181&redirect=Dlog&widgetTypeCall=true">
		                        <img src="${path}/resources/recommendation/blog.jpg" alt="">
		                    </a>
		                    <div class="member-info">
		                        <a href="http://blog.naver.com/PostView.nhn?blogId=ph664lsm&logNo=220907983181&redirect=Dlog&widgetTypeCall=true">
		                        	제닉스 STORMX TITAN MARK II 게이밍 마우스</a>
		                        <p>[출처] 제닉스 STORMX TITAN MARK II 게이밍 마우스|작성자 Jbourne</p>
		                    </div>
		                </div>
		            </div>
		            <div class="col-md-3">
		                <div class="single-team-member">
		                    <a href="http://blog.naver.com/PostView.nhn?blogId=xenicsholic&logNo=220876223569&redirect=Dlog&widgetTypeCall=true">
		                        <img src="${path}/resources/recommendation/blog1.jpg" alt="">
		                    </a>
		                    <div class="member-info">
		                        <a href="http://blog.naver.com/PostView.nhn?blogId=xenicsholic&logNo=220876223569&redirect=Dlog&widgetTypeCall=true">
		                        	[피스커뮤] 마우스로까지 나올 줄 몰랐지?! 타이탄 마크 마우스! - [제닉스 STORMX TITAN MARK IV]</a>
		                        <p>[출처] [피스커뮤] 마우스로까지 나올 줄 몰랐지?! 타이탄 마크 마우스! - [제닉스 STORMX TITAN MARK IV]|작성자 제닉스홀릭</p>
		                    </div>
		                </div>
		            </div>
		            <div class="col-md-3">
		                <div class="single-team-member">
		                    <a href="http://blog.naver.com/PostView.nhn?blogId=gukppa&logNo=220367499772&redirect=Dlog&widgetTypeCall=true">
		                        <img src="${path}/resources/recommendation/blog2.jpg" alt="">
		                    </a>
		                    <div class="member-info">
		                        <a href="http://blog.naver.com/PostView.nhn?blogId=gukppa&logNo=220367499772&redirect=Dlog&widgetTypeCall=true">
		                        	[게이밍기어 추천] 괴물사냥 준비는 다들 하셨습니까?! </a>
		                        <p>[출처] [게이밍기어 추천] 괴물사냥 준비는 다들 하셨습니까?!|작성자 우주최강 (gukppa)</p>
		                    </div>
		                </div>
		            </div>
		            <div class="col-md-3">
		                <div class="single-team-member">
		                    <a href="http://blog.naver.com/PostView.nhn?blogId=minz23&logNo=220377360428&redirect=Dlog&widgetTypeCall=true">
		                        <img src="${path}/resources/recommendation/blog3.jpg" alt="">
		                    </a>
		                    <div class="member-info">
		                        <a href="http://blog.naver.com/PostView.nhn?blogId=minz23&logNo=220377360428&redirect=Dlog&widgetTypeCall=true">
		                        	[LED/게이밍키보드] G키보드 LED2 (IGK2-LE) </a>
		                        <p>[출처] [LED/게이밍키보드] G키보드 LED2 (IGK2-LE)|작성자 똥글땡이</p>
		                    </div>
		                </div>
		            </div>
		        </div>
		        </div>
		    </div>
		</div>
		<!-- Our Team Area End -->
<%@ include file="/resources/include/footer.jsp"%>
</body>
</html>


