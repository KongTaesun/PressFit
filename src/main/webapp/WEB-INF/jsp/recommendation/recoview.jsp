<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 작성</title>

  <link rel="stylesheet" href="<c:url value='/resources/recommendation/css/style.css' />" />
  <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
  <script type='text/javascript' src="<c:url value='/resources/recommendation/jquery.particleground.js' />"></script>

  <%@ include file="/resources/include/header.jsp"%>
  <script src="<c:url value='/resources/include/commons.js' />"></script>
  
  <script type="text/javascript" src="<c:url value='/resources/recommendation/Chart.min.js' />"></script>
  <script type="text/javascript" src="<c:url value='/resources/recommendation/Chart.LlineBar.js' />"></script>
  <script src="<c:url value='/resources/recommendation/Chart.StackedBar.js' />"></script>
  <script src="<c:url value='/resources/recommendation/typeanswer.js' />"></script>
  
<script>
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
function PolarArea(name,a,b,c,d,e){
	var chartData = [
			{
				value: a,
				color:"#F7464A",
				highlight: "#FF5A5E",
				label: "Red"
			},
			{
				value: b,
				color: "#46BFBD",
				highlight: "#5AD3D1",
				label: "Green"
			},
			{
				value: c,
				color: "#FDB45C",
				highlight: "#FFC870",
				label: "Yellow"
			},
			{
				value: d,
				color: "#949FB1",
				highlight: "#A8B3C5",
				label: "Grey"
			},
			{
				value: e,
				color: "#4D5360",
				highlight: "#616774",
				label: "Dark Grey"
			}

		];

	var chart = null;
	var canvas = null;
	var ctx = null;
	var legendHolder = null;
	var helpers = Chart.helpers;
	$(function() {
		canvas = document.getElementById(name);
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
			responsive: true,
			onAnimationProgress: function() {
				console.log("onAnimationProgress");
			},
			onAnimationComplete: function() {
				console.log("onAnimationComplete");
			}
		});

		legendHolder.innerHTML = chart.generateLegend();
		helpers.each(legendHolder.firstChild.childNodes, function(legendNode, index){
			helpers.addEvent(legendNode, 'mouseover', function(){
				var activeSegment = chart.segments[index];
				activeSegment.save();
				activeSegment.fillColor = activeSegment.highlightColor;
				chart.showTooltip([activeSegment]);
				activeSegment.restore();
			});
		});
		helpers.addEvent(legendHolder.firstChild, 'mouseout', function(){
			chart.draw();
		});
		canvas.parentNode.appendChild(legendHolder.firstChild);
	});
	$("canvas").on("click", function(e) {
		var activePoints = chart.getSegmentsAtEvent(e);
		console.log(activePoints);
		for(var i in activePoints) {
			console.log(activePoints[i].value);
		}
	});

}
function Doughnut(name,a,b,c,d,e){
	var chartData = [
			{
				value: a,
				color:"#F7464A",
				highlight: "#FF5A5E",
				label: "Red"
			},
			{
				value: b,
				color: "#46BFBD",
				highlight: "#5AD3D1",
				label: "Green"
			},
			{
				value: c,
				color: "#FDB45C",
				highlight: "#FFC870",
				label: "Yellow"
			},
			{
				value: d,
				color: "#949FB1",
				highlight: "#A8B3C5",
				label: "Grey"
			},
			{
				value: e,
				color: "#4D5360",
				highlight: "#616774",
				label: "Dark Grey"
			}

		];

	var chart = null;
	var canvas = null;
	var ctx = null;
	var legendHolder = null;
	var helpers = Chart.helpers;
	$(function() {
		canvas = document.getElementById(name);
		legendHolder = document.createElement('div');
		ctx = canvas.getContext("2d");
		chart = new Chart(ctx).Doughnut(chartData, {
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
			responsive: true,
			onAnimationProgress: function() {
				console.log("onAnimationProgress");
			},
			onAnimationComplete: function() {
				console.log("onAnimationComplete");
			}
		});

		legendHolder.innerHTML = chart.generateLegend();
		helpers.each(legendHolder.firstChild.childNodes, function(legendNode, index){
			helpers.addEvent(legendNode, 'mouseover', function(){
				var activeSegment = chart.segments[index];
				activeSegment.save();
				activeSegment.fillColor = activeSegment.highlightColor;
				chart.showTooltip([activeSegment]);
				activeSegment.restore();
			});
		});
		helpers.addEvent(legendHolder.firstChild, 'mouseout', function(){
			chart.draw();
		});
		canvas.parentNode.appendChild(legendHolder.firstChild);
	});
	$("canvas").on("click", function(e) {
		var activePoints = chart.getSegmentsAtEvent(e);
		console.log(activePoints);
		for(var i in activePoints) {
			console.log(activePoints[i].value);
		}
	});

}
function radargraph(name,a,b,c,d,e){
	var radarChart = null;
	var radarChartData = {
		labels : ["성능","디자인","관심도","좋은평가","나쁜평가"],
		datasets: [
			{
				label: "My Second dataset",
				fillColor: "rgba(151,187,205,0.2)",
				strokeColor: "rgba(151,187,205,1)",
				pointColor: "rgba(151,187,205,1)",
				pointStrokeColor: "#fff",
				pointHighlightFill: "#fff",
				pointHighlightStroke: "rgba(151,187,205,1)",
				data: [a,b,c,d,e]
			}
		]
	};

	$(function() {
		var ctx = document.getElementById(name).getContext("2d");
		radarChart = new Chart(ctx).Radar(radarChartData, {
			scaleShowLine : true,
			angleShowLineOut : true,
			scaleShowLabels : false,
			scaleBeginAtZero : true,
			angleLineColor : "rgba(0,0,0,0.1)",
			angleLineWidth : 1,
			pointLabelFontFamily : "'Arial'",
			pointLabelFontStyle : "normal",
			pointLabelFontSize : 10,
			pointLabelFontColor : "#00000",
			pointDot : true,
			pointDotRadius : 3,
			pointDotStrokeWidth : 1,
			pointHitDetectionRadius : 20,
			datasetStroke : true,
			datasetStrokeWidth : 2,
			datasetFill : false,
			onAnimationProgress: function() {
				console.log("onAnimationProgress");
			},
			onAnimationComplete: function() {
				console.log("onAnimationComplete");
			}
		});
	});
	$("canvas").on("click", function(e) {
		var activePoints = radarChart.getPointsAtEvent(e);
		console.log(activePoints);

		for(var i in activePoints) {
			console.log(activePoints[i].value);
		}
	});

}
function typeanswerlist(answerlist,callback){
	var i=0;
	var inter = setInterval(function(){
		$('#answerlist').html(answerlist[i]);
		i++;
		if(i>=answerlist.length){
			$('#answerlist').html(answerlist[i]);
			$('#answerlistbottom').html('<strong>.분석완료.</strong>');
			clearInterval(inter);
		    setTimeout(function(){
				$('#answerlistend').hide();
				callback();
		    },3000);
		}
	}, 2000);
};
function type2answerlist(answerlist){
	var i=0;
	var inter = setInterval(function(){
		$('#answerlist').html(answerlist[i]);
		i++;
		if(i>=answerlist.length){
			$('#answerlist').html(answerlist[i]);
			$('#answerlistbottom').html('<strong>.분석완료.</strong>');
			clearInterval(inter);
		    setTimeout(function(){
				//$('#answerlistend').hide();
		    },1500);
		}
	}, 1500);
};
function type1obj(obj){

	$('#list0').show();
	var i=0;
	var inter = setInterval(function(){
		var str = '';
		str+="<div class='col-md-2' style='background-color: white;''>"+
			"<div class='single-banner'>"+
			"<div class='price'>검색단어 점수<br/>"+(obj.reviewlist.hitslist[i]._score*10).toFixed(2)+"/100</div>"+
			"<a href='"+obj.reviewlist.hitslist[i]._source.link+"'>"+
			"<canvas id='canvas"+i+"' height='260' width='260'></canvas></a>"+
			"<div class='banner-bottom text-center'>"+
			"<a href='"+obj.reviewlist.hitslist[i]._source.link+"'>"+
			obj.reviewlist.hitslist[i]._source.content.substring(0,100)+"...</a></div></div></div>";
		$('#list0 .banner-list').append(str).addClass('animate');
		radargraph('canvas'+i,10,10,10,10,10);
		i++;
		if(i>=6||i>=obj.reviewlist.hitslist.length){
			clearInterval(inter);
		} 
	},200);
	
	$('#first').show();
	var j='first';
	var str = '';
	str += "<div class='col-md-12 col-sm-7'>"+
			"<div class='single-banner'>"+
				"<div class='banner-bottom text-center'>"+
				"<div class='zt-span6 last' style='padding-top: 0px;padding-right: 10px;padding-bottom: 0px;padding-left: 10px;'>"+
					"<div class='zt-skill-bar'><div data-width='"+obj.first.content_cnt+"'> 관련 리뷰 <span>"+obj.first.content_cnt+"개</span></div></div>"+
					"<div class='zt-skill-bar'><div data-width='100'>분석 진행 현황<span>100%</span></div></div>"+
				"</div></div></div></div>"+
			      "<div class='col-md-1'></div>"+
					"<div class='col-md-3 col-sm-6'>"+
						"<div class='single-banner' style='padding: 5%;background-color: white;'>"+
							"<div class='price'>추가사항 <br/>65%</div>"+
							"<canvas id='canvas"+j+"' style='' height='260' width='260'></canvas>"+
							"<div class='banner-bottom text-center'>"+
								"<a href='#'>제품평가에서 이런평가를 받았어요.<br/>종합점수 : <strong>55</strong></a>"+
							"</div>"+
						"</div>"+
					"</div>"+
					"<div class='col-md-4 col-sm-8'>"+
						"<div class='single-banner'>"+
							"<a href='${path}/tmouse/view.do?idx="+obj.first.idx+
							"&curPage=1&searchOption=title&keyword='>"+
							"<img src='<c:url value='/resources/writer/img/banner/3.jpg' />'alt=''>"+
							"</a>"+
							"<div class='price'>판매순위 30위</div>"+
							"<div class='banner-bottom text-center'>"+
								"<a href='${path}/tmouse/view.do?idx="+obj.first.idx+
								"&curPage=1&searchOption=title&keyword='>"+
								obj.first.modelnameDB+"<br/>"+obj.first.price+"</a>"+
							"</div>"+
						"</div>"+
					"</div>"+
					"<div class='col-md-3 col-sm-6'>"+
						"<div class='single-banner' style='padding: 5%;background-color: white;'>"+
							"<div style='width:260px;height:260px'>"+
							"<canvas id='canvas2"+j+"' height='260' width='260'></canvas></div>"+
							"<div class='banner-bottom text-center'>"+
								"<a href='#'>리뷰에서 이런평가를 받았어요.<br/>종합점수 : <strong>24</strong></a>"+
							"</div>"+
						"</div>"+
					"</div>";
	$('#first .banner-list').append(str).addClass('animate');
	bargraph('canvas'+j,60,60,60,60,30);
	Doughnut('canvas2'+j,10,10,10,10,10);
	ztskillbar();
	
	$('#firstlist').show();
	if(obj.firstreview!=null){
		var k='firstlist';
		var str = '';
		str+="<div class='col-md-3' style='background-color: white;''>"+
			"<div class='single-banner'>"+
			"<div class='price'>검색단어 점수<br/>"+(obj.firstreview._score*10).toFixed(2)+"/100</div>"+
			"<a href='"+obj.firstreview._source.link+"'>"+
			"<canvas id='canvas"+k+"' height='260' width='260'></canvas></a>"+
			"<div class='banner-bottom text-center'>"+
			"<a href='"+obj.firstreview._source.link+"'>"+
			obj.firstreview._source.content.substring(0,100)+"...</a></div></div></div>";
		$('#firstlist .banner-list').append(str).addClass('animate');
		radargraph('canvas'+k,10,10,10,10,10);		
	}
	if(obj.secondreview!=null){
		var k='secondlist';
		var str = '';
		str+="<div class='col-md-2' style='background-color: white;''>"+
			"<div class='single-banner'>"+
			"<div class='price'>검색단어 점수<br/>"+(obj.secondreview._score*10).toFixed(2)+"/100</div>"+
			"<a href='"+obj.secondreview._source.link+"'>"+
			"<canvas id='canvas"+k+"' height='260' width='260'></canvas></a>"+
			"<div class='banner-bottom text-center'>"+
			"<a href='"+obj.secondreview._source.link+"'>"+
			obj.secondreview._source.content.substring(0,100)+"...</a></div></div></div>";
		$('#firstlist .banner-list').append(str).addClass('animate');
		radargraph('canvas'+k,10,10,10,10,10);		
	}
	if(obj.thirdreview!=null){
		var k='thirdlist';
		var str = '';
		str+="<div class='col-md-2' style='background-color: white;''>"+
			"<div class='single-banner'>"+
			"<div class='price'>검색단어 점수<br/>"+(obj.thirdreview._score*10).toFixed(2)+"/100</div>"+
			"<a href='"+obj.thirdreview._source.link+"'>"+
			"<canvas id='canvas"+k+"' height='260' width='260'></canvas></a>"+
			"<div class='banner-bottom text-center'>"+
			"<a href='"+obj.thirdreview._source.link+"'>"+
			obj.thirdreview._source.content.substring(0,100)+"...</a></div></div></div>";
		$('#firstlist .banner-list').append(str).addClass('animate');
		radargraph('canvas'+k,10,10,10,10,10);		
	}
	
};
function type3obj(obj){
	$('#first').show();
	var j='first';
	var str = '';
	str += "<div class='col-md-12 col-sm-7'>"+
			"<div class='single-banner'>"+
				"<div class='banner-bottom text-center'>"+
				"<div class='zt-span6 last' style='padding-top: 0px;padding-right: 10px;padding-bottom: 0px;padding-left: 10px;'>"+
					"<div class='zt-skill-bar'><div data-width='"+obj.first.content_cnt+"'> 관련 리뷰 <span>"+obj.first.content_cnt+"개</span></div></div>"+
					"<div class='zt-skill-bar'><div data-width='100'>분석 진행 현황<span>100%</span></div></div>"+
				"</div></div></div></div>"+
			      "<div class='col-md-1'></div>"+
					"<div class='col-md-3 col-sm-6'>"+
						"<div class='single-banner' style='padding: 5%;background-color: white;'>"+
							"<div class='price'>추가사항 <br/>65%</div>"+
							"<canvas id='canvas"+j+"' style='' height='260' width='260'></canvas>"+
							"<div class='banner-bottom text-center'>"+
								"<a href='#'>제품평가에서 이런평가를 받았어요.<br/>종합점수 : <strong>55</strong></a>"+
							"</div>"+
						"</div>"+
					"</div>"+
					"<div class='col-md-4 col-sm-8'>"+
						"<div class='single-banner'>"+
							"<a href='${path}/tmouse/view.do?idx="+obj.first.idx+
							"&curPage=1&searchOption=title&keyword='>"+
							"<img src='<c:url value='/resources/writer/img/banner/3.jpg' />'alt=''>"+
							"</a>"+
							"<div class='price'>판매순위 30위</div>"+
							"<div class='banner-bottom text-center'>"+
								"<a href='${path}/tmouse/view.do?idx="+obj.first.idx+
								"&curPage=1&searchOption=title&keyword='>"+
								obj.first.modelnameDB+"<br/>"+obj.first.price+"</a>"+
							"</div>"+
						"</div>"+
					"</div>"+
					"<div class='col-md-3 col-sm-6'>"+
						"<div class='single-banner' style='padding: 5%;background-color: white;'>"+
							"<div style='width:260px;height:260px'>"+
							"<canvas id='canvas2"+j+"' height='260' width='260'></canvas></div>"+
							"<div class='banner-bottom text-center'>"+
								"<a href='#'>리뷰에서 이런평가를 받았어요.<br/>종합점수 : <strong>24</strong></a>"+
							"</div>"+
						"</div>"+
					"</div>";
	$('#first .banner-list').append(str).addClass('animate');
	bargraph('canvas'+j,60,60,60,60,30);
	Doughnut('canvas2'+j,10,10,10,10,10);
	ztskillbar();
	
	$('#list1').show();
	var i=0;
	var inter = setInterval(function(){
		var str = '';
		str+="<div class='col-md-2' style='background-color: white;''>"+
			"<div class='single-banner'>"+
			"<div class='price'>검색단어 점수<br/>"+(obj.reviewlist.hitslist[i]._score*10).toFixed(2)+"/100</div>"+
			"<a href='"+obj.reviewlist.hitslist[i]._source.link+"'>"+
			"<canvas id='canvas"+i+"' height='260' width='260'></canvas></a>"+
			"<div class='banner-bottom text-center'>"+
			"<a href='"+obj.reviewlist.hitslist[i]._source.link+"'>"+
			obj.reviewlist.hitslist[i]._source.content.substring(0,100)+"...</a></div></div></div>";
		$('#list1 .banner-list').append(str).addClass('animate');
		radargraph('canvas'+i,10,10,10,10,10);
		i++;
		if(i>=6||i>=obj.reviewlist.hitslist.length){
			clearInterval(inter);
		} 
	},200);
	$('html body').css('height', '110%');
};
function type4obj(obj){
	$('#list2').show();
	$('#list3').show();
	var i=0;
	var inter = setInterval(function(){
		var str = '';
		str+="<div class='col-md-2' style='background-color: white;''>"+
			"<div class='single-banner'>"+
			"<div class='price'>검색단어 점수<br/>"+(obj.reviewlist.hitslist[i]._score*10).toFixed(2)+"/100</div>"+
			"<a href='"+obj.reviewlist.hitslist[i]._source.link+"'>"+
			"<canvas id='canvas"+i+"' height='260' width='260'></canvas></a>"+
			"<div class='banner-bottom text-center'>"+
			"<a href='"+obj.reviewlist.hitslist[i]._source.link+"'>"+
			obj.reviewlist.hitslist[i]._source.content.substring(0,100)+"...</a></div></div></div>";
		$('#list2 .banner-list').append(str).addClass('animate');
		radargraph('canvas'+i,10,10,10,10,10);
		
		filename('tmouse',obj.reviewlist.hitslist[i]._source.idx,function(img){
			var str2 = '';
			str2+="<div class='col-md-2' style='background-color: white;''>"+
				"<div class='single-banner'>"+
				"<a href='${path}/tmouse/view.do?idx="+obj.reviewlist.hitslist[i]._source.idx+
				"&curPage=1&searchOption=title&keyword='>"+
				"<img src='${path}/resources/upload/"+img+"'>"+
				"</a>"+
				"<div class='banner-bottom text-center'>"+
					"<a href='${path}/tmouse/view.do?idx="+obj.reviewlist.hitslist[i]._source.idx+
					"&curPage=1&searchOption=title&keyword='>"+
					obj.reviewlist.hitslist[i]._source.modelname+"<br/></a>"+
				"</div></div></div>";
			$('#list3 .banner-list').append(str2).addClass('animate');
		});	 
		i++;
		if(i>=6||i>=obj.reviewlist.hitslist.length){
			clearInterval(inter);
		} 
	},200);
	
};
function type5obj(obj){
	$('#list2').show();
	$('#list3').show();
	var i=0;
	var inter = setInterval(function(){
		var str = '';
		str+="<div class='col-md-2' style='background-color: white;''>"+
			"<div class='single-banner'>"+
			"<div class='price'>검색단어 점수<br/>"+(obj.reviewlist.hitslist[i]._score*10).toFixed(2)+"/100</div>"+
			"<a href='"+obj.reviewlist.hitslist[i]._source.link+"'>"+
			"<canvas id='canvas"+i+"' height='260' width='260'></canvas></a>"+
			"<div class='banner-bottom text-center'>"+
			"<a href='"+obj.reviewlist.hitslist[i]._source.link+"'>"+
			obj.reviewlist.hitslist[i]._source.content.substring(0,100)+"...</a></div></div></div>";
		$('#list2 .banner-list').append(str).addClass('animate');
		radargraph('canvas'+i,10,10,10,10,10);
		
		filename('keyboard',obj.reviewlist.hitslist[i]._source.idx,function(img){
			var str2 = '';
			str2+="<div class='col-md-2' style='background-color: white;''>"+
				"<div class='single-banner'>"+
				"<a href='${path}/keyboard/view.do?idx="+obj.reviewlist.hitslist[i]._source.idx+
				"&curPage=1&searchOption=title&keyword='>"+
				"<img src='${path}/resources/upload/"+img+"'/>"+
				"</a>"+
				"<div class='banner-bottom text-center'>"+
					"<a href='${path}/keyboard/view.do?idx="+obj.reviewlist.hitslist[i]._source.idx+
					"&curPage=1&searchOption=title&keyword='>"+
					obj.reviewlist.hitslist[i]._source.modelname+"<br/></a>"+
				"</div></div></div>";
			$('#list3 .banner-list').append(str2).addClass('animate');
		});	
			i++;
		if(i>=6||i>=obj.reviewlist.hitslist.length){
			clearInterval(inter);
		} 
	},200);
	
};
function type6obj(obj){
	$('#list2').show();
	$('#list3').show();

	var i=0;
	var inter = setInterval(function(){
		var kind = null;
		if(obj.reviewlist.hitslist[i]._index=="anlayze"){kind="tmouse"}
		else if(obj.reviewlist.hitslist[i]._index=="anlayze2"){kind="keyboard"}
		var str = '';
		str+="<div class='col-md-2' style='background-color: white;''>"+
			"<div class='single-banner'>"+
			"<div class='price'>검색단어 점수<br/>"+(obj.reviewlist.hitslist[i]._score*10).toFixed(2)+"/100</div>"+
			"<a href='"+obj.reviewlist.hitslist[i]._source.link+"'>"+
			"<canvas id='canvas"+i+"' height='260' width='260'></canvas></a>"+
			"<div class='banner-bottom text-center'>"+
			"<a href='"+obj.reviewlist.hitslist[i]._source.link+"'>"+
			obj.reviewlist.hitslist[i]._source.content.substring(0,100)+"...</a></div></div></div>";
		$('#list2 .banner-list').append(str).addClass('animate');
		radargraph('canvas'+i,10,10,10,10,10);
		
		filename(kind,obj.reviewlist.hitslist[i]._source.idx,function(img){
			var str2 = '';
			str2+="<div class='col-md-2' style='background-color: white;''>"+
				"<div class='single-banner'>"+
				"<a href='${path}/"+kind+"/view.do?idx="+obj.reviewlist.hitslist[i]._source.idx+
				"&curPage=1&searchOption=title&keyword='>"+
				"<img id='image"+i+"' src='${path}/resources/upload/"+img+"' />"+
				"</a>"+
				"<div class='banner-bottom text-center'>"+
					"<a href='${path}/"+kind+"/view.do?idx="+obj.reviewlist.hitslist[i]._source.idx+
					"&curPage=1&searchOption=title&keyword='>"+
					obj.reviewlist.hitslist[i]._source.modelname+"<br/></a>"+
				"</div></div></div>";
			$('#list3 .banner-list').append(str2).addClass('animate');
		});			
						i++;
		if(i>=6||i>=obj.reviewlist.hitslist.length){
			clearInterval(inter);
		} 
	},200);
};
function type7obj(obj){
	$('#first').show();
	filename('tmouse',+obj.first.idx,function(img){
	var j='first';
	var str = '';
	str += "<div class='col-md-12 col-sm-7'>"+
			"<div class='single-banner'>"+
				"<div class='banner-bottom text-center'>"+
				"<div class='zt-span6 last' style='padding-top: 0px;padding-right: 10px;padding-bottom: 0px;padding-left: 10px;'>"+
					"<div class='zt-skill-bar'><div data-width='"+obj.first.content_cnt+"'> 관련 리뷰 <span>"+obj.first.content_cnt+"개</span></div></div>"+
					"<div class='zt-skill-bar'><div data-width='100'>분석 진행 현황<span>100%</span></div></div>"+
				"</div></div></div></div>"+
			      "<div class='col-md-1'></div>"+
					"<div class='col-md-3 col-sm-6'>"+
						"<div class='single-banner' style='padding: 5%;background-color: white;'>"+
							"<div class='price'>추가사항 <br/>65%</div>"+
							"<canvas id='canvas"+j+"' style='' height='260' width='260'></canvas>"+
							"<div class='banner-bottom text-center'>"+
								"<a href='#'>제품평가에서 이런평가를 받았어요.<br/>종합점수 : <strong>55</strong></a>"+
							"</div>"+
						"</div>"+
					"</div>"+
					"<div class='col-md-4 col-sm-8'>"+
						"<div class='single-banner'>"+
						"<a href='${path}/tmouse/view.do?idx="+obj.reviewlist.hitslist[i]._source.idx+
						"&curPage=1&searchOption=title&keyword='>"+
						"<img id='image"+i+"' src='${path}/resources/upload/"+img+"' />"+
						"</a>"+
						"<div class='price'>"+obj.first.modelname+"</div>"+
							"<div class='banner-bottom text-center'>"+
								"<a href='${path}/tmouse/view.do?idx="+obj.first.idx+
								"&curPage=1&searchOption=title&keyword='>"+
								obj.first.modelnameDB+"<br/>"+obj.first.price+"</a>"+
							"</div>"+
						"</div>"+
					"</div>"+
					"<div class='col-md-3 col-sm-6'>"+
						"<div class='single-banner' style='padding: 5%;background-color: white;'>"+
							"<div style='width:260px;height:260px'>"+
							"<canvas id='canvas2"+j+"' height='260' width='260'></canvas></div>"+
							"<div class='banner-bottom text-center'>"+
								"<a href='#'>리뷰에서 이런평가를 받았어요.<br/>종합점수 : <strong>24</strong></a>"+
							"</div>"+
						"</div>"+
					"</div>";
	$('#first .banner-list').append(str).addClass('animate');
	bargraph('canvas'+j,60,60,60,60,30);
	Doughnut('canvas2'+j,10,10,10,10,10);
	ztskillbar();
	});
	var i=0;
	var kind = null;
	$('#list1').show();
	var inter = setInterval(function(){
		if(obj.reviewlist.hitslist[i]._index=="anlayze"){kind="tmouse"}
		else if(obj.reviewlist.hitslist[i]._index=="anlayze2"){kind="keyboard"}
		filename(kind,obj.reviewlist.hitslist[i]._source.idx,function(img){
		var str = '';
		str+="<div class='col-md-2' style='background-color: white;''>"+
			"<div class='single-banner'>"+
			"<div class='price'>검색단어 점수<br/>"+(obj.reviewlist.hitslist[i]._score*10).toFixed(2)+"/100</div>"+
			"<a href='${path}/"+kind+"/view.do?idx="+obj.reviewlist.hitslist[i]._source.idx+
			"&curPage=1&searchOption=title&keyword='>"+
			"<img id='image"+i+"' src='${path}/resources/upload/"+img+"' />"+
			"</a>"+
			"<div class='banner-bottom text-center'>"+
			"<a href='"+obj.reviewlist.hitslist[i]._source.link+"'>"+
			obj.reviewlist.hitslist[i]._source.content.substring(0,100)+"...</a></div></div></div>";
		$('#list1 .banner-list').append(str).addClass('animate');
		i++;
		if(i>=6||i>=obj.reviewlist.hitslist.length){
			clearInterval(inter);
		} 
		});	
	},200);
};
function type8obj(obj){
	var i=0;
	var kind = null;
	$('#list4').show();
	var inter = setInterval(function(){
		if(obj.firstreview.hitslist[i]!=null){
			if(obj.firstreview.hitslist[i]._index=="anlayze"){kind="tmouse"}
			else if(obj.firstreview.hitslist[i]._index=="anlayze2"){kind="keyboard"}
			filename(kind,obj.firstreview.hitslist[i]._source.idx,function(img){
			var str = '';
			str+="<div class='col-md-2' style='background-color: white;''>"+
				"<div class='single-banner'>"+
				"<div class='price'>검색단어 점수<br/>"+(obj.firstreview.hitslist[i]._score*10).toFixed(2)+"/100</div>"+
				"<a href='${path}/"+kind+"/view.do?idx="+obj.firstreview.hitslist[i]._source.idx+
				"&curPage=1&searchOption=title&keyword='>"+
				"<img src='${path}/resources/upload/"+img+"' />"+
				"</a>"+
				"<div class='banner-bottom text-center'>"+
				"<a href='"+obj.firstreview.hitslist[i]._source.link+"'>"+
				obj.firstreview.hitslist[i]._source.content.substring(0,100)+"...</a></div></div></div>";
			$('#list4 .banner-list').append(str).addClass('animate');
			i++;
			});	
			if(i>=5){
				clearInterval(inter);
			} 
		}
	},200);
	
	var j=0;
	var kind = null;
	$('#list5').show();
	var inter2 = setInterval(function(){
		if(obj.secondreview.hitslist[j]!=null){
		if(obj.secondreview.hitslist[j]._index=="anlayze"){kind="tmouse"}
		else if(obj.secondreview.hitslist[j]._index=="anlayze2"){kind="keyboard"}
		filename(kind,obj.secondreview.hitslist[j]._source.idx,function(img){
		var str = '';
		str+="<div class='col-md-2' style='background-color: white;''>"+
			"<div class='single-banner'>"+
			"<div class='price'>검색단어 점수<br/>"+(obj.secondreview.hitslist[j]._score*10).toFixed(2)+"/100</div>"+
			"<a href='${path}/"+kind+"/view.do?idx="+obj.secondreview.hitslist[j]._source.idx+
			"&curPage=1&searchOption=title&keyword='>"+
			"<img src='${path}/resources/upload/"+img+"' />"+
			"</a>"+
			"<div class='banner-bottom text-center'>"+
			"<a href='"+obj.secondreview.hitslist[j]._source.link+"'>"+
			obj.secondreview.hitslist[j]._source.content.substring(0,100)+"...</a></div></div></div>";
		$('#list5 .banner-list').append(str).addClass('animate');
			j++;
		});	
			if(j>=5){
				clearInterval(inter2);
			} 
		}
	},200);
};
function type9obj(obj){
	$('#first').show();
	filename('tmouse',+obj.first.idx,function(img){
	var j='first';
	var str = '';
	str += "<div class='col-md-12 col-sm-7'>"+
			"<div class='single-banner'>"+
				"<div class='banner-bottom text-center'>"+
				"<div class='zt-span6 last' style='padding-top: 0px;padding-right: 10px;padding-bottom: 0px;padding-left: 10px;'>"+
					"<div class='zt-skill-bar'><div data-width='"+obj.first.content_cnt+"'> 관련 리뷰 <span>"+obj.first.content_cnt+"개</span></div></div>"+
					"<div class='zt-skill-bar'><div data-width='100'>분석 진행 현황<span>100%</span></div></div>"+
				"</div></div></div></div>"+
			      "<div class='col-md-1'></div>"+
					"<div class='col-md-3 col-sm-6'>"+
						"<div class='single-banner' style='padding: 5%;background-color: white;'>"+
							"<div class='price'>추가사항 <br/>65%</div>"+
							"<canvas id='canvas"+j+"' style='' height='260' width='260'></canvas>"+
							"<div class='banner-bottom text-center'>"+
								"<a href='#'>제품평가에서 이런평가를 받았어요.<br/>종합점수 : <strong>55</strong></a>"+
							"</div>"+
						"</div>"+
					"</div>"+
					"<div class='col-md-4 col-sm-8'>"+
						"<div class='single-banner'>"+
						"<a href='${path}/tmouse/view.do?idx="+obj.reviewlist.hitslist[i]._source.idx+
						"&curPage=1&searchOption=title&keyword='>"+
						"<img id='image"+i+"' src='${path}/resources/upload/"+img+"' />"+
						"</a>"+
						"<div class='price'>"+obj.first.modelname+"</div>"+
							"<div class='banner-bottom text-center'>"+
								"<a href='${path}/tmouse/view.do?idx="+obj.first.idx+
								"&curPage=1&searchOption=title&keyword='>"+
								obj.first.modelnameDB+"<br/>"+obj.first.price+"</a>"+
							"</div>"+
						"</div>"+
					"</div>"+
					"<div class='col-md-3 col-sm-6'>"+
						"<div class='single-banner' style='padding: 5%;background-color: white;'>"+
							"<div style='width:260px;height:260px'>"+
							"<canvas id='canvas2"+j+"' height='260' width='260'></canvas></div>"+
							"<div class='banner-bottom text-center'>"+
								"<a href='#'>리뷰에서 이런평가를 받았어요.<br/>종합점수 : <strong>24</strong></a>"+
							"</div>"+
						"</div>"+
					"</div>";
	$('#first .banner-list').append(str).addClass('animate');
	bargraph('canvas'+j,60,60,60,60,30);
	Doughnut('canvas2'+j,10,10,10,10,10);
	ztskillbar();
	});
	$('#firstlist').show();
	
	var j=0;
	var inter1 = setInterval(function(){
		var str = '';
		str+="<div class='col-md-2' style='background-color: white;''>"+
			"<div class='single-banner'>"+
			"<div class='price'>검색단어 점수<br/>"+(obj.firstreview[j]._score*10).toFixed(2)+"/100</div>"+
			"<a href='"+obj.firstreview[j]._source.link+"'>"+
			"<canvas id='firstcanvas"+j+"' height='260' width='260'></canvas></a>"+
			"<div class='banner-bottom text-center'>"+
			"<a href='"+obj.firstreview[j]._source.link+"'>"+
			obj.firstreview[j]._source.content.substring(0,100)+"...</a></div></div></div>";
		$('#firstlist .banner-list').append(str).addClass('animate');
		radargraph('firstcanvas'+j,10,10,10,10,10);
		j++;
		if(j>=4||j>=obj.firstreview.length){
			clearInterval(inter1);
		} 
	},200);
	var i=0;
	
	$('#list1').show();
	var inter = setInterval(function(){
		filename('tmouse',obj.reviewlist.hitslist[i]._source.idx,function(img){
		var str = '';
		str+="<div class='col-md-2' style='background-color: white;''>"+
			"<div class='single-banner'>"+
			"<div class='price'>검색단어 점수<br/>"+(obj.reviewlist.hitslist[i]._score*10).toFixed(2)+"/100</div>"+
			"<a href='${path}/tmouse/view.do?idx="+obj.reviewlist.hitslist[i]._source.idx+
			"&curPage=1&searchOption=title&keyword='>"+
			"<img id='image"+i+"' src='${path}/resources/upload/"+img+"' />"+
			"</a>"+
			"<div class='banner-bottom text-center'>"+
			"<a href='"+obj.reviewlist.hitslist[i]._source.link+"'>"+
			obj.reviewlist.hitslist[i]._source.content.substring(0,100)+"...</a></div></div></div>";
		$('#list1 .banner-list').append(str).addClass('animate');
		i++;
		if(i>=6||i>=obj.reviewlist.hitslist.length){
			clearInterval(inter);
		} 
		});	
	},200);

	$('html body').css('height', '130%');
	
};
function type10obj(obj){
	$('#first').show();
	filename('keyboard',+obj.first.idx,function(img){
	var j='first';
	var str = '';
	str += "<div class='col-md-12 col-sm-7'>"+
			"<div class='single-banner'>"+
				"<div class='banner-bottom text-center'>"+
				"<div class='zt-span6 last' style='padding-top: 0px;padding-right: 10px;padding-bottom: 0px;padding-left: 10px;'>"+
					"<div class='zt-skill-bar'><div data-width='"+obj.first.content_cnt+"'> 관련 리뷰 <span>"+obj.first.content_cnt+"개</span></div></div>"+
					"<div class='zt-skill-bar'><div data-width='100'>분석 진행 현황<span>100%</span></div></div>"+
				"</div></div></div></div>"+
			      "<div class='col-md-1'></div>"+
					"<div class='col-md-3 col-sm-6'>"+
						"<div class='single-banner' style='padding: 5%;background-color: white;'>"+
							"<div class='price'>추가사항 <br/>65%</div>"+
							"<canvas id='canvas"+j+"' style='' height='260' width='260'></canvas>"+
							"<div class='banner-bottom text-center'>"+
								"<a href='#'>제품평가에서 이런평가를 받았어요.<br/>종합점수 : <strong>55</strong></a>"+
							"</div>"+
						"</div>"+
					"</div>"+
					"<div class='col-md-4 col-sm-8'>"+
						"<div class='single-banner'>"+
						"<a href='${path}/keyboard/view.do?idx="+obj.reviewlist.hitslist[i]._source.idx+
						"&curPage=1&searchOption=title&keyword='>"+
						"<img id='image"+i+"' src='${path}/resources/upload/"+img+"' />"+
						"</a>"+
						"<div class='price'>"+obj.first.modelname+"</div>"+
							"<div class='banner-bottom text-center'>"+
								"<a href='${path}/keyboard/view.do?idx="+obj.first.idx+
								"&curPage=1&searchOption=title&keyword='>"+
								obj.first.modelnameDB+"<br/>"+obj.first.price+"</a>"+
							"</div>"+
						"</div>"+
					"</div>"+
					"<div class='col-md-3 col-sm-6'>"+
						"<div class='single-banner' style='padding: 5%;background-color: white;'>"+
							"<div style='width:260px;height:260px'>"+
							"<canvas id='canvas2"+j+"' height='260' width='260'></canvas></div>"+
							"<div class='banner-bottom text-center'>"+
								"<a href='#'>리뷰에서 이런평가를 받았어요.<br/>종합점수 : <strong>24</strong></a>"+
							"</div>"+
						"</div>"+
					"</div>";
	$('#first .banner-list').append(str).addClass('animate');
	bargraph('canvas'+j,60,60,60,60,30);
	Doughnut('canvas2'+j,10,10,10,10,10);
	ztskillbar();
	});
	$('#firstlist').show();
	
	var j=0;
	var inter1 = setInterval(function(){
		var str = '';
		str+="<div class='col-md-2' style='background-color: white;''>"+
			"<div class='single-banner'>"+
			"<div class='price'>검색단어 점수<br/>"+(obj.firstreview[j]._score*10).toFixed(2)+"/100</div>"+
			"<a href='"+obj.firstreview[j]._source.link+"'>"+
			"<canvas id='firstcanvas"+j+"' height='260' width='260'></canvas></a>"+
			"<div class='banner-bottom text-center'>"+
			"<a href='"+obj.firstreview[j]._source.link+"'>"+
			obj.firstreview[j]._source.content.substring(0,100)+"...</a></div></div></div>";
		$('#firstlist .banner-list').append(str).addClass('animate');
		radargraph('firstcanvas'+j,10,10,10,10,10);
		j++;
		if(j>=4||j>=obj.firstreview.length){
			clearInterval(inter1);
		} 
	},200);
	var i=0;
	
	$('#list1').show();
	var inter = setInterval(function(){
		filename('keyboard',obj.reviewlist.hitslist[i]._source.idx,function(img){
		var str = '';
		str+="<div class='col-md-2' style='background-color: white;''>"+
			"<div class='single-banner'>"+
			"<div class='price'>검색단어 점수<br/>"+(obj.reviewlist.hitslist[i]._score*10).toFixed(2)+"/100</div>"+
			"<a href='${path}/keyboard/view.do?idx="+obj.reviewlist.hitslist[i]._source.idx+
			"&curPage=1&searchOption=title&keyword='>"+
			"<img id='image"+i+"' src='${path}/resources/upload/"+img+"' />"+
			"</a>"+
			"<div class='banner-bottom text-center'>"+
			"<a href='"+obj.reviewlist.hitslist[i]._source.link+"'>"+
			obj.reviewlist.hitslist[i]._source.content.substring(0,100)+"...</a></div></div></div>";
		$('#list1 .banner-list').append(str).addClass('animate');
		i++;
		if(i>=6||i>=obj.reviewlist.hitslist.length){
			clearInterval(inter);
		} 
		});	
	},200);

	$('html body').css('height', '130%');
};
function filename(kind,idx,callback){
	$.ajax({
		type : "GET",
		url: "${path}/admin/image/image.do",
		data: "kind="+kind+"&idx="+idx,
	 	contentType: "text/plain; charset=utf-8",
	 	dataType : "json",
	 	success: function(data){
			callback(data.filename);
	 	},
	 	error: function(xhr) {
		 	  console.log('실패-',xhr);
		 	}
		});
}
$(document).ready(function() {
	$('#intro').css('margin-top', '-350px');
	$('#intro').css('padding-top', '60px');
	$('#list0').hide();
	$('#first').hide();
	$('#firstlist').hide();
	$('#list1').hide();
	$('#list2').hide();
	$('#list3').hide();
	$('#list4').hide();
	$('#list5').hide();
	
	var chart = null;
	var canvas = null;
	var ctx = null;
	var legendHolder = null;
	var helpers = Chart.helpers;
	var months = [ "성능", "디자인", "가격", "관심도"];
	var data = null;
	$.ajax({
		type : "POST",
		url: "http://192.168.0.25:8900/?q=${q}",
	 	contentType: "text/plain; charset=utf-8",
	 	jsonp : "callback",
	 	dataType : "jsonp",
	 	jsonpCallback: "myCallback",
	 	success: function(data) {
	 		console.log('성공 - ', data);
			$('#loading').animate({
	            "opacity": "0",
	            "top": "10px"
	        },500, function () {
	        	$('#loading').hide(); 
	        });
			console.log(data.type);
			if(data.type == 1){
				typeanswerlist(data.answerlist,function(){
					type1obj(data.obj);
				});
			}
			else if(data.type == 2){
				type2answerlist(data.answerlist);
			}
			else if(data.type == 3){
				typeanswerlist(data.answerlist,function(){
					type3obj(data.obj);
				});
			}
			else if(data.type == 4){
				typeanswerlist(data.answerlist,function(){
					type4obj(data.obj);
				});
			}
			else if(data.type == 5){
				typeanswerlist(data.answerlist,function(){
					type5obj(data.obj);
				});
			}
			else if(data.type == 6){
				typeanswerlist(data.answerlist,function(){
					type6obj(data.obj);
				});
			}
			else if(data.type == 7){
				typeanswerlist(data.answerlist,function(){
					type7obj(data.obj);
				});
			}
			else if(data.type == 8){
				typeanswerlist(data.answerlist,function(){
					type8obj(data.obj);
				});
			}
			else if(data.type == 9){
				typeanswerlist(data.answerlist,function(){
					type9obj(data.obj);
				});
			}
			else if(data.type == 10){
				typeanswerlist(data.answerlist,function(){
					type10obj(data.obj);
				});
			}
			else {console.log('서버오류');}
	 	},
	 	error: function(xhr) {
	 	  console.log('실패 - ', xhr);
	 	}
		});
	});
