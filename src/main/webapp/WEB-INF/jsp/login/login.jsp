<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@ include file="/resources/include/header.jsp" %>
<style>
/*----------------------------------------*/
/*  16.	Login Page CSS
/*----------------------------------------*/
 .breadcrumbs-area{
 background-image:url('${path}/resources/writer/img/bigpicture/main.png');
/*  width: 800px;
 height: 200px;
 margin: 0 auto; */
 }
 .login-account section-padding {
  margin: 0 auto;
}
 .create-account-form1 {
  background-color: ;
  border: 1px solid #cfcfcf;
  min-height: 380px;
  padding: 36px 17px;
}

.heading-title {
  font-size: 18px;
  line-height: 1;
  margin-bottom: 40px;
  padding-bottom: 13px;
  position: relative;
  text-transform: uppercase;
}
.heading-title::after {
  background: #bbbbbb none repeat scroll 0 0;
  bottom: 0;
  content: "";
  height: 1px;
  left: 0;
  position: absolute;
  width: 100%;
}
.create-account-form .form-row > input {
  background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
  border: 1px solid #bbbbbb;
}
.create-account-form .btn-default {
  font-weight: 400;
}
.lost-password.form-group > a {
  text-decoration: underline;
}
.tabWrap {
	width: 450px;
	height: 500px;
}

.tab_Menu {
	margin: 0px;
	padding: 0px;
	list-style: none;
}

.tabMenu {
	list-style: none;
	width: 150px;
	margin: 0px;
	text-align: center;
	padding-top: 10px;
	padding-bottom: 10px;
	float: left;
}

.tabMenu a {
	list-style: none;
	color: #000000;
	font-weight: bold;
	text-decoration: none;
	font-family: 'Poppins', sans-serif;
}

.current {
	background-color: #BDBDBD;
	border: 1px solid gray;
	border-bottom: hidden;
}

.tabPage {
 	width: 450px;
	height: 382px; 
	float: left;
	border: 1px solid gray;
}
</style>


<script>
    $(document).ready(function(){
    	 console.log(document.form1);
        $("#btnLogin").click(function(){
            // 태크.val() : 태그에 입력된 값
            // 태크.val("값") : 태그의 값을 변경 
            var id = $("#id").val();
            var pw = $("#pw").val();
           /*  if(id == ""){
                alert("아이디를 입력하세요.");
                $("#id").focus(); // 입력포커스 이동
                return; // 함수 종료
            }
            if(pw == ""){
                alert("패스워드를 입력하세요.");
                $("#pw").focus();
                return;
            } */
            // 폼 내부의 데이터를 전송할 주소
            alert("ss");
           
            document.form1.action="loginCheck.do"
            // 제출
            document.form1.submit();
        });
    });
    
    	//로그인 탭
        function tabSetting() {
            // 탭 컨텐츠 hide 후 현재 탭메뉴 페이지만 show
            $('.tabPage').hide();
            $($('.current').find('a').attr('href')).show();
     
            // Tab 메뉴 클릭 이벤트 생성
            
            $(".tabMenu").click(function (event) {
                var tagName = event.target.tagName; // 현재 선택된 태그네임
                var selectedLiTag = (tagName.toString() == 'A') ? $(event.target).parent('li') : $(event.target); // A태그일 경우 상위 Li태그 선택, Li태그일 경우 그대로 태그 객체
                var currentLiTag = $('li[class~=current]'); // 현재 current 클래그를 가진 탭
                var isCurrent = false; 
                 
                // 현재 클릭된 탭이 current를 가졌는지 확인
                isCurrent = $(selectedLiTag).hasClass('current');
                 
                // current를 가지지 않았을 경우만 실행
                if (!isCurrent) {
                    $($(currentLiTag).find('a').attr('href')).hide();
                    $(currentLiTag).removeClass('current');
     
                    $(selectedLiTag).addClass('current');
                    $($(selectedLiTag).find('a').attr('href')).show();
                }
     
                return false;
            });
        }
     
        $(function () {
            // 탭 초기화 및 설정
            tabSetting();
        });

