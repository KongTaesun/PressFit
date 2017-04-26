<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="en">
<%@ include file="adminheader.jsp"%>
<script src="${path}/resources/admin/admin.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    fn_selectBoardList(1);
     
    $("#write").on("click", function(e){ //글쓰기 버튼
        e.preventDefault();
        fn_openBoardWrite();
    });
     
    $("a[name='title']").on("click", function(e){ //제목
        e.preventDefault();
        fn_openBoardDetail($(this));
    });
});
function fn_openBoardWrite(){
    var comSubmit = new ComSubmit();
    comSubmit.setUrl("<c:url value='/sample/openBoardWrite.do' />");
    comSubmit.submit();
}
 
function fn_openBoardDetail(obj){
    var comSubmit = new ComSubmit();
    comSubmit.setUrl("<c:url value='/sample/openBoardDetail.do' />");
    comSubmit.addParam("IDX", obj.parent().find("#IDX").val());
    comSubmit.submit();
}
 
function fn_selectBoardList(pageNo){
    var comAjax = new ComAjax();
    comAjax.setUrl("<c:url value='/admin/community/list.do' />");
    comAjax.setCallback("fn_selectBoardListCallback");
    comAjax.addParam("PAGE_INDEX",pageNo);
    comAjax.addParam("PAGE_ROW", 5);
    comAjax.ajax();
}
 
function fn_selectBoardListCallback(data){
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
            divId : "PAGE_NAVI",
            pageIndex : "PAGE_INDEX",
            totalCount : total,
            eventName : "fn_selectBoardList"
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
                       <div class="card" style="padding:2%">
                                <h4 class="title">Striped Table with Hover</h4>
                                <p class="category">${map.count}개의 게시물이 있습니다.</p>
                            <div class="content table-responsive table-full-width">
									<table class="table table-hover table-striped">
										<thead>
											<tr>
												<th class="number">Number</th>
												<th class="title">Title</th>
												<!-- <th class="writer">Writer</th> -->
												<th class="regdate">Regdate</th>
												<th class="count">Count</th>
											</tr>
										</thead>
										<tbody id="communitylist">
											
										</tbody>
									</table>
									<div id="PAGE_NAVI"></div>
   		 							<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>
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
