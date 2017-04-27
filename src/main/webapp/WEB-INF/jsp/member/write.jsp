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

<script>


	$(document).ready(function() {
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
	});

	function callback(data) {
		$('#searchResult').text(data);
	}
</script> 

<%@ include file="/resources/include/header.jsp"%>

</head>
<style> 
.breadcrumbs-area { 
 background-image: url('${path}/resources/writer/img/bigpicture/join_img.png');
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


	<!-- Loging Area Start -->
	<div class="login-account section-padding">
		<div class="container" style="display:table ;width: 700px;text-align: center">

			<div>

				<div>

					<form action="${path}/member/writer.do" autocomplete="off" class="create-account-form" method="post">
						<h2 class="heading-title">동의페이지</h2>
						<p class="form-row">
							<input type="hidden" name="sns_tmp_id" value=""> <input type="hidden" name="redirect" value="/ko/signup"> 
							<input type="hidden" name="marketing_email" value="false">
						<div id="signup-agree" class="create-account-form">
						
						
							<label> <input class="agree-all" type="checkbox"  id="allCheck"   name="Check"> <i></i> <span>전체동의</span> <!-- 볼드처리 -->
							</label>
 
							<div class="signup-agree-labelwrap">
								<label><input class="agree-tos" type="checkbox" name="agree-tos"> <i></i> <span> 이용약관<b>
											(필수)</b>
								</span>
								
								</label> <a href="${path}/resource/agreement/provision.do" target="_blank">상세보기</a>
							</div>
							<div class="signup-agree-labelwrap">
								<label><input class="agree-pp" type="checkbox" name="agree-pp"><i></i>
								
								<span>개인정보 수집 및 이용에 대한 안내<b>(필수)</b> 
								</span></label> <a href="${path}/agreement/helprule_private.do" target="_blank">상세보기</a>
							</div>
							<label><input class="agree-event" type="checkbox" name="agree_market_email"><i></i>
							
							<span>이벤트 등 혜택정보 알림(이메일/SMS) (선택)</span></label>
						
						<p class="form-row">
					<label> <input class="agree-adult" type="checkbox"
								name="adult"><i></i><span>만 14세 이상입니다.<b>
										(필수)</b>
							</span></label>
								
												<div class="signup-agree-foot">
								<button class="button form-button" type="button"
									data-action="cancel">취소</button>
								<button class="button form-button" type="submit"
									data-action="submit" disabled="disabled">동의</button>
							</div>
						
							<div id="signup-agree-error" class="signup-agree-error">이용약관과
								개인정보 수집 및 이용 모두 동의해주세요.</div>
						</div>
						
						
			
					<div class="login-info">
						<div class="form-help">
							<p>
								문제가 있거나 궁금한 점이 있으시면<br>아래 주소로 문의하시기 바랍니다.
							</p>
							<p>
								고객지원&nbsp;:&nbsp;<a class="link" href='mailto:help@lezhin.com'>help@pressfit.com</a>
							</p>
							
				</div>
				</div>
				</form> 
				</div>
		
			<div>
				<form action="${path}/member/insert.do" name="form1" class="create-account-form" method="post">

					<h1 class="heading-title">개인정보입력</h1>

					<p class="form-row">
						회원아이디 <input type="text" name="id" placeholder="회원아이디">
						<!-- <input type ="button" id="btn1" value="중복확인" /> <div ID="searchResult"></div> -->
					</p>
					<p class="form-row">
						비밀번호 <input type="password" name="pw" placeholder="비밀번호">
					</p>
					<!-- <p class="form-row">
														<input type="password" placeholder="비밀번호확인" />
													</p> -->
					<p class="form-row">
						이름 <input type="text" name="name" placeholder="이름" />
					</p>

					<p>
						성별 <br/> 
						<input type="radio" name="gender" placeholder="남자" value="0" />남자
						 <input type="radio" name="gender" placeholder="여자" value="1" />여자
					</p> 

					<p class="form-row">
						생년월일 <input type="text" name="birth" placeholder="생년월일" />
					</p>

					<p class="form-row">

						<input type="text" name="email" placeholder="이메일">
					</p>
					<p class="form-row">
						<input type="text" name="hp" placeholder="휴대폰">
					</p>

					<p class="form-row">
						<input type="text" name="address" placeholder="주소" />
					</p>
					
				<input type="submit" value="회원가입" />
				<input type="reset" value="취소" />
				</form>
			</div>
			
			</div>
		</div>
	</div>

 
<%@ include file="/resources/include/footer.jsp"%>
</body>
</html>