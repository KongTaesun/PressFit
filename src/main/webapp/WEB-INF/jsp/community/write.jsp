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
.breadcrumbs-area {
	background-image:
		url('${path}/resources/writer/img/bigpicture/q&a_img.png');
}  
.icon1
  {
   width: 30px;
    height: 30px;
  }
.fileDrop {
    width: 600px;
    height: 70px;
    border: 2px dotted gray;
    background-color: gray;
}
.join_row{
        overflow: hidden;
}
.list_delivery {

    overflow: hidden;
    padding-top: 31px;
}
.list_delivery dt {
    margin-bottom: 19px;
    font-size: 16px;
    line-height: 17px;
    color: #666;
}
.list_delivery dd {
    overflow: hidden;
    min-height: 50px;
    margin-bottom: 19px;
}
.list_delivery .box_input {
    height: 48px;
    padding: 0 19px;
    border: 1px solid #d2d2d2;
    background-color: #f9f9f9;
}
.list_delivery .box_input .tf_g {
    width: 100%;
    height: 30px;
    margin-top: 5px;
    border: 0;
    outline: 0;
    font-size: 16px;
    line-height: 24px;
    color: #535353;
    background-color: transparent;
}
.list_delivery .box_postal {
    float: left;
    width: 70%;
}
.list_delivery .box_input .tf_g:disabled {
    opacity: 1;
}
.list_delivery .btn_postal {
    float: left;
    width: 25%; 
    height: 50px;
    margin-left: 22px;
    /* border: 1px solid #d2d2d2;
    font-size: 16px;
    color: #1e1e1e;
    line-height: 49px;
    background-color: #fff;
    text-align: center;  */
}
.box_input {
input[type=text]:focus {
    outline: -webkit-focus-ring-color auto 5px;
	} 
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

</style>
</head>
<body>
  
        <!-- Breadcrumbs Area Start -->
        <div class="breadcrumbs-area">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
					    <div class="breadcrumbs">
					       <h2>공지사항</h2> 
					       <!-- <ul class="breadcrumbs-list">
						        <li>
						            <a title="Return to Home" href="index.html">Home</a>
						        </li>
						        <li>Shopping Cart</li>
						    </ul> -->
					    </div>
					</div>
				</div>
			</div>
		</div> 
		<!-- Breadcrumbs Area Start --> 

<!-- My Account Area Start --> 
			<div class="login-account section-padding">
		<div class="container" style="display:table; width: 700px;/* text-align: center */">
				
				<div class="p-details-tab" style="margin-top: 30px;">
            	<ul class="p-details-nav-tab">
					<img src="${path}/resources/writer/icon/writer.png" class="icon1" />
                	<li role="presentation" class="active"><a href="#" id="btnone">글쓰기</a></li>
                </ul>
      		</div>
      		
<form action="${path}/community/insert.do" id="form1" name="form1" 
class="create-account-form" method="post">
      <dl class="list_delivery">
      <dt> 
		<label for="oaName">제목</label>
	</dt>
	<dd> 
	<div class="box_input"><input class="tf_g" id="title" name="title" /></div>
	</dd>
	 <dt>
		<label for="oaName">부제목</label>
	</dt>
	<dd> 
	<div class="box_input"><input class="tf_g" id="subtitle" name="subtitle" ></div>
	</dd>
      </dl>
       
        <textarea name="content" id="content" rows="5" cols="80" 
        placeholder="내용을 입력해주세요"></textarea>
<script> 
CKEDITOR.replace("content",{
	filebrowserUploadUrl : "${path}/community/imageUpload.do"
});
</script>
   <br>
    <div style="width:650px; text-align: center;">
          <button type="submit" id="btnSave">확인</button>
        <button type="reset">취소</button>
    </div> 
</form>
</div>
</div>

<%@ include file="/resources/include/footer.jsp"%>
</body>
</html>
