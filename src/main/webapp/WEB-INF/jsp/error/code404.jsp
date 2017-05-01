<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>error</title>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<script>
$(document).ready(function() {
//okpt("CSS Particle Effects");
function initparticles() {
   bubbles();
}

/*The measurements are ... whack (so to say), for more general text usage I would generate different sized particles for the size of text; consider this pen a POC*/

function bubbles() {
   $.each($(".particletext.bubbles"), function(){
      var bubblecount = ($(this).width()/50)*20;
      for(var i = 0; i <= bubblecount; i++) {
         var size = ($.rnd(40,80)/5);
         $(this).append('<span class="particle" style="top:' + $.rnd(20,80) + '%; left:' + $.rnd(0,95) + '%;width:' + size + 'px; height:' + size + 'px;animation-delay: ' + ($.rnd(0,30)/10) + 's;"></span>');
      }
   });
}
jQuery.rnd = function(m,n) {
      m = parseInt(m);
      n = parseInt(n);
      return Math.floor( Math.random() * (n - m + 1) ) + m;
}

initparticles();

});
</script>
<style>
@font-face{font-family: 'Connoisseurs';src: url('${path}/resources/font/Connoisseurs.ttf')}
body {
  padding: 40px 0;
  font-family: Connoisseurs;
  background-color: #fff;
}
body .textcontainer {
  padding: 40px 0;
  text-align: center;
}
body .particletext {
  text-align: center;
  font-size: 160px;
  position: relative;
}
body .particletext.bubbles > .particle {
  opacity: 0;
  position: absolute;
  background-color: rgba(33, 150, 243, 0.5);
  -webkit-animation: bubbles 3s ease-in infinite;
          animation: bubbles 3s ease-in infinite;
  border-radius: 100%;
}
body .particletext.hearts > .particle {
  opacity: 0;
  position: absolute;
  background-color: #cc2a5d;
  -webkit-animation: hearts 3s ease-in infinite;
          animation: hearts 3s ease-in infinite;
}
body .particletext.hearts > .particle:before, body .particletext.hearts > .particle:after {
  position: absolute;
  content: '';
  border-radius: 100px;
  top: 0px;
  left: 0px;
  width: 100%;
  height: 100%;
  background-color: #cc2a5d;
}
body .particletext.hearts > .particle:before {
  -webkit-transform: translateX(-50%);
          transform: translateX(-50%);
}
body .particletext.hearts > .particle:after {
  -webkit-transform: translateY(-50%);
          transform: translateY(-50%);
}
body .particletext.lines > .particle {
  position: absolute;
  background-color: rgba(244, 67, 54, 0.5);
  -webkit-animation: lines 3s linear infinite;
          animation: lines 3s linear infinite;
}
body .particletext.confetti > .particle {
  opacity: 0;
  position: absolute;
  -webkit-animation: confetti 3s ease-in infinite;
          animation: confetti 3s ease-in infinite;
}
body .particletext.confetti > .particle.c1 {
  background-color: rgba(76, 175, 80, 0.5);
}
body .particletext.confetti > .particle.c2 {
  background-color: rgba(156, 39, 176, 0.5);
}
body .particletext.fire > .particle {
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
body .particletext.fire > .particle:before {
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
body .particletext.sunbeams > .particle {
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
</head>
<body>

<div class="textcontainer" style="padding: 0">
   <span class="particletext bubbles">PressFit 404</span>
</div>
<div class="textcontainer" style="font-size: 60px;padding: 0">
   에러 페이지<br/>
   <img style="width: 360px;height: 360px;" src="${path}/resources/admin/img/error.jpg">
</div>
<div class="textcontainer" style="font-size: 50px;padding: 0">
이용에 불편을 드려 죄송합니다.
</div>
</body>
</html>


