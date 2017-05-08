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
.joinbutton{
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	color: #616161; 
	padding: 9px 20px;
	background: -moz-linear-gradient(top, #ffffff 0%, #ffffff);
	background: -webkit-gradient(linear, left top, left bottom, from(#ffffff),
		to(#ffffff));
	-moz-border-radius: 0px;
	-webkit-border-radius: 0px;
	border-radius: 0px;
	border: 1px solid #dbe2ff;
	box-shadow:
	0px 1px 3px rgba(000,000,000,0.3),
	inset 0px 0px 2px rgba(255,255,255,0);
}

button {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	color: #616161;
	padding: 9px 20px;
	background: -moz-linear-gradient(top, #ffffff 0%, #ffffff);
	background: -webkit-gradient(linear, left top, left bottom, from(#ffffff),
		to(#ffffff));
	-moz-border-radius: 0px;
	-webkit-border-radius: 0px;
	border-radius: 0px;
	border: 1px solid #dbe2ff;
	box-shadow:
	0px 1px 3px rgba(000,000,000,0.3),
	inset 0px 0px 2px rgba(255,255,255,0);
}

button.btnbuy {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	font-weight: bold;
	color: #000000;
	padding: 9px 20px;
	background: -moz-linear-gradient(top, #ffffff 0%, #ffffff);
	background: -webkit-gradient(linear, left top, left bottom, from(#ffffff),
		to(#ffffff));
	-moz-border-radius: 0px;
	-webkit-border-radius: 0px;
	border-radius: 0px;
	border: 1px solid #879fff;
	box-shadow:
	0px 1px 3px rgba(000,000,000,0.3),
	inset 0px 0px 2px rgba(255,255,255,0);
}

button.btnbuy:hover {
	background: #32b5f3 none repeat scroll 0 0;
	color: #ffffff;
}
.join_row{
        overflow: hidden;
}
.list_delivery {

    overflow: hidden;
    padding-top: 31px;
}
.list_delivery dt {
    margin-bottom: 19px;
    font-size: 16px;
    line-height: 17px;
    color: #666;
}
.list_delivery dd {
    overflow: hidden;
    min-height: 50px;
    margin-bottom: 19px;
}
.list_delivery .box_input {
    height: 48px;
    padding: 0 19px;
    border: 1px solid #d2d2d2;
    background-color: #f9f9f9;
}
.list_delivery .box_input .tf_g {
    width: 100%;
    height: 30px;
    margin-top: 5px;
    border: 0;
    outline: 0;
    font-size: 16px;
    line-height: 24px;
    color: #535353;
    background-color: transparent;
}
.list_delivery .box_postal {
    float: left;
    width: 70%;
}
.list_delivery .box_input .tf_g:disabled {
    opacity: 1;
}
.list_delivery .btn_postal {
    float: left;
    width: 25%; 
    height: 50px;
    margin-left: 22px;
    /* border: 1px solid #d2d2d2;
    font-size: 16px;
    color: #1e1e1e;
    line-height: 49px;
    background-color: #fff;
    text-align: center;  */
}
.box_input {
input[type=text]:focus {
    outline: -webkit-focus-ring-color auto 5px;
	}
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
                                    <li role="presentation"><a href="${path}/member/updatepage.do?id=${vo.id}" id="btntwo">내정보관리</a></li>
                                    <li role="presentation"><a href="${path}/order/orderList.do" id="btnthree">내주문관리</a></li>
                                    <li role="presentation"><a href="${path}/order/orderCancel.do" id="btnthree">취소및교환</a></li>
                                  <!--   <li role="presentation"><a href="#" id="btnthree">1대1문의</a></li> -->
                                                          
                                </ul>  
                            </div>

 

	<!-- About Us Area Start -->
		<div class="about-us-area section-padding">
		    <div class="container">
                <div class="row">

                    <div class="about-top-inner">
                        <div class="col-md-6">
                            <div class="about-inner">
                                                              
                                <div class="about-content">

       <!-- <h2 class="heading-title">개인정보</h2> -->
						<dl class="list_delivery">
							<dt>
								<label for="oaName">회원아이디</label>
							</dt>
							<dd> 
								<div class="box_input"><input class="tf_g" id="oaName" name="id" type="text" value="${vo.id}" readonly="readonly"></div>
							</dd>
							<dt>
								<label for="oaName">비밀번호</label>
							</dt>
							<dd>
								<div class="box_input"><input class="tf_g" id="oaEmail" name="pw" type="password" value="${vo.pw}" readonly="readonly"></div>
							</dd>
							<dt>
								<label for="oaName">이름</label>
							</dt>
							<dd>
								<div class="box_input"><input class="tf_g" id="oaPhone" name="name" type="text"  value="${vo.name}" readonly="readonly"></div>
							</dd>
							<dt>
								<label for="oaName">성별</label>
							</dt>
							
							
							<dd><c:choose>
								<c:when test="${ vo.gender eq '0'}">
									<div class="box_input"><input class="tf_g" id="oaPhone" name="name" type="text" 
									 value="남자" readonly="readonly"></div>
							</c:when>
								<c:otherwise>
									<div class="box_input"><input class="tf_g" id="oaPhone" name="name" type="text" 
									 value="여자" readonly="readonly"></div>
							</c:otherwise>
							</c:choose>
							</dd>
							
							
							<dt>
								<label for="oaName">생년월일</label>
							</dt>
							<dd>
								<div class="box_input"><input class="tf_g" id="oaPhone" name="birth" type="text" value="${vo.birth}" readonly="readonly"></div>
							</dd>
							<dt>
								<label for="oaName">이메일</label>
							</dt> 
							<dd>
								<div class="box_input"><input class="tf_g" id="oaPhone" name="email" value="${vo.email}" type="text" readonly="readonly"></div>
							</dd>
							<dt>
								<label for="oaName">전화번호</label>
							</dt>
							<dd>
								<div class="box_input"><input class="tf_g" id="oaPhone" name="hp" value="${vo.hp}" type="text" readonly="readonly"></div>
							</dd>
							<dt>
								<label for="oaName">주소</label>
							</dt> 
							<dd>
								<div class="box_input"><input class="tf_g" id="oaPhone" name="address" value="${vo.basic_addr} ${vo.detail_addr} ${vo.post}" type="text"  readonly="readonly"></div>
							</dd>
							<dt>
								<label for="oaName">가입일자</label>
							</dt>
							<dd>
								<div class="box_input"><input class="tf_g" id="oaPhone" name="date" value="${vo.regdate}" type="text"  readonly="readonly"></div>
							</dd>
						</dl>
						
      
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="about-image">
                                <div class="card animated fadeIn">
                                
                                
 <center>                               
        <img class="center animated rollIn" src="${path}/resources/upload/${vo.cpicture}" alt="avatar"></center>
         <script>
			CKEDITOR.replace("content",{
				filebrowserUploadUrl : "${path}/keyboard/imageUpload.do"
			});
		</script>
		</center>
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
         </p>
         </center>
         	</div>
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
         
         
              <!--  	<div class="panel panel-default">
									<div class="panel-heading" role="tab" id="headingFour">
										<h4 class="panel-title">
											<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
												<i class="fa fa-building"></i>
												<span>사진업로드</span>
											</a>
										</h4>
									</div>
            <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
										<div class="panel-body">
											<div class="coupon-info">
															<p class="required">*이미지를 클릭해주세요</p>
													<textarea name="content" id="content" rows="4" cols="80" placeholder="이미지를 클릭해주세요"></textarea>
													<script>
													CKEDITOR.replace("content",{
														filebrowserUploadUrl : "${path}/keyboard/imageUpload.do"
													});
													</script>
											</div>
										</div>
									</div>
      </div>  -->
         
         
        
            
      
       


















