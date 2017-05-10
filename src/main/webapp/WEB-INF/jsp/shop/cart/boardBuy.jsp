<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.buy_Title {
	text-align: center;
}

.buy_info {
	border-top: 2px solid #5D5D5D;
	margin-top: 40px;
	padding: 40px;
	margin-bottom: 40px;
	font-size: x-large;
	text-align:center;
}
.buy_info > a{
color:#980000;
}
.go_main {
	text-align:center;
}
.btn_main {
    width: 200px;
    height: 50px;
    color: #fff; 
    background-color: #32B5F3;
    font-size: 20px;
    line-height: 21px;
    font-weight: 700;
    text-align: center;
    border:0px;
    margin-right:10px;
}

</style>
</head>

<body>
	<%@ include file="/resources/include/header.jsp"%>
	<div class="shopping-area section-padding"> 
		<div id="kakaoContent" class="cont_order" style="height:500px;">
			<div class="row">
				<div class="buy_Title">
					<H2>결제가 완료되었습니다.</H2>
				</div>
				<div class="buy_info">
					결제된 내용은 <a href="${path}/order/orderList.do">마이페이지</a>에서 확인하실 수 있습니다.
				</div>
			</div>

			<div class="go_main">
				<input type="button" class="btn_main" onclick="go_main()" value="메인으로" />
				<input type="button" class="btn_main" onclick="go_mypage()" value="구매내역 보러가기" />
			</div>
		</div>
	</div>
	<%@ include file="/resources/include/footer.jsp"%>
</body>
<script>
function go_main(){
	location.href="${path}/index.jsp";
}
function go_mypage(){
	location.href="${path}/order/orderList.do"
}

</script>
</html>
