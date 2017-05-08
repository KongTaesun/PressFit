<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@ include file="/resources/include/header.jsp"%>
<style>
 .breadcrumbs-area{
 background-image:url('${path}/resources/writer/img/bigpicture/main.png');
</style>


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


	<!-- Loging Area Start -->
	<div class="login-account section-padding">
		<div class="container" style="display:table ;width: 700px;text-align: center">

			<div>
	<form action="${path}/member/insert.do" name="form1" class="create-account-form" method="post">

					<h1 class="heading-title">아이디 찾기</h1>

					<p class="form-row">
						이름 <input type="text" name="name" placeholder="이름">
						</p>
					<p class="form-row">
						휴대폰번호 <input type="text" name="hp" placeholder="휴대폰 번로를 '-'없이 입력하세요">
					</p>
					<input type="submit" value="보내기" />
					</form>
					
					<form action="${path}/member/insert.do" name="form1" class="create-account-form" method="post">

					<h1 class="heading-title">비밀번호 찾기</h1>

					<p class="form-row">
						아이디 <input type="text" name="id" placeholder="아이디를 입력해주세요">
						</p>
					<p class="form-row">
						휴대폰번호 <input type="text" name="hp" placeholder="휴대폰 번로를 '-'없이 입력하세요">
					</p>
					<input type="submit" value="보내기" />
					</form>
							</div>
			</div>
				</div>
			

<%@ include file="/resources/include/footer.jsp" %>
</body>
</html>