<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="en">
<%@ include file="adminheader.jsp"%>
<script src="${path}/resources/admin/admin.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel="stylesheet" href="${path}/resources/admin/css/style.css">
<script src="<c:url value='/resources/ckediter/ckeditor.js' />"></script>
<script type="text/javascript">
$(document).ready(function () {
	$(".hover").mouseleave(function () {
		$(this).removeClass("hover");
	});
    galleryBoardList(1);
    $('#faq-links div').click(function(){
    	_movePage(1);
    });
});
function _movePage(value){
    $("#galleryPAGEINDEX").val(value);
    if(typeof(galleryBoardList) == "function"){
    	galleryBoardList(value);
    }
    else {
        eval(galleryBoardList + "(value);");
    }
    accordWithPage();
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
            Movename  :  "_movePage"
        };
        gfn_renderPaging(params);
         
        var str = "";
        $.each(data.list, function(key, value){
            str += 
            	"<figure class='snip1384' style='width: 250px;height:250px;'>" +
				"  <img src='${path}/resources/upload/" + value.fullName + "' alt='sample83' />" +
				 " <figcaption>" +
				 "   <h3>" + value.title + "("+value.recnt+")</h3>" +
				 "   <p>" + value.writer + "</p>" +
				 "   <p>" + value.viewcnt + "</p>" +
				 "   <p>" + value.regdate + "</p>" +
				 "<i class='ion-ios-arrow-right'></i>" +
				"  </figcaption>" +
				"  <a href='#' onclick='galleryBoardread("+ value.idx +")'></a>" +
				"</figure>";
        });
        body.append(str);
    }
}
function galleryBoardread(idx){
    var comAjax = new ComAjax();
    comAjax.setUrl("<c:url value='/admin/gallery/read.do' />");
    comAjax.setCallback("galleryBoardreadCallback");
    comAjax.addParam("galleryidx",idx);
    comAjax.ajax();
}
function galleryBoardreadCallback(data){
    var body = $("#galleryread");
    body.empty();
    var str = "<div class='header'>" +
                "<h4 class='title'>" + data.gallery.title + "</h4>" +
                "<p class='category'>작성자:" + data.gallery.writer + "조회수:" + data.gallery.viewcnt + "날짜:" + data.gallery.regdate + "</p>" +
            "</div>" +
            "<div class='content'>" +
            	data.gallery.content +
            "</div>";
    body.append(str);
}
function galleryBoardcreate(){
    var comAjax = new ComAjax();
    comAjax.setUrl("<c:url value='/admin/gallery/create.do' />");
    comAjax.setCallback("");
    comAjax.addParam("galleryPAGEINDEX",pageNo);
    comAjax.ajax();
}
function galleryBoardupdate(pageNo){
    var comAjax = new ComAjax();
    comAjax.setUrl("<c:url value='/admin/gallery/update.do' />");
    comAjax.setCallback("");
    comAjax.addParam("galleryPAGEINDEX",pageNo);
    comAjax.ajax();
}
function galleryBoarddelete(idx){
    var comAjax = new ComAjax();
    comAjax.setUrl("<c:url value='/admin/gallery/delete.do' />");
    comAjax.setCallback("");
    comAjax.addParam("galleryidx",idx);
    comAjax.ajax();
}
function galleryBoardcreateeditor(){
    var body = $("#galleryread");
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
    body.append(str);
}
function changeeditor(){
    var body = $("#galleryread .content");
    str="<textarea name='content' id='content'>"+body.html()+"</textarea>"+
    "<script>"+
    "CKEDITOR.replace('content',{"+
    	"height : '600px',"+
    	"filebrowserUploadUrl : '${path}/gallery/imageUpload.do'"+
    "});"+
    "</sc"+"ript>";
    body.empty();
    body.append(str);
}
</script>
<style>
@import url(https://fonts.googleapis.com/css?family=Raleway:300,700);
@import url(http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css);
figure.snip1384 {
  font-family: 'Raleway', Arial, sans-serif;
  position: relative;
  float: left;
  overflow: hidden;
  margin: 10px 1%;
  min-width: 230px;
  max-width: 315px;
  width: 100%;
  color: #ffffff;
  text-align: left;
  font-size: 16px;
  background-color: #000000;
}
figure.snip1384 * {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.35s ease;
  transition: all 0.35s ease;
}
figure.snip1384 img {
  max-width: 100%;
  backface-visibility: hidden;
  vertical-align: top;
}
figure.snip1384:after,
figure.snip1384 figcaption {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
}
figure.snip1384:after {
  content: '';
  background-color: rgba(0, 0, 0, 0.65);
  -webkit-transition: all 0.35s ease;
  transition: all 0.35s ease;
  opacity: 0;
}
figure.snip1384 figcaption {
  z-index: 1;
  padding: 40px;
}
figure.snip1384 h3,
figure.snip1384 .links {
  width: 100%;
  margin: 5px 0;
  padding: 0;
}
figure.snip1384 h3 {
  line-height: 1.1em;
  font-weight: 700;
  font-size: 1.4em;
  text-transform: uppercase;
  opacity: 0;
}
figure.snip1384 p {
  font-size: 0.8em;
  font-weight: 300;
  letter-spacing: 1px;
  opacity: 0;
  top: 50%;
  -webkit-transform: translateY(40px);
  transform: translateY(40px);
}
figure.snip1384 i {
  position: absolute;
  bottom: 10px;
  right: 10px;
  padding: 20px 25px;
  font-size: 34px;
  opacity: 0;
  -webkit-transform: translateX(-10px);
  transform: translateX(-10px);
}
figure.snip1384 a {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  z-index: 1;
}
figure.snip1384:hover img,
figure.snip1384.hover img {
  zoom: 1;
  filter: alpha(opacity=50);
  -webkit-opacity: 0.5;
  opacity: 0.5;
}
figure.snip1384:hover:after,
figure.snip1384.hover:after {
  opacity: 1;
  position: absolute;
  top: 10px;
  bottom: 10px;
  left: 10px;
  right: 10px;
}
figure.snip1384:hover h3,
figure.snip1384.hover h3,
figure.snip1384:hover p,
figure.snip1384.hover p,
figure.snip1384:hover i,
figure.snip1384.hover i {
  -webkit-transform: translate(0px, 0px);
  transform: translate(0px, 0px);
  opacity: 1;
}
</style>	
<body>
<div class="wrapper">
<%@ include file="adminsidebar.jsp"%>
    <div class="main-panel">
<%@ include file="admininsideheader.jsp"%>
        <div class="content">
            <div class="container-fluid">
			<div><input type="text" /><button>검색</button></div>
			<div id="galleryPAGE"></div>
   		 	<input type="hidden" id="galleryPAGEINDEX" name="galleryPAGEINDEX"/>
   		 	<div id="gallerylist">
						
            </div>
            <div class="row">
                   <div class="col-md-2"></div>
                   <div class="col-md-8">
                        <div>
                        <button onclick="galleryBoardcreateeditor()">새글</button>
                        <button onclick="">작성</button>
                        <button onclick="changeeditor()">수정</button>
                        <button onclick="">저장</button>
                        <button onclick="">삭제</button>
                        </div>
                       	<div class="card" id="galleryread">
                           
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
