<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<%@ include file="/resources/include/header.jsp"%>
<script type="text/javascript" src="${path}/include/js/common.js"></script>
<script src="<c:url value='/resources/ckediter/ckeditor.js' />"></script>
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
						<h2>MY PAGE</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
		<div class="about-us-area section-padding">
		    <div class="container">
                <div class="row">

<div class="p-details-tab" style="margin-top: 30px;">
                                <ul class="p-details-nav-tab">
                                    <li role="presentation" class="active"><a href="#" id="btnone">마이페이지</a></li>
                                    <li role="presentation"><a href="#" id="btntwo">내정보관리</a></li>
                                    <li role="presentation"><a href="#" id="btnthree">내주문관리</a></li>
                                    <li role="presentation"><a href="#" id="btnthree">취소및교환</a></li>
                                    <li role="presentation"><a href="#" id="btnthree">1대1문의</a></li>
                                
                                
                                </ul>
                            </div>



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
         <script>
			CKEDITOR.replace("content",{
				filebrowserUploadUrl : "${path}/keyboard/imageUpload.do"
			});
		</script>
<center>
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
            </center>
         </p>
      </div>
	</div>
</div>
                            </div>
                        </div>
                    </div>
                  
                </div>
		    </div>
		</div>

	<%@ include file="/resources/include/footer.jsp"%>
	
</body>
</html>

















