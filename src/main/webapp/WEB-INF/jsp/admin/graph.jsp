<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<%@ include file="adminheader.jsp"%>	
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<script src="${path}/resources/recommendation/Chart.js"></script>
<script src="${path}/resources/admin/num/jquery.color.min.js"></script>
<script src="${path}/resources/admin/num/jquery.animateNumber.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#todaysearch').animateNumber({ number: 165 });
	$('#todayvisit').animateNumber({ number: 165 });
	$('#todaysales').animateNumber({ number: 165 });
	$('#todaysales1').animateNumber({ number: 165 });
	$('#todaynetincome').animateNumber({ number: 165 });
	var randomScalingFactor = function(){ return Math.round(Math.random()*100)};
	var barChart = null;
	var barChartData = {
		labels : ["D+3","D+2","D+1","오늘","D-1"],
		datasets : [
			{
				fillColor : "rgba(220,220,220,0.5)",
				strokeColor : "rgba(220,220,220,0.8)",
				highlightFill: "rgba(220,220,220,0.75)",
				highlightStroke: "rgba(220,220,220,1)",
				data : [randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor()]
			},
			{
				fillColor : "rgba(151,187,205,0.5)",
				strokeColor : "rgba(151,187,205,0.8)",
				highlightFill : "rgba(151,187,205,0.75)",
				highlightStroke : "rgba(151,187,205,1)",
				data : [randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor()]
			}
		]
	};
	var barChartData2 = {
		labels : ["D+3","D+2","D+1","오늘","D-1"],
		datasets : [
			{
				fillColor : "rgba(220,220,220,0.5)",
				strokeColor : "rgba(220,220,220,0.8)",
				highlightFill: "rgba(220,220,220,0.75)",
				highlightStroke: "rgba(220,220,220,1)",
				data : [randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor()]
			},
			{
				fillColor : "rgba(151,187,205,0.5)",
				strokeColor : "rgba(151,187,205,0.8)",
				highlightFill : "rgba(151,187,205,0.75)",
				highlightStroke : "rgba(151,187,205,1)",
				data : [randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor()]
			}
		]
	};
	$(function() {
		var ctx = document.getElementById("stic1").getContext("2d");
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
	$(function() {
		var ctx = document.getElementById("stic2").getContext("2d");
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
	var chartData = [
		{
			value: randomScalingFactor(),
			color:"#F7464A",
			highlight: "#FF5A5E",
			label: "Red"
		},
		{
			value: randomScalingFactor(),
			color: "#46BFBD",
			highlight: "#5AD3D1",
			label: "Green"
		},
		{
			value: randomScalingFactor(),
			color: "#FDB45C",
			highlight: "#FFC870",
			label: "Yellow"
		},
		{
			value: randomScalingFactor(),
			color: "#949FB1",
			highlight: "#A8B3C5",
			label: "Grey"
		},
		{
			value: randomScalingFactor(),
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
		canvas = document.getElementById("circle1");
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
	$(function() {
		canvas = document.getElementById("circle2");
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
	$("input#btnPie").on("click", function() {
		chart.destroy();
		chart = new Chart(ctx).Pie(chartData, {
			animateScale: true,
			animation: true,
			responsive: true,
		});
	});
	
	$("input#btnDoughnut").on("click", function() {
		chart.destroy();
		chart = new Chart(ctx).Doughnut(chartData, {
			animateScale: true,
			animation: true,
			responsive: true,
		});
	});

});
</script>
<body>
<div class="wrapper">
<%@ include file="adminsidebar.jsp"%>
    <div class="main-panel">
<%@ include file="admininsideheader.jsp"%>
        <div class="content">
            <div class="container-fluid">
            <div class="row"><hr></div>
            <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-2">
                        <div class="card">
                            <div class="header" style="text-align: center">
                            	<h4 class="title" style="font-family: yanolja;font-size: 37px">
                            	<i class="pe-7s-study"></i>금일 검색</h4>
                                <h4 class="title" id="todaysearch" 
                                style="padding:10px;margin: 5px;font-family: yanolja;font-size: 37px">0</h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="card">
                            <div class="header" style="text-align: center">
                            	<h4 class="title" style="font-family: yanolja;font-size: 37px">
                            	<i class="pe-7s-diamond"></i>금일 방문</h4>
                                <h4 class="title" id="todayvisit" 
                                style="padding:10px;margin: 5px;font-family: yanolja;font-size: 37px">0</h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="card">
                            <div class="header" style="text-align: center">
                            	<h4 class="title" style="font-family: yanolja;font-size: 37px">
                            	<i class="pe-7s-arc"></i>금일 판매</h4>
                                <h4 class="title" id="todaysales" 
                                style="padding:10px;margin: 5px;font-family: yanolja;font-size: 37px">0</h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="card">
                            <div class="header" style="text-align: center">
                            	<h4 class="title" style="font-family: yanolja;font-size: 37px">
                            	<i class="pe-7s-cloud-download"></i>금일 매출</h4>
                                <h4 class="title" id="todaysales1" 
                                style="padding:10px;margin: 5px;font-family: yanolja;font-size: 37px">0</h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="card">
                            <div class="header" style="text-align: center">
                            	<h4 class="title" style="font-family: yanolja;font-size: 37px">
                            	<i class="pe-7s-magic-wand"></i>일 순수익</h4>
                                <h4 class="title" id="todaynetincome" 
                                style="padding:10px;margin: 5px;font-family: yanolja;font-size: 37px">0</h4>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">방문 그래프</h4>
                                <p class="category">Last Campaign Performance</p>
                            </div>
                            <div class="content">
                                <div style="width: 60%">
									<canvas id="stic1" height="300px" width="400px"
									style="position: relative;"></canvas>
								</div>
								<div class="footer">
                                    <div class="legend">
                                        <i class="fa fa-circle text-info"></i> Open
                                        <i class="fa fa-circle text-danger"></i> Bounce
                                    </div>
                                    <hr>
                                    <div class="stats">
                                        <i class="fa fa-clock-o"></i> Campaign sent 2 days ago
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">매출 그래프</h4>
                                <p class="category">Last Campaign Performance</p>
                            </div>
                            <div class="content">
                                <div style="width: 60%">
									<canvas id="stic2" height="300px" width="400px"
									style="position: relative;"></canvas>
								</div>
								<div class="footer">
                                    <div class="legend">
                                        <i class="fa fa-circle text-danger"></i> Bounce
                                        <i class="fa fa-circle text-warning"></i> Unsubscribe
                                    </div>
                                    <hr>
                                    <div class="stats">
                                        <i class="fa fa-clock-o"></i> Campaign sent 2 days ago
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
	                <div class="row">
	                <div class="card">
                           <div class="header">
                               <h4 class="title">멤버/</h4>
                               <p class="category">Last Campaign Performance</p>
                           </div>
                           <div class="content">
                               <div style="width: 60%">
								<canvas id="stic1" height="300px" width="400px"
								style="position: relative;"></canvas>
							</div>
							<div class="footer">
                                   <div class="legend">
                                       <i class="fa fa-circle text-info"></i> Open
                                       <i class="fa fa-circle text-danger"></i> Bounce
                                   </div>
                                   <hr>
                                   <div class="stats">
                                       <i class="fa fa-clock-o"></i> Campaign sent 2 days ago
                                   </div>
                               </div>
                           </div>
                       </div>
					</div>
					<div class="row">
	                <div class="card">
                           <div class="header">
                               <h4 class="title">방문 그래프</h4>
                               <p class="category">Last Campaign Performance</p>
                           </div>
                           <div class="content">
                               <div style="width: 60%">
								<canvas id="stic1" height="300px" width="400px"
								style="position: relative;"></canvas>
							</div>
							<div class="footer">
                                   <div class="legend">
                                       <i class="fa fa-circle text-info"></i> Open
                                       <i class="fa fa-circle text-danger"></i> Bounce
                                   </div>
                                   <hr>
                                   <div class="stats">
                                       <i class="fa fa-clock-o"></i> Campaign sent 2 days ago
                                   </div>
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
