<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 작성</title>
<%@ include file="/resources/include/header.jsp"%>
<script src="<c:url value='/resources/include/commons.js' />"></script>
<script>
$(document).ready(function() {
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

	});
</script>
<style>
p {
  margin-top: 3em;
}

.search-bar {
  -moz-transition: all 0.5s cubic-bezier(0.7, 0.03, 0.17, 0.97) 0.25s;
  -o-transition: all 0.5s cubic-bezier(0.7, 0.03, 0.17, 0.97) 0.25s;
  -webkit-transition: all 0.5s cubic-bezier(0.7, 0.03, 0.17, 0.97);
  -webkit-transition-delay: 0.25s;
  transition: all 0.5s cubic-bezier(0.7, 0.03, 0.17, 0.97) 0.25s;
  position: relative;
  width: 500px;
  height: 120px;
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
  color: white;
  border: 5px solid white;
  border-radius: 50px;
}
.search-bar .toggle {
  -moz-transition: all 0.5s cubic-bezier(0.98, 0.02, 0.46, 0.99) 0.25s;
  -o-transition: all 0.5s cubic-bezier(0.98, 0.02, 0.46, 0.99) 0.25s;
  -webkit-transition: all 0.5s cubic-bezier(0.98, 0.02, 0.46, 0.99);
  -webkit-transition-delay: 0.25s;
  transition: all 0.5s cubic-bezier(0.98, 0.02, 0.46, 0.99) 0.25s;
  position: absolute;
  width: 70px;
  height: 70px;
  cursor: pointer;
  right: 0;
  top: 0;
  border-radius: 50px;
}
.search-bar .toggle .toggle:after, .search-bar .toggle .toggle:before {
  border-color: #ee6da3;
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
  border-left: 4px solid white;
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
  color: #E62878;
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
</head>
<body>
        <!-- slider Area Start -->     
		<div class="slider-area"> 
			<div class="bend niceties preview-1">  
				<div id="ensign-nivoslider" class="slides">	   
					<img src="${path}/resources/upload/main.jpg" alt="" title="#slider-direction-1"  />
				</div> 
				 
				<!-- direction 1 -->   
				<div id="slider-direction-1" class="text-center slider-direction">   
					<!-- layer 1 -->    
					<div class="layer-1">
			            <h2 class="title-1">Recommender system</h2> 
		            </div> 
					   
 					<!-- layer 2 -->      
					<div class="layer-2">
						<p class="title-2" style="font-size: 22px;">베이지안 뉴런 모듈을 통한 추천 시스템. <br/>아래 검색어를 입력해 보세요.</p>
					</div>
					<div class="layer-1"> 
                        <div id="search-bar" class="search-bar">
                        <form id="searchgo" name="searchgo" action="${path}/search/answer.do">
						    <input id="q" name="q" type="text" />
						    <div id="close" class="toggle"></div>
                        </form>
						</div>
					</div>
					<!-- layer 2 -->      
					<div class="layer-2">
						<div class="col-md-1 col-sm-2 col-xs-6">
							<div class="single-counter wow" data-wow-duration="1.5s" data-wow-delay=".3s">
								<div class="counter-info">
															
								</div>
							</div>		                
			            </div>    
						<div class="col-md-2 col-sm-2 col-xs-6">
							<div class="single-counter wow" data-wow-duration="1.5s" data-wow-delay=".3s">
								<div class="counter-info">
									<span class="fcount">
										<span class="counter">3725</span>
									</span>
									<h3>누적검색횟수</h3>								
								</div>
							</div>		                
			            </div>
						<div class="col-md-2 col-sm-2 col-xs-6">
							<div class="single-counter wow" data-wow-duration="1.5s" data-wow-delay=".3s">
								<div class="counter-info">
									<span class="fcount">
										<span class="counter">3725</span>
									</span>
									<h3>이번달의 검색 수</h3>								
								</div>
							</div>		                
			            </div>
			            <div class="col-md-2 col-sm-2 col-xs-6">
							<div class="single-counter wow" data-wow-duration="1.5s" data-wow-delay=".3s">
								<div class="counter-info">
									<span class="fcount">
										<span class="counter">286</span>
									</span>
									<h3>오늘의 검색 수</h3>								
								</div>
							</div>		                
			            </div>
			            <div class="col-md-2 col-sm-2 col-xs-6">
							<div class="single-counter wow" data-wow-duration="1.5s" data-wow-delay=".3s">
								<div class="counter-info">
									<span class="fcount">
										<span class="counter">550</span>
									</span>
									<h3>총 제품 수</h3>								
								</div>
							</div>		                
			            </div>
			            <div class="col-md-2 col-sm-2 col-xs-6">
							<div class="single-counter wow" data-wow-duration="1.5s" data-wow-delay=".3s">
								<div class="counter-info">
									<span class="fcount">
										<span class="counter">2485</span>
									</span>
									<h3>분석완료 리뷰</h3>								
								</div>
							</div>		                
			            </div> 
					</div>   
					<!-- layer 3 --> 
					<div class="layer-4"> 
						<a href="#" class="title-4">설명이 필요하신가요?</a>  
					</div>
				</div>  
			</div>  
		</div>
		<!-- slider Area End-->   
	<%@ include file="/resources/include/footer.jsp" %>
</body>
</html>