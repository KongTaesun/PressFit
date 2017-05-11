<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<%@ include file="adminheader.jsp"%>
<script src="${path}/resources/admin/num/jquery.color.min.js"></script>
<script src="${path}/resources/admin/num/jquery.animateNumber.min.js"></script>
  <script type="text/javascript" src="<c:url value='/resources/recommendation/Chart.min.js' />"></script>
  <script type="text/javascript" src="<c:url value='/resources/recommendation/Chart.LlineBar.js' />"></script>
  <script src="<c:url value='/resources/recommendation/Chart.StackedBar.js' />"></script>
  <script src="<c:url value='/resources/recommendation/typeanswer.js' />"></script>
<script type="text/javascript">
function ztskillbar(){
	(function( $ ) {
	    "use strict";
	    $(function() {
	        function animated_contents() {
	            $(".zt-skill-bar > div ").each(function (i) {
	                var $this  = $(this),
	                    skills = $this.data('width');

	                $this.css({'width' : skills + '%'});

	            });
	        }
	        
	        if(jQuery().appear) {
	            $('.zt-skill-bar').appear().on('appear', function() {
	                animated_contents();
	            });
	        } else {
	            animated_contents();
	        }
	    });
	}(jQuery));
}
function bargraph(name,a,b,c,d){
	var barChart = null;
	var barChartData = {
		labels : ["성능","디자인","관심도","가격"],
		datasets : [
			{
				fillColor : "rgba(220,220,220,0.5)",
				strokeColor : "rgba(220,220,220,0.8)",
				highlightFill: "rgba(220,220,220,0.75)",
				highlightStroke: "rgba(220,220,220,1)",
				data : [30,26,84,95]
			},
			{
				fillColor : "rgba(151,187,205,0.5)",
				strokeColor : "rgba(151,187,205,0.8)",
				highlightFill : "rgba(151,187,205,0.75)",
				highlightStroke : "rgba(151,187,205,1)",
				data : [a,b,c,d]
			}
		]

	};

	$(function() {
		var ctx = document.getElementById(name).getContext("2d");
		barChart = new Chart(ctx).Bar(barChartData, {
			scaleBeginAtZero : false,
			scaleShowGridLines : true,
			scaleGridLineColor : "rgba(0,0,0,0.05)",
			scaleGridLineWidth : 1,
			barShowStroke : false,
			barStrokeWidth : 2,
			barValueSpacing : 5,
			barDatasetSpacing : 1,
			onAnimationProgress: function() {
				console.log("onAnimationProgress");
			},
			onAnimationComplete: function() {
				console.log("onAnimationComplete");
			}
		});
	});
	
	$("canvas").on("click", function(e) {
		var activeBars = barChart.getBarsAtEvent(e);
		console.log(activeBars);

		for(var i in activeBars) {
			console.log(activeBars[i].value);
		}
	});
}

