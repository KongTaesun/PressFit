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
                url: "${path}/faq/upload/uploadAjax.do",
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

<script>
$("#undercover").on(
		"change", function() {
			//체크박스가 선택된(checked) 상태인지 확인하는 방법
			if ($(this).is(":checked")) {
				//show() 메소드 특정 영역이 화면에 나타나도록 설정
				$("#myQABoardInsertForm").find("#pwForm").show();
				//removeAttr() 메소드 기존 속성 제거
				$("#myQABoardInsertForm").find("#pwForm").find("#pw").removeAttr("disabled");
			} else {
				//hide() 메소드 특정 영역이 화면에 보이지 않도록 설정
				$("#myQABoardInsertForm").find("#pwForm").hide();
				$("#myQABoardInsertForm").find("#pwForm").find("#pw").attr("disabled", "disabled");
			}
		});
</script>



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
				
				
<form id="form1" name="form1" method="post" action="${path}/faq/insert.do">
    <div>
      
        <input name="title" id="title" size="80" placeholder="제목을 입력해주세요">
    </div>
    <div>

        <textarea name="content" id="content" rows="5" cols="80" 
        placeholder="내용을 입력해주세요"></textarea>
<script> 
CKEDITOR.replace("content",{
	filebrowserUploadUrl : "${path}/faq/imageUpload.do"
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
	
	 <div class="checkbox">
		<label><input type="checkbox" value="" id="undercover">비밀글
			<span class="small">(비밀글을 체크하면 글내용 보기를 할 때 패스워드를 확인하는
				게시물이 됩니다.)</span></label> <label class="text-danger small">* <!-- 수강 신청 확인
			등 신원 확인이 필요한 문의는 이름, 전화번호, 이메일을 적어주시고, 비밀글 체크를 해주시기 바랍니다. --></label>
	</div>
    <div class="form-group" id="pwForm" style="display: none;">
		<input type="password" class="form-control " id="pw" name="pw"
			placeholder="패스워드 (4자리)" maxlength="4" required="required"
			disabled="disabled">
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
