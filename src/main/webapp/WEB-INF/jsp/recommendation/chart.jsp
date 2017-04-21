<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
	<script type="text/javascript" src="<c:url value='/resources/recommendation/Chart.min.js' />"></script>
	<script type="text/javascript" src="<c:url value='/resources/recommendation/Chart.LlineBar.js' />"></script>
    <script src="<c:url value='/resources/recommendation/Chart.StackedBar.js' />"></script>
	<script type="text/javascript">
		var randomScalingFactor = function(){ return Math.round(Math.random()*100)};
		var months = ["January","February","March","April","May","June","July", "August", "September", "October", "November", "December"];
		var barChart = null;
		var barChartData = {
			labels : ["January","February","March","April","May","June","July"],
			datasets : [
				{
					fillColor : "rgba(220,220,220,0.5)",
					strokeColor : "rgba(220,220,220,0.8)",
					highlightFill: "rgba(220,220,220,0.75)",
					highlightStroke: "rgba(220,220,220,1)",
					data : [randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor()]
				},
				{
					fillColor : "rgba(151,187,205,0.5)",
					strokeColor : "rgba(151,187,205,0.8)",
					highlightFill : "rgba(151,187,205,0.75)",
					highlightStroke : "rgba(151,187,205,1)",
					data : [randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor()]
				}
			]

		};

		$(function() {
			var ctx = document.getElementById("canvas2").getContext("2d");
			barChart = new Chart(ctx).Bar(barChartData, {
				//Boolean - Whether the scale should start at zero, or an order of magnitude down from the lowest value
				scaleBeginAtZero : false,
				//Boolean - Whether grid lines are shown across the chart
				scaleShowGridLines : true,
				//String - Colour of the grid lines
				scaleGridLineColor : "rgba(0,0,0,0.05)",
				//Number - Width of the grid lines
				scaleGridLineWidth : 1,
				//Boolean - If there is a stroke on each bar
				barShowStroke : false,
				//Number - Pixel width of the bar stroke
				barStrokeWidth : 2,
				//Number - Spacing between each of the X value sets
				barValueSpacing : 5,
				//Number - Spacing between data sets within X values
				barDatasetSpacing : 1,
				onAnimationProgress: function() {
					console.log("onAnimationProgress");
				},
				onAnimationComplete: function() {
					console.log("onAnimationComplete");
				}
			});
		});

		$("input#btnAdd").on("click", function() {
			barChart.addData(
				[randomScalingFactor(),randomScalingFactor()], 
				months[(barChart.datasets[0].bars.length)%12]
			);
		});

		$("canvas").on("click", function(e) {
			var activeBars = barChart.getBarsAtEvent(e);
			console.log(activeBars);

			for(var i in activeBars) {
				console.log(activeBars[i].value);
			}
		});

	</script>
	<script type="text/javascript">
		var randomScalingFactor = function(){ return Math.round(Math.random()*100)};
		var months = ["January","February","March","April","May","June","July", "August", "September", "October", "November", "December"];
		var radarChart = null;
		var radarChartData = {
			labels : ["January","February","March","April","May","June","July"],
			datasets: [
				{
					label: "My First dataset",
					fillColor: "rgba(220,220,220,0.2)",
					strokeColor: "rgba(220,220,220,1)",
					pointColor: "rgba(220,220,220,1)",
					pointStrokeColor: "#fff",
					pointHighlightFill: "#fff",
					pointHighlightStroke: "rgba(220,220,220,1)",
					data: [randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor()]
				},
				{
					label: "My Second dataset",
					fillColor: "rgba(151,187,205,0.2)",
					strokeColor: "rgba(151,187,205,1)",
					pointColor: "rgba(151,187,205,1)",
					pointStrokeColor: "#fff",
					pointHighlightFill: "#fff",
					pointHighlightStroke: "rgba(151,187,205,1)",
					data: [randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor()]
				}
			]
		};

		$(function() {
			var ctx = document.getElementById("canvas").getContext("2d");
			radarChart = new Chart(ctx).Radar(radarChartData, {
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

		$("input#btnAdd").on("click", function() {
			radarChart.addData(
				[randomScalingFactor(),randomScalingFactor()], 
				months[(radarChart.datasets[0].points.length)%12]
			);
		});

		$("canvas2").on("click", function(e) {
			var activePoints = radarChart.getPointsAtEvent(e);
			console.log(activePoints);

			for(var i in activePoints) {
				console.log(activePoints[i].value);
			}
		});
	</script>
	<script>
var randomScalingFactor = function(){ return Math.round(Math.random()*100)};

var lineBarChartData = {
	labels : ["January","February","March","April","May","June","July"],
	datasets : [
		{
			type: "line",
			fillColor : "rgba(151,187,205,0)",
			strokeColor : "rgba(151,187,205,1)",
			pointColor : "rgba(151,187,205,1)",
			pointStrokeColor : "#fff",
			pointHighlightFill : "#fff",
			pointHighlightStroke : "rgba(151,187,205,1)",
			data : [randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor()]
		},
		{
			fillColor : "rgba(220,220,220,0.5)",
			strokeColor : "rgba(220,220,220,0.8)",
			highlightFill: "rgba(220,220,220,0.75)",
			highlightStroke: "rgba(220,220,220,1)",
			data : [randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor()]
		},
		{
			fillColor : "rgba(151,187,205,0.5)",
			strokeColor : "rgba(151,187,205,0.8)",
			highlightFill : "rgba(151,187,205,0.75)",
			highlightStroke : "rgba(151,187,205,1)",
			data : [randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor()]
		}
	]

}

var chart = null;
$(function() {
	var ctx = document.getElementById("canvas3").getContext("2d");
	chart = new Chart(ctx).LineBar(lineBarChartData, {
		responsive : true
	});
});
</script>
	<script type="text/javascript">
		var randomScalingFactor = function(){ return Math.round(Math.random()*300)};
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
			canvas = document.getElementById("canvas4");
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

		$("input#btnAdd").on("click", function() {
			chart.addData({
				value: randomScalingFactor(),
				color: "#B48EAD",
				highlight: "#C69CBE",
				label: "Purple"
			});
		});

		$("input#btnPolar").on("click", function() {
			chart.destroy();
			chart = new Chart(ctx).PolarArea(chartData, {
				segmentStrokeColor: "#000000",
				animation: true,
				responsive: true,
			});
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

		$("canvas4").on("click", function(e) {
			var activePoints = chart.getSegmentsAtEvent(e);
			console.log(activePoints);
			for(var i in activePoints) {
				console.log(activePoints[i].value);
			}
		});

	</script>
	<script type="text/javascript">
        var randomScalingFactor = function(){ return Math.round(Math.random()*100)};
        var months = ["January","February","March","April","May","June","July", "August", "September", "October", "November", "December"];
        var barChart = null;
        var barChartData = {
            labels : ["January","February","March","April","May","June","July"],
            datasets : [
                {
                    fillColor : "rgba(220,220,220,0.5)",
                    strokeColor : "rgba(220,220,220,0.8)",
                    highlightFill: "rgba(220,220,220,0.75)",
                    highlightStroke: "rgba(220,220,220,1)",
                    data : [randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor()]
                },
                {
                    fillColor : "rgba(151,187,205,0.5)",
                    strokeColor : "rgba(151,187,205,0.8)",
                    highlightFill : "rgba(151,187,205,0.75)",
                    highlightStroke : "rgba(151,187,205,1)",
                    data : [randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor()]
                },
                {
                    fillColor : "rgba(240,73,73,0.5)",
                    strokeColor : "rgba(240,73,73,0.8)",
                    highlightFill : "rgba(240,73,73,0.75)",
                    highlightStroke : "rgba(240,73,73,1)",
                    data : [randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor()]
                }
            ]

        };

        $(function() {
            var ctx = document.getElementById("canvas5").getContext("2d");
            barChart = new Chart(ctx).StackedBar(barChartData, {
                //Boolean - Whether the scale should start at zero, or an order of magnitude down from the lowest value
                scaleBeginAtZero : false,
                //Boolean - Whether grid lines are shown across the chart
                scaleShowGridLines : true,
                //String - Colour of the grid lines
                scaleGridLineColor : "rgba(0,0,0,0.05)",
                //Number - Width of the grid lines
                scaleGridLineWidth : 1,
                //Boolean - If there is a stroke on each bar
                barShowStroke : false,
                //Number - Pixel width of the bar stroke
                barStrokeWidth : 2,
                //Number - Spacing between each of the X value sets
                barValueSpacing : 5,
                //Number - Spacing between data sets within X values
                barDatasetSpacing : 1,
                onAnimationProgress: function() {
                    console.log("onAnimationProgress");
                },
                onAnimationComplete: function() {
                    console.log("onAnimationComplete");
                }
            });
        });

        $("input#btnAdd").on("click", function() {
            barChart.addData(
                [randomScalingFactor(),randomScalingFactor(),randomScalingFactor()], 
                months[(barChart.datasets[0].bars.length)%12]
            );
        });

        $("canvas5").on("click", function(e) {
            var activeBars = barChart.getBarsAtEvent(e);
            console.log(activeBars);

            for(var i in activeBars) {
                console.log(activeBars[i].value);
            }
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
			height: 100%;
			border-radius: 5px;
		}
		.polararea-legend {
			list-style: none;
			position: absolute;
			right: 300px;
			top: 300px;
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
</head>
<body>
	<div style="width: 60%">
		<canvas id="canvas4" height="450" width="600"></canvas>
	</div>
	<br />
	<input type="button" id="btnAdd" value="add data">
	<input type="button" id="btnPolar" value="view polar-area">
	<input type="button" id="btnPie" value="view pie">
	<input type="button" id="btnDoughnut" value="view doughnut">
	
	<div style="width: 60%">
		<canvas id="canvas" height="450" width="600"></canvas>
	</div>
	<input type="button" id="btnAdd" value="add data">	
	
	<div style="width: 60%">
		<canvas id="canvas2" height="450" width="600"></canvas>
	</div>
	<input type="button" id="btnAdd" value="add data">
	
	<div style="width: 60%">
		<canvas id="canvas3" height="450" width="600"></canvas>
	</div>
	
	<div style="width: 60%">
        <canvas id="canvas5" height="450" width="600"></canvas>
    </div>
    <input type="button" id="btnAdd" value="add data">
</body>
</html>