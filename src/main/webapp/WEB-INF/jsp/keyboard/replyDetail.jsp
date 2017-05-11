<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PressFit</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
    //3. 댓글 수정
    $("#btnReplyUpdate").click(function(){
        var detailReplytext = $("#detailReplytext").val();
        $.ajax({
            type: "put",
            url: "${path}/keyboard/reply/update/${vo.idx}",
            // 기본값 text/html을 json으로 변경
            headers: {
                "Content-Type":"application/json"
            },
            // 데이터를 json형태로 변환
            data: JSON.stringify({
                replytext : detailReplytext
            }),
            dataType: "text",
            success: function(result){
                if(result == "success"){
                    $("#modifyReply").css("visibility", "hidden");
                    // 댓글 목록 갱신
                    listReply("1");
                }
            }
        });
    });
    
    // 4. 댓글 상세화면 닫기
    $("#btnReplyClose").click(function(){
        $("#modifyReply").css("visibility", "hidden");
    });

    $("#btnReplycmt").click(function(){
    	replyJsoncmt(); // json 형식으로 입력
    });
    // 5. 댓글 삭제
    $("#btnReplyDelete").click(function(){
        if(confirm("삭제하시겠습니까?")){
            $.ajax({
                type: "delete",
                url: "${path}/keyboard/reply/delete/${vo.idx}",
                success: function(result){
                    if(result == "success"){
                        alert("삭제되었습니다.");
                        $("#modifyReply").css("visibility", "hidden");
                        listReply("1");
                    }
                }
            });
        }
    });
 // 1_2. 댓글 입력 함수(json방식)
    function replyJsoncmt(){
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
            url: "${path}/keyboard/reply/insertRestcmt.do",
            headers: {
                "Content-Type" : "application/json"
            },
            dateType: "text",
            // param형식보다 간편
            data: JSON.stringify({
            	idx : "${idx}",
            	boardno : "${boardno}",
                replytext : "└re:"+$("#detailReplytext").val(),
                secretReply : $("#secretReply").val()
            }),
            success: function(){
                alert("댓글이 등록되었습니다.");
                listReply("1"); // Rest 방식
            }
        });
    }
    // 2_3. 댓글 목록 - Rest방식
    function listReply(num){
        $.ajax({
            type: "get",
            url: "${path}/keyboard/reply/list/${boardno}/"+num,
            success: function(result){
            	console.log(result);
            // responseText가 result에 저장됨.
                $("#listReply").html(result);
            }
        });
    }    
</script>
</head>
<body>
    댓글 번호 : ${vo.idx} ${idx} ${cmt}<br>
    <textarea id="detailReplytext" rows="5" cols="82">${vo.replytext}</textarea>
    <div style="text-align: center;">
        <!-- 본인 댓글만 수정, 삭제가 가능하도록 처리 -->
        <c:if test="${sessionScope.id == vo.replayer}">
        	<input type="checkbox" id="secretReply">비밀 댓글
            <button type="button" id="btnReplyUpdate" >수정</button>
            <button type="button" id="btnReplyDelete" >삭제</button>
        </c:if>
        <c:if test="${cmt=='cmt'}">
        	<input type="checkbox" id="secretReply">비밀 댓글
            <button type="button" id="btnReplycmt" >답글달기</button>
        </c:if>
        <button type="button" id="btnReplyClose" >닫기</button>
    </div>
</body>
</html>
