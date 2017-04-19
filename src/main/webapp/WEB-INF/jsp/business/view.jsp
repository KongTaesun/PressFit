<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<%@ include file="/resources/include/header.jsp" %>

<script type="text/javascript">
$(document).ready(function(){
	//수정 버튼 클릭
	$("#btnUpdate").click(function(){
		document.form1.action="${path}/business/update.do";
		document.form1.submit();
	});
	//삭제 버튼 클릭
	$("#btnDelete").click(function(){
		if(confirm("삭제하시겠습니까?")){
			document.form1.action=
				"${path}/business/delete.do";
			document.form1.submit();
		}
	});
});
</script>
</head>
<body>

<!-- Breadcrumbs Area Start -->
	<div class="breadcrumbs-area">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="breadcrumbs">
						<h2>My Account</h2>
						<ul class="breadcrumbs-list">
							<li><a title="Return to Home" href="index.html">Home</a></li>
							<li>My Account</li>
						</ul>
					</div>
				</div>
			</div> 
		</div>
	</div>
	
<h2>회원정보</h2>

<form name="form1" method="post">
<table border="1" width="400px">
  <tr>
    <td>아이디</td>
    <td><input name="id" value="${vo.id}" readonly></td>
  </tr>
  <tr>
    <td>비밀번호</td>
    <td><input type="password" name="pw"></td>
  </tr>
  <tr>
    <td>이름</td>
    <td><input name="name" value="${vo.name}"></td>
  </tr>
  <tr>
    <td>이메일</td>
    <td><input name="email" value="${vo.email}"></td>
  </tr>
  <tr>
  	<td>회원가입일자</td>
  	<td>
  	<fmt:formatDate value="${vo.regdate}"
  		pattern="yyyy-MM-dd HH:mm:ss"/></td>
  </tr>
  <tr>
  	<td>회원정보수정일자</td>
  	<td> 
  	<fmt:formatDate value="${vo.updatedate}"
  		pattern="yyyy-MM-dd a HH:mm:ss"/></td>
  </tr> 
  <tr>
    <td colspan="2" align="center">
      <input type="button" value="수정" id="btnUpdate">
   	  <input type="button" value="삭제" id="btnDelete">
   	  <div style="color:red">${message}</div>
    </td>
  </tr>
</table>
</form>


<%@ include file="/resources/include/footer.jsp" %>

</body>
</html>

















