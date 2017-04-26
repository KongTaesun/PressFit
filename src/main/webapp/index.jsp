<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Home</title>
<%@ include file="/resources/include/header.jsp"%>
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
  height: 50px;\
  line-height: 50px;
  width: 100%; 
  padding: 0 1em; 
  box-sizing: border-box;
  background: transparent;  
  color: white;
  border: 4px solid white;  
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
	setTimeout(function() {
	    $('#close').click();
	}, 1000);
	});
</script>
</head>

        <!-- slider Area Start -->     
		<div class="slider-area"> 
			<div class="bend niceties preview-1">  
				<div id="ensign-nivoslider" class="slides">	   
					<img src="${path}/resources/writer/img/bigpicture/main.jpg" alt=""	title="#slider-direction-1" />
				</div> 
				 
				<!-- direction 1 -->   
				<div id="slider-direction-1" class="text-center slider-direction">   
					<!-- layer 1 -->    
					<div class="layer-1">
			            <h2 class="title-1" >Recommender system</h2> 
		            </div>
 					<!-- layer 2 -->      
					<div class="layer-2">
						<p class="title-2" style="font-size: 22px;">베이지안 뉴런 모듈을 통한 추천 시스템. <br/>아래 검색어를 입력해 보세요.</p>
					</div>
					<div class="layer-1"> 
                        <form id="searchgo" name="searchgo" action="${path}/search/answer.do">
	                        <div id="search-bar" class="search-bar">
							    <input id="q" name="q" type="text" />
							    <div id="close" class="toggle"></div>
							</div>
						</form>
					</div>
					<!-- layer 2 -->      
					<div class="layer-2">
						<div class="col-md-1 col-sm-2 col-xs-6">
							<div class="single-counter wow" data-wow-duration="1.5s" data-wow-delay=".9999s">
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
				</div>  
			</div>  
		</div>
<!-- Online Banner Area Start -->
<script type="text/javascript" src="<c:url value='/resources/recommendation/Chart.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/recommendation/Chart.LlineBar.js' />"></script>
<script src="<c:url value='/resources/recommendation/Chart.StackedBar.js' />"></script>
<script>
	var randomScalingFactor = function() {
		return Math.round(Math.random() * 100)
	};

	var lineBarChartData = {
		labels : [ "January", "February", "March", "April", "May", "June",
				"July" ],
		datasets : [
				{
					type : "line",
					fillColor : "rgba(151,187,205,0)",
					strokeColor : "rgba(151,187,205,1)",
					pointColor : "rgba(151,187,205,1)",
					pointStrokeColor : "#fff",
					pointHighlightFill : "#fff",
					pointHighlightStroke : "rgba(151,187,205,1)",
					data : [ randomScalingFactor(), randomScalingFactor(),
							randomScalingFactor(), randomScalingFactor(),
							randomScalingFactor(), randomScalingFactor(),
							randomScalingFactor() ]
				},
				{
					fillColor : "rgba(220,220,220,0.5)",
					strokeColor : "rgba(220,220,220,0.8)",
					highlightFill : "rgba(220,220,220,0.75)",
					highlightStroke : "rgba(220,220,220,1)",
					data : [ randomScalingFactor(), randomScalingFactor(),
							randomScalingFactor(), randomScalingFactor(),
							randomScalingFactor(), randomScalingFactor(),
							randomScalingFactor() ]
				},
				{
					fillColor : "rgba(151,187,205,0.5)",
					strokeColor : "rgba(151,187,205,0.8)",
					highlightFill : "rgba(151,187,205,0.75)",
					highlightStroke : "rgba(151,187,205,1)",
					data : [ randomScalingFactor(), randomScalingFactor(),
							randomScalingFactor(), randomScalingFactor(),
							randomScalingFactor(), randomScalingFactor(),
							randomScalingFactor() ]
				} ]

	}

	var chart = null;
	$(function() {
		var ctx = document.getElementById("canvas3").getContext("2d");
		chart = new Chart(ctx).LineBar(lineBarChartData, {
			responsive : true
		});
	});
