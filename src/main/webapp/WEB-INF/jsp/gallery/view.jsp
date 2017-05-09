<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 작성</title>
<%@ include file="/resources/include/header.jsp" %>
<script src="<c:url value='/resources/include/commons.js' />"></script>
<style>
.breadcrumbs-area {
 background-image: url('${path}/resources/writer/img/bigpicture/gallery_img.png');
}
button {
    font-family: Arial, Helvetica, sans-serif;
    font-size: 14px;
    color: #616161;
    padding: 9px 20px;
    background: -moz-linear-gradient(top, #ffffff 0%, #ffffff);
    background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#ffffff));
    -moz-border-radius: 0px;
    -webkit-border-radius: 0px;
    border-radius: 0px;
    border: 1px solid #dbe2ff;
    box-shadow: 0px 1px 3px rgba(000,000,000,0.3), inset 0px 0px 2px rgba(255,255,255,0);
}
button.hover {
    font-weight: bold;
    color: #000000;
    border: 1px solid #879fff;
}
.replytextstyle {
	border: 1px solid #858585;
	border-left: 1px solid #858585;
	margin-top: 10px;
	margin-bottom: 17px;
	height: 75px;
}

.replytextdiv {
	width: 650px;
	text-align: center;
	margin-bottom: 50px;
	background: #f9f9f9;
	height: 195px;
}
</style>
<script>
    $(document).ready(function(){
        /* 게시글 관련 */
        // 1. 게시글 수정
        $("#btnUpdete").click(function(){
        	location.href="${path}/gallery/update.do?idx=${dto.idx}";
        });
        $("#btnCmt").click(function(){
        	location.href="${path}/gallery/cmt.do?idx=${dto.idx}";
        });
        // 2. 게시글 삭제
        // 삭제 버튼 클릭 
		$("#btnDelete").click(function(){
		    // 댓글이 존재하는 게시물의 삭제처리 방지
		    var count = "${count}";
		    // 댓글의 수가 0보다 크면 팝업, 함수 종료
		    if(count > 0) {
		    	if(confirm("댓글이 많이 있습니다. 삭제하시겠습니까?")){
		    		document.form1.action = "${path}/gallery/delete.do?idx=${dto.idx}";
			        document.form1.submit();
		    	}else{return;}
		    }
		    // 댓글의 수가 0이면 삭제처리
		    if(confirm("삭제하시겠습니까?")){
		    	location.href = "${path}/gallery/delete.do?idx=${dto.idx}";
		    }else{
		    }
		});

        
        // 3. 게시글 목록으로 이동 - 버튼 클릭시 상세보기화면에 있던 페이지, 검색옵션, 키워드 값을 가지로 목록으로 이동
        $("#btnList").click(function(){
            location.href="${path}/gallery/list.do?curPage=${curPage}&searchOption=${searchOption}&keyword=${keyword}";
        });
        
        /* 댓글 관련 */ 
        // 1. 댓글 입력
        $("#btnReply").click(function(){
            replyJson(); // json 형식으로 입력
        });
        
        // 2. 댓글 목록
        listReply("1"); // rest방식
        
     	// 1. 첨부파일 목록 불러오기 함수 호출
        listAttach();
        
        // 4. 게시글 수정버튼 클릭 이벤트 처리
        $("#btnUpdete").click(function(){
        	location.href="${path}/gallery/update.do?idx=${dto.idx}";
        });
    });
    
   
 	// 첨부파일 목록 ajax요청 처리
    function listAttach(){
        $.ajax({
            type: "post",
            url: "${path}/gallery/getAttach/${dto.idx}",
            success: function(list){
                $(list).each(function(){ 
                var fileInfo = getFileInfo(this);
                var str = "";
                // 이미지 파일이면 썸네일 이미지 출력
                if(checkImageType(this)){ 
                    str = "<div><a href='"+fileInfo.imgsrc+fileInfo.fileName+"'>";
                    str += "<img src='"+fileInfo.imgsrc+fileInfo.fileName+"' ></a>";
                // 일반파일이면 다운로드링크
                } else { 
                    str = "<div><a href='"+fileInfo.getLink+"'>"+fileInfo.fileName+"</a>";
                }
                // 삭제 버튼
                //str += "<span data-src="+fileInfo.fileName+">[삭제]</span></div>";
                $(".uploadedList").append(str);
                
                });
            }
            
        });
    }
    // 1_2. 댓글 입력 함수(json방식)
    function replyJson(){
        var replytext=$("#replytext").val();
        var idx="${dto.idx}"
        // 비밀댓글 체크여부
        var secretReply = "n";
        // 태그.is(":속성") 체크여부 true/false
        if( $("#secretReply").is(":checked") ){
            secretReply = "y";
        }
        $.ajax({                
            type: "post",
            url: "${path}/gallery/reply/insertRest.do",
            headers: {
                "Content-Type" : "application/json"
            },
            dateType: "text",
            // param형식보다 간편
            data: JSON.stringify({
            	boardno : idx,
                replytext : replytext,
                secretReply : secretReply
            }),
            success: function(){
                alert("댓글이 등록되었습니다.");
                // 댓글 입력 완료후 댓글 목록 불러오기 함수 호출
                //listReply("1");     // 전통적인 Controller방식
                //listReply2();     // json리턴 방식
                listReply("1"); // Rest 방식
            }
        });
    }
    // 2_2. 댓글 목록 - 날짜 형식 변환 함수 작성
    function changeDate(date){
        date = new Date(parseInt(date));
        year = date.getFullYear();
        month = date.getMonth();
        day = date.getDate();
        hour = date.getHours();
        minute = date.getMinutes();
        second = date.getSeconds();
        strDate = year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;
        return strDate;
    }
    
    // 2_3. 댓글 목록 - Rest방식
    function listReply(num){
        $.ajax({
            type: "get",
            url: "${path}/gallery/reply/list/${dto.idx}/"+num,
            success: function(result){
            	console.log(result);
            // responseText가 result에 저장됨.
                $("#listReply").html(result);
            }
        });
    }    
    
    // **댓글 수정화면 생성 함수
    function showReplyModify(num){
        $.ajax({
            type: "get",
            url: "${path}/gallery/reply/detail/"+num,
            success: function(result){
                $("#modifyReply").html(result);
                // 태그.css("속성", "값")
                $("#modifyReply").css("visibility", "visible");
            }
        })
    }
    // **댓글 답글화면 생성 함수
    function showReplyCmtModify(num){
        $.ajax({
            type: "get",
            url: "${path}/gallery/reply/Cmtdetail/"+num,
            success: function(result){
                $("#modifyReply").html(result);
                $("#modifyReply").css("visibility", "visible");
            }
        })
    }
</script>
</head>
<body>
 	<!-- Breadcrumbs Area Start -->
	<div class="breadcrumbs-area">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
				    <div class="breadcrumbs">
				       <h2>GALLERY</h2> 
				    </div>
				</div>
			</div>
		</div>
	</div> 
	<!-- Breadcrumbs Area Start --> 
    <!-- Single Product Area Start -->
    <div class="single-product-area section-padding"> 
	    <div class="container">
			<div class="row">
 				<div class="single-product-details">
					<h2>${dto.title}</h2>
                    ${dto.writer} / ${dto.regdate} / 조회수 : ${dto.viewcnt} <br/><br/>
                    <p>${dto.content}</p>
		         	<!-- 게시물번호를 hidden으로 처리 -->
		            <input type="hidden" name="boardno" value="${dto.idx}">
                    <div>
						<!-- 본인이 쓴 게시물만 수정, 삭제가 가능하도록 처리 -->
				        <c:if test="${sessionScope.id == dto.writer}">
				            <button type="button" id="btnDelete" style="float:right; margin-right:5px">삭제</button>
				            <button type="button" id="btnUpdete" style="float:right; margin-right:5px">수정</button>
				        </c:if>
			            <!-- 상세보기 화면에서 게시글 목록화면으로 이동 -->
			            <button type="button" id="btnList" style="float:right; margin-right:5px">목록</button>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="p-details-tab-content">
					<div class="p-details-tab">
						<ul class="p-details-nav-tab" role="tablist">
 							<li role="presentation" class="active"><a href="#reviews" aria-controls="reviews" role="tab" data-toggle="tab">Reply</a></li>
						</ul>
					</div>
                    <div class="clearfix"></div>
					<div class="tab-content review">
                       	<div role="tabpanel" class="tab-pane active" id="reviews">
                           	<div id="product-comments-block-tab">
                               <div style="width: 650px; text-align: center;"
									class="replytextdiv">
									<br>
									<!-- 로그인 한 회원에게만 댓글 작성폼이 보이게 처리 -->
									<c:if test="${sessionScope.id != null}">
										<textarea rows="5" cols="80" id="replytext"
											class="replytextstyle" placeholder="댓글을 작성해주세요"></textarea>
										<br>
										<!-- 비밀댓글 체크박스 -->
										<button type="button" id="btnReply"
											style="margin-left: 60px; color: black;">댓글 작성</button> &nbsp;
									            <input type="checkbox" id="secretReply"> 비밀 댓글 
									</c:if>
									<!-- 로그인하지 않았을 경우 -->
									<c:if test="${sessionScope.id == null}">
										<div style="margin-top: 65px;">
											<a href="${path}/login/login.do"
												style="background: lavenderblush; border: aliceblue; font-weight: bold; color: black;">로그인</a>
											후 댓글 작성 가능합니다!
										</div>
									</c:if>
								</div>
                                <!-- 댓글 목록 출력할 위치 -->
   								<div id="listReply" ></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
    <!-- Single Product Area End -->
     
    <!-- Footer Start -->    
	<%@ include file="/resources/include/footer.jsp" %>
    <!-- Footer End -->    
    </body>
</html>