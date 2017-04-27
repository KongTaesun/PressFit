<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="en">
<%@ include file="adminheader.jsp"%>
<script src="${path}/resources/admin/admin.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel="stylesheet" href="${path}/resources/admin/css/style.css">
<script type="text/javascript">
$(document).ready(function () {
	businessBoardList(1);
    memberBoardList(1);
    $('#faq-links div').click(function(){
    	_movePage(1);
    });
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
				"</a>" +
				"<ul class='faq-content'>" +
					"<li><div><p>" +
						value.content +
					"</p></div></li>" +
				"</ul></li>";
        });
        body.append(str);
        
    }
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
			"</a>" +
			"<ul class='faq-content'>" +
				"<li><div><p>" +
					value.content +
				"</p></div></li>" +
			"</ul></li>";
        });
        body.append(str);
    }
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
				<div><input type="text" /><button>검색</button></div>
			</div>
            <div class="row">
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
<%@ include file="adminfooter.jsp"%>
    </div>
</div>
<script src="${path}/resources/admin/js/index.js"></script>
    
</body>
</html>
