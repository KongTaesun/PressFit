<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PressFit</title>
<%@ include file="/resources/include/header.jsp" %>
<%@ include file="/resources/include/sessionCheck.jsp" %>
<script src="<c:url value='/resources/ckediter/ckeditor.js' />"></script>
<script src="<c:url value='/resources/include/commons.js' />"></script>
<script>
    $(document).ready(function(){
        // 3. 게시글 목록으로 이동 - 버튼 클릭시 상세보기화면에 있던 페이지, 검색옵션, 키워드 값을 가지로 목록으로 이동
        $("#btnList").click(function(){
            location.href="${path}/community/list.do?curPage=${curPage}&searchOption=${searchOption}&keyword=${keyword}";
        });
     	// 1. 첨부파일 목록 불러오기 함수 호출
        listAttach();
        
        // 4. 게시글 수정버튼 클릭 이벤트 처리
        $("#btnUpdeteinsert").click(function(){
        	var title = $("#title").val();
            
            if(title == ""){
                alert("제목을 입력하세요");
                document.form1.title.focus();
                return;
            }
        	document.form1.action = "${path}/community/updateinsert.do";
	        document.form1.submit();
        });
     	// 2. 첨부파일 추가 ajax요청
        $("#fileDrop").on("dragenter dragover", function(e){
            e.preventDefault(); // 기본효과 제한
        });
        $("#fileDrop").on("drop", function(e){
            e.preventDefault(); // 기본효과 제한
            var files = e.originalEvent.dataTransfer.files; // 드래그한 파일들
            //console.log(files);
            var file = files[0]; // 첫번째 첨부파일
            var formData = new FormData(); // 폼데이터 객체
            formData.append("file", file); // 첨부파일 추가
            $.ajax({
                url: "${path}/community/upload/uploadAjax",
                type: "post",
                data: formData,
                dataType: "text",
                processData: false, // processType: false - header가 아닌 body로 전달
                contentType: false,
                success: function(data){
                	// 첨부 파일의 정보
                    var fileInfo = getFileInfo(data);
                    // 하이퍼링크
                    var html = "<a href='"+fileInfo.getLink+"'>"+fileInfo.fileName+"</a><br>";
                    // hidden 태그 추가
                    html += "<input type='hidden' name = 'filelist' class='filelist' value='"+fileInfo.fullName+"'>";
                    var str = "<input type='hidden' name = 'filelist' class='filelist' value='"+fileInfo.fullName+"'>"
                    // div에 추가
                    $("#uploadedList").append(html);
                    $("#form1").append(str);
                }
            });
        });

        // 3. 첨부파일 삭제 ajax요청
        // 태그.on("이벤트", "자손태그", 이벤트 핸들러)
        $("#uploadedList").on("click", ".fileDel", function(e){
            var that = $(this); // 클릭한 a태그
            $.ajax({
                type: "post",
                url: "${path}/community/upload/deleteFile",
                data: {fileName: $(this).attr("data-src")},
                dataType: "text",
                success: function(result){
                    if(result == "deleted"){
                        that.parent("div").remove();
                    }
                }

            });
        });
    });
 	// 첨부파일 목록 ajax요청 처리
    function listAttach(){
        $.ajax({
            type: "post",
            url: "${path}/community/getAttach/${dto.idx}",
            success: function(list){
                $(list).each(function(){
                // each문 내부의 this : 각 step에 해당되는 값을 의미    
                var fileInfo = getFileInfo(this);
                // a태그안에는 파일의 링크를 걸어주고, 목록에는 파일의 이름 출력
                var html = "<div><a href='"+fileInfo.getLink+"'>"+fileInfo.fileName+"</a>&nbsp;&nbsp;";
                // 삭제 버튼
                html += "<a href='#' class='fileDel' data-src='"+this+"'>[삭제]</a></div>"
                $("#uploadedList").append(html);
                });
            }
        });
    }
 	
</script>
<style>
    #modifyReply {
        width: 600px;
        height: 130px;
        background-color: gray;
        padding: 10px;
        z-index: 10;
        visibility: hidden;
    }
</style>
</head>
<body>

<%@ include file="/resources/include/mobile.jsp" %>
      
        <!-- Breadcrumbs Area Start -->
        <div class="breadcrumbs-area">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
					    <div class="breadcrumbs">
					       <h2>About Us</h2> 
					       <ul class="breadcrumbs-list">
						        <li>
						            <a title="Return to Home" href="index.html">Home</a>
						        </li>
						        <li>About Us</li>
						    </ul>
					    </div>
					</div>
				</div>
			</div>
		</div> 
		<!-- Breadcrumbs Area Start --> 
		
		<!-- About Us Area Start -->
		<div class="about-us-area section-padding">
		    <div class="container">
                <div class="row">
                    <div class="about-top-inner">
                        <div class="col-md-6">
                            <div class="about-inner">
                                <div class="about-title">
                
    <h2>게시글 보기</h2>
 
    <form id="form1" name="form1" method="post">
    	<input type="hidden" name="idx" id="idx" size="80" value="${dto.idx}" >
    	<input type="hidden" name="writer" id="writer" size="80" value="${dto.writer}" >
        <div>        <!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 -->
            작성일자 : <fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd a HH:mm:ss"/>
                    <!-- 날짜 형식 => yyyy 4자리연도, MM 월, dd 일, a 오전/오후, HH 24시간제, hh 12시간제, mm 분, ss 초 -->
        </div>
        <div>
            조회수 : ${dto.viewcnt}
        </div>
        <div>
            제목
            <input name="title" id="title" size="80" value="${dto.title}" placeholder="제목을 입력해주세요">
        </div>
        <div>
            내용
            <textarea name="content" id="content" rows="4" cols="80" placeholder="내용을 입력해주세요">${dto.content}</textarea>
<script>
CKEDITOR.replace("content",{
	filebrowserUploadUrl : "${path}/community/imageUpload.do"
});
</script>
        </div>
        <div>
            이름	${dto.writer}
        </div>
        <div style="width:650px; text-align: center;">
            <!-- 게시물번호를 hidden으로 처리 -->
            <input type="hidden" name="boardno" value="${dto.idx}">
            <button type="button" id="btnUpdeteinsert">수정완료</button>
            <button type="button" id="btnList">목록</button>
        </div>
    </form>
     	첨부파일 등록
	<!-- 첨부파일 등록영역 -->
	<div class="fileDrop"></div>
	<!-- 업로드된 파일 목록 -->
	<div class="uploadedList"></div>
    
    
    </div>
    </div>
    </div>
    </div>
    </div>
    </div>
    </div>
    
</body>
</html>