</script> 
</head>
<body>
	
        <!-- Breadcrumbs Area Start -->
        <div class="breadcrumbs-area">
			 <div class="container" >
				<div class="row">
					<div class="col-md-12">
					    <div class="breadcrumbs">
					       <h2>LOGIN/REGISTER</h2> 
					       <ul class="breadcrumbs-list">
						        <li>
						            <a title="Return to Home" href="index.html">Home</a>
						        </li>
						        <li>Login</li>
						    </ul>
					    </div>
					</div>
				</div>
			</div>
		</div>
		<!-- Breadcrumbs Area Start --> 
		 
        <!-- Loging Area Start --> 
        <div class="login-account section-padding">
           <div class="container" style="width:450px; height:450px;"> 
                <div class="row" style="width:450px; height:450px;"> 
                    
                    
                    
                    <div class="tabWrap">
                    	<ul class="tab_Menu">
                    		<li class="tabMenu current">
                    			<a href="#usersLogin">회원 로그인</a>
                    		</li>
                    		<li class="tabMenu">
                    			<a href="#sellerLogin">사업자 로그인</a>
                    		</li>
                    	</ul>

					<div class="tab_Content_Wrap">
						<div id="usersLogin" class="tabPage">
							<c:if test="${sessionScope.id != null}">
								<h2>${sessionScope.id}(${sessionScope.id})유저님 환영합니다.</h2>
							</c:if>
							<c:if test="${sessionScope.id == null}">
								<form name="form1" class="create-account-form1" method="post"
									action="${path}/login/loginCheck.do">
									<h2 class="heading-title">회원 로그인</h2>
									<p class="form-row">
										<input type="text" name="id" id="id" placeholder="ID">
									</p>
									<p class="form-row">
										<input type="password" name="pw" id="pw"
											placeholder="Password">
									</p>
									<div class="submit">
										<button name="submitcreate" id="btnLogin" type="submit"
											class="btn-default">

											<span> <i class="fa fa-user left"></i> 로그인
											</span>
										</button>
									</div>
									<br/>
									<p class="lost-password form-group">
										<a href="${path}/login/find.do" rel="nofollow">아이디/비밀번호 찾기
											></a>
									</p>
								</form>
							</c:if>
						</div>


						<div id="sellerLogin" class="tabPage">
							<c:if test="${sessionScope.id != null}">
								<h2>${sessionScope.id}(${sessionScope.id})사업자님환영합니다.</h2>
							</c:if>
							<c:if test="${sessionScope.id == null}">

								<form name="form1" class="create-account-form1" method="post"
									action="${path}/business/businessloginCheck.do">
									<h2 class="heading-title">사업자 로그인</h2>
									<p class="form-row">
										<input type="text" name="id" id="id" placeholder="ID">
									</p>
									<p class="form-row">
										<input type="password" name="pw" id="pw"
											placeholder="Password">
									</p>
									<div class="submit">
										<button name="submitcreate" id="btnLogin" type="submit"
											class="btn-default">

											<span> <i class="fa fa-user left" ></i> 로그인
											</span>
										</button>
									</div>
									<br/>
									<p class="lost-password form-group">
										<a href="${path}/login/find.do" rel="nofollow">아이디/비밀번호 찾기 ></a>
									</p>
								</form>
							</c:if>
						</div>
					</div>


					
<!-- ======================================================================================================== -->
<!-- ======================================================================================================== -->
<!-- ======================================================================================================== -->
<!-- ======================================================================================================== -->
<!-- ======================================================================================================== -->




<%-- 					<c:if test="${sessionScope.id != null}">
                    	<h2>${sessionScope.id}(${sessionScope.id})</h2>
                    </c:if>
                    
                    
                    <c:if test="${sessionScope.id == null}">
                    
                        <form name="form1" class="create-account-form" method="post" action="${path}/login/loginCheck.do"> 
                            <h2 class="heading-title">
                                회원 로그인  
                            </h2> 
                              <p class="form-row"> 
                                <input type="text" name="id" id="id" placeholder="ID">
                            </p>
                            <p class="form-row"> 
                                <input type="password" name="pw" id="pw" placeholder="Password">
                            </p>
                            <p class="lost-password form-group">
                                <a href="${path}/login/find.do" rel="nofollow">아이디/비밀번호 찾기 ></a>
                            </p> 
                            <div class="submit">					
                                <button name="submitcreate" id="btnLogin" type="submit" class="btn-default">

                                    <span>
                                        <i class="fa fa-user left"></i>
                                        로그인
                                    </span>
                                </button>
                            </div>                       
                            
                        </form>
                        </c:if> 
                        
                    </div> 
                     
                    
                    <div class="col-md-6 col-sm-6"> 
                    <c:if test="${sessionScope.id != null}">
                    	<h2>${sessionScope.id}(${sessionScope.id})님 환영합니다.</h2>
                    </c:if>
                    <c:if test="${sessionScope.id == null}"> 
    
                       <form name="form1" class="create-account-form" method="post" action="${path}/business/businessloginCheck.do">
                            <h2 class="heading-title">
                                사업자 로그인
                            </h2>
                            <p class="form-row">
                                <input type="text" name="id" id="id" placeholder="ID">
                            </p>
                            <p class="form-row"> 
                                <input type="password" name="pw" id="pw" placeholder="Password">
                            </p>
                            <p class="lost-password form-group">
                                <a href="${path}/login/find.do" rel="nofollow">아이디/비밀번호 찾기 ></a>
                            </p> 
                            <div class="submit">					
                                <button name="submitcreate" id="btnLogin" type="submit" class="btn-default">

                                    <span >
                                        <i class="fa fa-user left" ></i>
                                        로그인
                                    </span>
                                </button>
                            </div>                           
                       </form>
					</c:if>
--%>
                    </div> 
                </div>               
           </div>   
    </div> 
         
   <!--      <a class="btn btn-block btn-social btn-kakao" onclick="document.kakao.submit();">
        <span class="fa fa-kakao"></span>카카오톡 계정으로 로그인하기</a> 
      
         <form action="/auth/kakao" name="kakao">
         <input type="hidden" name="scope"value=email,user_friends"/></form>-->
         
 <div class="submit" style="text-align: center" >					
                           
                                <button name="submitcreate" id="submitcreate" type="submit" class="btn-default">
                                    <span>
                                    <a href="${path}/member/write.do">
                                        <i class="fa fa-user left"></i>
                                        개인회원가입 
                                    </span></a>
                                </button> 
                                 
                                    <button name="submitcreate" id="submitcreate" type="submit" class="btn-default">
                                    <span>
                                    <a href="${path}/business/write.do">
                                        <i class="fa fa-user left"></i>
                                        사업자회원가입  
                                    </span></a> 
                                </button> 
                            </div>
     <br>
<%@ include file="/resources/include/footer.jsp" %>
    
</body>
</html>

