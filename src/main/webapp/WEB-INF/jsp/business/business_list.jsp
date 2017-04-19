<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- views/member/member_list.jsp -->

<%@ include file="/resources/include/header.jsp" %>

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


<h2>회원목록</h2>
<input type="button" value="회원등록"
onclick="location.href='${path}/business/write.do'">
<table border="1" width="700px">
  <tr>
  	<th>아이디</th>
  	<th>이름</th>
  	<th>이메일</th>
  	<th>가입일자</th>
  </tr>
<c:forEach var="row" items="${list}">
  <tr>
    <td>${row.id}</td>
    <td>
<a href="${path}/business/view.do?id=${row.id}">
${row.name}</a></td>
    <td>${row.email}</td>
    <td>${row.regdate}</td> 
  </tr>
</c:forEach>  


<%@ include file="/resources/include/footer.jsp" %>

</table>
</body>
</html> 

















