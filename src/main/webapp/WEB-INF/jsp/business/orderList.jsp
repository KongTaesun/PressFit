<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<title>주문내역</title>
<%@ include file="/resources/include/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<style>
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

.breadcrumbs-area { 
 background-image: url('${path}/resources/writer/img/bigpicture/bucket.png');
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

</style>
<script type="text/javascript" src="<c:url value='/resources/recommendation/Chart.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/recommendation/Chart.LlineBar.js' />"></script>
<script src="<c:url value='/resources/recommendation/Chart.StackedBar.js' />"></script>

<script>
	$(document).ready(function() {
		$('#one').show();
		$('#two').hide();
		$('#three').hide();
		$('#btnone').click(function(){
			$('#one').show();
			$('#two').hide();
			$('#three').hide();
		});
		$('#btntwo').click(function(){
			$('#one').hide();
			$('#two').show();
			$('#three').hide();
			
		});
		$('#btnthree').click(function(){
			$('#one').hide();
			$('#two').hide();
			$('#three').show();
			
		});
		$.datepicker.setDefaults({
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

		  
		    $("#datepicker1, #datepicker2").datepicker();
		  
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
		
		
		$('input[type=checkbox]').click(function() {
			var ischecked = $(this).is(":checked");
			if (ischecked) {
				var a = Number($(this).parents('tr').children('td[name="price"]').children('input').val());
				var b = Number($('#chicemoney').text());
				$('#chicemoney').html(a+b);
			}
			if (!ischecked) {
				var a = Number($(this).parents('tr').children('td[name="price"]').children('input').val());
				var b = Number($('#chicemoney').text());
				$('#chicemoney').html(b-a);
			}
		});
		
		
 		$("#order").click(function(){
 			order();
		});
 		
 		$("#btnWrite").click(
				function() {
					// 페이지 주소 변경(이동)
					location.href = "${path}/business/orderList.do?curPage="
							+ page
							+ "&searchOption=${map.searchOption}"
							+ "&keyword=${map.keyword}";
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
 		 list;
	}	
 	
	/////////////////////////////////////////////
	// 그래프 1
	var randomScalingFactor = function() {
		return Math.round(Math.random() * 100)
	};

	var lineBarChartData = {
		labels : [ "January", "February", "March", "April", "May", "June",
				"July" ],
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
							randomScalingFactor() ]
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
		var ctx = document.getElementById("canvas3").getContext("2d");
		chart = new Chart(ctx).LineBar(lineBarChartData, {
			responsive : true
		});
	});
	
	// 그래프 2
	var randomScalingFactor = function() {
		return Math.round(Math.random() * 300)
	};
	var chartData = [ {
		value : randomScalingFactor(),
		color : "#F7464A",
		highlight : "#FF5A5E",
		label : "Red"
	}, {
		value : randomScalingFactor(),
		color : "#46BFBD",
		highlight : "#5AD3D1",
		label : "Green"
	}, {
		value : randomScalingFactor(),
		color : "#FDB45C",
		highlight : "#FFC870",
		label : "Yellow"
	}, {
		value : randomScalingFactor(),
		color : "#949FB1",
		highlight : "#A8B3C5",
		label : "Grey"
	}, {
		value : randomScalingFactor(),
		color : "#4D5360",
		highlight : "#616774",
		label : "Dark Grey"
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

	$("input#btnAdd").on("click", function() {
		chart.addData({
			value : randomScalingFactor(),
			color : "#B48EAD",
			highlight : "#C69CBE",
			label : "Purple"
		});
	});

	$("input#btnPolar").on("click", function() {
		chart.destroy();
		chart = new Chart(ctx).PolarArea(chartData, {
			segmentStrokeColor : "#000000",
			animation : true,
			responsive : true,
		});
	});

	$("input#btnPie").on("click", function() {
		chart.destroy();
		chart = new Chart(ctx).Pie(chartData, {
			animateScale : true,
			animation : true,
			responsive : true,
		});
	});

	$("input#btnDoughnut").on("click", function() {
		chart.destroy();
		chart = new Chart(ctx).Doughnut(chartData, {
			animateScale : true,
			animation : true,
			responsive : true,
		});
	});

	$("canvas4").on("click", function(e) {
		var activePoints = chart.getSegmentsAtEvent(e);
		console.log(activePoints);
		for ( var i in activePoints) {
			console.log(activePoints[i].value);
		}
	});
</script>



</head>
<body>

  
        <!-- Breadcrumbs Area Start -->
        <div class="breadcrumbs-area">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
					    <div style="padding: 100px 0;">
					       <h2>SHOPPING CART</h2> 
					       <ul class="breadcrumbs-list">
						        <li>
						            <a title="Return to Home" href="index.html">Home</a>
						        </li>
						        <li>Shopping Cart</li>
						    </ul>
						    
						    
						    
					    </div>
					    
					    <!-- layer 2 -->      
					<div>
						<div class="col-md-1 col-sm-2 col-xs-6">
							<div class="single-counter wow animated animated" data-wow-duration="1.5s" data-wow-delay=".9999s" style="visibility: visible; animation-duration: 1.5s; animation-delay: 0.9999s;">
								<div class="counter-info">
															
								</div>
							</div>		                
			            </div>    
						<div class="col-md-2 col-sm-2 col-xs-6">
							<div class="single-counter wow animated animated" data-wow-duration="1.5s" data-wow-delay=".3s" style="visibility: visible; animation-duration: 1.5s; animation-delay: 0.3s;">
								<div class="counter-info">
									<span class="fcount">
										<span class="counter">3725</span>
									</span>
									<h3>누적검색횟수</h3>								
								</div>
							</div>		                
			            </div>
						<div class="col-md-2 col-sm-2 col-xs-6">
							<div class="single-counter wow animated animated" data-wow-duration="1.5s" data-wow-delay=".3s" style="visibility: visible; animation-duration: 1.5s; animation-delay: 0.3s;">
								<div class="counter-info">
									<span class="fcount">
										<span class="counter">3725</span>
									</span>
									<h3>마우스 매출액</h3>								
								</div>
							</div>		                
			            </div>
			            <div class="col-md-2 col-sm-2 col-xs-6">
							<div class="single-counter wow animated animated" data-wow-duration="1.5s" data-wow-delay=".3s" style="visibility: visible; animation-duration: 1.5s; animation-delay: 0.3s;">
								<div class="counter-info">
									<span class="fcount">
										<span class="counter">286</span>
									</span>
									<h3>키보드 매출액</h3>								
								</div>
							</div>		                
			            </div>
			            <div class="col-md-2 col-sm-2 col-xs-6">
							<div class="single-counter wow animated animated" data-wow-duration="1.5s" data-wow-delay=".3s" style="visibility: visible; animation-duration: 1.5s; animation-delay: 0.3s;">
								<div class="counter-info">
									<span class="fcount">
										<span class="counter">550</span>
									</span>
									<h3>총 판매량</h3>								
								</div>
							</div>		                
			            </div>
			            <div class="col-md-2 col-sm-2 col-xs-6">
							<div class="single-counter wow animated animated" data-wow-duration="1.5s" data-wow-delay=".3s" style="visibility: visible; animation-duration: 1.5s; animation-delay: 0.3s;">
								<div class="counter-info">
									<span class="fcount">
										<span class="counter">2485</span>
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
		<!-- Breadcrumbs Area Start --> 
		
	
		<!-- Cart Area Start -->
		<div class="shopping-cart-area">
		    <!-- <div class="col-md-1"></div> -->
		    <div class="col-md-1"></div>
		    <div class="col-md-10">
	          <div class="wishlist-table-area table-responsive">
	              <div>
					<div class="col-md-12">
                        <div class="p-details-tab-content">
                        <div style="margin-top:20px;">
                        <form name="frm" method="post" action="${path}/business/orderList.do" >
                        	
                        	
                        	<input type="text" name="startDate" id="datepicker1">
                        	<input type="text" name="endDate" id="datepicker2">
                        	<input class="btnSearch fL" type="submit" value="조회" />
                       	 </form>

                            </div>
                            <div>
                                <ul>
                                    <li role="presentation" class="active"><a href="#" id="btnone">주문내역</a></li>
                                    <li role="presentation"><a href="#" id="btntwo">환불내역</a></li>
                                    <li role="presentation"><a href="#" id="btnthree">교환내역</a></li>
                                </ul>
                            </div>
                            <div class="clearfix"></div>
                            <div>
                                <div id="one">
                                <form name="frm" method="post" action="${path}/business/payment.do?searchOption=order" onsubmit="return order();">
                                <div  class="orderlist_scroll">
                                <c:choose>
						        <c:when test="${map.listcount1 == 0}">
						           	주문들어온 내역이 없습니다.
						        </c:when>
						        <c:otherwise>
									<table>
	                                <thead>
						                 <tr>
						                	<th><input type="checkbox" id="allCheck1"/></th>
						                	<th>상품번호</th>
						                    <th>상품명</th>
						                    <th>단가</th>
						                    <th>수량</th>
						                    <th>금액</th>
						                    <th>구매자</th>
						                   	<th>상태</th>
						                   	<th>주문날짜</th>
						                </tr>
	                                </thead>
	                                <tbody>
						                <c:forEach var="row1" items="${map.list1}" varStatus="i">
					              
					         			 <input type="hidden"  name="idx" value="${row1.idx}"> 
					         			 <input type="hidden"  name="kind" value="${row1.kind}"> 
						                <tr>
						                	<td name="cart_id"><input type="checkbox" class="check_id1" name="check" value="${row1.cart_id }" ></td>
						                	<td>${row1.cart_id }<input type="hidden" id="cart_id" name="cart_id" value="${row1.cart_id}"/></td>
						                	
						                	
						                    <td>
						                    
						                        <a href="${path}/${row1.kind}/view.do?idx=${row1.idx}&curPage=1&searchOption=${map.searchOption}&keyword=${map.keyword}">
						                        ${row1.modelname}</a>
						                    
						                    </td>
						                    
						                    
						                    
						                    <td align="right">
						                        <fmt:formatNumber pattern="###,###,###" value="${row1.price}"/> 원
						                        <input type="hidden" name="price" value="${row1.price}">
						                    </td>
						                    <td align="right">
						                        ${row1.amount} 개
						                        <input type="hidden"  name="amount" value="${row1.amount}"/> 
						                    </td>
						                    
						                    <td name="price" align="right">
						                    	<input type="hidden" value="${row1.money}"/>
						                        <fmt:formatNumber pattern="###,###,###" value="${row1.money}"/>
						                    </td>
						                    <td>
						                    	${row1.user_id} 
						                    </td>
						                    <td>
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
						                    </td>
						                    <td>
						                   		 ${row1.orderdate}
						                    </td>
						                    <%-- <td>
						                        <a href="${path}/shop/cart/delete.do?cart_id=${row1.cart_id}">
						                        <input type="hidden" name="cart_id" value="${row1.cart_id}">삭제</a>
						                    </td> --%>
						                </tr>
						                </c:forEach>
	                                </tbody>
	                            </table>
	                            </c:otherwise>
							    </c:choose>
							    
	                            
	                        </div>
	                        <div class="shopingcart-bottom-area">
	                        	<input type="submit" id="order" class="btn-default" name="order" value="배송시작"/>
	                        </div>
	                        </form>
                                </div>
                                
                                
                                <div id="two">
                                <form name="frm" method="post" action="${path}/business/payment.do?searchOption=refund" onsubmit="return order();">
                                <div class="orderlist_scroll">
                                <c:choose>
						        <c:when test="${map.listcount2 == 0}">
						           	환불내역이 없습니다.
						        </c:when>
						        <c:otherwise>
                                    <table>
	                                <thead>
						                 <tr>
						                	<th><input type="checkbox" id="allCheck2"/></th>
						                	<th>상품번호</th>
						                    <th>상품명</th>
						                    <th>단가</th>
						                    <th>수량</th>
						                    <th>금액</th>
						                    <th>구매자</th>
						                   	<th>상태</th>
						                   	<th>주문날짜</th>
	
						                    <!-- <th>취소</th> -->
						                </tr>
	                                </thead>
	                                <tbody>
						                <c:forEach var="row2" items="${map.list2}" varStatus="i">
						                 <input type="hidden" id="idx" name="idx" value="${row2.idx}"> 
					         			 <input type="hidden" id="kind" name="kind" value="${row2.kind}"> 
						                <tr>
						                	<td name="cart_id"><input type="checkbox" class="check_id2" name="check" value="${row2.cart_id }" ></td>
						                	<td>${row2.cart_id }<input type="hidden" id="cart_id" name="cart_id" value="${row2.cart_id}"/></td>
						                	
						                	
						                    <td>
						                    
						                        <a href="${path}/${row2.kind}/view.do?idx=${row2.idx}&curPage=1&searchOption=${map.searchOption}&keyword=${map.keyword}">
						                        ${row2.modelname}</a>
						                   
						                    </td>
						                    
						                    
						                    
						                    <td align="right">
						                        <fmt:formatNumber pattern="###,###,###" value="${row2.price}"/> 원
						                        <input type="hidden" name="price" value="${row2.price}">
						                    </td>
						                    <td align="right">
						                        ${row2.amount} 개
						                        <input type="hidden"  name="amount" value="${row2.amount}"> 
						                    </td>
						                    
						                    <td name="price" align="right">
						                    	<input type="hidden" value="${row2.money}"/>
						                        <fmt:formatNumber pattern="###,###,###" value="${row2.money}"/>
						                    </td>
						                    <td>
						                    	${row2.user_id} 
						                    </td>
						                    <td>
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
						                    </td>
						                    <td>
						                   		 ${row2.orderdate}
						                    </td>
						                    <%-- <td>
						                        <a href="${path}/shop/cart/delete.do?cart_id=${row2.cart_id}">
						                        <input type="hidden" name="cart_id" value="${row2.cart_id}">삭제</a>
						                    </td> --%>
						                </tr>
						                </c:forEach>
	                                </tbody>
	                            </table>
	                            </c:otherwise>
							    </c:choose>
	                            
                                
	                        </div>
	                        <div class="shopingcart-bottom-area">
	                        	<input type="submit" id="order" class="btn-default" name="order" value="환불승인"/>
	                            
	                        </div>
	                        </form>
                            </div>
                                
                                <div id="three">
                                <form name="frm" method="post" action="${path}/business/payment.do?searchOption=exchange" onsubmit="return order();">
                                <div class="orderlist_scroll">
                                <c:choose>
						        <c:when test="${map.listcount3 == 0}">
						           	교환내역이 없습니다.
						        </c:when>
						        <c:otherwise>
                                    <table>
	                                <thead>
						                 <tr>
						                	<th><input type="checkbox" id="allCheck3"/></th>
						                	<th>상품번호</th>
						                    <th>상품명</th>
						                    <th>단가</th>
						                    <th>수량</th>
						                    <th>금액</th>
						                    <th>구매자</th>
						                   	<th>상태</th>
						                   	<th>주문날짜</th>
	
						                    <!-- <th>취소</th> -->
						                </tr>
	                                </thead>
	                                <tbody>
						                <c:forEach var="row3" items="${map.list3}" varStatus="i">
						                 <input type="hidden"  name="idx" value="${row3.idx}"> 
					         			 <input type="hidden"  name="kind" value="${row3.kind}"> 
						                <tr>
						                	<td name="cart_id"><input type="checkbox" class="check_id3" name="check" value="${row3.cart_id }" ></td>
						                	<td>${row3.cart_id }<input type="hidden" id="cart_id" name="cart_id" value="${row3.cart_id}"/></td>
						                	
						                	
						                    <td>
						                    
						                        <a href="${path}/${row3.kind}/view.do?idx=${row3.idx}&curPage=1&searchOption=${map.searchOption}&keyword=${map.keyword}">
						                        ${row3.modelname}</a>
						                     
						                    </td>
						                    
						                    
						                    
						                    <td align="right">
						                        <fmt:formatNumber pattern="###,###,###" value="${row3.price}"/> 원
						                        <input type="hidden" name="price" value="${row3.price}">
						                    </td>
						                    <td align="right">
						                        ${row3.amount} 개
						                        <input type="hidden"  name="amount" value="${row3.amount}"> 
						                    </td>
						                    
						                    <td name="price" align="right">
						                    	<input type="hidden" value="${row3.money}"/>
						                        <fmt:formatNumber pattern="###,###,###" value="${row3.money}"/>
						                    </td>
						                    <td>
						                    	${row3.user_id} 
						                    </td>
						                    <td>
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
						                    </td>
						                    <td>
						                   		 ${row3.orderdate}
						                    </td>
						                    <%-- <td>
						                        <a href="${path}/shop/cart/delete.do?cart_id=${row3.cart_id}">
						                        <input type="hidden" name="cart_id" value="${row3.cart_id}">삭제</a>
						                    </td> --%>
						                </tr>
						                </c:forEach>
	                                </tbody>
	                            </table>
	                            </c:otherwise>
							    </c:choose>
	                            
                                
	                        </div>
	                        <div class="shopingcart-bottom-area">
	                        	<input type="submit" id="order" class="btn-default" name="order" value="교환승인"/>
	                            
	                        </div>
	                        </form>
                                </div>
                            </div>
                        </div>
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
			<!-- <div class="col-md-2"></div> -->
				<div class="col-md-6 col-sm-6">
					<div class="single-banner" style="padding:5%">
						<div style="height=350;width=350">
						<canvas id="canvas4" style="width: 322px; height: 322px;" height="402" width="402"></canvas></div>
						<div class="banner-bottom text-center">
							<a href="#">NEW RELEASE 2016</a>
						</div>
					</div>
				</div>
				
				<div class="col-md-6 hidden-sm">
					<div class="single-banner" style="padding:5%">
					<div style="height=350;width=350">
					<canvas id="canvas3" style="width: 322px; height: 322px;" height="402" width="402"></canvas></div>
						<div class="banner-bottom text-center">
							<a href="#">NEW RELEASE 2016</a>
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
		
    </body>
</html>