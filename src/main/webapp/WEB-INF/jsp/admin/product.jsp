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
	tmouseBoardList(1);
    keyboardBoardList(1);
    $('#faq-links div').click(function(){
    	_movePage(1);
    });
});
function tmouseBoardList(pageNo){
    var comAjax = new ComAjax();
    comAjax.setUrl("<c:url value='/admin/tmouse/list.do' />");
    comAjax.setCallback("tmouseBoardListCallback");
    comAjax.addParam("tmousePAGEINDEX",pageNo);
    comAjax.addParam("PAGE_ROW", 5);
    comAjax.ajax();
}

function tmouseBoardListCallback(data){
    var total = data.TOTAL;

    var body = $("#tmouselist");
    body.empty();
    if(total == 0){
        var str = "<tr>" +
                        "<td colspan='4'>조회된 결과가 없습니다.</td>" +
                    "</tr>";
        body.append(str);
    }
    else{
        var params = {
            divId : "tmousePAGE",
            pageIndex : "tmousePAGEINDEX",
            totalCount : total,
            eventName : "tmouseBoardList",
            Movename  :  "_movePage"
        };
        gfn_renderPaging(params);
         
        var str = "";
        $.each(data.list, function(key, value){
            str += 
				"<li><a href='#'>" +
				"<span class='col-md-2'>" + value.manufacturecompany + "</span> " + 
				"<span class='col-md-5'>" + value.modelname + "("+value.recnt+")</span> " + 
				"<span class='col-md-2'>" + value.price + "</span> " +
				"<span class='col-md-1'>" + value.crea_id + "</span> " + 
				"<span class='col-md-1'>" + value.hit_cnt + "</span> " + 
			"</a>" +
			"<ul class='faq-content'>" +
				"<li><div><p>" +
				"<img src='${path}/resources/upload/"+value.fullName+"' style='width:570 ;height:550'>" +
					value.content +
				"</p></div></li>" +
			"</ul></li>";
        });
        body.append(str);
        
    }
}
function _movePage(value){
    $("#tmousePAGEINDEX").val(value);
    if(typeof(tmouseBoardList) == "function"){
    	tmouseBoardList(value);
    }
    else {
        eval(tmouseBoardList + "(value);");
    }
    $("#keyboardPAGEINDEX").val(value);
    if(typeof(keyboardBoardList) == "function"){
    	keyboardBoardList(value);
    }
    else {
        eval(keyboardBoardList + "(value);");
    }
    accordWithPage();
}
function keyboardBoardList(pageNo){
    var comAjax = new ComAjax();
    comAjax.setUrl("<c:url value='/admin/keyboard/list.do' />");
    comAjax.setCallback("keyboardBoardListCallback");
    comAjax.addParam("keyboardPAGEINDEX",pageNo);
    comAjax.addParam("PAGE_ROW", 5);
    comAjax.ajax();
}
function keyboardBoardListCallback(data){
    var total = data.TOTAL;

    var body = $("#keyboardlist");
    body.empty();
    if(total == 0){
        var str = "<tr>" +
                        "<td colspan='4'>조회된 결과가 없습니다.</td>" +
                    "</tr>";
        body.append(str);
    }
    else{
        var params = {
            divId : "keyboardPAGE",
            pageIndex : "keyboardPAGEINDEX",
            totalCount : total,
            eventName : "keyboardBoardList",
            Movename  :  "_movePage"
        };
        gfn_renderPaging(params);
         
        var str = "";
        $.each(data.list, function(key, value){
            str += 
				"<li><a href='#'>" +
				"<span class='col-md-2'>" + value.manufacturecompany + "</span> " + 
				"<span class='col-md-5'>" + value.modelname + "("+value.recnt+")</span> " + 
				"<span class='col-md-2'>" + value.price + "</span> " +
				"<span class='col-md-1'>" + value.crea_id + "</span> " + 
				"<span class='col-md-1'>" + value.hit_cnt + "</span> " + 
			"</a>" +
			"<ul class='faq-content'>" +
				"<li><div><p>" +
				"<img src='${path}/resources/upload/"+value.fullName+"' style='width:570 ;height:550'>" +
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
            	<div id="faq-links">
				    <div id="service" class="faq-selected col-md-6">tmouse</div>
				    <div id="installation" class="col-md-6">keyboard</div>
				    <div id="mobile" > </div>
				</div>
						<div id="faq-wrapper" class="about-service">
							<div class="faq-group">
								<div class="slide-left">
									<div id="tmousePAGE"></div>
   		 							<input type="hidden" id="tmousePAGEINDEX" name="tmousePAGEINDEX"/>
								</div>
								<hr>
							</div>
							<!--faq-group-->
							<div class="slide-left">
								<div class="faq">
									<ul class="faq-accordion" id="tmouselist">

									</ul>
								</div>
							</div>
						</div>
						<div class="about-installation faq-hide">
							<div class="faq-group">
								<div class="slide-left">
									<div id="keyboardPAGE"></div>
   		 							<input type="hidden" id="keyboardPAGEINDEX" name="keyboardPAGEINDEX"/>
								</div>
								<hr>
							</div>

							<div class="slide-left">
								<ul class="faq-accordion" id="keyboardlist">

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