function linegraph(name){
	var randomScalingFactor = function(){ return Math.round(Math.random()*100)};
	var lineChart = null;
	var lineChartData = {
		labels : ["January","February","March","April","May","June","July"],
		datasets : [
			{
				label: "My Second dataset",
				fillColor : "rgba(151,187,205,0.2)",
				strokeColor : "rgba(151,187,205,1)",
				pointColor : "rgba(151,187,205,1)",
				pointStrokeColor : "#fff",
				pointHighlightFill : "#fff",
				pointHighlightStroke : "rgba(151,187,205,1)",
				data : [randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor()]
			}
		]

	};

	$(function() {
		var ctx = document.getElementById(name).getContext("2d");
		lineChart = new Chart(ctx).Line(lineChartData, {
			///Boolean - Whether grid lines are shown across the chart
			scaleShowGridLines : true,
			//String - Colour of the grid lines
			scaleGridLineColor : "rgba(0,0,0,0.05)",
			//Number - Width of the grid lines
			scaleGridLineWidth : 1,
			//Boolean - Whether the line is curved between points
			bezierCurve : true,
			//Number - Tension of the bezier curve between points
			bezierCurveTension : 0.4,
			//Boolean - Whether to show a dot for each point
			pointDot : true,
			//Number - Radius of each point dot in pixels
			pointDotRadius : 4,
			//Number - Pixel width of point dot stroke
			pointDotStrokeWidth : 1,
			//Number - amount extra to add to the radius to cater for hit detection outside the drawn point
			pointHitDetectionRadius : 20,
			//Boolean - Whether to show a stroke for datasets
			datasetStroke : true,
			//Number - Pixel width of dataset stroke
			datasetStrokeWidth : 2,
			//Boolean - Whether to fill the dataset with a colour
			datasetFill : true,
			onAnimationProgress: function() {
				console.log("onAnimationProgress");
			},
			onAnimationComplete: function() {
				console.log("onAnimationComplete");
			}
		});
	});
}
$(document).ready(function(){
	
	$('#graph').show();
	var j='graph';
	var str = '';
	str += "<div class='col-md-12'>"+
			"<div class='card'>"+
				"<div class='header' style='padding: 15px;'>"+
				"<div class='title zt-span6 last' style='padding-top: 0px;padding-right: 10px;padding-bottom: 0px;padding-left: 10px;'>"+
					"<div class='zt-skill-bar'><div data-width='60'> 관련 리뷰 <span>60개</span></div></div>"+
					"<div class='zt-skill-bar'><div data-width='100'>분석 진행 현황<span>100%</span></div></div>"+
				"</div></div></div></div>"+
				"<div class='col-md-1'></div>"+
					"<div class='col-md-5'>"+
						"<div class='card' style='padding: 5%;background-color: white;'>"+
							"<div class='header'><div class='title'>"+
								"<a href='#'>리뷰의 제품평가 평가/사이트제품 평가 수준.</a>"+
							"<canvas id='canvas"+j+"' style='position: relative;' height='260px' width='400px'></canvas>"+
							"</div></div>"+
						"</div>"+
					"</div>"+
					"<div class='col-md-5'>"+
						"<div class='card' style='padding: 5%;background-color: white;'>"+
							"<div class='header'><div class='title'>"+
								"<a href='#'>현재 : <strong>월별 데이터</strong></a>"+
							"<canvas id='canvas2"+j+"'style='position: relative;' height='260px' width='400px'></canvas>"+
							"</div></div>"+
						"</div>"+
					"</div>";
	$('#graph .banner-list').append(str).addClass('animate');
	bargraph('canvas'+j,60,60,60,60,30);
	linegraph('canvas2'+j);
	ztskillbar();
	
	$.ajax({
		type : "post",
		url: "${path}/logger/all.do",
	 	contentType: "text/plain; charset=utf-8",
	 	dataType : "json",
	 	success: function(data){
			console.log(data);
	var comma_separator_number_step = $.animateNumber.numberStepFactories.separator(',')
	$('#allvisit').animateNumber(
	  {
	    number: data.allvisit,
	    numberStep: comma_separator_number_step
	  }
	);
	$('#dayvisit').animateNumber({ number: data.dayvisit });
	$('#processtime').html(data.processtime);
	$('#allresponsecount').animateNumber(
	  {
	    number: data.allresponsecount,
	    numberStep: comma_separator_number_step
	  }
	);
	$('#dayresponsecount').animateNumber(
		 {
		    number: data.dayresponsecount,
		    numberStep: comma_separator_number_step
		}
	);
	$('#allsearch').animateNumber(
			 {
			    number: data.allsearch,
			    numberStep: comma_separator_number_step
			}
		);
	$('#daysearch').animateNumber({ number: data.daysearch });

	var word = $.animateNumber.numberStepFactories.append(' 개')
	$('#alloreder').animateNumber({
		number:  data.alloreder,color: 'green','font-size': '20px',
		easing: 'easeInQuad',numberStep: word
	}, 2000);
	$('#dayoreder').animateNumber({
		number:  data.dayoreder,color: 'green','font-size': '20px',
		easing: 'easeInQuad',numberStep: word
	}, 2000);
	 		
	 	},
	 	error: function(xhr) {
		 	  console.log('실패-',xhr);
		 	}
		});
	
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
	border-radius: 5px;
}
</style>
<style>
  .zt-skill-bar {
        color: #fff;
        font-size: 11px;
        line-height: 25px;
        height: 25px;
        margin-bottom: 5px;

        background-color: rgba(0,0,0,0.1);

        -webkit-border-radius: 2px;
           -moz-border-radius: 2px;
            -ms-border-radius: 2px;
                border-radius: 2px;

    }

    .zt-skill-bar * {
        webkit-transition: all 0.5s ease;
          -moz-transition: all 0.5s ease;
           -ms-transition: all 0.5s ease;
            -o-transition: all 0.5s ease;
               transition: all 0.5s ease;
    }

    .zt-skill-bar div {
        background-color: #ffc600;
        position: relative;
        padding-left: 25px;
        width: 0;

        -webkit-border-radius: 2px;
           -moz-border-radius: 2px;
           -ms- border-radius: 2px;
                border-radius: 2px;
    }

    .zt-skill-bar span {
        display: block;
        position: absolute;
        right: 0;
        top: 0;
        height: 100%;
        padding: 0 5px 0 10px;
        background-color: #1a1a1a;

        -webkit-border-radius: 0 2px 2px 0;
           -moz-border-radius: 0 2px 2px 0;
            -ms-border-radius: 0 2px 2px 0;
                border-radius: 0 2px 2px 0;
    }

    .zt-skill-bar span:before {
        content: "";
        position: absolute;
        width: 6px;
        height: 6px;
        top: 50%;
        left: -3px;
        margin-top: -3px;
        background-color: #1a1a1a;

        -webkit-transform: rotate(45deg);
           -moz-transform: rotate(45deg);
            -ms-transform: rotate(45deg);
                transform: rotate(45deg);
    }
</style>
<link rel="stylesheet" media="screen" href="${path}/resources/recommendation/particles/css/style.css">
<div class="wrapper">
<%@ include file="adminsidebar.jsp"%>
    <div class="main-panel">
<%@ include file="admininsideheader.jsp"%>
        <div class="content" style="width: 100%;height: 120%;">
            <div id="particles-js" class="container-fluid" style="width: 100%;height: 100%;">
			<!-- scripts -->
			<script src="${path}/resources/recommendation/particles/particles.js"></script>
			<script src="${path}/resources/recommendation/particles/js/app.js"></script>  	
                <div class="row" style="padding: 5%;">
                    <div class="col-md-1"></div>
                    <div class="col-md-2">
                        <div class="card">
                            <div class="header" style="text-align: center">
                            	<h4 class="title" style="font-family: yanolja;font-size: 20px">
                            	<i class="pe-7s-study"></i>방문 누적</h4>
                                <h4 class="title" id="allvisit" 
                                style="padding:10px;margin: 5px;font-family: yanolja;font-size: 20px">0</h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="card">
                            <div class="header" style="text-align: center">
                            	<h4 class="title" style="font-family: yanolja;font-size: 20px">
                            	<i class="pe-7s-diamond"></i>오늘 방문</h4>
                                <h4 class="title" id="dayvisit" 
                                style="padding:10px;margin: 5px;font-family: yanolja;font-size: 20px">0</h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="card">
                            <div class="header" style="text-align: center">
                            	<h4 class="title" style="font-family: yanolja;font-size: 18px">
                            	<i class="pe-7s-arc"></i>평균응답속도</h4>
                                <h4 class="title" id="processtime" 
                                style="padding:10px;margin: 5px;font-family: yanolja;font-size: 20px">0</h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="card">
                            <div class="header" style="text-align: center">
                            	<h4 class="title" style="font-family: yanolja;font-size: 20px">
                            	<i class="pe-7s-cloud-download"></i>전체응답량</h4>
                                <h4 class="title" id="allresponsecount" 
                                style="padding:10px;margin: 5px;font-family: yanolja;font-size: 20px">0</h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="card">
                            <div class="header" style="text-align: center">
                            	<h4 class="title" style="font-family: yanolja;font-size: 20px">
                            	<i class="pe-7s-magic-wand"></i>오늘응답량</h4>
                                <h4 class="title" id="dayresponsecount" 
                                style="padding:10px;margin: 5px;font-family: yanolja;font-size: 20px">0</h4>
                            </div>
                        </div>
                    </div>
               <div class="row">
                    <div class="col-md-3">
                        <div class="card">
                            <div class="header" style="text-align: center">
                            	<h4 class="title" style="font-family: yanolja;font-size: 20px">
                            	<i class="pe-7s-diamond"></i>검색 누적</h4>
                                <h4 class="title" id="allsearch" 
                                style="padding:10px;margin: 5px;font-family: yanolja;font-size: 20px">0</h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card">
                            <div class="header" style="text-align: center">
                            	<h4 class="title" style="font-family: yanolja;font-size: 20px">
                            	<i class="pe-7s-diamond"></i>오늘 검색</h4>
                                <h4 class="title" id="daysearch" 
                                style="padding:10px;margin: 5px;font-family: yanolja;font-size: 20px">0</h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card">
                            <div class="header" style="text-align: center">
                            	<h4 class="title" style="font-family: yanolja;font-size: 20px">
                            	<i class="pe-7s-diamond"></i>주문 누적</h4>
                                <h4 class="title" id="alloreder" 
                                style="padding:10px;margin: 5px;font-family: yanolja;font-size: 20px">0</h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card">
                            <div class="header" style="text-align: center">
                            	<h4 class="title" style="font-family: yanolja;font-size: 20px">
                            	<i class="pe-7s-diamond"></i>오늘 주문</h4>
                                <h4 class="title" id="dayoreder" 
                                style="padding:10px;margin: 5px;font-family: yanolja;font-size: 20px">0</h4>
                            </div>
                        </div>
                    </div>
                    </div>
                    <div id="graph" class="row" style="top:30px;position:relative;">
						<div class="banner-list">
						
						</div>
					</div>
                </div>
            </div>
        </div>
<%@ include file="adminfooter.jsp"%>
    </div>
</div>
</body>
</html>