document.addEventListener('DOMContentLoaded', function () {
	  particleground(document.getElementById('particles'), {
	    dotColor: '#32B5F3',
	    lineColor: '#32B5F3'
	  });
	  var intro = document.getElementById('intro');
	  intro.style.marginTop = - intro.offsetHeight / 2 + 'px';
	}, false);
</script>
<style>
#loading {
 width: 100%;  
 height: 100%;  
 top: 0px;
 left: 0px;
 position: fixed;  
 display: block; 
 background-color: black;  
 z-index: 99;  
 text-align: center; 
 } 

*,
*:before,
*:after {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

.wrapper {
  position: absolute;
  left: 50%;
  top: 50%;
  margin: -100px;
  width: 200px;
  height: 200px;
  background-color: transparent;
  border: none;
  -webkit-user-select: none;
}
.wrapper .box-wrap {
  width: 70%;
  height: 70%;
  margin: calc((100% - 70%)/2) calc((100% - 70%)/2);
  position: relative;
  -webkit-transform: rotate(-45deg);
          transform: rotate(-45deg);
}
.wrapper .box-wrap .box {
  width: 100%;
  height: 100%;
  position: absolute;
  left: 0;
  top: 0;
  background: rgba(135, 0, 0, 0.6);
  background: -webkit-linear-gradient(left, #141562, #486FBC, #EAB5A1, #8DD6FF, #4973C9, #D07CA7, #F4915E, #F5919E, #B46F89, #141562, #486FBC);
  background: linear-gradient(to right, #141562, #486FBC, #EAB5A1, #8DD6FF, #4973C9, #D07CA7, #F4915E, #F5919E, #B46F89, #141562, #486FBC);
  background-position: 0% 50%;
  background-size: 1000% 1000%;
  visibility: hidden;
}
.wrapper .box-wrap .box.one {
  -webkit-animation: moveGradient 15s infinite, oneMove 3.5s infinite;
          animation: moveGradient 15s infinite, oneMove 3.5s infinite;
}
.wrapper .box-wrap .box.two {
  -webkit-animation: moveGradient 15s infinite, twoMove 3.5s .15s infinite;
          animation: moveGradient 15s infinite, twoMove 3.5s .15s infinite;
}
.wrapper .box-wrap .box.three {
  -webkit-animation: moveGradient 15s infinite, threeMove 3.5s .3s infinite;
          animation: moveGradient 15s infinite, threeMove 3.5s .3s infinite;
}
.wrapper .box-wrap .box.four {
  -webkit-animation: moveGradient 15s infinite, fourMove 3.5s .575s infinite;
          animation: moveGradient 15s infinite, fourMove 3.5s .575s infinite;
}
.wrapper .box-wrap .box.five {
  -webkit-animation: moveGradient 15s infinite, fiveMove 3.5s .725s infinite;
          animation: moveGradient 15s infinite, fiveMove 3.5s .725s infinite;
}
.wrapper .box-wrap .box.six {
  -webkit-animation: moveGradient 15s infinite, sixMove 3.5s .875s infinite;
          animation: moveGradient 15s infinite, sixMove 3.5s .875s infinite;
}

@-webkit-keyframes moveGradient {
  to {
    background-position: 100% 50%;
  }
}

@keyframes moveGradient {
  to {
    background-position: 100% 50%;
  }
}
@-webkit-keyframes oneMove {
  0% {
    visibility: visible;
    -webkit-clip-path: inset(0% 35% 70% round 5%);
            clip-path: inset(0% 35% 70% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  14.2857% {
    -webkit-clip-path: inset(0% 35% 70% round 5%);
            clip-path: inset(0% 35% 70% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  28.5714% {
    -webkit-clip-path: inset(35% round 5%);
            clip-path: inset(35% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  42.8571% {
    -webkit-clip-path: inset(35% 70% 35% 0 round 5%);
            clip-path: inset(35% 70% 35% 0 round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  57.1428% {
    -webkit-clip-path: inset(35% 70% 35% 0 round 5%);
            clip-path: inset(35% 70% 35% 0 round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  71.4285% {
    -webkit-clip-path: inset(0% 70% 70% 0 round 5%);
            clip-path: inset(0% 70% 70% 0 round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  85.7142% {
    -webkit-clip-path: inset(0% 70% 70% 0 round 5%);
            clip-path: inset(0% 70% 70% 0 round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  100% {
    -webkit-clip-path: inset(0% 35% 70% round 5%);
            clip-path: inset(0% 35% 70% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
}
@keyframes oneMove {
  0% {
    visibility: visible;
    -webkit-clip-path: inset(0% 35% 70% round 5%);
            clip-path: inset(0% 35% 70% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  14.2857% {
    -webkit-clip-path: inset(0% 35% 70% round 5%);
            clip-path: inset(0% 35% 70% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  28.5714% {
    -webkit-clip-path: inset(35% round 5%);
            clip-path: inset(35% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  42.8571% {
    -webkit-clip-path: inset(35% 70% 35% 0 round 5%);
            clip-path: inset(35% 70% 35% 0 round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  57.1428% {
    -webkit-clip-path: inset(35% 70% 35% 0 round 5%);
            clip-path: inset(35% 70% 35% 0 round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  71.4285% {
    -webkit-clip-path: inset(0% 70% 70% 0 round 5%);
            clip-path: inset(0% 70% 70% 0 round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  85.7142% {
    -webkit-clip-path: inset(0% 70% 70% 0 round 5%);
            clip-path: inset(0% 70% 70% 0 round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  100% {
    -webkit-clip-path: inset(0% 35% 70% round 5%);
            clip-path: inset(0% 35% 70% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
}
@-webkit-keyframes twoMove {
  0% {
    visibility: visible;
    -webkit-clip-path: inset(0% 70% 70% 0 round 5%);
            clip-path: inset(0% 70% 70% 0 round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  14.2857% {
    -webkit-clip-path: inset(0% 70% 70% 0 round 5%);
            clip-path: inset(0% 70% 70% 0 round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  28.5714% {
    -webkit-clip-path: inset(0% 35% 70% round 5%);
            clip-path: inset(0% 35% 70% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  42.8571% {
    -webkit-clip-path: inset(0% 35% 70% round 5%);
            clip-path: inset(0% 35% 70% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  57.1428% {
    -webkit-clip-path: inset(35% round 5%);
            clip-path: inset(35% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  71.4285% {
    -webkit-clip-path: inset(35% 70% 35% 0 round 5%);
            clip-path: inset(35% 70% 35% 0 round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  85.7142% {
    -webkit-clip-path: inset(35% 70% 35% 0 round 5%);
            clip-path: inset(35% 70% 35% 0 round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  100% {
    -webkit-clip-path: inset(0% 70% 70% 0 round 5%);
            clip-path: inset(0% 70% 70% 0 round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
}
@keyframes twoMove {
  0% {
    visibility: visible;
    -webkit-clip-path: inset(0% 70% 70% 0 round 5%);
            clip-path: inset(0% 70% 70% 0 round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  14.2857% {
    -webkit-clip-path: inset(0% 70% 70% 0 round 5%);
            clip-path: inset(0% 70% 70% 0 round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  28.5714% {
    -webkit-clip-path: inset(0% 35% 70% round 5%);
            clip-path: inset(0% 35% 70% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  42.8571% {
    -webkit-clip-path: inset(0% 35% 70% round 5%);
            clip-path: inset(0% 35% 70% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  57.1428% {
    -webkit-clip-path: inset(35% round 5%);
            clip-path: inset(35% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  71.4285% {
    -webkit-clip-path: inset(35% 70% 35% 0 round 5%);
            clip-path: inset(35% 70% 35% 0 round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  85.7142% {
    -webkit-clip-path: inset(35% 70% 35% 0 round 5%);
            clip-path: inset(35% 70% 35% 0 round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  100% {
    -webkit-clip-path: inset(0% 70% 70% 0 round 5%);
            clip-path: inset(0% 70% 70% 0 round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
}
@-webkit-keyframes threeMove {
  0% {
    visibility: visible;
    -webkit-clip-path: inset(35% 70% 35% 0 round 5%);
            clip-path: inset(35% 70% 35% 0 round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  14.2857% {
    -webkit-clip-path: inset(35% 70% 35% 0 round 5%);
            clip-path: inset(35% 70% 35% 0 round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  28.5714% {
    -webkit-clip-path: inset(0% 70% 70% 0 round 5%);
            clip-path: inset(0% 70% 70% 0 round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  42.8571% {
    -webkit-clip-path: inset(0% 70% 70% 0 round 5%);
            clip-path: inset(0% 70% 70% 0 round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  57.1428% {
    -webkit-clip-path: inset(0% 35% 70% round 5%);
            clip-path: inset(0% 35% 70% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  71.4285% {
    -webkit-clip-path: inset(0% 35% 70% round 5%);
            clip-path: inset(0% 35% 70% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  85.7142% {
    -webkit-clip-path: inset(35% round 5%);
            clip-path: inset(35% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  100% {
    -webkit-clip-path: inset(35% 70% 35% 0 round 5%);
            clip-path: inset(35% 70% 35% 0 round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
}
@keyframes threeMove {
  0% {
    visibility: visible;
    -webkit-clip-path: inset(35% 70% 35% 0 round 5%);
            clip-path: inset(35% 70% 35% 0 round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  14.2857% {
    -webkit-clip-path: inset(35% 70% 35% 0 round 5%);
            clip-path: inset(35% 70% 35% 0 round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  28.5714% {
    -webkit-clip-path: inset(0% 70% 70% 0 round 5%);
            clip-path: inset(0% 70% 70% 0 round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  42.8571% {
    -webkit-clip-path: inset(0% 70% 70% 0 round 5%);
            clip-path: inset(0% 70% 70% 0 round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  57.1428% {
    -webkit-clip-path: inset(0% 35% 70% round 5%);
            clip-path: inset(0% 35% 70% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  71.4285% {
    -webkit-clip-path: inset(0% 35% 70% round 5%);
            clip-path: inset(0% 35% 70% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  85.7142% {
    -webkit-clip-path: inset(35% round 5%);
            clip-path: inset(35% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  100% {
    -webkit-clip-path: inset(35% 70% 35% 0 round 5%);
            clip-path: inset(35% 70% 35% 0 round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
}
@-webkit-keyframes fourMove {
  0% {
    visibility: visible;
    -webkit-clip-path: inset(35% 0% 35% 70% round 5%);
            clip-path: inset(35% 0% 35% 70% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  14.2857% {
    -webkit-clip-path: inset(35% 0% 35% 70% round 5%);
            clip-path: inset(35% 0% 35% 70% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  28.5714% {
    -webkit-clip-path: inset(35% round 5%);
            clip-path: inset(35% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  42.8571% {
    -webkit-clip-path: inset(70% 35% 0% 35% round 5%);
            clip-path: inset(70% 35% 0% 35% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  57.1428% {
    -webkit-clip-path: inset(70% 35% 0% 35% round 5%);
            clip-path: inset(70% 35% 0% 35% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  71.4285% {
    -webkit-clip-path: inset(70% 0 0 70% round 5%);
            clip-path: inset(70% 0 0 70% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  85.7142% {
    -webkit-clip-path: inset(70% 0 0 70% round 5%);
            clip-path: inset(70% 0 0 70% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  100% {
    -webkit-clip-path: inset(35% 0% 35% 70% round 5%);
            clip-path: inset(35% 0% 35% 70% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
}
@keyframes fourMove {
  0% {
    visibility: visible;
    -webkit-clip-path: inset(35% 0% 35% 70% round 5%);
            clip-path: inset(35% 0% 35% 70% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  14.2857% {
    -webkit-clip-path: inset(35% 0% 35% 70% round 5%);
            clip-path: inset(35% 0% 35% 70% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  28.5714% {
    -webkit-clip-path: inset(35% round 5%);
            clip-path: inset(35% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  42.8571% {
    -webkit-clip-path: inset(70% 35% 0% 35% round 5%);
            clip-path: inset(70% 35% 0% 35% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  57.1428% {
    -webkit-clip-path: inset(70% 35% 0% 35% round 5%);
            clip-path: inset(70% 35% 0% 35% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  71.4285% {
    -webkit-clip-path: inset(70% 0 0 70% round 5%);
            clip-path: inset(70% 0 0 70% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  85.7142% {
    -webkit-clip-path: inset(70% 0 0 70% round 5%);
            clip-path: inset(70% 0 0 70% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  100% {
    -webkit-clip-path: inset(35% 0% 35% 70% round 5%);
            clip-path: inset(35% 0% 35% 70% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
}
@-webkit-keyframes fiveMove {
  0% {
    visibility: visible;
    -webkit-clip-path: inset(70% 0 0 70% round 5%);
            clip-path: inset(70% 0 0 70% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  14.2857% {
    -webkit-clip-path: inset(70% 0 0 70% round 5%);
            clip-path: inset(70% 0 0 70% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  28.5714% {
    -webkit-clip-path: inset(35% 0% 35% 70% round 5%);
            clip-path: inset(35% 0% 35% 70% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  42.8571% {
    -webkit-clip-path: inset(35% 0% 35% 70% round 5%);
            clip-path: inset(35% 0% 35% 70% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  57.1428% {
    -webkit-clip-path: inset(35% round 5%);
            clip-path: inset(35% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  71.4285% {
    -webkit-clip-path: inset(70% 35% 0% 35% round 5%);
            clip-path: inset(70% 35% 0% 35% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  85.7142% {
    -webkit-clip-path: inset(70% 35% 0% 35% round 5%);
            clip-path: inset(70% 35% 0% 35% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  100% {
    -webkit-clip-path: inset(70% 0 0 70% round 5%);
            clip-path: inset(70% 0 0 70% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
}
@keyframes fiveMove {
  0% {
    visibility: visible;
    -webkit-clip-path: inset(70% 0 0 70% round 5%);
            clip-path: inset(70% 0 0 70% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  14.2857% {
    -webkit-clip-path: inset(70% 0 0 70% round 5%);
            clip-path: inset(70% 0 0 70% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  28.5714% {
    -webkit-clip-path: inset(35% 0% 35% 70% round 5%);
            clip-path: inset(35% 0% 35% 70% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  42.8571% {
    -webkit-clip-path: inset(35% 0% 35% 70% round 5%);
            clip-path: inset(35% 0% 35% 70% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  57.1428% {
    -webkit-clip-path: inset(35% round 5%);
            clip-path: inset(35% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  71.4285% {
    -webkit-clip-path: inset(70% 35% 0% 35% round 5%);
            clip-path: inset(70% 35% 0% 35% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  85.7142% {
    -webkit-clip-path: inset(70% 35% 0% 35% round 5%);
            clip-path: inset(70% 35% 0% 35% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  100% {
    -webkit-clip-path: inset(70% 0 0 70% round 5%);
            clip-path: inset(70% 0 0 70% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
}
@-webkit-keyframes sixMove {
  0% {
    visibility: visible;
    -webkit-clip-path: inset(70% 35% 0% 35% round 5%);
            clip-path: inset(70% 35% 0% 35% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  14.2857% {
    -webkit-clip-path: inset(70% 35% 0% 35% round 5%);
            clip-path: inset(70% 35% 0% 35% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  28.5714% {
    -webkit-clip-path: inset(70% 0 0 70% round 5%);
            clip-path: inset(70% 0 0 70% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  42.8571% {
    -webkit-clip-path: inset(70% 0 0 70% round 5%);
            clip-path: inset(70% 0 0 70% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  57.1428% {
    -webkit-clip-path: inset(35% 0% 35% 70% round 5%);
            clip-path: inset(35% 0% 35% 70% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  71.4285% {
    -webkit-clip-path: inset(35% 0% 35% 70% round 5%);
            clip-path: inset(35% 0% 35% 70% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  85.7142% {
    -webkit-clip-path: inset(35% round 5%);
            clip-path: inset(35% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  100% {
    -webkit-clip-path: inset(70% 35% 0% 35% round 5%);
            clip-path: inset(70% 35% 0% 35% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
}
@keyframes sixMove {
  0% {
    visibility: visible;
    -webkit-clip-path: inset(70% 35% 0% 35% round 5%);
            clip-path: inset(70% 35% 0% 35% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  14.2857% {
    -webkit-clip-path: inset(70% 35% 0% 35% round 5%);
            clip-path: inset(70% 35% 0% 35% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  28.5714% {
    -webkit-clip-path: inset(70% 0 0 70% round 5%);
            clip-path: inset(70% 0 0 70% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  42.8571% {
    -webkit-clip-path: inset(70% 0 0 70% round 5%);
            clip-path: inset(70% 0 0 70% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  57.1428% {
    -webkit-clip-path: inset(35% 0% 35% 70% round 5%);
            clip-path: inset(35% 0% 35% 70% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  71.4285% {
    -webkit-clip-path: inset(35% 0% 35% 70% round 5%);
            clip-path: inset(35% 0% 35% 70% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  85.7142% {
    -webkit-clip-path: inset(35% round 5%);
            clip-path: inset(35% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
  100% {
    -webkit-clip-path: inset(70% 35% 0% 35% round 5%);
            clip-path: inset(70% 35% 0% 35% round 5%);
    -webkit-animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
            animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
  }
}
</style>
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
</head>
<style>
html,body{
overflow: visible;
height: 150%;
}
audio, canvas, progress, video {
vertical-align: inherit;
}
</style>
<body>
<div id="loading">
<div class="wrapper">
    <div class="box-wrap">
        <div class="box one"></div>
        <div class="box two"></div>
        <div class="box three"></div>
        <div class="box four"></div>
        <div class="box five"></div>
        <div class="box six"></div>
    </div>
</div>
</div>

<div id="particles">
  <div id="intro">
    <!-- Online Banner Area Start -->
	<div id="answerlistend" class="row" style="top: 0px;position: relative;">
		<div class="banner-list" style="padding:8%">
			<div class="col-md-12">
				<div class="single-banner" style="font-size: 30px; padding: 5%;background-color: white;">
					<p id="answerlist" style="font-size: 30px;"></p>
					<div  id="answerlistbottom" class="banner-bottom text-center">
						<strong> 분석중 ... </strong>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="list0" class="row" style="top:30px;position:relative;">
		<div class="banner-list" style="padding:3%">
		<h2>-검색 내용이 포함된 리뷰-</h2>
		
		</div>
	</div>
	<div id="list4" class="row" style="top:30px;position:relative;">
		<div class="banner-list" style="padding:3%">
		<h2>-검색 내용이 포함된 리뷰 및 제품(마우스)-</h2>
		
		</div>
	</div>
	<div id="list5" class="row" style="top:30px;position:relative;">
		<div class="banner-list" style="padding:3%">
		<h2>-검색 내용이 포함된 리뷰 및 제품(키보드)-</h2>
		
		</div>
	</div>
	<div id="list2" class="row" style="top:30px;position:relative;">
		<div class="banner-list" style="padding:3%">
		<h2>-검색하신 회사가 포함된 리뷰-</h2>
		
		</div>
	</div>
		<div id="list3" class="row" style="top:30px;position:relative;">
		<div class="banner-list" style="padding:3%">
		<h2>-검색하신 회사의 추천 제품-</h2>
		
		</div>
	</div>
	<div id="first" class="row" style="position: relative;">
		<div class="banner-list" style="padding:3%">
		<h2>-추 천 제 품-</h2>
					
		</div>
	</div>
		<div id="firstlist" class="row" style="position:relative;">
		<div class="banner-list" style="padding:3%">
		<h2>-추천 제품 관련 리뷰-</h2>
		<div class="col-md-2"></div>
		</div>
	</div>
	<div id="list1" class="row" style="position:relative;">
		<div class="banner-list" style="padding:3%">
		<h2>-추가 추천 리스트-</h2>
			
		</div>
	</div>
		
	</div>
</div>

</body>
	<%@ include file="/resources/include/footer.jsp" %>
</html>