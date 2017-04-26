<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="en">
<%@ include file="adminheader.jsp"%>
<script src="${path}/resources/admin/admin.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	tmouseBoardList(1);
	keyboardBoardList(1);
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
    $("#tmousePAGEINDEX").val(value);
    if(typeof(tmouseBoardList) == "function"){
    	tmouseBoardList(value);
    }
    else {
        eval(tmouseBoardList + "(value);");
    }
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
    $("#keyboardPAGEINDEX").val(value);
    if(typeof(keyboardBoardList) == "function"){
    	keyboardBoardList(value);
    }
    else {
        eval(keyboardBoardList + "(value);");
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
			    <label for="tab-nav-1">tmouse</label>
			    <input type="radio" name="tabs" id="tab-nav-2">
			    <label for="tab-nav-2">keyboard</label>
			    <div class="tabs" style="perspective:none">
			      <div style="width: 90%;font-size: 15px;">
			      <h2>tmouse</h2>
			      <table class="table table-hover">
					<thead>
						<tr>
							<th class="number">Number</th>
							<th class="title">Title</th>
							<th class="regdate">Regdate</th>
							<th class="count">Count</th>
						</tr>
					</thead>
					<tbody id="tmouselist">
					
					</tbody>
					</table>
					<div id="tmousePAGE"></div>
   		 			<input type="hidden" id="tmousePAGEINDEX" name="tmousePAGEINDEX"/>
   		 			</div>
   		 		 <div style="width: 90%;font-size: 15px;">
			      <h2>keyboard</h2>
			      <table class="table table-hover">
					<thead>
						<tr>
							<th class="number">Number</th>
							<th class="title">Title</th>
							<th class="regdate">Regdate</th>
							<th class="count">Count</th>
						</tr>
					</thead>
					<tbody id="keyboardlist">
					
					</tbody>
					</table>
					<div id="keyboardPAGE"></div>
   		 			<input type="hidden" id="keyboardPAGEINDEX" name="keyboardPAGEINDEX"/>
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
