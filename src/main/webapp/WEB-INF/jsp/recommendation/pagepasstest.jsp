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
<script>
$(document).ready(function() {
		setTimeout(function() {
			$('#loading').animate({
	            "opacity": "0",
	            "top": "10px"
	        },400, function () {
	        	$('#loading').hide(); 
	        });
		}, 3000);
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
</head>
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
    
  </div>
</div>

</body>
	<%@ include file="/resources/include/footer.jsp" %>
</html>