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
<script src="${path}/resources/admin/num/jquery.color.min.js"></script>
<script src="${path}/resources/admin/num/jquery.animateNumber.min.js"></script>
<script type="text/javascript">
$(document).ready(function () {
	$('#editorcommunity').show();
	$('#communityBoardcreate').hide();
	$('#editorfaq').show();
	$('#faqBoardcreate').hide();
	$('#changeeditorcommunity').hide();
	$('#communityBoardupdate').hide();
	$('#changeeditorfaq').hide();
	$('#faqBoardupdate').hide();
	$(".hover").mouseleave(function () {
		$(this).removeClass("hover");
	});
    communityBoardList(1);
    faqBoardList(1);
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
    var percent_number_step = $.animateNumber.numberStepFactories.append(' 개')
	$('#communityBoardcnt').animateNumber({
		number: total,color: 'black','font-size': '37px',
		easing: 'easeInQuad',numberStep: percent_number_step
	}, 500);
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
    var body = $("#read");
    body.empty();
    var str = "<button class='dialog__trigger' onclick='communityBoarddelete("+ data.community.idx +")'>삭제</button></h4>" + 
    		"<div class='header'>" +
                "<h4 class='title' id='title'>" + data.community.title + "</h4>" +
                "<input type='hidden' id='idx' value='"+ data.community.idx +"' />"+
                "<p class='category'>작성자:" + data.community.writer + "조회수:" + data.community.viewcnt + "날짜:" + data.community.regdate + "</p>" +
            "</div>" +
            "<div class='content'>" +
            	data.community.content +
            "</div>";
    body.append(str);
	$('#editorcommunity').hide();
	$('#communityBoardcreate').hide();
	$('#editorfaq').hide();
	$('#faqBoardcreate').hide();
	$('#changeeditorcommunity').show();
	$('#communityBoardupdate').hide();
	$('#changeeditorfaq').hide();
	$('#faqBoardupdate').hide();
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
    var percent_number_step = $.animateNumber.numberStepFactories.append(' 개')
	$('#faqBoardcnt').animateNumber({
		number: total,color: 'black','font-size': '37px',
		easing: 'easeInQuad',numberStep: percent_number_step
	}, 500);
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
    var body = $("#read");
    body.empty();
    var str = 
    	"<button class='dialog__trigger' onclick='faqBoarddelete("+ data.faq.idx +")'>삭제</button></h4>" + 
    		"<div class='header'>" +
                "<h4 class='title' id='title'>" + data.faq.title + "</h4>" +
                "<input type='hidden' id='idx' value='"+ data.faq.idx +"' />"+
                "<p class='category'>작성자:" + data.faq.writer + "조회수:" + data.faq.viewcnt + "날짜:" + data.faq.regdate + "</p>" +
            "</div>" +
            "<div class='content'>" +
            	data.faq.content +
            "</div>";
    body.append(str);
	$('#editorcommunity').hide();
	$('#faqBoardcreate').hide();
	$('#editorfaq').hide();
	$('#communityBoardcreate').hide();
	$('#changeeditorcommunity').hide();
	$('#communityBoardupdate').hide();
	$('#changeeditorfaq').show();
	$('#faqBoardupdate').hide();
}
function communityBoardcreate(){
    var comAjax = new ComAjax();
    comAjax.setUrl("<c:url value='/admin/community/create.do' />");
    var title = $("#title").val();
    var content = CKEDITOR.instances.content.document.getBody().getText();
    comAjax.addParam("title",title);
    comAjax.addParam("content",content);
    comAjax.ajax();
    location.reload();
}
function faqBoardcreate(){
    var comAjax = new ComAjax();
    comAjax.setUrl("<c:url value='/admin/faq/create.do' />");
    var title = $("#title").val();
    var content = CKEDITOR.instances.content.document.getBody().getText();
    comAjax.addParam("title",title);
    comAjax.addParam("content",content);
    comAjax.ajax();
    location.reload();
}
function communityBoardupdate(){
    var comAjax = new ComAjax();
    comAjax.setUrl("<c:url value='/admin/community/update.do' />");
    var title = $("#title").val();
    var content = CKEDITOR.instances.content.document.getBody().getText();
    var idx = $('#idx').val();
    comAjax.addParam("idx",idx);
    comAjax.addParam("title",title);
    comAjax.addParam("content",content);
    comAjax.ajax();
    location.reload();
}
function faqBoardupdate(){
    var comAjax = new ComAjax();
    comAjax.setUrl("<c:url value='/admin/faq/update.do' />");
    var title = $("#title").val();
    var content = CKEDITOR.instances.content.document.getBody().getText();
    var idx = $('#idx').val();
    console.log(idx);
    console.log(content);
    console.log(title);
    comAjax.addParam("idx",idx);
    comAjax.addParam("title",title);
    comAjax.addParam("content",content);
    comAjax.ajax();
    location.reload();
}
function faqBoarddelete(idx){
    var comAjax = new ComAjax();
    comAjax.setUrl("<c:url value='/admin/faq/delete.do' />");
    comAjax.addParam("faqidx",idx);
    comAjax.ajax();
    _movePage($("#faqPAGEINDEX").val());
}

function editorcommunity(){
    var body = $("#read");
    str="<div class='header'>" +
		"<h4 class='title'>제목 " +
	    "<input type='text' id='title'></input></h4>" +
	"</div>" +
	"<div class='content'>" +
	"<textarea name='content' id='content'></textarea>"+
	"<script>"+
	"CKEDITOR.replace('content',{"+
		"height : '600px',"+
		"filebrowserUploadUrl : '${path}/community/imageUpload.do'"+
	"});"+
	"</sc"+"ript>"+
	"</div>";
    body.empty();
    body.append(str);
	$('#editorcommunity').hide();
	$('#communityBoardcreate').show();
	$('#editorfaq').hide();
	$('#faqBoardcreate').hide();
	$('#changeeditorcommunity').hide();
	$('#communityBoardupdate').hide();
	$('#changeeditorfaq').hide();
	$('#faqBoardupdate').hide();
}
function editorfaq(){
    var body = $("#read");
    str="<div class='header'>" +
		"<h4 class='title'>제목 " +
	    "<input type='text' id='title'></input></h4>" +
	"</div>" +
	"<div class='content'>" +
	"<textarea name='content' id='content'></textarea>"+
	"<script>"+
	"CKEDITOR.replace('content',{"+
		"height : '600px',"+
		"filebrowserUploadUrl : '${path}/faq/imageUpload.do'"+
	"});"+
	"</sc"+"ript>"+
	"</div>";
    body.empty();
    body.append(str);
	$('#editorcommunity').hide();
	$('#communityBoardcreate').hide();
	$('#editorfaq').hide();
	$('#faqBoardcreate').show();
	$('#changeeditorcommunity').hide();
	$('#communityBoardupdate').hide();	
	$('#changeeditorfaq').hide();
	$('#faqBoardupdate').hide();
}
function changeeditorcommunity(){
    var body = $("#read");
    var content = $("#read .content");
    var title = $("#title").text();
    var idx = $('#idx').val();
    str="<div class='header'>" +
		"<h4 class='title'>제목 " +
	    "<input type='text' id='title' value='"+title+"'></input></h4>" +
        "<input type='hidden' id='idx' value='"+ idx +"' />"+
	"</div>" +
	"<div class='content'>" +
	"<textarea name='content' id='content'>"+content.html()+"</textarea>"+
	"<script>"+
	"CKEDITOR.replace('content',{"+
		"height : '600px',"+
		"filebrowserUploadUrl : '${path}/community/imageUpload.do'"+
	"});"+
	"</sc"+"ript>"+ 
	"</div>"; 
	body.empty();
    body.append(str);
	$('#editorcommunity').hide();
	$('#communityBoardcreate').hide();
	$('#editorfaq').hide();
	$('#faqBoardcreate').hide();
	$('#changeeditorcommunity').hide();
	$('#communityBoardupdate').show();
	$('#changeeditorfaq').hide();
	$('#faqBoardupdate').hide();
    
}
function changeeditorfaq(){
    var body = $("#read");
    var content = $("#read .content");
    var title = $("#title").text();
    var idx = $('#idx').val();
    str="<div class='header'>" +
		"<h4 class='title'>제목 " +
	    "<input type='text' id='title' value='"+title+"'></input></h4>" +
        "<input type='hidden' id='idx' value='"+ idx +"' />"+
	"</div>" +
	"<div class='content'>" +
	"<textarea name='content' id='content'>"+content.html()+"</textarea>"+
	"<script>"+
	"CKEDITOR.replace('content',{"+
		"height : '600px',"+
		"filebrowserUploadUrl : '${path}/faq/imageUpload.do'"+
	"});"+
	"</sc"+"ript>"+ 
	"</div>"; 
	body.empty();
    body.append(str);
	$('#editorcommunity').hide();
	$('#communityBoardcreate').hide();
	$('#editorfaq').hide();
	$('#faqBoardcreate').hide();
	$('#changeeditorcommunity').hide();
	$('#communityBoardupdate').hide();
	$('#changeeditorfaq').hide();
	$('#faqBoardupdate').show();
}
function editorcloses(){
	var body = $("#read");
	body.empty();
	$('#editorcommunity').show();
	$('#communityBoardcreate').hide();
	$('#editorfaq').show();
	$('#faqBoardcreate').hide();
	$('#changeeditorcommunity').hide();
	$('#communityBoardupdate').hide();
	$('#changeeditorfaq').hide();
	$('#faqBoardupdate').hide();
}
</script>
<body>
<div class="wrapper">
<%@ include file="adminsidebar.jsp"%>
    <div class="main-panel">
<%@ include file="admininsideheader.jsp"%>
        <div class="content">
            <div class="container-fluid">
            <div class="row"><hr> </div>
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-2">
	             	<div class="card">
						<div class="header" style="text-align: center">
							<h4 class="title" style="font-family: yanolja; font-size: 37px">공지사항</h4>
						</div>
						<div class="content">
							<div id="communityBoardcnt" class="num" style="text-align:center; font-family: yanolja;font-size: 37px">1</div>
						</div>
					</div>
				</div>
				
				<div class="col-md-4"></div>
				<div class="col-md-2">
	             	<div class="card">
						<div class="header" style="text-align: center">
							<h4 class="title" style="font-family: yanolja; font-size: 37px">QnA</h4>
						</div>
						<div class="content">
							<div id="faqBoardcnt" class="num" style="text-align:center; font-family: yanolja;font-size: 37px">1</div>
						</div>
					</div>
				</div>
			</div>
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
                        <button class="dialog__trigger" id="editorcommunity" onclick="editorcommunity()">공지작성</button>
                        <button class="dialog__trigger" id="communityBoardcreate" onclick="communityBoardcreate()">공지저장</button>
                        <button class="dialog__trigger" id="editorfaq" onclick="editorfaq()">QnA작성</button>
                        <button class="dialog__trigger" id="faqBoardcreate" onclick="faqBoardcreate()">QnA저장</button>
                        <button class="dialog__trigger" id="changeeditorcommunity" onclick="changeeditorcommunity()">공지수정</button>
                        <button class="dialog__trigger" id="communityBoardupdate" onclick="communityBoardupdate()">공지수정저장</button>
                        <button class="dialog__trigger" id="changeeditorfaq" onclick="changeeditorfaq()">QnA수정</button>
                        <button class="dialog__trigger" id="faqBoardupdate" onclick="faqBoardupdate()">QnA수정저장</button>
                        <button class="dialog__trigger" id="editorcloses" onclick="editorcloses()">닫기</button>
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
