<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="en">
<%@ include file="adminheader.jsp"%>
<script src="${path}/resources/admin/admin.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel="stylesheet" href="${path}/resources/admin/css/style.css">
<script src="<c:url value='/resources/ckediter/ckeditor.js' />"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript">
$(document).ready(function () {
	$(".hover").mouseleave(function () {
		$(this).removeClass("hover");
	});
    communityBoardList(1);
    faqBoardList(1);
    
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

});
function _movePage(value){
    $("#communityPAGEINDEX").val(value);
    if(typeof(communityBoardList) == "function"){
    	communityBoardList(value);
    }
    else {
        eval(communityBoardList + "(value);");
    }
}
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
            str += "    <tr>" +
				   "    	<td>"+value.idx+"</td>" +
				   "    	<td><a href='#' onclick='communityBoardread("+ value.idx +")'>" + value.title + "("+value.recnt+")</a></td>" +
				   "    	<td>"+value.writer+"</td>" +
				   "    	<td>"+value.viewcnt+"</td>" +
				   "    	<td></td>" +
				   "    	<td></td>" +
				   "    </tr>";
        });
        body.append(str);
    }
}
function communityBoardread(idx){
    var comAjax = new ComAjax();
    comAjax.setUrl("<c:url value='/admin/community/read.do' />");
    comAjax.setCallback("communityBoardreadCallback");
    comAjax.addParam("communityidx",idx);
    comAjax.ajax();
}
function communityBoardreadCallback(data){
    var body = $("#communityread");
    body.empty();
    var str = "<button class='dialog__trigger' onclick='communityBoarddelete("+ data.community.idx +")'>삭제</button></h4>" + 
    		"<div class='header'>" +
                "<h4 class='title'>" + data.community.title + 
                "<p class='category'>작성자:" + data.community.writer + "조회수:" + data.community.viewcnt + "날짜:" + data.community.regdate + "</p>" +
            "</div>" +
            "<div class='content'>" +
            	data.community.content +
            "</div>";
    body.append(str);
}
function communityBoardcreate(){
    var comAjax = new ComAjax();
    comAjax.setUrl("<c:url value='/admin/community/create.do' />");
    comAjax.addParam("communityPAGEINDEX",pageNo);
    comAjax.ajax();
}
function communityBoardupdate(pageNo){
    var comAjax = new ComAjax();
    comAjax.setUrl("<c:url value='/admin/community/update.do' />");
    comAjax.addParam("communityPAGEINDEX",pageNo);
    comAjax.ajax();
}
function communityBoarddelete(idx){
    var comAjax = new ComAjax();
    comAjax.setUrl("<c:url value='/admin/community/delete.do' />");
    comAjax.addParam("communityidx",idx);
    comAjax.ajax();
    _movePage($("#communityPAGEINDEX").val());
}
function _movePage2(value){
    $("#faqPAGEINDEX").val(value);
    if(typeof(faqBoardList) == "function"){
    	faqBoardList(value);
    }
    else {
        eval(faqBoardList + "(value);");
    }
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
            Movename  :  "_movePage2"
        };
        gfn_renderPaging(params);
         
        var str = "";
        $.each(data.list, function(key, value){	
            str += "    <tr>" +
				   "    	<td>"+value.idx+"</td>" +
				   "    	<td><a href='#' onclick='faqBoardread("+ value.idx +")'>" + value.title + "("+value.recnt+")</a></td>" +
				   "    	<td>"+value.writer+"</td>" +
				   "    	<td>"+value.viewcnt+"</td>" +
				   "    	<td></td>" +
				   "    	<td></td>" +
				   "    </tr>";
        });
        body.append(str);
    }
}
function faqBoardread(idx){
    var comAjax = new ComAjax();
    comAjax.setUrl("<c:url value='/admin/faq/read.do' />");
    comAjax.setCallback("faqBoardreadCallback");
    comAjax.addParam("faqidx",idx);
    comAjax.ajax();
}
function faqBoardreadCallback(data){
    var body = $("#faqread");
    body.empty();
    var str = "<button class='dialog__trigger' onclick='faqBoarddelete("+ data.faq.idx +")'>삭제</button></h4>" + 
    		"<div class='header'>" +
                "<h4 class='title'>" + data.faq.title + 
                "<p class='category'>작성자:" + data.faq.writer + "조회수:" + data.faq.viewcnt + "날짜:" + data.faq.regdate + "</p>" +
            "</div>" +
            "<div class='content'>" +
            	data.faq.content +
            "</div>";
    body.append(str);
}
function faqBoardcreate(){
    var comAjax = new ComAjax();
    comAjax.setUrl("<c:url value='/admin/faq/create.do' />");
    comAjax.addParam("faqPAGEINDEX",pageNo);
    comAjax.ajax();
}
function faqBoardupdate(pageNo){
    var comAjax = new ComAjax();
    comAjax.setUrl("<c:url value='/admin/faq/update.do' />");
    comAjax.addParam("faqPAGEINDEX",pageNo);
    comAjax.ajax();
}
function faqBoarddelete(idx){
    var comAjax = new ComAjax();
    comAjax.setUrl("<c:url value='/admin/faq/delete.do' />");
    comAjax.addParam("faqidx",idx);
    comAjax.ajax();
    _movePage($("#faqPAGEINDEX").val());
}
function createeditor(){
    var body = $("#read");
    if(body.html()!=null){
    	body.empty();    	
    }    
    var str = "<div class='header'>" +
    			"<h4 class='title'>제목 " +
                "<input type='text'></input></h4>" +
            "</div>" +
            "<div class='content'>" +
            "<textarea name='content' id='content'>"+body.html()+"</textarea>"+
            "<script>"+
            "CKEDITOR.replace('content',{"+
            	"height : '600px',"+
            	"filebrowserUploadUrl : '${path}/gallery/imageUpload.do'"+
            "});"+
            "</sc"+"ript>"+
            "</div>";
    body.empty();
    body.append(str);
}
function changeeditor(){
    var body = $("#read .content");
    str="<div class='header'>" +
		"<h4 class='title'>제목 " +
	    "<input type='text'></input></h4>" +
	"</div>" +
	"<div class='content'>" +
	"<textarea name='content' id='content'>"+body.html()+"</textarea>"+
	"<script>"+
	"CKEDITOR.replace('content',{"+
		"height : '600px',"+
		"filebrowserUploadUrl : '${path}/gallery/imageUpload.do'"+
	"});"+
	"</sc"+"ript>"+
	"</div>";
    body.empty();
    body.append(str);
}
function editorcloses(){
	var body = $("#read");
	body.empty();
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
                   <div class="col-md-6">
                   <div class="card">
                   <div class="header" style="text-align: center">
					<div id="communityPAGE"></div>
		   		 	<input type="hidden" id="communityPAGEINDEX" name="communityPAGEINDEX"/>
		   		 	</div>
	   		 		<table class='table table-hover'>
		                <thead>
		                	<th>idx</th>
		                	<th>title</th>
		                	<th>writer</th>
		                	<th>viewcnt</th>
		                </thead>
		                <tbody id="communitylist">
		                
		                </tbody>
		            </table>
		            </div>
	            </div>
	            <div class="col-md-6">
	            <div class="card">
	            <div class="header" style="text-align: center">
	            	<div id="faqPAGE"></div>
		   		 	<input type="hidden" id="faqPAGEINDEX" name="faqPAGEINDEX"/>
		   		 	</div>
	   		 		<table class='table table-hover'>
		                <thead>
		                   <th>idx</th>
		                	<th>title</th>
		                	<th>writer</th>
		                	<th>viewcnt</th>
		                </thead>
		                <tbody id="faqlist">
		                
		                </tbody>
		            </table>
		           </div>
	            </div>
	        </div>
          <div class="row">
                   <div class="col-md-2"></div>
                   <div class="col-md-8">
                        <div>
                        <button class="dialog__trigger" onclick="createeditor()">새글</button>
                        <button class="dialog__trigger" onclick="communityBoardcreate()">공지작성</button>
                        <button class="dialog__trigger" onclick="faqBoardcreate()">QnA작성</button>
                        <button class="dialog__trigger" onclick="changeeditor()">수정</button>
                        <button class="dialog__trigger" onclick="communityBoardupdate()">저장</button>
                        <button class="dialog__trigger" onclick="editorcloses()">닫기</button>
                        </div>
                    </div>
                </div> 
            <div class="row">
                   <div class="col-md-2"></div>
                   <div class="col-md-8">
                       	<div class="card" id="read">
                           
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
