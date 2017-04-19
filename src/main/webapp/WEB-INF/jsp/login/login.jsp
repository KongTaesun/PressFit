<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@ include file="/resources/include/header.jsp" %>

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
</script> 
</head>
<body>
	
        <!-- Breadcrumbs Area Start -->
        <div class="breadcrumbs-area">
			<div class="container">
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
           <div class="container"> 
                <div class="row"> 
                    <div class="col-md-6 col-sm-6">
                      <c:if test="${sessionScope.id != null}">
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

                    </div> 
                </div>               
           </div>   
    </div>
         
        <a class="btn btn-block btn-social btn-kakao" onclick="document.kakao.submit();">
        <span class="fa fa-kakao"></span>카카오톡 계정으로 로그인하기</a>
      
         <form action="/auth/kakao" name="kakao">
         <input type="hidden" name="scope"value=email,user_friends"/></form>
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