</script>
<script type="text/javascript">
	var randomScalingFactor = function() {
		return Math.round(Math.random() * 300)
	};
	var chartData = [ {
		value : randomScalingFactor(),
		color : "#F7464A",
		highlight : "#FF5A5E",
		label : "Red"
	}, {
		value : randomScalingFactor(),
		color : "#46BFBD",
		highlight : "#5AD3D1",
		label : "Green"
	}, {
		value : randomScalingFactor(),
		color : "#FDB45C",
		highlight : "#FFC870",
		label : "Yellow"
	}, {
		value : randomScalingFactor(),
		color : "#949FB1",
		highlight : "#A8B3C5",
		label : "Grey"
	}, {
		value : randomScalingFactor(),
		color : "#4D5360",
		highlight : "#616774",
		label : "Dark Grey"
	}

	];

	var chart = null;
	var canvas = null;
	var ctx = null;
	var legendHolder = null;
	var helpers = Chart.helpers;
	$(function() {
		canvas = document.getElementById("canvas4");
		legendHolder = document.createElement('div');
		ctx = canvas.getContext("2d");
		chart = new Chart(ctx).PolarArea(chartData, {
			scaleShowLabelBackdrop : true,
			scaleBackdropColor : "rgba(255,255,255,0.75)",
			scaleBeginAtZero : true,
			scaleBackdropPaddingY : 2,
			scaleBackdropPaddingX : 2,
			scaleShowLine : true,
			segmentShowStroke : true,
			segmentStrokeColor : "#fff",
			segmentStrokeWidth : 2,
			animationSteps : 100,
			animationEasing : "easeOutBounce",
			animateRotate : true,
			animateScale : false,
			responsive : true,
			onAnimationProgress : function() {
				console.log("onAnimationProgress");
			},
			onAnimationComplete : function() {
				console.log("onAnimationComplete");
			}
		});

		legendHolder.innerHTML = chart.generateLegend();
		helpers.each(legendHolder.firstChild.childNodes, function(legendNode,
				index) {
			helpers.addEvent(legendNode, 'mouseover', function() {
				var activeSegment = chart.segments[index];
				activeSegment.save();
				activeSegment.fillColor = activeSegment.highlightColor;
				chart.showTooltip([ activeSegment ]);
				activeSegment.restore();
			});
		});
		helpers.addEvent(legendHolder.firstChild, 'mouseout', function() {
			chart.draw();
		});
		//canvas.parentNode.appendChild(legendHolder.firstChild);
	});

	$("input#btnAdd").on("click", function() {
		chart.addData({
			value : randomScalingFactor(),
			color : "#B48EAD",
			highlight : "#C69CBE",
			label : "Purple"
		});
	});

	$("input#btnPolar").on("click", function() {
		chart.destroy();
		chart = new Chart(ctx).PolarArea(chartData, {
			segmentStrokeColor : "#000000",
			animation : true,
			responsive : true,
		});
	});

	$("input#btnPie").on("click", function() {
		chart.destroy();
		chart = new Chart(ctx).Pie(chartData, {
			animateScale : true,
			animation : true,
			responsive : true,
		});
	});

	$("input#btnDoughnut").on("click", function() {
		chart.destroy();
		chart = new Chart(ctx).Doughnut(chartData, {
			animateScale : true,
			animation : true,
			responsive : true,
		});
	});

	$("canvas4").on("click", function(e) {
		var activePoints = chart.getSegmentsAtEvent(e);
		console.log(activePoints);
		for ( var i in activePoints) {
			console.log(activePoints[i].value);
		}
	});
</script>
<script type="text/javascript">
		var randomScalingFactor = function(){ return Math.round(Math.random()*100)};
		var months = ["January","February","March","April","May","June","July", "August", "September", "October", "November", "December"];
		var radarChart = null;
		var radarChartData = {
			labels : ["January","February","March","April","May","June","July"],
			datasets: [
				{
					label: "My First dataset",
					fillColor: "rgba(220,220,220,0.2)",
					strokeColor: "rgba(220,220,220,1)",
					pointColor: "rgba(220,220,220,1)",
					pointStrokeColor: "#fff",
					pointHighlightFill: "#fff",
					pointHighlightStroke: "rgba(220,220,220,1)",
					data: [randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor()]
				},
				{
					label: "My Second dataset",
					fillColor: "rgba(151,187,205,0.2)",
					strokeColor: "rgba(151,187,205,1)",
					pointColor: "rgba(151,187,205,1)",
					pointStrokeColor: "#fff",
					pointHighlightFill: "#fff",
					pointHighlightStroke: "rgba(151,187,205,1)",
					data: [randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor()]
				}
			]
		};

		$(function() {
			var ctx = document.getElementById("canvas").getContext("2d");
			radarChart = new Chart(ctx).Radar(radarChartData, {
				//Boolean - Whether to show lines for each scale point
				scaleShowLine : true,
				//Boolean - Whether we show the angle lines out of the radar
				angleShowLineOut : true,
				//Boolean - Whether to show labels on the scale
				scaleShowLabels : false,
				// Boolean - Whether the scale should begin at zero
				scaleBeginAtZero : true,
				//String - Colour of the angle line
				angleLineColor : "rgba(0,0,0,0.1)",
				//Number - Pixel width of the angle line
				angleLineWidth : 1,
				//String - Point label font declaration
				pointLabelFontFamily : "'Arial'",
				//String - Point label font weight
				pointLabelFontStyle : "normal",
				//Number - Point label font size in pixels
				pointLabelFontSize : 10,
				//String - Point label font colour
				pointLabelFontColor : "#666",
				//Boolean - Whether to show a dot for each point
				pointDot : true,
				//Number - Radius of each point dot in pixels
				pointDotRadius : 3,
				//Number - Pixel width of point dot stroke
				pointDotStrokeWidth : 1,
				//Number - amount extra to add to the radius to cater for hit detection outside the drawn point
				pointHitDetectionRadius : 20,
				//Boolean - Whether to show a stroke for datasets
				datasetStroke : true,
				//Number - Pixel width of dataset stroke
				datasetStrokeWidth : 2,
				//Boolean - Whether to fill the dataset with a colour
				datasetFill : false,
				onAnimationProgress: function() {
					console.log("onAnimationProgress");
				},
				onAnimationComplete: function() {
					console.log("onAnimationComplete");
				}
			});
		});

		$("input#btnAdd").on("click", function() {
			radarChart.addData(
				[randomScalingFactor(),randomScalingFactor()], 
				months[(radarChart.datasets[0].points.length)%12]
			);
		});

		$("canvas").on("click", function(e) {
			var activePoints = radarChart.getPointsAtEvent(e);
			console.log(activePoints);

			for(var i in activePoints) {
				console.log(activePoints[i].value);
			}
		});
	</script>
