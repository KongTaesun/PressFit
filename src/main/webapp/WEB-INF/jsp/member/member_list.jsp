<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PressFit</title>
<%@ include file="/resources/include/header.jsp"%>
</head>
<style>
	nav ul li{
	display : in
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


	 <!-- Shop Area Start -->
        <div class="shopping-area section-padding">
            <div class="container">
                <div class="row">       
                    <div class="col-md-9 col-sm-9 col-xs-12">
                        <div class="wishlist-right-area table-responsive">
                            <table class="wish-list-table">
                                <thead>
                                
                                    <tr>
                                        <th class="customer_id">아이디</th>
                                        <th class="customer_name">이름</th>
                                        <th class="customer_gender">성별</th>
                                        <th class="customer_birth">생년월일</th>
                                        <th class="customer_email">이메일</th>                                     
                                        <th class="customer_hp">전화번호</th>
                                        <th class="customer_address">주소</th>
                                        <th class="customer_regdate">가입일자</th>
                                        <th class="customer_approve">가입승인</th> 
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="row" items="${list}"> 
                                    <tr>
                                        <td class="customer_id">
                                            <a href="#">
                                                ${row.id}<td><a href="${path}/member/view.do?id=${row.id}"></td>
                                            </a>
                                        </td>
                                        <td class="customer_name">
                                         <a> ${row.name}</a>
                                        </td>
                                        <td class="customer_gender">
                                         <a> ${row.gender}</a>
                                        </td>
                                        
                                         <td class="customer_birth">
                                         <a> ${row.birth}</a>
                                        </td>
                                        
                                         <td class="customer_email">
                                         <a> ${row.email}</a>
                                        </td>
                                        
                                         <td class="customer_hp">
                                         <a> ${row.hp}</a>
                                        </td>
                                        
                                          <%-- <td class="customer_address">
                                         <a> ${row.}</a>
                                        </td> --%>
                                        
                                          <td class="customer_regdate">
                                         <a> ${row.regdate}</a>
                                        </td>
                                          <td class="customer_approve">
                                         <a>  </a>
                                        </td>
                                    </tr>                               
                                  </c:forEach>                                   
                                </tbody>
                            </table>
                        </div>
                        <div class="wishlist-bottom-link">
                            <a class="wishlist-single-link" href="index.html">
                                <i class="fa fa-angle-double-left"></i>
                                Back
                            </a>
                                <a href="#" class="right-shoping-cart">SHARE WISHLIST</a>
                                <a href="#" class="right-shoping-cart">ADD ALL TO CART</a>
                                <a href="#" class="right-shoping-cart">UPDATE WISHLIST</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                
        <!-- Shop Area End -->
		
	</table>
	
	
	
	
	
	
	
	<%@ include file="/resources/include/footer.jsp"%>
	
</body>
</html>

















