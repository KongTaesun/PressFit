<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PressFit</title>
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
 .section-padding{
 padding: 70px 0 0 0;
 }
 .login-account section-padding {
  margin: 0 auto;
}
 .create-account-form1 {
  background-color: #f9f9f9;
  /* border: 1px solid #cfcfcf; */
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
  font-weight: 700;
}
.lost-password.form-group > a {
  text-decoration: underline;
}
.tabWrap {
	width: 700px;
	height: 430px;
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
  color: #444444;
    display: block;
    position: relative;
}

.current {
	background-color: #f9f9f9; 
/* 	border: 1px solid gray; */
	border-bottom: hidden;
}

.tabPage {
 	width: 700px;
	height: 382px; 
	float: left; 
/* 	border: 1px solid gray; */
}
button {
    font-family: Arial, Helvetica, sans-serif;
    font-size: 14px;
    color: #616161;
    padding: 9px 20px;
    background: -moz-linear-gradient(top, #ffffff 0%, #ffffff);
    background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#ffffff));
    -moz-border-radius: 0px;
    -webkit-border-radius: 0px;
    border-radius: 0px;
    border: 1px solid #dbe2ff;
    box-shadow: 0px 1px 3px rgba(000,000,000,0.3), inset 0px 0px 2px rgba(255,255,255,0);
}
button.hover {
    font-weight: bold;
    color: #000000;
    border: 1px solid #879fff;
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

</style>


<script>
    $(document).ready(function(){
    	 console.log(document.form1);
        $("#btnLogin").click(function(){
   
            var id = $("#id").val();
            var pw = $("#pw").val();
      
         
            document.form1.action="loginCheck.do"
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
					       <h2>로그인</h2> 
					       <!--<ul class="breadcrumbs-list">
						         <li>
						            <a title="Return to Home" href="index.html">Home</a>
						        </li> 
						        <li>Login</li> 
						    </ul> -->
					    </div>
					</div>
				</div> 
			</div>
		</div>
		<!-- Breadcrumbs Area Start --> 
		 
		 
		 
        <!-- Loging Area Start --> 
        <div class="login-account section-padding">
        	<div class="container" style="display:table ;width: 700px;text-align: center">
          <div class ="create-account-form" style="border:0px;">
                <div class="row">
                    
            
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
											class="btn1">
 
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
											class="btn1">

											<span> <i class="fa fa-user left1" ></i> 로그인
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
    
    <!--  <div style="background-color:#15a181; width: 100%; height: 50px;text-align: center; color: white; "><h3>SIST Login</h3></div>
<br>
    
    <div id="naver_id_login" style="text-align:center"><a href="${url}"><img width="223" src="${pageContext.request.contextPath}/resources/img/naver_Bn_Green.PNG"/></a></div>
<br>
    
         
       <a class="btn btn-block btn-social btn-kakao" onclick="document.kakao.submit();">
        <span class="fa fa-kakao"></span>카카오톡 계정으로 로그인하기</a> 
      
         <form action="/auth/kakao" name="kakao">
         <input type="hidden" name="scope"value=email,user_friends"/></form>-->
         <br>
 <div class="submit" style="text-align: center; margin-bottom: 50px;" >					
                           
                                <button name="submitcreate" id="submitcreate" type="submit" class="btn1">
                                    <span>
                                    <a href="${path}/member/write.do">
                                        <i class="fa fa-user left"></i>
                                        	개인회원가입 
                                    </a></span>
                                </button> 
                                 
                                    <button name="submitcreate" id="submitcreate" type="submit" class="btn1">
                                    <span>
                                    <a href="${path}/business/write.do">
                                        <i class="fa fa-user left"></i>
                                        사업자회원가입  
                                    </span></a> 
                                </button> 
                            </div>
     <br/>
     <br/>
<%@ include file="/resources/include/footer.jsp" %>
    
</body>
</html>

