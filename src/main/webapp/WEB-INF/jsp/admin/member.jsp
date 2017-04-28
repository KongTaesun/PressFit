<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="en">
<%@ include file="adminheader.jsp"%>
<script src="${path}/resources/admin/admin.js"></script>
<script src="${path}/resources/admin/num/jquery.color.min.js"></script>
<script src="${path}/resources/admin/num/jquery.animateNumber.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel="stylesheet" href="${path}/resources/admin/css/style.css">
<script type="text/javascript">
$(document).ready(function () {
	businessBoardList(1);
    memberBoardList(1);
    $('#faq-links div').click(function(){
    	_movePage(1);
    });
    var percent_number_step = $.animateNumber.numberStepFactories.append(' 명')
	$('#allcnt').animateNumber({
		number: 10,
		color: 'black','font-size': '37px',
		easing: 'easeInQuad',numberStep: percent_number_step
	}, 2000);

});
function businessBoardList(pageNo){
    var comAjax = new ComAjax();
    comAjax.setUrl("<c:url value='/admin/business/list.do' />");
    comAjax.setCallback("businessBoardListCallback");
    comAjax.addParam("businessPAGEINDEX",pageNo);
    comAjax.addParam("PAGE_ROW", 5);
    comAjax.ajax();
}

function businessBoardListCallback(data){
    var total = data.TOTAL;
    var percent_number_step = $.animateNumber.numberStepFactories.append(' 명')
	$('#businesscnt').animateNumber({
		number: total,color: 'black','font-size': '37px',
		easing: 'easeInQuad',numberStep: percent_number_step
	}, 500);
    var body = $("#businesslist");
    body.empty();
    if(total == 0){
        var str = "<tr>" +
                        "<td colspan='4'>조회된 결과가 없습니다.</td>" +
                    "</tr>";
        body.append(str);
    }
    else{
        var params = {
            divId : "businessPAGE",
            pageIndex : "businessPAGEINDEX",
            totalCount : total,
            eventName : "businessBoardList",
            Movename  :  "_movePage"
        };
        gfn_renderPaging(params);
         
        var str = "";
        $.each(data.list, function(key, value){
            str += 
				"<li><a href='#'>" +
					"<span class='col-md-1'>" + value.idx + "</span> " + 
					"<span class='col-md-3'>" + value.id + "</span> " + 
					"<span class='col-md-2'>" + value.name + "</span> " +
					"<span class='col-md-2'>경고:" + value.warn + "</span> " +
					"<span class='col-md-1'>"+
					"<button onclick='businessdelete("+ value.idx +")'>삭제</button></span> " +
					"<span class='col-md-1'>"+
					"<button onclick='businessupdate1("+ value.idx +")'>PW변경</button></span> " +
					"<span class='col-md-1'>"+
					"<button onclick='businessupdate2("+ value.idx +")'>경고</button></span> " +
				"</a>" +
				"<ul class='faq-content'>" +
					"<li><div>" +
					"<h1 style='padding: 10px;'>사업자정보</h1>" +
					"<table class='table table-hover'>" +
	                "<thead>" +
	                    "<th>id</th>" +
	                	"<th>name</th>" +
	                	"<th>gender</th>" +
	                	"<th>birth</th>" +
	                	"<th>email</th>" +
	                	"<th>hp</th>" +
	                	"<th>address</th>" +
	                "</thead>" +
	                "<tbody>" +
	                "    <tr>" +
	                "    	<td>"+value.id+"</td>" +
	                "    	<td>"+value.name+"</td>" +
	                "    	<td>"+value.gender+"</td>" +
	                "    	<td>"+value.birth+"</td>" +
	                "    	<td>"+value.email+"</td>" +
	                "    	<td>"+value.hp+"</td>" +
	                "    	<td>"+value.address+"</td>" +
	                "    </tr>" +
	                "</tbody>" +
	                "<thead>" +
	                    "<th>companyname</th>" +
	                	"<th>companytp</th>" +
	                	"<th>representative</th>" +
	                	"<th>corporateregistration</th>" +
	                	"<th>typeofbusiness</th>" +
	                	"<th>itemsofbusiness</th>" +
	                	"<th>companyaddress</th>" +
	                "</thead>" +
	                "<tbody>" +
	                "    <tr>" +
	                "    	<td>"+value.companyname+"</td>" +
	                "    	<td>"+value.companytp+"</td>" +
	                "    	<td>"+value.representative+"</td>" +
	                "    	<td>"+value.corporateregistrationnumber+"</td>" +
	                "    	<td>"+value.typeofbusiness+"</td>" +
	                "    	<td>"+value.itemsofbusiness+"</td>" +
	                "    	<td>"+value.companyaddress+"</td>" +
	                "    </tr>" +
	                "</tbody>" +
	            "</table>" +
				"</ul></li>";
        });
        body.append(str);
    }
}
function businessdelete(idx){
    var comAjax = new ComAjax();
    comAjax.setUrl("<c:url value='/admin/business/delete.do' />");
    comAjax.addParam("businessidx",idx);
    comAjax.ajax();
    _movePage($("#businessPAGEINDEX").val());
}
function businessupdate1(idx){
    var comAjax = new ComAjax();
    comAjax.setUrl("<c:url value='/admin/business/update1.do' />");
    comAjax.addParam("businessidx",idx);
    var password = prompt('변경할 비밀번호를 입력하세요', '1234'); 
    alert(password);
    comAjax.addParam("password",password);
    comAjax.ajax();
}
function businessupdate2(idx){
    var comAjax = new ComAjax();
    comAjax.setUrl("<c:url value='/admin/business/update2.do' />");
    comAjax.addParam("businessidx",idx);
    comAjax.ajax();
}
function _movePage(value){
    $("#businessPAGEINDEX").val(value);
    if(typeof(businessBoardList) == "function"){
    	businessBoardList(value);
    }
    else {
        eval(businessBoardList + "(value);");
    }
    $("#memberPAGEINDEX").val(value);
    if(typeof(memberBoardList) == "function"){
    	memberBoardList(value);
    }
    else {
        eval(memberBoardList + "(value);");
    }
    accordWithPage();
}
function memberBoardList(pageNo){
    var comAjax = new ComAjax();
    comAjax.setUrl("<c:url value='/admin/member/list.do' />");
    comAjax.setCallback("memberBoardListCallback");
    comAjax.addParam("memberPAGEINDEX",pageNo);
    comAjax.addParam("PAGE_ROW", 5);
    comAjax.ajax();
}
function memberBoardListCallback(data){
    var total = data.TOTAL;
    var percent_number_step = $.animateNumber.numberStepFactories.append(' 명')
	$('#membercnt').animateNumber({
		number: total,color: 'black','font-size': '37px',
		easing: 'easeInQuad',numberStep: percent_number_step
	}, 500);
    var body = $("#memberlist");
    body.empty();
    if(total == 0){
        var str = "<tr>" +
                        "<td colspan='4'>조회된 결과가 없습니다.</td>" +
                    "</tr>";
        body.append(str);
    }
    else{
        var params = {
            divId : "memberPAGE",
            pageIndex : "memberPAGEINDEX",
            totalCount : total,
            eventName : "memberBoardList",
            Movename  :  "_movePage"
        };
        gfn_renderPaging(params);
         
        var str = "";
        $.each(data.list, function(key, value){
            str += 
				"<li><a href='#'>" +
				"<span class='col-md-1'>" + value.idx + "</span> " + 
				"<span class='col-md-3'>" + value.id + "</span> " + 
				"<span class='col-md-2'>" + value.name + "</span> " +
				"<span class='col-md-2'>경고:" + value.warn + "</span> " +
				"<span class='col-md-1'>"+
				"<button onclick='memberdelete("+ value.idx +")'>삭제</button></span> " +
				"<span class='col-md-1'>"+
				"<button onclick='memberupdate1("+ value.idx +")'>PW변경</button></span> " +
				"<span class='col-md-1'>"+
				"<button onclick='memberupdate2("+ value.idx +")'>경고</button></span> " +
			"</a>" +
			"<ul class='faq-content'>" +
				"<li><div>" +
				"<h1 style='padding: 10px;'>회원정보</h1>" +
				"<table class='table table-hover'>" +
	                "<thead>" +
	                    "<th>id</th>" +
	                	"<th>name</th>" +
	                	"<th>gender</th>" +
	                	"<th>birth</th>" +
	                	"<th>email</th>" +
	                	"<th>hp</th>" +
	                	"<th>address</th>" +
	                "</thead>" +
	                "<tbody>" +
	                "    <tr>" +
	                "    	<td>"+value.id+"</td>" +
	                "    	<td>"+value.name+"</td>" +
	                "    	<td>"+value.gender+"</td>" +
	                "    	<td>"+value.birth+"</td>" +
	                "    	<td>"+value.email+"</td>" +
	                "    	<td>"+value.hp+"</td>" +
	                "    	<td>"+value.address+"</td>" +
	                "    </tr>" +
	                "</tbody>" +
	            "</table>" +
			"</ul></li>";
        });
        body.append(str);
    }
}
function memberdelete(idx){
    var comAjax = new ComAjax();
    comAjax.setUrl("<c:url value='/admin/member/delete.do' />");
    comAjax.addParam("memberidx",idx);
    comAjax.ajax();
    _movePage($("#memberPAGEINDEX").val());
}
function memberupdate1(idx){
    var comAjax = new ComAjax();
    comAjax.setUrl("<c:url value='/admin/member/update1.do' />");
    comAjax.addParam("memberidx",idx);
    var password = prompt('변경할 비밀번호를 입력하세요', '1234'); 
    alert(password);
    comAjax.addParam("password",password);
    comAjax.ajax();
}
function memberupdate2(idx){
    var comAjax = new ComAjax();
    comAjax.setUrl("<c:url value='/admin/member/update2.do' />");
    comAjax.addParam("memberidx",idx);
    comAjax.ajax();
}
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
				<div class="col-md-3">
	             	<div class="card">
						<div class="header" style="text-align: center">
							<h4 class="title" style="font-family: yanolja; font-size: 37px">사업자</h4>
						</div>
						<div class="content">
							<div id="businesscnt" class="num" style="text-align:center; font-family: yanolja;font-size: 37px">1</div>
						</div>
					</div>
				</div>
				<div class="col-md-3">
	             	<div class="card">
						<div class="header" style="text-align: center">
							<h4 class="title" style="font-family: yanolja; font-size: 37px">멤버</h4>
						</div>
						<div class="content">
							<div id="membercnt" class="num" style="text-align:center; font-family: yanolja;font-size: 37px">1</div>
						</div>
					</div>
				</div>
				<div class="col-md-3">
	             	<div class="card">
						<div class="header" style="text-align: center">
							<h4 class="title" style="font-family: yanolja; font-size: 37px">총원</h4>
						</div>
						<div class="content">
							<div id="allcnt" class="num" style="text-align:center; font-family: yanolja;font-size: 37px">1</div>
						</div>
					</div>
				</div>
				
			</div>
            <div class="row">
				<div class="col-md-12">
             	<div class="card">
            	<div id="faq-links">
				    <div id="service" class="faq-selected col-md-6">business</div>
				    <div id="installation" class="col-md-6">member</div>
				    <div id="mobile" > </div>
				</div>
					<div id="faq-wrapper" class="about-service">
						<div class="faq-group">
							<div class="slide-left">
								<div id="businessPAGE"></div>
   	 							<input type="hidden" id="businessPAGEINDEX" name="businessPAGEINDEX"/>
							</div>
							<hr>
						</div>
						<!--faq-group-->
						<div class="slide-left">
							<div class="faq">
								<ul class="faq-accordion" id="businesslist">
									</ul>
							</div>
						</div>
					</div>
					<div class="about-installation faq-hide">
						<div class="faq-group">
							<div class="slide-left">
								<div id="memberPAGE"></div>
  		 							<input type="hidden" id="memberPAGEINDEX" name="memberPAGEINDEX"/>
							</div>
							<hr>
						</div>
							<div class="slide-left">
							<ul class="faq-accordion" id="memberlist">
								</ul>
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
<script src="${path}/resources/admin/js/index.js"></script>
    
</body>
</html>
