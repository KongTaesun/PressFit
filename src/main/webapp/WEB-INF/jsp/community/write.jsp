<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 작성</title>
<%@ include file="/resources/include/header.jsp" %>
<%@ include file="/resources/include/sessionCheck.jsp" %>
<script src="<c:url value='/resources/ckediter/ckeditor.js' />"></script>
<script src="<c:url value='/resources/include/commons.js' />"></script>

<script>
    $(document).ready(function(){
        $("#btnSave").click(function(){
            var title = $("#title").val();
            var content = $("#content").val();
            
            if(title == ""){
                alert("제목을 입력하세요");
                document.form1.title.focus();
                return;
            }
            document.form1.submit();
        });
        // 파일 업로드 영역에서 기본효과를 제한
        $(".fileDrop").on("dragenter dragover", function(e){
            e.preventDefault(); // 기본효과 제한
        });
        // 드래그해서 드롭한 파일들 ajax 업로드 요청
        $(".fileDrop").on("drop", function(e){
            e.preventDefault(); // 기본효과 제한
            var files = e.originalEvent.dataTransfer.files; // 드래그한 파일들
            var file = files[0]; // 첫번째 첨부파일
            var formData = new FormData(); // 폼데이터 객체
            formData.append("file", file); // 첨부파일 추가
            $.ajax({
                url: "${path}/community/upload/uploadAjax.do",
                type: "post",
                data: formData,
                dataType: "text",
                processData: false, // processType: false - header가 아닌 body로 전달
                contentType: false,
                // ajax 업로드 요청이 성공적으로 처리되면
                success: function(data){
                    // 첨부 파일의 정보
                    var fileInfo = getFileInfo(data);
                    // 하이퍼링크
                    var html = "<a href='"+fileInfo.getLink+"'>"+fileInfo.fileName+"</a><br>";
                 	// 삭제 버튼
                    html += "<a href='#' class='fileDel' data-src='"+this+"'>[삭제]</a></div>"
                    var str = "<input type='hidden' name = 'filelist' class='filelist' value='"+fileInfo.fullName+"'>";
                    // div에 추가
                    $("#uploadedList").append(html);
                    $("#form1").append(str);
            }
        });
    });
        $(".uploadedList").on("click", "#fileDel", function(event){
            alert("이미지 삭제")
            var that = $(this); // 여기서 this는 클릭한 span태그
            $.ajax({
                url: "${path}/upload/deleteFile",
                type: "post",
                // data: "fileName="+$(this).attr("date-src") = {fileName:$(this).attr("data-src")}
                // 태그.attr("속성")
                data: {fileName:$(this).attr("data-src")}, // json방식
                dataType: "text",
                success: function(result){
                    if( result == "deleted" ){
                        // 클릭한 span태그가 속한 div를 제거
                        that.parent("div").remove();
                    }
                }
            });
        });
});
</script>
<style>
/* 첨부파일을 드래그할 영역의 스타일 */
.fileDrop {
    width: 600px;
    height: 70px;
    border: 2px dotted gray;
    background-color: gray;
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
					       <h2>SHOPPING CART</h2> 
					       <ul class="breadcrumbs-list">
						        <li>
						            <a title="Return to Home" href="index.html">Home</a>
						        </li>
						        <li>Shopping Cart</li>
						    </ul>
					    </div>
					</div>
				</div>
			</div>
		</div> 
		<!-- Breadcrumbs Area Start --> 

<!-- My Account Area Start -->
		<div class="my-account-area section-padding">
			<div class="container">
				<div class="section-title2">
					<h2>게시물 작성</h2> 
					<p>Welcome to my homepage.</p>
				</div>
				
				
<form id="form1" name="form1" method="post" action="${path}/community/insert.do">
    <div>
      
        <input name="title" id="title" size="80" placeholder="제목을 입력해주세요">
    </div>
    <div>

        <textarea name="content" id="content" rows="5" cols="80" 
        placeholder="내용을 입력해주세요"></textarea>
<script> 
CKEDITOR.replace("content",{
	filebrowserUploadUrl : "${path}/community/imageUpload.do"
});
</script>
    </div>
    <div>
	    첨부파일 등록
	    <!-- 첨부파일 등록영역 -->
	    <div class="fileDrop"></div>
	    <!-- 첨부파일의 목록 출력영역 -->
	    <div id="uploadedList"></div>
	</div>
    <div style="width:1000px; text-align: center;">
        <button type="button" id="btnSave">확인</button>
        <button type="reset">취소</button>
    </div>
    
</form>
</div>
    </div>
    

</body>
</html>
