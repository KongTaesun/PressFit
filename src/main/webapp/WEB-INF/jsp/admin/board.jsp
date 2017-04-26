<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="en">
<%@ include file="adminheader.jsp"%>
<script src="${path}/resources/admin/admin.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	communityBoardList(1);
    galleryBoardList(1);
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
            str += "<tr>" +
                        "<td>" + value.idx + "</td>" +
                        "<td class='title'>" +
                            "<a href='#this' name='title'>" + value.title + "</a>" +
                            "<input type='hidden' name='title' value=" + value.idx + ">" +
                            "<span style='color: red;'>("+value.recnt+")"+
                        "</td>" +
                        "<td>" + value.viewcnt + "</td>" +
	                    "<td>"+value.regdate+"</td>"+
                    "</tr>";
        });
        body.append(str);
         
        $("a[name='title']").on("click", function(e){ //제목
            e.preventDefault();
            fn_openBoardDetail($(this));
        });
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
}
function galleryBoardList(pageNo){
    var comAjax = new ComAjax();
    comAjax.setUrl("<c:url value='/admin/gallery/list.do' />");
    comAjax.setCallback("galleryBoardListCallback");
    comAjax.addParam("galleryPAGEINDEX",pageNo);
    comAjax.addParam("PAGE_ROW", 5);
    comAjax.ajax();
}
function galleryBoardListCallback(data){
    var total = data.TOTAL;

    var body = $("#gallerylist");
    body.empty();
    if(total == 0){
        var str = "<tr>" +
                        "<td colspan='4'>조회된 결과가 없습니다.</td>" +
                    "</tr>";
        body.append(str);
    }
    else{
        var params = {
            divId : "galleryPAGE",
            pageIndex : "galleryPAGEINDEX",
            totalCount : total,
            eventName : "galleryBoardList",
            Movename  :  "_movePage2"
        };
        gfn_renderPaging(params);
         
        var str = "";
        $.each(data.list, function(key, value){
            str += "<tr>" +
                        "<td>" + value.idx + "</td>" +
                        "<td class='title'>" +
                            "<a href='#this' name='title'>" + value.title + "</a>" +
                            "<input type='hidden' name='title' value=" + value.idx + ">" +
                            "<span style='color: red;'>("+value.recnt+")"+
                        "</td>" +
                        "<td>" + value.viewcnt + "</td>" +
	                    "<td>"+value.regdate+"</td>"+
                    "</tr>";
        });
        body.append(str);
         
        $("a[name='title']").on("click", function(e){ //제목
            e.preventDefault();
            fn_openBoardDetail($(this));
        });
    }
}
function _movePage2(value){
    $("#galleryPAGEINDEX").val(value);
    if(typeof(galleryBoardList) == "function"){
    	galleryBoardList(value);
    }
    else {
        eval(galleryBoardList + "(value);");
    }
}

</script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="${path}/resources/admin/css/style.css">
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/normalize/2.0.1/normalize.css">
<link href='http://fonts.googleapis.com/css?family=PT+Sans' rel='stylesheet' type='text/css'>
<script src="http://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.6/prefixfree.min.js"></script>
<body>
<div class="wrapper">
<%@ include file="adminsidebar.jsp"%>
    <div class="main-panel">
<%@ include file="admininsideheader.jsp"%>
        <div class="content">
            <div class="container-fluid">
            <div class="row">
			  <div class="tabbed" style="margin: 10px">
			    <input type="radio" name="tabs" id="tab-nav-1" checked>
			    <label for="tab-nav-1">community</label>
			    <input type="radio" name="tabs" id="tab-nav-2">
			    <label for="tab-nav-2">gallery</label>
			    <div class="tabs" style="perspective:none">
			      <div style="width: 90%;font-size: 15px;">
			      <h2>community</h2>
			      <table class="table table-hover">
					<thead>
						<tr>
							<th class="number">Number</th>
							<th class="title">Title</th>
							<th class="regdate">Regdate</th>
							<th class="count">Count</th>
						</tr>
					</thead>
					<tbody id="communitylist">
					
					</tbody>
					</table>
					<div id="communityPAGE"></div>
   		 			<input type="hidden" id="communityPAGEINDEX" name="communityPAGEINDEX"/>
   		 			</div>
   		 		 <div style="width: 90%;font-size: 15px;">
			      <h2>gallery</h2>
			      <table class="table table-hover">
					<thead>
						<tr>
							<th class="number">Number</th>
							<th class="title">Title</th>
							<th class="regdate">Regdate</th>
							<th class="count">Count</th>
						</tr>
					</thead>
					<tbody id="gallerylist">
					
					</tbody>
					</table>
					<div id="galleryPAGE"></div>
   		 			<input type="hidden" id="galleryPAGEINDEX" name="galleryPAGEINDEX"/>
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