<style type="text/css">
.doughnut-legend {
	list-style: none;
	position: absolute;
	right: 8px;
	top: 0;
}

.doughnut-legend li {
	display: block;
	padding-left: 30px;
	position: relative;
	margin-bottom: 4px;
	border-radius: 5px;
	padding: 2px 8px 2px 28px;
	font-size: 14px;
	cursor: default;
	-webkit-transition: background-color 200ms ease-in-out;
	-moz-transition: background-color 200ms ease-in-out;
	-o-transition: background-color 200ms ease-in-out;
	transition: background-color 200ms ease-in-out;
}

.doughnut-legend li:hover {
	background-color: #fafafa;
}

.doughnut-legend li span {
	display: block;
	position: absolute;
	left: 0;
	top: 0;
	width: 20px;
	height: 100%;
	border-radius: 5px;
}

.polararea-legend {
	list-style: none;
	right: 300px;
	top: 300px;
	visibility: hidden;
}

.polararea-legend li {
	display: block;
	padding-left: 30px;
	position: relative;
	margin-bottom: 4px;
	border-radius: 5px;
	padding: 2px 8px 2px 28px;
	font-size: 14px;
	cursor: default;
	-webkit-transition: background-color 200ms ease-in-out;
	-moz-transition: background-color 200ms ease-in-out;
	-o-transition: background-color 200ms ease-in-out;
	transition: background-color 200ms ease-in-out;
}

.polararea-legend li:hover {
	background-color: #fafafa;
}

.polararea-legend li span {
	display: block;
	position: absolute;
	left: 0;
	top: 0;
	width: 20px;
	height: 100%;
	border-radius: 5px;
}
</style>

<div class="online-banner-area">
	<div class="container">
		<div class="banner-title text-center">
			<h1>
				당신을위한 <span>PressFit</span>의 노력<br/>
			</h1>
			<h3>
				-<span>PressFit</span>정보수집 현황-
			</h3><br/>
			<p>PressFit은 사용자여러분께 ~~~~~~~~~~~~~~~~~~~~~~~<br/>~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~그렇답니다.</p>
		</div>
		<div class="row">
			<div class="banner-list">
				<div class="col-md-4 col-sm-6">
					<div class="single-banner" style="padding:5%">
						<div style="height=350;width=350">
						<canvas id="canvas4" style="height=262;width=262" height="262" width="262"></canvas></div>
						<div class="banner-bottom text-center">
							<a href="#">NEW RELEASE 2016</a>
						</div>
					</div>
				</div>
				<div class="col-md-4 col-sm-6">
					<div class="single-banner" style="padding:5%">
					<div style="height=350;width=350">
						<canvas id="canvas" style="height=300;width=300" height="300" width="300"></canvas></div>
						<div class="banner-bottom text-center">
							<a href="#">NEW RELEASE 2016</a>
						</div>
					</div>
				</div>
				<div class="col-md-4 hidden-sm">
					<div class="single-banner" style="padding:5%">
					<div style="height=350;width=350">
					<canvas id="canvas3" style="height=262;width=262" height="262" width="262"></canvas></div>
						<div class="banner-bottom text-center">
							<a href="#">NEW RELEASE 2016</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Online Banner Area End -->
