<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PressFit</title>
<%@ include file="/resources/include/header.jsp"%>
<script type="text/javascript" src="${path}/include/js/common.js"></script>
<script src="<c:url value='/resources/ckediter/ckeditor.js' />"></script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
// 다음 주소 API
function DaumPostcode() {
	new daum.Postcode({
		oncomplete : function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var fullAddr = ''; // 최종 주소 변수
			var extraAddr = ''; // 조합형 주소 변수

			// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				fullAddr = data.roadAddress;

			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				fullAddr = data.jibunAddress;
			}

			// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
			if (data.userSelectedType === 'R') {
				//법정동명이 있을 경우 추가한다.
				if (data.bname !== '') {
					extraAddr += data.bname; 
				}
				// 건물명이 있을 경우 추가한다.
				if (data.buildingName !== '') {
					extraAddr += (extraAddr !== '' ? ', '
							+ data.buildingName
							: data.buildingName);
				}
				// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
				fullAddr += (extraAddr !== '' ? ' ('
						+ extraAddr + ')'
						: '');
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			$("#post").val(data.zonecode);
			$("#basic_addr").val(fullAddr);
			$("#detail_addr").focus();

		}
	}).open();
}
</script> 

<style>
.breadcrumbs-area {
	background-image:
		url('${path}/resources/writer/img/bigpicture/mypage_img.png');
}
</style>
<style>

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
}
.box_input {
input[type=text]:focus {
    outline: -webkit-focus-ring-color auto 5px;
	}
}
</style>
<script type="text/javascript">
function imgError(image) {
    image.onerror = "";
    image.src = "${path}/resources/writer/icon/130917_224626.png";
    return true;
}
</script>
</head>
<body>
<!-- Breadcrumbs Area Start -->
	<div class="breadcrumbs-area">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="breadcrumbs">
						<h2>내정보관리</h2>
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
                                    <li role="presentation"><a href="${path}/member/mypage.do?id=${sessionScope.id}" id="btnone">마이페이지</a></li>
                                    <li role="presentation"class="active"><a href="#" id="btntwo">내정보관리</a></li>
                                    <li role="presentation"><a href="${path}/order/orderList.do" id="btnthree">내주문관리</a></li>
                                    <li role="presentation"><a href="${path}/order/orderCancel.do" id="btnthree">취소및교환</a></li>
                                    <!-- <li role="presentation"><a href="#" id="btnthree">1대1문의</a></li> -->
	                       
                                </ul>
                            </div>

	<!-- About Us Area Start -->

                    <div class="about-top-inner">
                        <div class="col-md-6">
                            <div class="about-inner">
                                                              
                                <div class="about-content">

       <!-- <h2 class="heading-title">개인정보</h2> -->
       	<form action="${path}/member/updatepage.do" name="form1" class="create-account-form" method="post">
						<dl class="list_delivery">
						
							<dt>
								<label for="oaName">회원아이디</label>
							</dt>
							<dd> 
								<div class="box_input"><input class="tf_g" id="oaName" name="id" type="text" value="${vo.id}"></div>
							</dd>
							<dt>
								<label for="oaName">비밀번호</label>
							</dt>
							<dd>
								<div class="box_input"><input class="tf_g" id="oaEmail" name="pw" type="password" value="${vo.pw}"></div>
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
							<dd>
							<c:choose>
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
								<div class="box_input"><input class="tf_g" id="oaPhone" name="birth" type="text" value="${vo.birth}" readonly="readonly" ></div>
							</dd>
							<dt>
								<label for="oaName">이메일</label>
							</dt> 
							<dd>
								<div class="box_input"><input class="tf_g" id="oaPhone" name="email" value="${vo.email}" type="text"></div>
							</dd>
							<dt>
								<label for="oaName">전화번호</label>
							</dt>
							<dd>
								<div class="box_input"><input class="tf_g" id="oaPhone" name="hp" value="${vo.hp}" type="text" ></div>
							</dd>
							<dt>
								<label for="oaName">주소</label>
							</dt> 
							<dd>
								<div class="box_input box_postal">
								<input class="tf_g" id="post" name="post" type="text" readonly=readonly placeholder="우편번호" value="${vo.post}"></div>
							
								<button type="button" class="btn_postal" onclick="DaumPostcode()" style="line-height: 0px;">주소검색</button>
							</dd>
							<dd> 
								<div class="box_input">
								
								<input class="tf_g" id="basic_addr" name="basic_addr" type="text" readonly=readonly value="${vo.basic_addr}" ></div>
							</dd>
							
							
							<dd> 
								<div class="box_input"><input class="tf_g" id="detail_addr" name="detail_addr" type="text"  value=" ${vo.detail_addr}" ></div>
							</dd>
							
							<dt>
								<label for="oaName">가입일자</label>
							</dt>
							<dd>
								<div class="box_input"><input class="tf_g" id="oaPhone" name="date" value="${vo.regdate}" type="text" readonly="readonly"></div>
							</dd>
						</dl>
							
					
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="about-image">
                                <div class="card animated fadeIn">
                                
                                
 <div class="create-account-form" align = "center">                                 
        <img class="center animated rollIn" src="${path}/resources/upload/${vo.cpicture}" alt="avatar"  onerror="imgError(this);">
         <script>
			CKEDITOR.replace("content",{
				filebrowserUploadUrl : "${path}/member/updatepage/imageUpload.do"
			});
		</script>
                            
             	<div class="panel panel-default" style="margin-top:15px; width:100%">
									<div class="panel-heading" role="tab" id="headingFour" style="width:100%;">
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
														filebrowserUploadUrl : "${path}/member/imageUpload.do"
													});
													</script>
											</div>
										</div>
									</div>
   								   </div>  

						<button class="button form-button" type="submit">수정하기</button>
						<button class="button form-button" type="reset">취소</button>
                    </form>
                    </div>
                  </div> 
                  </div>
                  </div>
                  </div></div>
              </div>
              </div>
               

	<%@ include file="/resources/include/footer.jsp"%>
	
</body>
</html>
         
         
            
         
         
            
      
       


















