<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="en">
<%@ include file="adminheader.jsp"%>
<script src="${path}/resources/admin/admin.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel="stylesheet" href="${path}/resources/admin/css/style.css">
<script src="${path}/resources/admin/num/jquery.color.min.js"></script>
<script src="${path}/resources/admin/num/jquery.animateNumber.min.js"></script>
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
    var percent_number_step = $.animateNumber.numberStepFactories.append(' 개')
	$('#tmouseBoardcnt').animateNumber({
		number: total,color: 'black','font-size': '20px',
		easing: 'easeInQuad',numberStep: percent_number_step
	}, 500);
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
				"<span class='col-md-4'>" + value.modelname + "("+value.recnt+")</span> " + 
				"<span class='col-md-1'>" + value.price + "￦</span> " +
				"<span class='col-md-1'>" + value.crea_id + "</span>"+
				"<span class='col-md-1'><button class='btn btn-default btn-block' onclick='tmousedelete("+ value.idx +")'>삭제</button></span>" +
				"<span class='col-md-1'><button class='btn btn-default btn-block' onclick='tmouseupdate2("+ value.idx +")'>경고:" + value.warn +"</button></span>" +
			"</a>" +
			"<ul class='faq-content'>" +
				"<li><div><p>" +
				"<img src='${path}/resources/upload/"+value.fullName+"' style='width:570 ;height:550'>" +
					value.content +
					"<div class='table-responsive table-full-width' style='padding: 15px;'>"+
					"<table class='table table-hover table-striped'>"+
					 "<tbody>"+
					   "<tr >"+
					    "<td>제조사</td>"+
					    "<td>"+value.manufacturecompany+"</td>"+
					    "<td>출시년월</td>"+
					    "<td>"+value.registrationyear+"</td>"+
					   "</tr>"+
					   "<tr>"+
					    "<td>광/볼 마우스</td>"+
					    "<td>"+value.responsivemethod+"</td>"+
					    "<td>버튼갯수</td>"+
					    "<td>"+value.numberofbuttons +"</td>"+
					   "</tr>"+
					    "<tr >"+
					    "<td>유/무선</td>"+
					    "<td>"+value.connectionmethod +"</td>"+
					    "<td>블루투스 버전</td>"+
					    "<td>"+value.bluetoothversion +"</td>"+
					   "</tr>"+
					    "<tr >"+
					    "<td>배터리</td>"+
					    "<td>"+value.battery +"</td>"+
					    "<td>인터페이스</td>"+
					    "<td>"+value.interface1 +"</td>"+
					   "</tr>"+
					    "<tr >"+
					    "<td>휠 조정</td>"+
					    "<td>"+value.wheeladjustment +"</td>"+
					    "<td>마우스 센서</td>"+
					    "<td>"+value.mousesensor +"</td>"+
					   "</tr>"+
					   "<tr>"+
					     "<th colspan='4'>기능</th>"+
					   "</tr>"+
					    "<tr >"+
					    "<td>최대 감도</td>"+
					    "<td>"+value.maximumsensitivity +"</td>"+
					    "<td>DPI 변경</td>"+
					    "<td>"+value.changedpi +"</td>"+
					   "</tr>"+
					    "<tr >"+
					    "<td>스캔율</td>"+
					    "<td>"+value.scanrate +"</td>"+
					    "<td>가속도 지원</td>"+
					    "<td>"+value.accelerationsupport +"</td>"+
					   "</tr>"+
					    "<tr >"+
					    "<td>응답속도</td>"+
					    "<td>"+value.responsespeed +"</td>"+
					    "</tr>"+
					    "<tr>"+
					     "<th colspan='4'>매크로</th>"+
					   "</tr>"+
					    "<tr>"+
					    "<td>매크로 기능</td>"+
					    "<td>"+value.macrofunction +"</td>"+
					    "<td>소프트웨어 지원</td>"+
					    "<td>"+value.softwaresupport +"</td>"+
					    "</tr>"+
					    "<tr >"+
					    "<td>내장 메모리 지원</td>"+
					    "<td>"+value.builtinmemory+"</td>"+
					   "</tr>"+
					   "<tr>"+
					     "<th colspan='4'>외형</th>"+
					   "</tr>"+
					    "<tr >"+
					    "<td>손목터널증후군 방지</td>"+
					    "<td>"+value.wristtunnelsyndrome +"</td>"+
					    "<td>LED 튜닝제품</td>"+
					    "<td>"+value.ledtuningproducts+"</td>"+
					    "</tr>"+
					    "<tr >"+
					    "<td>마우스 코팅</td>"+
					    "<td>"+value.mousecoating +"</td>"+
					    "</tr>"+
					    "<tr>"+
					     "<th colspan='4'>부가 기능</th>"+
					   "</tr>"+
					   "<tr>"+
					    "<td>게이밍 마우스</td>"+
					    "<td>"+value.gamingmouse+"</td>"+
					    "<td>무게추 적용</td>"+
					    "<td>"+value.weightapplication +"</td>"+
					   "</tr>"+
					   "<tr>"+
					    "<td>커스텀펌웨어 지원</td>"+
					    "<td>"+value.customfirmwaresupport+"</td>"+
					    "<td>파츠 변경 가능</td>"+
					    "<td>"+value.possiblechangeparts +"</td>"+
					   "</tr>"+
					   "<tr>"+
					    "<td>DPI Shift</td>"+
					    "<td>"+value.dpishift+"</td>"+
					    "<td>멀티페어링</td>"+
					    "<td>"+value.multipairing +"</td>"+
					   "</tr>"+
					   "<tr>"+
					    "<td>스위치</td>"+
					    "<td>"+value.switch1+"</td>"+
					    "<td>세로</td>"+
					    "<td>"+value.length +"</td>"+
					   "</tr>"+
					   "<tr>"+
					     "<th colspan='4'>크기</th>"+
					   "</tr>"+
					   "<tr>"+
					    "<td>가로</td>"+
					    "<td>"+value.width+"</td>"+
					    "<td>높이</td>"+
					    "<td>"+value.height +"</td>"+
					   "</tr>"+
					   "<tr>"+
					    "<td>무게</td>"+
					    "<td>"+value.weight+"</td>"+
					   "</tr></tbody></table></div>"+
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
    var percent_number_step = $.animateNumber.numberStepFactories.append(' 개')
	$('#keyboardBoardcnt').animateNumber({
		number: total,color: 'black','font-size': '20px',
		easing: 'easeInQuad',numberStep: percent_number_step
	}, 500);
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
				"<span class='col-md-4'>" + value.modelname + "("+value.recnt+")</span> " + 
				"<span class='col-md-1'>" + value.price + "￦</span> " +
				"<span class='col-md-1'>" + value.crea_id + "</span>"+
				"<span class='col-md-1'><button class='btn btn-default btn-block' onclick='keyboarddelete("+ value.idx +")'>삭제</button></span>" +
				"<span class='col-md-1'><button class='btn btn-default btn-block' onclick='keyboardupdate2("+ value.idx +")'>경고:" + value.warn +"</button></span>" +
				"</a>" + 
			"<ul class='faq-content'>" +
				"<li><div><p>" +
				"<img src='${path}/resources/upload/"+value.fullName+"' style='width:570 ;height:550'>" +
					value.content +
					"<div class='table-responsive table-full-width' style='padding: 15px;'>"+
					"<table class='table table-hover table-striped'>"+
					"<tbody>"+
					  "<tr>"+
					      "<td>제조사</td>"+
					      "<td>"+value.manufacturecompany+"</td>"+
					      "<td>등록년월</td>"+
					      "<td>"+value.registrationyear+"</td>"+
					  "</tr>"+
					   "<tr>"+
					      "<td>연결방식</td>"+
					      "<td>"+value.connectionmethod +"</td>"+
					      "<td>블루투스 버전</td>"+
					      "<td>"+value.bluetoothversion +"</td>"+
					  "</tr>"+
					   "<tr>"+
					      "<td>배터리</td>"+
					      "<td>"+value.battery +"</td>"+
					      "<td>키 배열</td>"+
					      "<td>"+value.keyarray +"</td>"+
					  "</tr>"+
					   "<tr>"+
					      "<td>인터페이스</td>"+
					      "<td>"+value.interface1 +"</td>"+
					      "<td>접점 방식</td>"+
					      "<td>"+value.contactsystem +"</td>"+
					  "</tr>"+
					  "<tr>"+
					      "<td>스위치</td>"+
					      "<td>"+value.keyswitch +"</td>"+
					      "<td>키보드 형태</td>"+
					      "<td>"+value.keyboardform +"</td>"+
					  "</tr>"+
					  "<tr>"+
					  	"<th colspan='4'>기능</th>"+
					  "</tr>"+
					   "<tr>"+
					      "<td>기능 키</td>"+
					      "<td>"+value.functionkey +"</td>"+
					      "<td>매크로 기능</td>"+
					      "<td>"+value.macrofunction +"</td>"+
					  "</tr>"+
					   "<tr>"+
					      "<td>동시입력</td>"+
					      "<td>"+value.simultaneousinput +"</td>"+
					      "<td>응답속도</td>"+
					      "<td>"+value.responsevelocity +"</td>"+
					  "</tr>"+
					  "<tr>"+
					  	"<th colspan='4'>키 잠금</th>"+
					  "</tr>"+
					   "<tr>"+
					      "<td>윈도우 키 잠금</td>"+
					      "<td>"+value.windowskeylocking +"</td>"+
					      "<td>전체 키 잠금</td>"+
					      "<td>"+value.fullkeylock +"</td>"+
					   "</tr>"+
					   "<tr>"+
					  	"<th colspan='4'>외형</th>"+
					  "</tr>"+
					   "<tr>"+
					      "<td>스텝스컬쳐2</td>"+
					      "<td>"+value.stepsculture2 +"</td>"+
					      "<td>비키스타일</td>"+
					      "<td>"+value.vikistyle +"</td>"+
					   "</tr>"+
					   "<tr>"+
					      "<td>금속 하우징</td>"+
					      "<td>"+value.metalhousing +"</td>"+
					      "<td>외국어 전용</td>"+
					      "<td>"+value.foreignlanguageonly +"</td>"+
					   "</tr>"+
					   "<tr>"+
					      "<td>키캡 재질</td>"+
					      "<td>"+value.keycapmaterial +"</td>"+
					      "<td>키캡 각인방식</td>"+
					      "<td>"+value.keycapburningmethod +"</td>"+
					   "</tr>"+
					   "<tr>"+
					      "<td>LED 백라이트</td>"+
					      "<td>"+value.ledbacklight+"</td>"+
					  "</tr>"+
					  "<tr>"+
					  	"<th colspan='4'>케이블</th>"+
					  "</tr>"+
					   "<tr>"+
					      "<td>직조(패브릭) 케이블</td>"+
					      "<td>"+value.fabriccable +"</td>"+
					      "<td>착탈식 케이블</td>"+
					      "<td>"+value.removablecable+"</td>"+
					   "</tr>"+
					  "<tr>"+
					  	"<th colspan='4'>부가 기능</th>"+
					  "</tr>"+
					  "<tr>"+
					      "<td>멀티페어링</td>"+
					      "<td>"+value.multipairing+"</td>"+
					      "<td>USB허브 내장</td>"+
					      "<td>"+value.builtinusbhub +"</td>"+
					  "</tr>"+
					  "<tr>"+
					      "<td>체리식 스테빌라이저</td>"+
					      "<td>"+value.cherrystylestabilizer+"</td>"+
					      "<td>생활방수</td>"+
					      "<td>"+value.lifewaterproofing +"</td>"+
					  "</tr>"+
					  "<tr>"+
					      "<td>터치패드</td>"+
					      "<td>"+value.touchpad+"</td>"+
					      "<td>트랙볼</td>"+
					      "<td>"+value.trackball +"</td>"+
					  "</tr>"+
					  "<tr>"+
					      "<td>모션센서</td>"+
					      "<td>"+value.motionsensor+"</td>"+
					      "<td>스마트키보드</td>"+
					      "<td>"+value.smartkeyboard +"</td>"+
					  "</tr>"+
					  "<tr>"+
					      "<td>방향키 전환</td>"+
					      "<td>"+value.switchrudder+"</td>"+
					  "</tr>"+
					  "<tr>"+
					  	"<th colspan='4'>추가 구성</th>"+
					  "</tr>"+
					  "<tr>"+
					      "<td>실리콘 키스킨</td>"+
					      "<td>"+value.siliconkeyskin+"</td>"+
					      "<td>플라스틱 덮개</td>"+
					      "<td>"+value.plasticcover +"</td>"+
					  "</tr>"+
					  "<tr>"+
					      "<td>키캡 리무버</td>"+
					      "<td>"+value.keycapremover+"</td>"+
					      "<td>청소용 브러쉬</td>"+
					      "<td>"+value.cleaningbrush +"</td>"+
					  "</tr>"+
					  "<tr>"+
					      "<td>교체용 키캡</td>"+
					      "<td>"+value.replacementkeycaps+"</td>"+
					  "</tr>"+
					  "<tr>"+
					  	"<th colspan='4'>크기(가로x세로x높이)</th>"+
					  "</tr>"+
					  "<tr>"+
					      "<td>가로</td>"+
					      "<td>"+value.width+"</td>"+
					      "<td>세로</td>"+
					      "<td>"+value.length +"</td>"+
					  "</tr>"+
					  "<tr>"+
					  	"<td>높이</td>"+
					      "<td>"+value.height+"</td>"+
					      "<td>무게</td>"+
					      "<td>"+value.weight+"</td>"+
					  "</tr>"+
					  "<tr>"+
					  	"<td>케이블 길이</td>"+
					      "<td>"+value.cablelength+"</td>"+
					   "</tr></tbody></table></div>"+
				"</p></div></li>" +
			"</ul></li>";
        });
        body.append(str);
    }
}
function keyboarddelete(idx){
    var comAjax = new ComAjax();
    comAjax.setUrl("<c:url value='/admin/keyboard/delete.do' />");
    comAjax.addParam("keyboardidx",idx);
    comAjax.ajax();
    _movePage($("#keyboardPAGEINDEX").val());
}
function tmousedelete(idx){
    var comAjax = new ComAjax();
    comAjax.setUrl("<c:url value='/admin/tmouse/delete.do' />");
    comAjax.addParam("tmouseidx",idx);
    comAjax.ajax();
    _movePage($("#tmousePAGEINDEX").val());
}
function keyboardupdate2(idx){
    var comAjax = new ComAjax();
    comAjax.setUrl("<c:url value='/admin/keyboard/update2.do' />");
    comAjax.addParam("keyboardidx",idx);
    comAjax.ajax();
    _movePage($("#keyboardPAGEINDEX").val());
}
function tmouseupdate2(idx){
    var comAjax = new ComAjax();
    comAjax.setUrl("<c:url value='/admin/tmouse/update2.do' />");
    comAjax.addParam("tmouseidx",idx);
    comAjax.ajax();
    _movePage($("#tmousePAGEINDEX").val());
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
				<div class="col-md-4">
	             	<div class="card">
						<div class="header" style="text-align: center">
							<h4 class="title" style="font-family: yanolja; font-size: 20px">마우스</h4>
						</div>
						<div class="content">
							<div id="tmouseBoardcnt" class="num" style="text-align:center; font-family: yanolja;font-size: 20px">1</div>
						</div>
					</div>
				</div>
				<div class="col-md-4">
	             	<div class="card">
						<div class="header" style="text-align: center">
							<h4 class="title" style="font-family: yanolja; font-size: 20px">키보드</h4>
						</div>
						<div class="content">
							<div id="keyboardBoardcnt" class="num" style="text-align:center; font-family: yanolja;font-size: 20px">1</div>
						</div>
					</div>
				</div>
			</div>
            <div class="row">
            	<div id="faq-links">
				    <div id="service" class="faq-selected col-md-6">마우스</div>
				    <div id="installation" class="col-md-6">키보드</div>
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
