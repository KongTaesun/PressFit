<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<title>사업자 페이지</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script>
	//데이트피커를 사용하기 위해 제이쿼리 1.7을 쓰기 위한 소스
	var jQuery1_7 = $.noConflict();
	
	jQuery1_7(document).ready(function() {
		jQuery1_7.datepicker.setDefaults({
			dateFormat: 'yy-mm-dd',
			prevText: '이전 달',
			nextText: '다음 달',
			monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			dayNames: ['일', '월', '화', '수', '목', '금', '토'],
			dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
			dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
			showMonthAfterYear: true,
			yearSuffix: '년'
		});
		jQuery1_7("#datepicker1, #datepicker2").datepicker();
	});
</script>
<style>
.polararea-legend {
    list-style: none;
    position: absolute;
    right: 5%;
    top: 35%;
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
.polararea-legend li span {
    display: block;
    position: absolute;
    left: 0;
    top: 0;
    width: 20px;
    height: 100%;
    border-radius: 5px;
}
.image{
    height: 100px;
    width: 100px;
    display: inline-block;
    position: absolute;
} 
img{
width:100%
}
.title{
    height: 50px;
    width: 500px;
    display: inline-block;
    position: relative;
    margin-top: 50px;
    margin-left: 100px;
}     
.orderlist_scroll{
overflow-y:scroll; width:100%; height:400px; 
}

.btn-default{
background:#32b5f3 none repeat scroll 0 0;
border-radius: 20px;
color: #ffffff;
display: inline-block;
font-weight: 500;
padding: 10px 25px;
text-transform: uppercase;
float: right !important;
}

.p-details-tab ul.p-details-nav-tab li.active a {
    color: #444444;
    display: block;
    position: relative;
}

.p-details-tab ul.p-details-nav-tab li a {
    color: #c8c8c8;
    display: block;
    font-size: 20px;
    font-weight: 700;
    line-height: 1;
    margin-bottom: 25px;
    padding-bottom: 10px;
    position: relative;
    text-transform: capitalize;
}
.desc_total {
    padding: 0 0 7px;
    font-size: 18px;
    color: #666;
}
.emph_total {
    font-weight: 700;
    color: #222;
}
.list_basket {
    overflow: hidden;
    margin-top: 27px;
}
.list_basket li {
    position: relative;
    float: left;
    width: 100%;
    padding: 25px 0 30px;
    border-bottom: 1px solid #efefef;
}
.choice_basket {
    float: left;
    width: 34px;
    height: 120px;
    margin-top: 5px;
}
.list_basket .link_thumb {
    overflow: hidden;
    position: relative;
    float: left;
    width: 120px;
    height: 120px;
    margin: 5px 50px 0 0;
}
.thumb_g {
    display: block;
    width: 100%;
    height: auto;
}
.list_basket .desc_basket {
    overflow: hidden;
}
.list_basket .desc_basket .tit_product {
    display: block;
    padding-right: 50px;
    font-size: 20px;
    line-height: 22px;
}
.list_basket .desc_basket .list_append {
    overflow: hidden;
    float: left;
    width: 335px;
    margin-top: 46px;
    font-size: 16px;
    color: #222;
    line-height: 24px;
}
.list_basket .list_append li {
    padding: 0;
    border-bottom: 0 none;
    text-align: right;
}
.list_basket .list_append .tit_append {
    float: left;
    color: #999;
}
.list_basket .desc_basket .list_append1 {
    overflow: hidden;
    float: left;
    width: 335px;
    margin-top: 46px;
    margin-left: 150px;
    font-size: 16px;
    color: #222;
    line-height: 24px;
}
.list_basket .list_append1 li {
    padding: 0;
    border-bottom: 0 none;
    text-align: right;
}
.list_basket .list_append1 .tit_append {
    float: left;
    color: #999;
}
.productRemove {
    color: #666666;
    font-size: 25px;
    position: absolute;
    right: 0;
    bottom: 30px;
}
.info_price {
    overflow: hidden;
    width: 100%;
    margin: 0 auto;
    padding: 72px 0 46px;
    border-bottom: 1px solid #b5b5b5;
}
.info_price .list_price {
    float: left;
    width: 450px;
    font-size: 18px;
    color: #999;
    line-height: 31px;
}
.list_price dt {
    float: left;
}
.list_price dd {
    overflow: hidden;
    color: #222;
    text-align: right;
}
.info_price .price_total {
    float: right;
    width: 450px;
    margin-top: 30px;
    font-size: 20px;
    color: #1e1e1e;
}
.desc_nodata {
    padding: 151px 0 138px;
    /* border-bottom: 1px solid #222; */
    font-size: 18px;
    color: #666;
    text-align: center;
}
button {
    font-family: Arial, Helvetica, sans-serif;
    font-size: 14px;
    color: #616161;
    padding: 9px 20px;
    background: -moz-linear-gradient(top, #ffffff 0%, #ffffff);
    background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#ffffff));
    -moz-border-radius: 0px;
    -webkit-border-radius: 0px;
    border-radius: 0px;
    border: 1px solid #dbe2ff;
    box-shadow: 0px 1px 3px rgba(000,000,000,0.3), inset 0px 0px 2px rgba(255,255,255,0);
}
button.hover {
    font-weight: bold;
    color: #000000;
    border: 1px solid #879fff;
}
.inner_basket {
    width: 100%;
    height: 40px;
    margin: 20px auto;
}
.cart_atag {
    font-family: Arial, Helvetica, sans-serif;
    font-size: 14px;
    color: #616161;
    padding: 9px 20px;
    background: -moz-linear-gradient(top, #ffffff 0%, #ffffff);
    background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#ffffff));
    -moz-border-radius: 0px;
    -webkit-border-radius: 0px;
    border-radius: 0px;
    border: 1px solid #dbe2ff;
    box-shadow: 0px 1px 3px rgba(000,000,000,0.3), inset 0px 0px 2px rgba(255,255,255,0);
}
.cart_atag.hover {
    font-weight: bold;
    color: #000000;
    border: 1px solid #879fff;
}
.desc_nodata {
    padding: 151px 0 138px;
    font-size: 18px;
    color: #666;
    text-align: center;
}
</style>
<%@ include file="/resources/include/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="<c:url value='/resources/recommendation/Chart.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/recommendation/Chart.LlineBar.js' />"></script>
<script src="<c:url value='/resources/recommendation/Chart.StackedBar.js' />"></script>
<script>
	$(document).ready(function() {
		$('#one').show();
		$('#two').hide();
		$('#three').hide();
		$('#btnone').click(function(){
			$('.p-details-nav-tab li').removeClass('active');
			$('.p-details-nav-tab > li:nth-of-type(1)').addClass('active');
			$('#one').show();
			$('#two').hide();
			$('#three').hide();
		});
		$('#btntwo').click(function(){
			$('.p-details-nav-tab li').removeClass('active');
			$('.p-details-nav-tab > li:nth-of-type(2)').addClass('active');
			$('#one').hide();
			$('#two').show();
			$('#three').hide();
		});
		$('#btnthree').click(function(){
			$('.p-details-nav-tab li').removeClass('active');
			$('.p-details-nav-tab > li:nth-of-type(3)').addClass('active');
			$('#one').hide();
			$('#two').hide();
			$('#three').show();
		});  
		//전체 체크(주문)
		$("#allCheck1").click(function(){
			if($("#allCheck1").prop("checked")){
				$(".check_id1").prop("checked", true);
			}
			else{
				$(".check_id1").prop("checked", false);
			}
		});
		//전체 체크(환불)
		$("#allCheck2").click(function(){
			if($("#allCheck2").prop("checked")){
				$(".check_id2").prop("checked", true);
			}
			else{
				$(".check_id2").prop("checked", false);
			}
		});
		//전체 체크(교환)
		$("#allCheck3").click(function(){
			if($("#allCheck3").prop("checked")){
				$(".check_id3").prop("checked", true);
			}
			else{
				$(".check_id3").prop("checked", false);
			}
		});
		
		$.ajax({
			type : "POST",
			url: "${path}/business/graphData.do",
		 	contentType: "text/plain; charset=utf-8",
		 	dataType : "json",
		 	success: function(data) {
		 		console.log(data);
		 		
		 		var word = $.animateNumber.numberStepFactories.append('');
		 		
		 		$('#counter1').animateNumber({
		 			number: data.list1.mAmount,color: 'white','font-size': '37px',
		 			easing: 'easeInQuad',numberStep: word
		 		}, 2000);
		 		$('#counter2').animateNumber({
		 			number: data.list1.mSalesAmount,color: 'white','font-size': '37px',
		 			easing: 'easeInQuad',numberStep: word
		 		}, 2000);
		 		$('#counter3').animateNumber({
		 			number: data.list1.mSalesTotal,color: 'white','font-size': '37px',
		 			easing: 'easeInQuad',numberStep: word
		 		}, 2000);
		 		$('#counter4').animateNumber({
		 			number: data.list1.mSalesAmount+data.list1.kSalesAmount,color: 'white','font-size': '37px',
		 			easing: 'easeInQuad',numberStep: word
		 		}, 2000);
		 		$('#counter5').animateNumber({
		 			number: data.list1.kAmount,color: 'white','font-size': '37px',
		 			easing: 'easeInQuad',numberStep: word
		 		}, 2000);
		 		$('#counter6').animateNumber({
		 			number: data.list1.kSalesAmount,color: 'white','font-size': '37px',
		 			easing: 'easeInQuad',numberStep: word
		 		}, 2000);
		 		$('#counter7').animateNumber({
		 			number: data.list1.kSalesTotal,color: 'white','font-size': '37px',
		 			easing: 'easeInQuad',numberStep: word
		 		}, 2000);
		 		$('#counter8').animateNumber({
		 			number: data.list1.mSalesTotal+data.list1.kSalesTotal,color: 'white','font-size': '37px',
		 			easing: 'easeInQuad',numberStep: word
		 		}, 2000);
		 		var str = "";
		 		str+= ' <div> ';
				str+= ' <div class="product-wrapper" style="width: 100%;  height: 210px; text-align: center;"> ';
				str+= ' <a href="${path}/tmouse/view.do?idx='+data.list2.idx+'&curPage=1&searchOption=&keyword=" > ';
				str+= ' <img src="${path}/resources/upload/'+data.list2.fullName+'" style="width: 210px; height: 210px;"> </a> </div>';
				str+= ' <div class="banner-bottom1 text-center"> ';
				str+= ' <div class="banner-bottom-title" style="width: 100%; overflow: hidden; top: 50%;"> ';
				str+= ' <a href="${path}/tmouse/view.do?idx='+data.list2.idx+'&curPage=1&searchOption=&keyword=&crea_id='+data.list2.crea_id+'"> ';
				str+=  data.list2.modelname+'</a></div></div></div> ';
		 		$('#mouseRank').html(str);
		 		
		 		var str = "";
		 		str+= ' <div> ';
				str+= ' <div class="product-wrapper" style="width: 100%; height: 210px; text-align: center;"> ';
				str+= ' <a href="${path}/tmouse/view.do?idx='+data.list3.idx+'&curPage=1&searchOption=&keyword=" > ';
				str+= ' <img src="${path}/resources/upload/'+data.list3.fullName+'" style="width: 210px; height: 210px;"> </a> </div>';
				str+= ' <div class="banner-bottom1 text-center"> ';
				str+= ' <div class="banner-bottom-title" style="width: 100%; overflow: hidden; top: 50%;"> ';
				str+= ' <a href="${path}/tmouse/view.do?idx='+data.list3.idx+'&curPage=1&searchOption=&keyword=&crea_id='+data.list3.crea_id+'"> ';
				str+=  data.list3.modelname+'</a></div></div></div> ';
		 		$('#keyboardRank').html(str);
		 		
		 		circleGraph(data.list1.mSalesAmount, data.list1.kSalesAmount);
		 	},
		 	error: function(xhr) {
		 	  console.log('실패 - ', xhr);
		 	}
		});
	});
	// 체크된 항목(cart_id) 배열생성
	function order() {
		var idx = document.getElementsByName("check");
		for (var i = 0; i < idx.length; i++) {
			if (idx[i].checked == true) {
				var list = new Array(idx[i].value);
			}
		}
	}	
</script>

<script> //그래프 스크립트
	// 그래프 1
	var randomScalingFactor = function() {
		return Math.round(Math.random() * 100)
	};
	
	
	
	/* $.ajax({
		type : "POST",
		url: " ",
	 	contentType: "text/plain; charset=utf-8",
	 	dataType : "json",
	 	success: function(data) {
	 		var str=null;
	 		str+=
	 		$('cavaus2').html(str);
	 	},
	 	error: function(xhr) {
	 	  console.log('실패 - ', xhr);
	 	}
	});
	
	$.ajax({
		type : "POST",
		url: " ",
	 	contentType: "text/plain; charset=utf-8",
	 	dataType : "json",
	 	success: function(data) {
	 		var str=null;
	 		str+=
	 		$('cavaus2').html(str);
	 		$('cavaus2').html(str);
	 		$('cavaus2').html(str);
	 		$('cavaus2').html(str);
	 		$('cavaus2').html(str);
	 		$('cavaus2').html(str);
	 	},
	 	error: function(xhr) {
	 	  console.log('실패 - ', xhr);
	 	}
	});
	$.ajax({
		type : "POST",
		url: " ",
	 	contentType: "text/plain; charset=utf-8",
	 	dataType : "json",
	 	success: function(data) {
	 		var str=null;
	 		str+=
	 		$('cavaus2').html(str);
	 	},
	 	error: function(xhr) {
	 	  console.log('실패 - ', xhr);
	 	}
	});
	$.ajax({
		type : "POST",
		url: " ",
	 	contentType: "text/plain; charset=utf-8",
	 	dataType : "json",
	 	success: function(data) {
	 		var str=null;
	 		str+=
	 		$('cavaus2').html(str);
	 	},
	 	error: function(xhr) {
	 	  console.log('실패 - ', xhr);
	 	}
	}); */
	var lineBarChartData = {
		labels : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
		datasets : [
				/* {
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
				}, */
				{
					fillColor : "rgba(220,220,220,0.5)",
					strokeColor : "rgba(220,220,220,0.8)",
					highlightFill : "rgba(220,220,220,0.75)",
					highlightStroke : "rgba(220,220,220,1)",
					data : [ randomScalingFactor(), randomScalingFactor(),
							randomScalingFactor(), randomScalingFactor(),
							randomScalingFactor(), randomScalingFactor(),
							randomScalingFactor(), randomScalingFactor(),
							randomScalingFactor(), randomScalingFactor(),
							randomScalingFactor(), randomScalingFactor() ]
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
		var ctx = document.getElementById("canvas5").getContext("2d");
		chart = new Chart(ctx).LineBar(lineBarChartData, {
			responsive : true
		});
	});
	
	// 그래프 2
	function circleGraph(a,b){
		var chartData = [
			{
				value : a,
				color : "#F7464A",
				highlight : "#FF5A5E",
				label : "마우스"
			}, {
				value : b,
				color : "#46BFBD",
				highlight : "#5AD3D1",
				label : "키보드"
			}
		];
		var chart = null;
		var canvas = null;
		var ctx = null;
		var legendHolder = null;
		var helpers = Chart.helpers;
		$(function() {
			canvas = document.getElementById("canvas1");
			legendHolder = document.createElement('div');
			ctx = canvas.getContext("2d");
			chart = new Chart(ctx).Pie(chartData, {
				animateScale : true,
				animation : true,
				responsive : true,
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
	}
	
	
/* 	// 그래프 3
	var radarChartData = {
		label: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
		datasets : [
				{
					fillColor : "rgba(220,220,220,0.5)",
					strokeColor : "rgba(220,220,220,0.8)",
					pointColor : "rgba(220,220,220,0.75)",
					pointStrokeColor : "rgba(220,220,220,1)",
					points : [ randomScalingFactor(), randomScalingFactor(),
							randomScalingFactor(), randomScalingFactor(),
							randomScalingFactor(), randomScalingFactor(),
							randomScalingFactor(), randomScalingFactor(),
							randomScalingFactor(), randomScalingFactor(),
							randomScalingFactor(), randomScalingFactor() ]
				},
				{
					fillColor : "rgba(151,187,205,0.5)",
					strokeColor : "rgba(151,187,205,0.8)",
					pointColor : "rgba(151,187,205,0.75)",
					pointStrokeColor : "rgba(151,187,205,1)",
					points : [ randomScalingFactor(), randomScalingFactor(),
							randomScalingFactor(), randomScalingFactor(),
							randomScalingFactor(), randomScalingFactor(),
							randomScalingFactor() ]
				}
		]
	};
	var chart = null;
	var canvas = null;
	var ctx = null;
	var legendHolder = null;
	var helpers = Chart.helpers;
	$(function() {
		var ctx = document.getElementById("canvas4").getContext("2d");
		chart = new Chart(ctx).radar(radarChartData, {
			responsive : true
		});
	}); */
	
	
		var radarChart = null;
		var radarChartData = {
			labels : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
			datasets: [
				
					{
						fillColor : "rgba(220,220,220,0.5)",
						strokeColor : "rgba(220,220,220,0.8)",
						pointColor : "rgba(220,220,220,0.75)",
						pointStrokeColor : "rgba(220,220,220,1)",
						pointHighlightFill: "#fff",
						pointHighlightStroke: "rgba(220,220,220,0.8)",
						data : [ randomScalingFactor(), randomScalingFactor(),
								randomScalingFactor(), randomScalingFactor(),
								randomScalingFactor(), randomScalingFactor(),
								randomScalingFactor(), randomScalingFactor(),
								randomScalingFactor(), randomScalingFactor(),
								randomScalingFactor(), randomScalingFactor() ]
					},
					{
						fillColor : "rgba(151,187,205,0.5)",
						strokeColor : "rgba(151,187,205,0.8)",
						pointColor : "rgba(151,187,205,0.75)",
						pointStrokeColor : "rgba(151,187,205,1)",
						pointHighlightFill: "#fff",
						pointHighlightStroke: "rgba(151,187,205,0.8)",
						data : [ randomScalingFactor(), randomScalingFactor(),
							randomScalingFactor(), randomScalingFactor(),
							randomScalingFactor(), randomScalingFactor(),
							randomScalingFactor(), randomScalingFactor(),
							randomScalingFactor(), randomScalingFactor(),
							randomScalingFactor(), randomScalingFactor() ]
					}
				
					/* label: "My Second dataset",
					fillColor: "rgba(151,187,205,0.2)",
					strokeColor: "rgba(151,187,205,1)",
					pointColor: "rgba(151,187,205,1)",
					pointStrokeColor: "#fff",
					pointHighlightFill: "#fff",
					pointHighlightStroke: "rgba(151,187,205,1)",
					data: [a,b,c,d,e] */
				
			]
		};

		$(function() {
			var ctx = document.getElementById("canvas4").getContext("2d");
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
		$("canvas4").on("click", function(e) {
			var activePoints = radarChart.getPointsAtEvent(e);
			console.log(activePoints);

			for(var i in activePoints) {
				console.log(activePoints[i].value);
			}
		});

	
</script>
</head>
<body>
	<!-- Breadcrumbs Area Start -->
	<div class="breadcrumbs-area" style="background-image: url('${path}/resources/writer/img/bigpicture/biz.png');">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div style="padding: 80px 0;height: 0px;text-align:center;">
						<h2>사업자 페이지</h2> 
					</div>
					<!-- layer 1 -->      
					<div class="col-md-12" style="text-align:center;">  
						<div class="col-md-2 col-sm-2 col-xs-6"></div>
						<div class="col-md-2 col-sm-2 col-xs-6">
							<div class="single-counter wow" data-wow-duration="1.5s" data-wow-delay=".3s">
								<div class="counter-info">
									<span>
										<span id="counter1" style="font-size: 30px">0</span>
									</span>
									<h3>마우스 재고량</h3>								
								</div>
							</div>		                
			            </div>
						<div class="col-md-2 col-sm-2 col-xs-6">
							<div class="single-counter wow" data-wow-duration="1.5s" data-wow-delay=".3s">
								<div class="counter-info" style="font-size: 30px">
									<span>
										<span id="counter2">0</span>
									</span>
									<h3>마우스 판매량</h3>								
								</div>
							</div>		                
			            </div>
						<div class="col-md-2 col-sm-2 col-xs-6">
							<div class="single-counter wow" data-wow-duration="1.5s" data-wow-delay=".3s">
								<div class="counter-info" style="font-size: 30px">
									<span>
										<span id="counter3">0</span>
									</span>
									<h3>마우스 매출액</h3>								
								</div>
							</div>		                
			            </div>
						<div class="col-md-2 col-sm-2 col-xs-6">
							<div class="single-counter wow" data-wow-duration="1.5s" data-wow-delay=".3s">
								<div class="counter-info" style="font-size: 30px">
									<span>
										<span id="counter4">0</span>
									</span>
									<h3>총 판매량</h3>								
								</div>
							</div>		                
			            </div>
					</div>
					<!-- layer 2 --> 
					<div class="col-md-12" style="text-align:center;">
						<div class="col-md-2 col-sm-2 col-xs-6"></div>
						<div class="col-md-2 col-sm-2 col-xs-6">
							<div class="single-counter wow" data-wow-duration="1.5s" data-wow-delay=".3s"> 
								<div class="counter-info">
									<span>
										<span id="counter5" style="font-size: 30px">0</span>
									</span>
									<h3>키보드 재고량</h3>								
								</div>
							</div>		                
			            </div>
			            <div class="col-md-2 col-sm-2 col-xs-6">
							<div class="single-counter wow" data-wow-duration="1.5s" data-wow-delay=".3s">
								<div class="counter-info">
									<span>
										<span id="counter6" style="font-size: 30px">0</span>
									</span>
									<h3>키보드 판매량</h3>								
								</div>
							</div>		                
			            </div>
			            <div class="col-md-2 col-sm-2 col-xs-6">
							<div class="single-counter wow" data-wow-duration="1.5s" data-wow-delay=".3s">
								<div class="counter-info">
									<span>
										<span id="counter7" style="font-size: 30px">0</span>
									</span>
									<h3>키보드 매출액</h3>								
								</div>
							</div>		                
			            </div>
			            <div class="col-md-2 col-sm-2 col-xs-6">
							<div class="single-counter wow" data-wow-duration="1.5s" data-wow-delay=".3s">
								<div class="counter-info">
									<span>
										<span id="counter8" style="font-size: 30px">0</span>
									</span>
									<h3>총 매출액</h3>								
								</div>
							</div>		                
			            </div> 
					</div>
					
				</div>
			</div>
		</div>
	</div> 
	<!-- Breadcrumbs Area End --> 
	<!-- Cart Area Start -->
	<div class="shopping-cart-area">
		<div class="container">
			<div class="p-details-tab-content">
 				<div style="margin-top:20px;">
					<form name="frm" method="post" action="${path}/business/orderList.do" >
						<input type="text" name="startDate" id="datepicker1"> ~ <input type="text" name="endDate" id="datepicker2">
						<button style="margin-top:10px;" type="submit">조회</button>
					</form>
				</div>
				<div class="p-details-tab" style="margin-top: 30px;"> 
					<ul class="p-details-nav-tab">
						<li role="presentation" class="active"><a href="#" id="btnone">주문내역</a></li>
						<li role="presentation"><a href="#" id="btntwo">환불내역</a></li>
						<li role="presentation"><a href="#" id="btnthree">교환내역</a></li>
					</ul>
				</div>
                <div>
					<div id="one">
						<form name="frm" method="post" action="${path}/business/payment.do?searchOption=order" onsubmit="return order();">
							<div class="orderlist_scroll">
								<c:choose>
									<c:when test="${map.listcount1 == 0}">
										<p class="desc_nodata">주문들어온 내역이 없습니다.</p>
									</c:when>
						        	<c:otherwise>
							        	<span class="choice_g choice_all" style="height:0%;">
											<input type="checkbox" id="allCheck1"/>
											<label for="checkAll" class="lab_g">
												전체 선택
											</label>
										</span>
										<ul class="list_basket">
											<c:forEach var="row1" items="${map.list1}" varStatus="i">
												<input type="hidden"  name="idx" value="${row1.idx}"> 
						         			 	<input type="hidden"  name="kind" value="${row1.kind}">
												<li class="check_on">
													<span class="choice_g choice_basket">
														<input type="checkbox" class="check_id1" name="check" value="${row1.cart_id }" >
													</span>
													<a href="${path}/${row1.kind}/view.do?idx=${row1.idx}&curPage=1&searchOption=${map.searchOption}&keyword=${map.keyword}" class="link_thumb">
														<img src="${path}/resources/upload${row1.fullName}" class="thumb_g" alt="">
													</a>
													<div class="desc_basket">
														상품번호 ${row1.cart_id }<input type="hidden" id="cart_id" name="cart_id" value="${row1.cart_id}"/>
														<strong class="tit_product">
															<a href="${path}/${row1.kind}/view.do?idx=${row1.idx}&curPage=1&searchOption=${map.searchOption}&keyword=${map.keyword}" class="link_product">
																${row1.modelname}
															</a>
														</strong>
														<ul class="list_append">
															<li>
																<em class="tit_append">단가 :</em>
																<span class="product_price">
																	<fmt:formatNumber pattern="###,###,###" value="${row1.price}"/>
																	<input type="hidden" name="price" value="${row1.price}">
																</span>원
															</li>
															<li>
																<em class="tit_append">수량 :</em>
																<span class="product_price">
																	<input type="text" style="width: 10px; border: none;" name="amount" value="${row1.amount}" readonly="readonly">
																</span>개
																 <input type="hidden"  name="amount" value="${row1.amount}"/>
															</li>
															<li name="price">
																<em class="tit_append">금액 :</em>
																<span class="product_price">
							                        				<fmt:formatNumber pattern="###,###,###" value="${row1.money}"/>
																</span>원
																<input type="hidden" value="${row1.money}"/>
															</li>
														</ul>
														<ul class="list_append1">
															<li>
																<em class="tit_append">구매자 :</em>
																<span class="product_price">
																	${row1.user_id}
																</span>
															</li>
															<li>
																<em class="tit_append">상태 :</em>
																<span class="product_price">
																	<c:if test="${row1.shippingStatus eq 0}">
											                    		결제확인
											                    	</c:if>
											                    	<c:if test="${row1.shippingStatus eq 1}">
											                    		배송중
											                    	</c:if>
											                    	<c:if test="${row1.shippingStatus eq 2}">
											                    		배송완료
											                    	</c:if>
											                    	<c:if test="${row1.shippingStatus eq 3}">
											                    		환불신청
											                    	</c:if>
											                    	<c:if test="${row1.shippingStatus eq 4}">
											                    		환불완료
											                    	</c:if>
											                    	<c:if test="${row1.shippingStatus eq 5}">
											                    		교환신청
											                    	</c:if>
											                    	<c:if test="${row1.shippingStatus eq 6}">
											                    		교환중
											                    	</c:if>
											                    	<c:if test="${row1.shippingStatus eq 7}">
											                    		교환완료
							                    					</c:if>
																</span>
															</li>
															<li name="price">
																<em class="tit_append">주문일자 :</em>
																<span class="product_price">
							                        				${row1.orderdate}
																</span>
															</li>
														</ul>
													</div>
												</li>
											</c:forEach>
										</ul>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="shopingcart-bottom-area">
								<button style="float:right;margin-top:10px;" type="submit" name="order">배송시작</button>
	                        </div>
						</form>
					</div>
                    <div id="two">
						<form name="frm" method="post" action="${path}/business/payment.do?searchOption=refund" onsubmit="return order();">
							<div class="orderlist_scroll">
								<c:choose>
									<c:when test="${map.listcount2 == 0}">
										<p class="desc_nodata">환불내역이 없습니다.</p>
									</c:when>
									<c:otherwise>
										<span class="choice_g choice_all" style="height:0%;">
											<input type="checkbox" id="allCheck2"/>
											<label for="checkAll" class="lab_g">
												전체 선택
											</label>
										</span>
										<ul class="list_basket">
											<c:forEach var="row2" items="${map.list2}" varStatus="i">
												<input type="hidden"  name="idx" value="${row2.idx}"> 
						         			 	<input type="hidden"  name="kind" value="${row2.kind}">
												<li class="check_on">
													<span class="choice_g choice_basket">
														<input type="checkbox" class="check_id2" name="check" value="${row2.cart_id }" >
													</span>
													<a href="${path}/${row2.kind}/view.do?idx=${row2.idx}&curPage=1&searchOption=${map.searchOption}&keyword=${map.keyword}" class="link_thumb">
														<img src="${path}/resources/upload${row2.fullName}" class="thumb_g" alt="">
													</a>
													<div class="desc_basket">
														상품번호 ${row2.cart_id }<input type="hidden" id="cart_id" name="cart_id" value="${row2.cart_id}"/>
														<strong class="tit_product">
															<a href="${path}/${row2.kind}/view.do?idx=${row2.idx}&curPage=1&searchOption=${map.searchOption}&keyword=${map.keyword}" class="link_product">
																${row2.modelname}
															</a>
														</strong>
														<ul class="list_append">
															<li>
																<em class="tit_append">단가 :</em>
																<span class="product_price">
																	<fmt:formatNumber pattern="###,###,###" value="${row2.price}"/>
																	<input type="hidden" name="price" value="${row2.price}">
																</span>원
															</li>
															<li>
																<em class="tit_append">수량 :</em>
																<span class="product_price">
																	<input type="text" style="width: 10px; border: none;" name="amount" value="${row2.amount}" readonly="readonly">
																</span>개
																 <input type="hidden"  name="amount" value="${row2.amount}"/>
															</li>
															<li name="price">
																<em class="tit_append">금액 :</em>
																<span class="product_price">
							                        				<fmt:formatNumber pattern="###,###,###" value="${row2.money}"/>
																</span>원
																<input type="hidden" value="${row2.money}"/>
															</li>
														</ul>
														<ul class="list_append1">
															<li>
																<em class="tit_append">구매자 :</em>
																<span class="product_price">
																	${row2.user_id}
																</span>
															</li>
															<li>
																<em class="tit_append">상태 :</em>
																<span class="product_price">
																	<c:if test="${row2.shippingStatus eq 0}">
											                    		결제확인
											                    	</c:if>
											                    	<c:if test="${row2.shippingStatus eq 1}">
											                    		배송중
											                    	</c:if>
											                    	<c:if test="${row2.shippingStatus eq 2}">
											                    		배송완료
											                    	</c:if>
											                    	<c:if test="${row2.shippingStatus eq 3}">
											                    		환불신청
											                    	</c:if>
											                    	<c:if test="${row2.shippingStatus eq 4}">
											                    		환불완료
											                    	</c:if>
											                    	<c:if test="${row2.shippingStatus eq 5}">
											                    		교환신청
											                    	</c:if>
											                    	<c:if test="${row2.shippingStatus eq 6}">
											                    		교환중
											                    	</c:if>
											                    	<c:if test="${row2.shippingStatus eq 7}">
											                    		교환완료
							                    					</c:if>
																</span>
															</li>
															<li name="price">
																<em class="tit_append">주문일자 :</em>
																<span class="product_price">
							                        				${row2.orderdate}
																</span>
															</li>
														</ul>
													</div>
												</li>
											</c:forEach>
										</ul>
									</c:otherwise>
								</c:choose>
							</div>
	                        <div class="shopingcart-bottom-area">
								<button style="float:right;margin-top:10px;" type="submit" name="order">환불승인</button>
							</div>
						</form>
					</div>
					<div id="three">
						<form name="frm" method="post" action="${path}/business/payment.do?searchOption=exchange" onsubmit="return order();">
							<div class="orderlist_scroll">
 								<c:choose>
									<c:when test="${map.listcount3 == 0}">
										<p class="desc_nodata">교환내역이 없습니다.</p>
									</c:when>
									<c:otherwise>
										<span class="choice_g choice_all" style="height:0%;">
											<input type="checkbox" id="allCheck3"/>
											<label for="checkAll" class="lab_g">
												전체 선택
											</label>
										</span>
										<ul class="list_basket">
											<c:forEach var="row3" items="${map.list3}" varStatus="i">
												<input type="hidden"  name="idx" value="${row3.idx}"> 
						         			 	<input type="hidden"  name="kind" value="${row3.kind}">
												<li class="check_on">
													<span class="choice_g choice_basket">
														<input type="checkbox" class="check_id3" name="check" value="${row3.cart_id }" >
													</span>
													<a href="${path}/${row3.kind}/view.do?idx=${row3.idx}&curPage=1&searchOption=${map.searchOption}&keyword=${map.keyword}" class="link_thumb">
														<img src="${path}/resources/upload${row3.fullName}" class="thumb_g" alt="">
													</a>
													<div class="desc_basket">
														상품번호 ${row3.cart_id }<input type="hidden" id="cart_id" name="cart_id" value="${row3.cart_id}"/>
														<strong class="tit_product">
															<a href="${path}/${row3.kind}/view.do?idx=${row3.idx}&curPage=1&searchOption=${map.searchOption}&keyword=${map.keyword}" class="link_product">
																${row3.modelname}
															</a>
														</strong>
														<ul class="list_append">
															<li>
																<em class="tit_append">단가 :</em>
																<span class="product_price">
																	<fmt:formatNumber pattern="###,###,###" value="${row3.price}"/>
																	<input type="hidden" name="price" value="${row3.price}">
																</span>원
															</li>
															<li>
																<em class="tit_append">수량 :</em>
																<span class="product_price">
																	<input type="text" style="width: 10px; border: none;" name="amount" value="${row3.amount}" readonly="readonly">
																</span>개
																 <input type="hidden"  name="amount" value="${row3.amount}"/>
															</li>
															<li name="price">
																<em class="tit_append">금액 :</em>
																<span class="product_price">
							                        				<fmt:formatNumber pattern="###,###,###" value="${row3.money}"/>
																</span>원
																<input type="hidden" value="${row3.money}"/>
															</li>
														</ul>
														<ul class="list_append1">
															<li>
																<em class="tit_append">구매자 :</em>
																<span class="product_price">
																	${row3.user_id}
																</span>
															</li>
															<li>
																<em class="tit_append">상태 :</em>
																<span class="product_price">
																	<c:if test="${row3.shippingStatus eq 0}">
											                    		결제확인
											                    	</c:if>
											                    	<c:if test="${row3.shippingStatus eq 1}">
											                    		배송중
											                    	</c:if>
											                    	<c:if test="${row3.shippingStatus eq 2}">
											                    		배송완료
											                    	</c:if>
											                    	<c:if test="${row3.shippingStatus eq 3}">
											                    		환불신청
											                    	</c:if>
											                    	<c:if test="${row3.shippingStatus eq 4}">
											                    		환불완료
											                    	</c:if>
											                    	<c:if test="${row3.shippingStatus eq 5}">
											                    		교환신청
											                    	</c:if>
											                    	<c:if test="${row3.shippingStatus eq 6}">
											                    		교환중
											                    	</c:if>
											                    	<c:if test="${row3.shippingStatus eq 7}">
											                    		교환완료
							                    					</c:if>
																</span>
															</li>
															<li name="price">
																<em class="tit_append">주문일자 :</em>
																<span class="product_price">
							                        				${row3.orderdate}
																</span>
															</li>
														</ul>
													</div>
												</li>
											</c:forEach>
										</ul>
									</c:otherwise>
								</c:choose>
							</div>
	                        <div class="shopingcart-bottom-area">
	                        	<button style="float:right;margin-top:10px;" type="submit" name="order">교환승인</button>
	                        </div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Cart Area End -->
		
		<div class="online-banner">
	<div class="container">
		<!-- <div class="banner-title text-center">
			<h1>
				당신을위한 <span>PressFit</span>의 노력<br>
			</h1>
			<h3>
				-<span>PressFit</span>정보수집 현황-
			</h3>
		</div> -->
		<div class="row">
			<div class="banner-list" style="align:center">
				<div class="col-md-4 col-sm-4">
					<div class="single-banner" style="padding:5%">
						<div style="height=350;width=350">
							<div style="width:70%;">
							<canvas id="canvas1" style="width: 100%; height: 100%;" height="402" width="402"></canvas>
							<ul class="polararea-legend">
								<li><span style="background-color:#F7464A"></span>마우스</li>
								<li><span style="background-color:#46BFBD"></span>키보드</li>
							</ul>
							</div>
						</div>
						<div class="banner-bottom text-center">
							<a href="#">제품 판매량</a>
						</div>
					</div>
				</div>
				<div class="col-md-4 col-sm-4">
					<div class="single-banner" style="padding:5%">
						<div id="mouseRank" style="height=350;width=350">
							
						</div>
						<div class="banner-bottom text-center">
							<a href="#">마우스 판매 1위</a>
						</div>
					</div>
				</div>
				<div class="col-md-4 col-sm-4">
					<div class="single-banner" style="padding:5%">
						<div id="keyboardRank" style="height=350;width=350">
							
						</div>
						<div class="banner-bottom text-center">
							<a href="#">키보드 판매 1위</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="banner-list" style="align:center">
				<div class="col-md-6 col-sm-6">
					<div class="single-banner" style="padding:5%">
						<div style="height=350;width=350">
							<div style="width:70%;">
								<canvas id="canvas4" style="width: 100%; height: 100%;" height="402" width="402"></canvas>
								<ul class="polararea-legend">
									<li><span style="background-color:rgba(220,220,220,0.5)"></span>마우스</li>
									<li><span style="background-color:rgba(151,187,205,0.8)"></span>키보드</li>
								</ul>
							</div>
						</div>
						<div class="banner-bottom text-center">
							<a href="#">제품 판매량</a>
						</div>
					</div>
				</div>
				
				<div class="col-md-6 hidden-sm">
					<div class="single-banner" style="padding:5%">
						<div style="height=350;width=350">
							<div style="width:80%;">
								<canvas id="canvas5" style="width: 100%; height: 100%;" height="402" width="402"></canvas>
								<ul class="polararea-legend">
									<li><span style="background-color:rgba(220,220,220,0.8)"></span>마우스</li>
									<li><span style="background-color:rgba(151,187,205,0.8)"></span>키보드</li>
								</ul>
							</div>
						</div>
						<div class="banner-bottom text-center">
							<a href="#">2017 제품 판매량</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
		
        <!-- Discount Area Start -->
        <div class="discount-area">
            <div class="container">
                <div class="row">
                   
                </div>
            </div>
        </div>
        <!-- Discount Area End -->
        
		<%@ include file="/resources/include/footer.jsp" %>
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
		<script src="${path}/resources/admin/num/jquery.animateNumber.min.js"></script>
		<script src="${path}/resources/admin/num/jquery.color.min.js"></script>
    </body>
</html>