<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 작성</title>
<%@ include file="/resources/include/header.jsp"%>
<script src="<c:url value='/resources/include/commons.js' />"></script>
<script>
$(document).ready(function() {
	//search();
	 $("#btnCmt").click(function(){
     	location.href="${path}/keyboard/cmt.do?idx=${dto.idx}";
     });
	});
	
function search(){
	var amount=$("#amount").val();
	if(amount < 1){
		alert("수량을 체크해주세요!");
	} else{
		$.ajax({
            type: "get",
            url: "${path}/shop/cart/insert.do?price=${dto.price}&amount="+ amount +"&modelname=${dto.modelname}&manufacturecompany=${dto.manufacturecompany}&idx=${dto.idx}&fullName=${dto.fullName}&kind=keyboard&crea_id=${dto.crea_id}",
            success: function(){
            	var result = confirm("장바구니에 추가되었습니다. 바로 확인하시겠습니까?");
        		if(result){
        			location.href="${path}/shop/cart/cartList.do";
        		} else{
        		}
            },
            error: function(){
            	alert("실패");
            }
        });
	}
}  
</script>

</head>
<body>

</body>
<%@ include file="/resources/include/footer.jsp" %>
</html>