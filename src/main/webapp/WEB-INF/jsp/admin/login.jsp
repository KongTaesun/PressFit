<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<c:set var="path" value="${pageContext.request.contextPath}" />
<html lang="en">
<%@ include file="adminheader.jsp"%>
<script type="text/javascript">
	$(document).ready(function() {

	});
</script>
<body style="background-image: url('${path}/resources/admin/img/login.jpg');">
	<div class="content"style="width: 100%;height: 100%">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-3"> </div>
				<div class="col-md-6" style="padding: 10%">
					<div class="card" style="background-color:white;">
						<div class="header" style="height: 60px;text-align: center;padding: 10%;">
							<h4 class="title" style="font-family: Connoisseurs;
							text-transform: none;font-size: 60px">PressFit</h4>
						</div>
						<div class="content" style="text-transform: none;font-size: 15px">
							<form method="post" action="${path}/admin/inter/passwordcheck.do">
								<div class="row">
								<div class="col-md-2"> </div>
									<div class="col-md-8">
										<div class="form-group">
											<label style="color:black">아이디</label> 
											<input type="text" id="id" name="id" class="form-control" placeholder="admin ID" value="">
										</div>
									</div>
								</div>

								<div class="row">
								<div class="col-md-2"> </div>
									<div class="col-md-8">
										<div class="form-group">
											<label style="color:black">패스워드</label> 
											<input type="text" id="pw" name="pw" class="form-control" placeholder="admin PW" value="">
										</div>
									</div>
								</div>

								<div class="row">
								<div class="col-md-2"> </div>
									<div class="col-md-8">
										<div class="form-group">
											<label style="color:black">패스워드</label> 
											<input type="text" id="pw2" name="pw2" class="form-control" placeholder="admin second PW"
												value="">
										</div>
									</div>
								</div>
								<div class="col-md-5"> </div>
								<div class="col-md-2">
								<button type="submit" class="btn btn-info btn-fill">Login</button>
								</div>
								<div class="clearfix"></div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
