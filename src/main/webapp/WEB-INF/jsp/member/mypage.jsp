<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<%@ include file="/resources/include/header.jsp"%>
<style>
.breadcrumbs-area {
	background-image:
		url('${path}/resources/writer/img/bigpicture/mypage_img.png');
}
</style>
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

	<!-- About Us Area Start -->
		<div class="about-us-area section-padding">
		    <div class="container">
                <div class="row">
                    <div class="about-top-inner">
                        <div class="col-md-6">
                            <div class="about-inner">
                                <div class="about-title">
                                    <h2>마이페이지</h2>
                                </div>
                                <div class="about-content">
                                   
                                     <p class="form-row">
						아이디 ${vo.id} 
					</p>
								
					<p class="form-row">
						이름  ${vo.name} 
					</p>

					<p class="form-row">
						성별
					</p>

					<p class="form-row">
						생년월일 ${vo.birth} 
					</p>

					<p class="form-row">
						이메일 ${vo.email}
					</p>
					<p class="form-row">
						전화번호 ${vo.hp}
					</p>					
					<p class="form-row">
						주소
						${vo.address} 
					</p>
                                         
                                    <p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="about-image">
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
                            </div>
                        </div>
                    </div>
                    <div class="about-bottom-inner">
                        <div class="col-md-6">
                            <div class="about-image">
                                <img src="img/about/2.jpg" alt="">
                            </div>
                        </div>
                        <div class="col-md-6">  
                            <div class="about-inner">
                                <div class="about-title">
                                    <h2>Mission and Vission</h2>
                                </div>
                                <div class="about-content">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elitss ed do eiusmod tempor incididunt ut labore et dolore mag na aliqua. Utes enim ad minim veniam, quis nostrud exerck itation ullam co laboris nisi ut aliquip ex ea commodo coes nsequat. Duis aute irure dolor in reprehenderit in.</p>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elitss ed do eiusmod tempor incididunt ut labore et dolore mag na aliqua. Utes enim ad minimLorem ipsum dolor sit amet, consectetur adipisicing elitss ed do eiusmod tempor incididunt ut labore et dolore mag na aliqua. </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
		    </div>
		</div>
		<!-- About Us Area End -->
 
	<h2>마이페이지</h2>  
	
   
	
	<%@ include file="/resources/include/footer.jsp"%>
	
</body>
</html>

















