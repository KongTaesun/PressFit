<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js">
	
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script> 
	$(document).ready(function() {
		$('#btn1').click(function() {
			$.ajax({
				url : "${pageContext.request.contextPath}/business/checkID.do",
				type : "get", 
				data : {
					id : $('#id').val()
				},
				success : function(msg) {
					if (resultCnt = 1) {
						$('#searchResult').html(msg);
					} else {
						$('#searchResult').html(msg);
					}
				}
			});
		});
	});

	function callback(data) {
		$('#searchResult').text(data);
	}
</script>
<script> 

	$(document).ready(function() {
		

		$("#infoAgree").show();
		$("#infoShow").hide();
		$('#btn1').click(function() {
			$.ajax({
				url : "${pageContext.request.contextPath}/member/checkID.do",
				type : "get",
				data : {
					id : $('#id').val()
				},
				success : function(msg) {
					if (resultCnt = 1) {
						$('#searchResult').html(msg);
					} else {
						$('#searchResult').html(msg);
					}
				}
			});  
		});
		
		$("#allCheck").click(function(){
			
			if($("#allCheck").prop("checked")){
				$("input[type=checkbox]").prop("checked", true);
			}
			else{
				$("input[type=checkbox]").prop("checked", false);
			}
		})
		$("#btnAgree").click(function(){
			if($(".agree-tos").prop("checked")){
				$("#infoShow").show();
				$("#infoAgree").hide();	
			}
			else {
				alert('필수항목을 체크해주세요');
			}
			
		});
	});

	function callback(data) {
		$('#searchResult').text(data);
	}
	function checkSex(){
		$('#radioman').click(function(){ 
			$('#manLb').addClass('on');
			$('#womanLb').removeClass('on');

		});
		$('#radiowoman').click(function(){
			$('#manLb').removeClass('on');
			$('#womanLb').addClass('on');

		});
	} 
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
	
	function DaumPostcode2() {
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
</style>
<style> 
.sex {
    display: block;
    height: 31px;
    margin-right: -3px;
}
.jender {
    position: relative;
    z-index: 10;
    display: block;
    float: left;
    width: 49.8%;
    height: 40px;
    border: solid 1px #dcdcdc;
    font-size: 12px;
}
.jender input {
    position: absolute;
    z-index: 9;
    top: 0;
    left: 0;
    width: 100%;
    height: 31px;
}
.jender label {
    line-height: 32px;
    position: absolute;
    z-index: 10;
    top: 0;
    left: 0;
    display: block;
    width: 100%;
    height: 38px;
    cursor: pointer;
    text-align: center;
    color: #999;
    background: #fff;
}
.jender input:checked+label {
    z-index: 100;
    margin: -1px;
    color: #337ab7;
    border: solid 1px #4d90fe;
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
 


<%@ include file="/resources/include/header.jsp"%>

<style> 
.breadcrumbs-area { 
 background-image: url('${path}/resources/writer/img/bigpicture/join_img.png');
}

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
						
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Loging Area Start -->
	<div class="login-account section-padding">
		<div class="container"
			style="display: table; width: 700px; text-align: center">
			<div id="infoAgree">
				<form action="${path}/member/writer.do" autocomplete="off"
					class="create-account-form" method="post">
					<h2 class="heading-title">동의페이지</h2>
					<p class="form-row">
						<input type="hidden" name="sns_tmp_id" value=""> <input
							type="hidden" name="redirect" value="/ko/signup"> <input
							type="hidden" name="marketing_email" value="false">
					<div id="signup-agree" class="create-account-form" style="">


						<label> <input class="agree-all" type="checkbox"
							id="allCheck" name="Check"> <i></i> <span>전체동의</span>
						</label>

						<div class="signup-agree-labelwrap">
							<label><input class="agree-tos" type="checkbox"
								name="agree-tos"> <i></i> <span> 이용약관<b> (필수)</b>
							</span> </label> <a href="${path}/resource/agreement/provision.do"
								target="_blank">상세보기</a>
						</div>
						<div class="signup-agree-labelwrap">
							<label><input class="agree-tos" type="checkbox"
								name="agree-pp"><i></i> <span>개인정보 수집 및 이용에 대한 안내<b>(필수)</b>
							</span></label> <a href="${path}/resource/agreement/helprule_private.do"
								target="_blank">상세보기</a>
						</div>
						<label><input class="agree-event" type="checkbox"
							name="agree_market_email"><i></i> <span>이벤트 등 혜택정보
								알림(이메일/SMS) (선택)</span></label>

						<p class="form-row">
							<label> <input class="agree-tos" type="checkbox"
								name="adult"><i></i><span>만 14세 이상입니다.<b>
										(필수)</b>
							</span></label> <br>
						<div class="signup-agree-foot">
							<button class="button form-button" type="button"
								data-action="cancel">취소</button>
							<button class="button form-button" type="button"
								data-action="submit" id="btnAgree">동의</button>
						</div>
						<br>
						<div id="signup-agree-error" class="signup-agree-error">이용약관과
							개인정보 수집 및 이용 모두 동의해주세요.</div>
					</div>

					<div class="form-help">
						,
						<p>
							문제가 있거나 궁금한 점이 있으시면<br>아래 주소로 문의하시기 바랍니다.
						</p>
						<p>
							고객지원&nbsp;:&nbsp;<a class="link" href='mailto:help@lezhin.com'>help@pressfit.com</a>
						</p>

					</div>
				</form>
			</div>
			
			
				<div id="infoShow">
				<form action="${path}/member/insert.do" name="form1"
					class="create-account-form" method="post">

					<h1 class="heading-title">개인정보입력</h1>
						<dl class="list_delivery">
							<!-- <dt><label for="oaName">회원아이디</label><span class="ico_friends ico_star">필수입력</span></dt> -->
							<dd>
								<div class="box_input"><input class="tf_g" id="oaName" name="id" placeholder="회원아이디" type="text" value=""></div>
							</dd>
							<dd>
								<div class="box_input"><input class="tf_g" id="oaEmail" name="pw" placeholder="비밀번호" type="password" value=""></div>
							</dd>
							<dd>
								<div class="box_input"><input class="tf_g" id="oaPhone" name="name" placeholder="이름" type="text"  value=""></div>
							</dd>
							<dd>
								<div id="sexDiv" class="join_row">
									<span class="row_title blind"> </span> <span class="sex"> <span
										class="jender"> <input type="radio" name="sex"
											id="radioman" placeholder="남자" value="0" onclick="checkSex()" />
											<label for="radioman" id="manLb" class="">남자</label>
									</span> <span class="jender"> <input type="radio" name="sex"
											id="radiowoman" placeholder="여자" value="1" onclick="checkSex()" />
											<label id="womanLb" for="radiowoman" class="">여자</label>
									</span>
			
									</span>
								</div>
							</dd>
							<dd>
								<div class="box_input"><input class="tf_g" id="oaPhone" name="birth" placeholder="생년월일" type="text" ></div>
							</dd> 
							<dd>
								<div class="box_input"><input class="tf_g" id="oaPhone" name="email" placeholder="이메일" type="text" ></div>
							</dd>
							<dd>
								<div class="box_input"><input class="tf_g" id="oaPhone" name="hp" placeholder="휴대폰" type="text" ></div>
							</dd> 
							<dd>
								<div class="box_input box_postal">
								<input class="tf_g" id="post" name="post" type="text" readonly=readonly placeholder="우편번호"></div>
								<button type="button" class="btn_postal" onclick="DaumPostcode()">주소검색</button>
							</dd>
							<dd>
								<div class="box_input">
								
								<input class="tf_g" id="basic_addr" name="basic_addr" type="text" readonly=readonly placeholder="주소" ></div>
							</dd>


						<dd>
							<div class="box_input">
								<input class="tf_g" id="detail_addr" name="detail_addr"
									type="text" placeholder="상세주소">
							</div>
						</dd>


						<dd>
							<div class="box_input">
								<input class="tf_g" id="oaName" name="companyname"
									placeholder="회사명" type="text" value="">
							</div>
						</dd>

						<dd>
							<div class="box_input">
								<input class="tf_g" id="oaPhone" name="companytp"
									placeholder="회사 전화번호" type="text">
							</div>
						</dd>

						<dd>
							<div class="box_input">
								<input class="tf_g" id="oaPhone" name="representative"
									placeholder="대표자명" type="text">
							</div>
						</dd>
						<dd>
							<div class="box_input">
								<input class="tf_g" id="oaPhone"
									name="corporateregistrationnumber" placeholder="사업자등록번호"
									type="text">
							</div>

						</dd> 

						<dd>
							<div class="box_input">
								<input class="tf_g" id="oaPhone" name="typeofbusiness"
									placeholder="업태" type="text">
							</div>

						</dd>

						<dd>
							<div class="box_input">
								<input class="tf_g" id="oaPhone" name="itemsofbusiness"
									placeholder="종목" type="text">
							</div>

						</dd>
	</dl>
					

						<input type="submit" value="회원가입" /> 
						
						<input type="reset" value="취소" />

				</form>

			</div>

		</div>
	</div>






<%@ include file="/resources/include/footer.jsp"%>
</body>
</html>