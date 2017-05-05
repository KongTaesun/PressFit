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
function graph(){
	var randomScalingFactor = function() {return Math.round(Math.random() * 200)};
}
function typeanswerlist(answerlist){
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
		    },1500);
		}
	}, 1500);
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
	
};
function type3obj(obj){
	
};
function type4obj(obj){
	
};
function type5obj(obj){
	
};
function type6obj(obj){
	
};
function type7obj(obj){
	
};
function type8obj(obj){
	
};
function type9obj(obj){
	
};
function type10obj(obj){
	
};
$(document).ready(function() {
	$('#intro').css('margin-top', '-350px');
	$('#first').hide();
	$('#first1').hide();
	$('#list').hide();
	
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
				typeanswerlist(data.answerlist);
				type1obj(data.obj);
			}
			else if(data.type == 2){
				type2answerlist(data.answerlist);
			}
			else if(data.type == 3){
				typeanswerlist(data.answerlist);
				type3obj(data.obj);
			}
			else if(data.type == 4){
				typeanswerlist(data.answerlist);
				type4obj(data.obj);
			}
			else if(data.type == 5){
				typeanswerlist(data.answerlist);
				type5obj(data.obj);
			}
			else if(data.type == 6){
				typeanswerlist(data.answerlist);
				type6obj(data.obj);
			}
			else if(data.type == 7){
				typeanswerlist(data.answerlist);
				type7obj(data.obj);
			}
			else if(data.type == 8){
				typeanswerlist(data.answerlist);
				type8obj(data.obj);
			}
			else if(data.type == 9){
				typeanswerlist(data.answerlist);
				type9obj(data.obj);
				}
			else if(data.type == 10){
				typeanswerlist(data.answerlist);
				type10obj(data.obj);
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
	<div id="first" class="row" style="top: 270px;position: relative;">
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
	<div id="first1" class="row" style="top: 230px;position:relative;">
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
<div id="list" class="row" style="top: 210px;position:relative;">
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