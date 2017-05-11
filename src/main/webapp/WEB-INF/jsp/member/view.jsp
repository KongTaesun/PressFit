<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PressFit</title>
<%@ include file="/resources/include/header.jsp"%>

<script type="text/javascript">
	$(document).ready(function() {
		//수정 버튼 클릭
		$("#btnUpdate").click(function() {
			document.form1.action = "${path}/member/update.do";
			document.form1.submit();
		});
		//삭제 버튼 클릭
		$("#btnDelete").click(function() {
			if (confirm("삭제하시겠습니까?")) {
				document.form1.action = "${path}/member/delete.do";
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

<div class="login-account section-padding">
		<div class="container" style="display:table ;width: 700px;text-align: center">

	<h2>마이페이지</h2> 
	<form name="form1" method="post">
		
		<h1 class="heading-title">회원정보</h1>

					<p class="form-row">
						아이디 <input name="id" value="${vo.id}" readonly />
					</p>
					<p class="form-row">
						비밀번호 <input type="password" name="pw" />
					</p>
				
					<p class="form-row">
						이름 <input name="name" value="${vo.name}" />
					</p>

					<p class="form-row">
						성별 <input type="checkbox" name="gender" placeholder="남자" value="0" /> 
						<input type="checkbox" name="gender" placeholder="여자" value="1" />
					</p>

					<p class="form-row">
						생년월일 <input name="birth" value="${vo.birth}" />
					</p>

					<p class="form-row">
						이메일
						<input name="email" value="${vo.email}">
					</p>
					<p class="form-row">
						전화번호
						<input name="hp" value="${vo.hp}">
					</p>
					
				<%-- 	<p class="form-row">
						주소
						<input name="address" value="${vo.address}" />
					</p> --%>
					
					<p class="form-row">
					
					회원가입일자
					
					<fmt:formatDate value="${vo.regdate}"
						pattern="yyyy-MM-dd HH:mm:ss" />
					</p>
				
					<p class="form-row">
					
					회원정보수정일자
					
					<fmt:formatDate value="${vo.updatedate}"
						pattern="yyyy-MM-dd a HH:mm:ss" />
					</p>
										
					<td colspan="2" align="center">
					<input type="submit" value="수정" id="btnUpdate"> 
					<input type="submit" value="삭제" id="btnDelete">
					<div style="color: red">${message}</div>
					</td>
					</form>
	</div>
	</div>
	
	
	<%@ include file="/resources/include/footer.jsp"%>
	
</body>
</html>

















