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
<script>
$(document).ready(function() {
	var chart = null;
	var canvas = null;
	var ctx = null;
	var legendHolder = null;
	var helpers = Chart.helpers;
	var months = [ "성능", "디자인", "가격", "관심도"];
	$.ajax({
		type : "POST",
		url: "http://192.168.1.61:8900/?q=${q}",
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
			$(function() {
				var canvas = document.getElementById("canvas4");
				var legendHolder = document.createElement('div');
				var ctx = canvas.getContext("2d");
				var chart = new Chart(ctx).PolarArea([ {
					value : randomScalingFactor(),
					color : "#F7464A",
					highlight : "#FF5A5E",
					label : "성능"
				}, {
					value : randomScalingFactor(),
					color : "#46BFBD",
					highlight : "#5AD3D1",
					label : "디자인"
				}, {
					value : randomScalingFactor(),
					color : "#FDB45C",
					highlight : "#FFC870",
					label : "가격"
				}, {
					value : randomScalingFactor(),
					color : "#4D5360",
					highlight : "#A8B3C5",
					label : "관심도"
				}], {
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
			$(function() {
				var ctx = document.getElementById("canvas3").getContext("2d");
				var chart = new Chart(ctx).LineBar({
					labels : [ "성능", "디자인", "가격", "관심도"],
					datasets : [
							{
								fillColor : "rgba(149,225,240,0.5)",
								strokeColor : "rgba(149,225,240,0.9)",
								highlightFill : "rgba(149,225,240,0.75)",
								highlightStroke : "rgba(149,225,240,1)",
								data : [ randomScalingFactor(), randomScalingFactor(),
										randomScalingFactor(), randomScalingFactor() ]
							},
							{
								fillColor : "rgba(151,200,255,0.5)",
								strokeColor : "rgba(151,200,255,0.9)",
								highlightFill : "rgba(151,200,255,0.75)",
								highlightStroke : "rgba(151,200,255,1)",
								data : [ randomScalingFactor(), randomScalingFactor(),
										randomScalingFactor(), randomScalingFactor() ]
							} ]
			
				}, {
					responsive : true
				});
			});
			$(function() {
				var ctx = document.getElementById("canvas").getContext("2d");
				var radarChart = new Chart(ctx).Radar({
					labels : [ "성능", "디자인", "가격", "관심도"],
					datasets: [
							{
								label: "My Second dataset",
								fillColor: "rgba(90,68,210,0.2)",
								strokeColor: "rgba(90,68,210,1)",
								pointColor: "rgba(90,68,210,1)",
								pointStrokeColor: "#fff",
								pointHighlightFill: "#fff",
								pointHighlightStroke: "rgba(90,68,210,1)",
								data: [randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor()]
							}
						]
					}, {
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
			$(function() {
				var ctx = document.getElementById("canvas2").getContext("2d");
				var radarChart = new Chart(ctx).Radar({
					labels : [ "성능", "디자인", "건강", "관심도", "촣은평가" , "나쁜평가"],
					datasets: [
							{
								label: "My First dataset",
								fillColor: "rgba(50,110,120,0.2)",
								strokeColor: "rgba(50,110,120,1)",
								pointColor: "rgba(50,110,220,1)",
								pointStrokeColor: "#fff",
								pointHighlightFill: "#fff",
								pointHighlightStroke: "rgba(50,110,220,1)",
								data: [randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor()]
							}
						]
					}, {
					scaleShowLine : true,
					angleShowLineOut : true,
					scaleShowLabels : false,
					scaleBeginAtZero : true,
					angleLineColor : "rgba(0,0,0,0.1)",
					angleLineWidth : 1,
					pointLabelFontFamily : "'Arial'",
					pointLabelFontStyle : "normal",
					pointLabelFontSize : 10,
					pointLabelFontColor : "#666",
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
height: 130%;
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
  <div id="intro" style="position: ixed;">
    <!-- Online Banner Area Start -->
	<script>
		var randomScalingFactor = function() {return Math.round(Math.random() * 200)};
		
	</script>

	<div class="row" style="top: 270px;position: relative;">
		<div class="banner-list" style="padding:8%">
					<div class="col-md-12 col-sm-7">
						<div class="single-banner">
							<div class="banner-bottom text-center">
							<div class="zt-span6 last" style="padding-top: 0px;padding-right: 10px;padding-bottom: 0px;padding-left: 10px;">
								<div class="zt-skill-bar"><div data-width="80" style="">리뷰를 찾아라! naverblog(100개중)<span>80개</span></div></div>
								<div class="zt-skill-bar"><div data-width="100" style="">분석 진행 현황<span>100%</span></div></div>
							</div>
							</div>
						</div>
					</div>
					<div class="col-md-1"></div>
					<div class="col-md-3 col-sm-6">
						<div class="single-banner" style="padding: 5%;background-color: white;">
							<div class="price">
								추가사항 <br/>65%
							</div>
							<canvas id="canvas" style="" height="260" width="260"></canvas>
							<div class="banner-bottom text-center">
								<a href="#">제품평가에서 이런평가를 받았어요.<br/>종합점수 : <strong>55</strong></a>
							</div>
						</div>
					</div>
					<div class="col-md-4 col-sm-8">
						<div class="single-banner">
							<a href="#">
							<img src="<c:url value='/resources/writer/img/banner/3.jpg' />"alt="">
							</a>
							<div class="price">
								판매순위 30위
							</div>
							<div class="banner-bottom text-center">
								<a href="#">추천 상품</a>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-6">
						<div class="single-banner" style="padding: 5%;background-color: white;">
							<div class="price">
								분석정확도 <br/>65%
							</div>
							<canvas id="canvas2" style="" height="260" width="260"></canvas>
							<div class="banner-bottom text-center">
								<a href="#">리뷰에서 이런평가를 받았어요.<br/>종합점수 : <strong>24</strong></a>
							</div>
						</div>
					</div>
				</div>
			</div>
	<div class="row" style="top: 230px;position:relative;">
		<div class="banner-list" style="padding:3%">
					<div class="col-md-3 col-sm-6">
						<div class="single-banner" style="padding: 5%;background-color: white">
							<div>
								<canvas id="canvas3" style="" height="262" width="262"></canvas>
							</div>
							<div class="banner-bottom text-center">
								<a href="#">제품군 종합 스펙 비율 <br/>제품군 전체:제품</a>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-6">
						<div class="single-banner" style="padding: 5%;background-color: white">
							<div>
								<canvas id="canvas4" style="" height="262" width="262"></canvas>
							</div>
							<div class="banner-bottom text-center">
								<a href="#">제품 스펙비율</a>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-6">
						<div class="single-banner" style="padding: 5%;background-color: white">
							<a href="#"><span>좋아</span></a>
							<a href="#"><span>좋아</span></a>
							<a href="#"><span>좋아</span></a>
							<a href="#"><span>좋아</span></a>
							<a href="#"><span>좋아</span></a>
							<a href="#"><span>좋아</span></a>
							<a href="#"><span>좋아</span></a>
							<a href="#"><span>좋아</span></a>
							<div class="banner-bottom text-center">
								<a href="#">분석 리뷰 리스트</a>
							</div>
						</div>
					</div>
					
					<div class="col-md-3 col-sm-6">
						<div class="single-banner" style="padding: 5%;background-color: white">
							<table>
							<tr><td>1</td><td>1</td></tr>
							<tr><td>1</td><td>1</td></tr>
							<tr><td>1</td><td>1</td></tr>
							<tr><td>1</td><td>1</td></tr>
							<tr><td>1</td><td>1</td></tr>
							<tr><td>1</td><td>1</td></tr>
							<tr><td>1</td><td>1</td></tr>
							<tr><td>1</td><td>1</td></tr>
							</table>
							<div class="banner-bottom text-center">
								<a href="#">제품 기본사항</a>
							</div>
						</div>
					</div>		
				</div>
			</div>
<div class="row" style="top: 210px;position:relative;">
		<div class="banner-list" style="padding:3%">
		<h2>-추가 추천 상품리스트-</h2>
			<div class="col-md-2 col-sm-6">
				<div class="single-banner">
				<a href="#"> <img
				src="<c:url value='/resources/writer/img/banner/2.jpg' />"
				alt="">
				</a>
				<div class="price">
						<span>$</span>160
				</div>
					<div class="banner-bottom text-center">
					<a href="#">2순위</a>
					</div>
				</div>
			</div>
			<div class="col-md-2 col-sm-6">
				<div class="single-banner">
				<a href="#"> <img
				src="<c:url value='/resources/writer/img/banner/2.jpg' />"
				alt="">
				</a>
				<div class="price">
						<span>$</span>160
				</div>
					<div class="banner-bottom text-center">
					<a href="#">3순위</a>
					</div>
				</div>
			</div>
			<div class="col-md-2 col-sm-6">
				<div class="single-banner">
				<a href="#"> <img
				src="<c:url value='/resources/writer/img/banner/2.jpg' />"
				alt="">
				</a>
				<div class="price">
						<span>$</span>160
				</div>
					<div class="banner-bottom text-center">
					<a href="#">비슷한 조건의 제품</a>
					</div>
				</div>
			</div>
			<div class="col-md-2 col-sm-6">
				<div class="single-banner">
				<a href="#"> <img
				src="<c:url value='/resources/writer/img/banner/2.jpg' />"
				alt="">
				</a>
				<div class="price">
						<span>$</span>160
				</div>
					<div class="banner-bottom text-center">
					<a href="#">비슷한 평가의 제품</a>
					</div>
				</div>
			</div>
			<div class="col-md-2 col-sm-6">
				<div class="single-banner">
				<a href="#"> <img
				src="<c:url value='/resources/writer/img/banner/2.jpg' />"
				alt="">
				</a>
				<div class="price">
						<span>$</span>160
				</div>
					<div class="banner-bottom text-center">
					<a href="#">같은회사의 제품</a>
					</div>
				</div>
			</div>
			<div class="col-md-2 col-sm-6">
				<div class="single-banner">
				<a href="#"> <img
				src="<c:url value='/resources/writer/img/banner/2.jpg' />"
				alt="">
				</a>
				<div class="price">
						<span>$</span>160
				</div>
					<div class="banner-bottom text-center">
					<a href="#">관리자 추천 제품</a>
					</div>
				</div>
			</div>
			
		</div>
</div>
		
	</div>
</div>

</body>
	<%@ include file="/resources/include/footer.jsp" %>
</html>