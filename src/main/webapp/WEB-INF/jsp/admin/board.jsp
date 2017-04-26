<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="en">
<%@ include file="adminheader.jsp"%>
<script src="${path}/resources/admin/admin.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="${path}/resources/admin/css/style.css">
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/normalize/2.0.1/normalize.css">
<link rel="stylesheet" type="text/css" href="${path}/resources/admin/js/defaults.css">
<link rel="stylesheet" type="text/css" href="${path}/resources/admin/js/demo.css"><%-- 
<script type="text/javascript" src="${path}/resources/admin/js/accordion.js"></script> --%>

<script type="text/javascript">
$(document).ready(function () {
	communityBoardList(1);
    galleryBoardList(1);
});
function close_accordion_section() {
	$('.accordion .accordion-section-title').removeClass('active');
	$('.accordion .accordion-section-content').slideUp(300).removeClass('open');
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
            str += 
            	"<div class='accordion-section'>" +
					"<a class='accordion-section-title' href='#accordion-"+key+"'>" +
					"<span style='padding:5px'>" + value.idx + "</span> " + 
					"<span style='padding:15px'>" + value.title + "("+value.recnt+")</span> " + 
					"<span style='padding:5px'>" + value.writer + "</span> " +
					"<span style='padding:5px'>" + value.viewcnt + "</span> " + 
					"<span style='padding:5px'>" + value.regdate + "</span> " + 
					"</a>" +
					"<div id='accordion-"+key+"' class='accordion-section-content'>" +
						value.content +
					"</div>" +
				"</div>";
        });
        body.append(str);
        $('.accordion-section-title').click(function(e) {
    		var currentAttrValue = $(this).attr('href');
    		if($(e.target).is('.active')) {
    			close_accordion_section();
    		}else {
    			close_accordion_section();
    			$(this).addClass('active');
    			$('.accordion ' + currentAttrValue).slideDown(300).addClass('open'); 
    		}
    		e.preventDefault();
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
            str += 
		        	"<div class='accordion-section'>" +
					"<a class='accordion-section-title' href='#accordion-"+key+"'>" +
					"<span style='padding:5px'>" + value.idx + "</span> " + 
					"<span style='padding:15px'>" + value.title + "("+value.recnt+")</span> " + 
					"<span style='padding:5px'>" + value.writer + "</span> " +
					"<span style='padding:5px'>" + value.viewcnt + "</span> " + 
					"<span style='padding:5px'>" + value.regdate + "</span> " + 
					"</a>" +
					"<div id='accordion-"+key+"' class='accordion-section-content'>" +
						value.content +
					"</div>" +
				"</div>";
        });
        body.append(str);
         
        $('.accordion-section-title').click(function(e) {
    		var currentAttrValue = $(this).attr('href');
    		if($(e.target).is('.active')) {
    			close_accordion_section();
    		}else {
    			close_accordion_section();
    			$(this).addClass('active');
    			$('.accordion ' + currentAttrValue).slideDown(300).addClass('open'); 
    		}
    		e.preventDefault();
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
			      <div class="accordion" id="communitylist">
										
					</div>
					<div id="communityPAGE"></div>
   		 			<input type="hidden" id="communityPAGEINDEX" name="communityPAGEINDEX"/>
   		 			</div>
   		 		 <div style="width: 90%;font-size: 15px;">
			      <h2>gallery</h2>
			      <div class="accordion" id="gallerylist">
										
					</div>
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
