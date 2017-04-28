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
	communityBoardList(1);
    faqBoardList(1);
    $('#faq-links div').click(function(){
    	_movePage(1);
    });
});
function communityBoardList(pageNo){
    var comAjax = new ComAjax();
    comAjax.setUrl("<c:url value='/admin/community/list.do' />");
    comAjax.setCallback("communityBoardListCallback");
    comAjax.addParam("communityPAGEINDEX",pageNo);
    comAjax.addParam("PAGE_ROW", 5);
    comAjax.ajax();
}

function communityBoardListCallback(data){
    var total = data.TOTAL;

    var body = $("#communitylist");
    body.empty();
    if(total == 0){
        var str = "<tr>" +
                  "<td colspan='4'>조회된 결과가 없습니다.</td>" +
                  "</tr>";
        body.append(str);
    }
    else{
        var params = {
            divId : "communityPAGE",
            pageIndex : "communityPAGEINDEX",
            totalCount : total,
            eventName : "communityBoardList",
            Movename  :  "_movePage"
        };
        gfn_renderPaging(params);
         
        var str = "";
        $.each(data.list, function(key, value){
            str += 
				"<li><a href='#'>" +
					"<span class='col-md-1'>" + value.idx + "</span> " + 
					"<span class='col-md-3'>" + value.title + "("+value.recnt+")</span> " + 
					"<span class='col-md-2'>" + value.writer + "</span> " +
					"<span class='col-md-2'>" + value.viewcnt + "</span> " + 
					"<span class='col-md-2'>" + value.regdate + "</span> " + 
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
    $("#communityPAGEINDEX").val(value);
    if(typeof(communityBoardList) == "function"){
    	communityBoardList(value);
    }
    else {
        eval(communityBoardList + "(value);");
    }
    $("#faqPAGEINDEX").val(value);
    if(typeof(faqBoardList) == "function"){
    	faqBoardList(value);
    }
    else {
        eval(faqBoardList + "(value);");
    }
    accordWithPage();
}
function faqBoardList(pageNo){
    var comAjax = new ComAjax();
    comAjax.setUrl("<c:url value='/admin/faq/list.do' />");
    comAjax.setCallback("faqBoardListCallback");
    comAjax.addParam("faqPAGEINDEX",pageNo);
    comAjax.addParam("PAGE_ROW", 5);
    comAjax.ajax();
}
function faqBoardListCallback(data){
    var total = data.TOTAL;

    var body = $("#faqlist");
    body.empty();
    if(total == 0){
        var str = "<tr>" +
                        "<td colspan='4'>조회된 결과가 없습니다.</td>" +
                    "</tr>";
        body.append(str);
    }
    else{
        var params = {
            divId : "faqPAGE",
            pageIndex : "faqPAGEINDEX",
            totalCount : total,
            eventName : "faqBoardList",
            Movename  :  "_movePage"
        };
        gfn_renderPaging(params);
         
        var str = "";
        $.each(data.list, function(key, value){
            str += 
				"<li><a href='#'>" +
				"<span class='col-md-1'>" + value.idx + "</span> " + 
				"<span class='col-md-3'>" + value.title + "("+value.recnt+")</span> " + 
				"<span class='col-md-2'>" + value.writer + "</span> " +
				"<span class='col-md-2'>" + value.viewcnt + "</span> " + 
				"<span class='col-md-2'>" + value.regdate + "</span> " + 
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
				    <div id="service" class="faq-selected col-md-6">공지사항</div>
				    <div id="installation" class="col-md-6">QnA</div>
				    <div id="mobile" > </div>
				</div>
						<div id="faq-wrapper" class="about-service">
							<div class="faq-group">
								<div class="slide-left">
									<div id="communityPAGE"></div>
   		 							<input type="hidden" id="communityPAGEINDEX" name="communityPAGEINDEX"/>
								</div>
								<hr>
							</div>
							<!--faq-group-->
							<div class="slide-left">
								<div class="faq">
									<ul class="faq-accordion" id="communitylist">

									</ul>
								</div>
							</div>
						</div>
						<div class="about-installation faq-hide">
							<div class="faq-group">
								<div class="slide-left">
									<div id="faqPAGE"></div>
   		 							<input type="hidden" id="faqPAGEINDEX" name="faqPAGEINDEX"/>
								</div>
								<hr>
							</div>

							<div class="slide-left">
								<ul class="faq-accordion" id="faqlist">

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