<!-- Shop Info Area Start -->
<div class="shop-info-area"  style="background-image: url('${path}/resources/writer/img/bigpicture/gift.jpg');">
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-sm-6">
				<div class="single-shop-info">
					<div class="shop-info-icon">
						<i class="flaticon-money"></i>
					</div>
					<div class="shop-info-content">
						<h2>시간을 아끼세요</h2>
						<p>PressFit은 많은 정보를 제공해드립니다.<br/>
						찾는 수고를 덜어 보세요 .</p>
						<a href="#">READ MORE</a>
					</div>
				</div>
			</div>
			<div class="col-md-4 col-sm-6">
				<div class="single-shop-info">
					<div class="shop-info-icon">
						<i class="flaticon-transport"></i>
					</div>
					<div class="shop-info-content">
						<h2>빠른 선택과 빠른 배송</h2>
						<p>PressFit은 빠른배송을 제공해드립니다.<br/>
						Mr쿠x 보다 빠른배송.</p>
						<a href="#">READ MORE</a>
					</div>
				</div>
			</div>
			<div class="col-md-4 hidden-sm">
				<div class="single-shop-info">
					<div class="shop-info-icon">
						<i class="flaticon-school"></i>
					</div>
					<div class="shop-info-content">
						<h2>한눈에 쏙쏙</h2>
						<p>PressFit은 많은 정보를 제공해드립니다.<br/>
						찾으시는 제품의 숨은 정보를 알려드려요.</p>
						<a href="#">READ MORE</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Shop Info Area End -->
<!-- Testimonial Area Start -->
<div class="testimonial-area text-center" style="background-image: url('${path}/resources/writer/img/bigpicture/keyboard_img.jpg');">
	<div class="container">
		<div class="testimonial-title">
			<h2>OUR TESTIMONIAL</h2>
			<p>What our clients say about the books reviews and comments</p>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="testimonial-list">
					<div class="single-testimonial">
						<img src="img/testimonial/1.jpg" alt="">
						<div class="testmonial-info clearfix">
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
								sed do eiusmod tempor incididunt ut labore et dolore magna
								aliqua. Ut enim ad minim veniam, quis nostrud exercitation.</p>
							<div class="testimonial-author text-center">
								<h3>JOHN DOE</h3>
								<p>The Author</p>
							</div>
						</div>
					</div>
					<div class="single-testimonial">
						<img src="img/testimonial/2.jpg" alt="">
						<div class="testmonial-info clearfix">
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
								sed do eiusmod tempor incididunt ut labore et dolore magna
								aliqua. Ut enim ad minim veniam, quis nostrud exercitation.</p>
							<div class="testimonial-author text-center">
								<h3>Ashim Kumar</h3>
								<p>CEO</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Testimonial Area End -->
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


<%@ include file="/resources/include/footer.jsp"%>

<!--Quickview Product Start -->
<div id="quickview-wrapper">
	<!-- Modal -->
	<div class="modal fade" id="productModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="modal-product">
						<div class="product-images">
							<div class="main-image images">
								<img alt="" src="img/quick-view.jpg">
							</div>
						</div>
						<div class="product-info">
							<h1>Frame Princes Cut Diamond</h1>
							<div class="price-box">
								<p class="s-price">
									<span class="special-price"><span class="amount">$280.00</span></span>
								</p>
							</div>
							<a href="product-details.html" class="see-all">See all
								features</a>
							<div class="quick-add-to-cart">
								<form method="post" class="cart">
									<div class="numbers-row">
										<input type="number" id="french-hens" value="3">
									</div>
									<button class="single_add_to_cart_button" type="submit">Add
										to cart</button>
								</form>
							</div>
							<div class="quick-desc">Lorem ipsum dolor sit amet,
								consectetur adipiscing elit. Nam fringilla augue nec est
								tristique auctor. Donec non est at libero vulputate rutrum.
								Morbi ornare lectus quis justo gravida semper. Nulla tellus mi,
								vulputate adipiscing cursus eu, suscipit id nulla.</div>
							<div class="social-sharing">
								<div class="widget widget_socialsharing_widget">
									<h3 class="widget-title-modal">Share this product</h3>
									<ul class="social-icons">
										<li><a target="_blank" title="Facebook" href="#"
											class="facebook social-icon"><i class="fa fa-facebook"></i></a></li>
										<li><a target="_blank" title="Twitter" href="#"
											class="twitter social-icon"><i class="fa fa-twitter"></i></a></li>
										<li><a target="_blank" title="Pinterest" href="#"
											class="pinterest social-icon"><i class="fa fa-pinterest"></i></a></li>
										<li><a target="_blank" title="Google +" href="#"
											class="gplus social-icon"><i class="fa fa-google-plus"></i></a></li>
										<li><a target="_blank" title="LinkedIn" href="#"
											class="linkedin social-icon"><i class="fa fa-linkedin"></i></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>


