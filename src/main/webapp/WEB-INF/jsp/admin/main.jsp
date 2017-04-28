<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<%@ include file="adminheader.jsp"%>
<script src="${path}/resources/admin/num/jquery.color.min.js"></script>
<script src="${path}/resources/admin/num/jquery.animateNumber.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#lines').animateNumber({ number: 165 });
	$('#lines1').animateNumber({ number: 165 });
	$('#lines2').animateNumber({
		number: 64,color: 'green','font-size': '37px',
		easing: 'easeInQuad',numberStep: percent_number_step
		}, 2000);
	var comma_separator_number_step = $.animateNumber.numberStepFactories.separator(',')
	$('#world-population').animateNumber(
	  {
	    number: 2650,
	    numberStep: comma_separator_number_step
	  }
	);
	var percent_number_step = $.animateNumber.numberStepFactories.append(' %')
	$('#fun-level').animateNumber({
		number: 100,color: 'green','font-size': '37px',
		easing: 'easeInQuad',numberStep: percent_number_step
	}, 2000);
	
	var word = $.animateNumber.numberStepFactories.append(' 개')
	$('#wordall').animateNumber({
		number: 100,color: 'green','font-size': '37px',
		easing: 'easeInQuad',numberStep: word
	}, 2000);
	$('#productword').animateNumber({
		number: 100,color: 'green','font-size': '37px',
		easing: 'easeInQuad',numberStep: word
	}, 2000);
	$('#emotionword').animateNumber({
		number: 100,color: 'green','font-size': '37px',
		easing: 'easeInQuad',numberStep: word
	}, 2000);
	$('#techword').animateNumber({
		number: 100,color: 'green','font-size': '37px',
		easing: 'easeInQuad',numberStep: word
	}, 2000);
	$('#designword').animateNumber({
		number: 100,color: 'green','font-size': '37px',
		easing: 'easeInQuad',numberStep: word
	}, 2000);
	
});
</script>
<body>
<div class="wrapper">
<%@ include file="adminsidebar.jsp"%>
    <div class="main-panel">
<%@ include file="admininsideheader.jsp"%>
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-2">
                        <div class="card">
                            <div class="header" style="text-align: center">
                            	<h4 class="title" style="font-family: yanolja;font-size: 37px">
                            	<i class="pe-7s-study"></i>검색 누적</h4>
                                <h4 class="title" id="lines" 
                                style="padding:10px;margin: 5px;font-family: yanolja;font-size: 37px">0</h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="card">
                            <div class="header" style="text-align: center">
                            	<h4 class="title" style="font-family: yanolja;font-size: 37px">
                            	<i class="pe-7s-diamond"></i>금일 검색</h4>
                                <h4 class="title" id="lines1" 
                                style="padding:10px;margin: 5px;font-family: yanolja;font-size: 37px">0</h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="card">
                            <div class="header" style="text-align: center">
                            	<h4 class="title" style="font-family: yanolja;font-size: 37px">
                            	<i class="pe-7s-arc"></i>구매율</h4>
                                <h4 class="title" id="lines2" 
                                style="padding:10px;margin: 5px;font-family: yanolja;font-size: 37px">0</h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="card">
                            <div class="header" style="text-align: center">
                            	<h4 class="title" style="font-family: yanolja;font-size: 37px">
                            	<i class="pe-7s-cloud-download"></i>크롤링</h4>
                                <h4 class="title" id="world-population" 
                                style="padding:10px;margin: 5px;font-family: yanolja;font-size: 37px">0</h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="card">
                            <div class="header" style="text-align: center">
                            	<h4 class="title" style="font-family: yanolja;font-size: 37px">
                            	<i class="pe-7s-magic-wand"></i>분석완료</h4>
                                <h4 class="title" id="fun-level" 
                                style="padding:10px;margin: 5px;font-family: yanolja;font-size: 37px">0</h4>
                            </div>
                        </div>
                    </div>
                    
                <div class="row">
                	<div class="col-md-4"></div>
                    <div class="col-md-4">
                        <div class="card">
                            <div class="header" style="text-align: center">
                            	<h4 class="title" style="font-family: yanolja;font-size: 37px">
                            	<i class="pe-7s-box2"></i>단어사전 총계<i class="pe-7s-box2"></i></h4>
                                <h4 class="title" id="wordall" 
                                style="padding:10px;margin: 5px;font-family: yanolja;font-size: 37px">0</h4>
                            </div>
                        </div>
                    </div>
               </div>
               <div class="row">
                    <div class="col-md-3">
                        <div class="card">
                            <div class="header" style="text-align: center">
                            	<h4 class="title" style="font-family: yanolja;font-size: 37px">
                            	<i class="pe-7s-diamond"></i>제품 관련 주요단어</h4>
                                <h4 class="title" id="productword" 
                                style="padding:10px;margin: 5px;font-family: yanolja;font-size: 37px">0</h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card">
                            <div class="header" style="text-align: center">
                            	<h4 class="title" style="font-family: yanolja;font-size: 37px">
                            	<i class="pe-7s-diamond"></i>감정평가 단어</h4>
                                <h4 class="title" id="emotionword" 
                                style="padding:10px;margin: 5px;font-family: yanolja;font-size: 37px">0</h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card">
                            <div class="header" style="text-align: center">
                            	<h4 class="title" style="font-family: yanolja;font-size: 37px">
                            	<i class="pe-7s-diamond"></i>성능평가 단어</h4>
                                <h4 class="title" id="techword" 
                                style="padding:10px;margin: 5px;font-family: yanolja;font-size: 37px">0</h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card">
                            <div class="header" style="text-align: center">
                            	<h4 class="title" style="font-family: yanolja;font-size: 37px">
                            	<i class="pe-7s-diamond"></i>디자인 평가 단어</h4>
                                <h4 class="title" id="designword" 
                                style="padding:10px;margin: 5px;font-family: yanolja;font-size: 37px">0</h4>
                            </div>
                        </div>
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
