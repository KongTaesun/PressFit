<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<%@ include file="/resources/include/header.jsp"%>

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
	
   <div class="card animated fadeIn">
         <center><img class="center animated rollIn" src="${path}/resources/writer/img/ava.png" alt="avatar"></center>
         <hr>
         <div class="name">
            ${vo.id}
         </div>
         <p class="subtitle">Student</p>
         <p class="icons animated pulse">
            <a href="https://twitter.com/" target="_blank">
            <span class="fa-stack fa-lg">
                <i class="fa fa-circle-thin fa-stack-2x"></i> 
                <i class="fa fa-twitter fa-stack-1x"></i>
            </span>
            </a>
            <a href="https://www.facebook.com/" target="_blank">
            <span class="fa-stack fa-lg">
                <i class="fa fa-circle-thin fa-3x fa-stack-2x"></i>     
                <i class="fa fa-facebook fa-stack-1x"></i>
            </span>
            </a>
            <a href="https://google.com/" target="_blank">
            <span class="fa-stack fa-lg">
                <i class="fa fa-circle-thin fa-stack-2x"></i>
                <i class="fa fa-google-plus fa-stack-1x"></i>
            </span>
            </a>
            <a href="https://www.instagram.com/" target="_blank">
            <span class="fa-stack fa-lg">
                <i class="fa fa-circle-thin fa-stack-2x"></i>
                <i class="fa fa-instagram fa-stack-1x"></i>
            </span>
            </a>
            <a href="https://github.com/" target="_blank">
            <span class="fa-stack fa-lg">
                <i class="fa fa-circle-thin fa-stack-2x"></i>
                <i class="fa fa-github fa-stack-1x"></i>
            </span>
            </a>
         </p>
      </div>
	</div>
</div>
	
	<%@ include file="/resources/include/footer.jsp"%>
	
</body>
</html>

















