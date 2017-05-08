<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<%@ include file="adminheader.jsp"%>
<script src="${path}/resources/admin/num/jquery.color.min.js"></script>
<script src="${path}/resources/admin/num/jquery.animateNumber.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		type : "post",
		url: "${path}/logger/all.do",
	 	contentType: "text/plain; charset=utf-8",
	 	dataType : "json",
	 	success: function(data){
			console.log(data);
	var word = $.animateNumber.numberStepFactories.append('');
	$('#allsearch').animateNumber({
		number: data.allsearch,color: 'black','font-size': '50px',
		easing: 'easeInQuad',numberStep: word
	}, 2000);
	$('#daysearch').animateNumber({
		number: data.daysearch,color: 'black','font-size': '50px',
		easing: 'easeInQuad',numberStep: word
	}, 2000);
	$('#two').animateNumber({
		number: 2978 ,color: 'black','font-size': '50px',
		easing: 'easeInQuad',numberStep: word
	}, 2000);
	},
	error: function(xhr) {
		console.log('실패-',xhr);
	}
	});

	var percent_number_step = $.animateNumber.numberStepFactories.append(' %')
	$('#one').animateNumber({
		number: 100,color: 'green','font-size': '37px',
		easing: 'easeInQuad',numberStep: percent_number_step
	}, 2000);
	$('#fun-level').animateNumber({
		number: 100,color: 'green','font-size': '37px',
		easing: 'easeInQuad',numberStep: percent_number_step
	}, 2000);
	
	var word = $.animateNumber.numberStepFactories.append(' 개')
	$('#wordall').animateNumber({
		number: 74231,color: 'green','font-size': '37px',
		easing: 'easeInQuad',numberStep: word
	}, 2000);
	$('#productword').animateNumber({
		number: 67,color: 'green','font-size': '37px',
		easing: 'easeInQuad',numberStep: word
	}, 2000);
	$('#emotionword').animateNumber({
		number: 267,color: 'green','font-size': '37px',
		easing: 'easeInQuad',numberStep: word
	}, 2000);
	$('#techword').animateNumber({
		number: 7830,color: 'green','font-size': '37px',
		easing: 'easeInQuad',numberStep: word
	}, 2000);
	$('#designword').animateNumber({
		number: 9126,color: 'green','font-size': '37px',
		easing: 'easeInQuad',numberStep: word
	}, 2000);
	
});
</script>
<link rel="stylesheet" media="screen" href="${path}/resources/recommendation/particles/css/style.css">
<div class="wrapper">
<%@ include file="adminsidebar.jsp"%>
    <div class="main-panel">
<%@ include file="admininsideheader.jsp"%>
        <div class="content" style="width: 100%;height: 100%;">
            <div id="particles-js" class="container-fluid" style="width: 100%;height: 100%;">
			<!-- scripts -->
			<script src="${path}/resources/recommendation/particles/particles.js"></script>
			<script src="${path}/resources/recommendation/particles/js/app.js"></script>  	
                <div class="row" style="padding: 5%;">
                    <div class="col-md-1"></div>
                    <div class="col-md-2">
                        <div class="card">
                            <div class="header" style="text-align: center">
                            	<h4 class="title" style="font-family: yanolja;font-size: 37px">
                            	<i class="pe-7s-study"></i>검색 누적</h4>
                                <h4 class="title" id="allsearch" 
                                style="padding:10px;margin: 5px;font-family: yanolja;font-size: 37px">0</h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="card">
                            <div class="header" style="text-align: center">
                            	<h4 class="title" style="font-family: yanolja;font-size: 37px">
                            	<i class="pe-7s-diamond"></i>금일 검색</h4>
                                <h4 class="title" id="daysearch" 
                                style="padding:10px;margin: 5px;font-family: yanolja;font-size: 37px">0</h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="card">
                            <div class="header" style="text-align: center">
                            	<h4 class="title" style="font-family: yanolja;font-size: 37px">
                            	<i class="pe-7s-arc"></i>구매율</h4>
                                <h4 class="title" id="one" 
                                style="padding:10px;margin: 5px;font-family: yanolja;font-size: 37px">0</h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="card">
                            <div class="header" style="text-align: center">
                            	<h4 class="title" style="font-family: yanolja;font-size: 37px">
                            	<i class="pe-7s-cloud-download"></i>크롤링</h4>
                                <h4 class="title" id="two" 
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
