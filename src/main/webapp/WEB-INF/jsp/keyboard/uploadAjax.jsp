<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/resources/include/header.jsp" %>
<script>
    $(document).ready(function(){
        $(".fileDrop").on("dragenter dragover", function(event){
            event.preventDefault(); // 기본효과를 막음
        });
        // event : jQuery의 이벤트
        // originalEvent : javascript의 이벤트
        $(".fileDrop").on("drop", function(event){
            event.preventDefault(); // 기본효과를 막음
            // 드래그된 파일의 정보
            var files = event.originalEvent.dataTransfer.files;
            // 첫번째 파일
            var file = files[0];
            // 콘솔에서 파일정보 확인
            console.log(file);

            // ajax로 전달할 폼 객체
            var formData = new FormData();
            // 폼 객체에 파일추가, append("변수명", 값)
            formData.append("file", file);


            $.ajax({
                type: "post",
                url: "${path}/upload/uploadAjax",
                data: formData,
                // processData: true=> get방식, false => post방식
                dataType: "text",
                // contentType: true => application/x-www-form-urlencoded, 
                //                false => multipart/form-data
                processData: false,
                contentType: false,
                success: function(data){
                    alert(data);
                }
            });
        });
    });
</script>
</head>
<body>
<%@ include file="/resources/include/menu.jsp" %>
    <h2>AJAX File Upload</h2>
    <!-- 파일을 업로드할 영역 -->
    <div class="fileDrop" style="width:600px;height: 200px;border: 1px dotted blue;"></div>
    <!-- 업로드된 파일 목록 -->
    <div class="uploadedList"></div>
</body>
</html>