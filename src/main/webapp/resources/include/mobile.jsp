<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<!-- Mobile Menu Start -->
		<div class="mobile-menu-area"> 
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12">
						<div class="mobile-menu">
							<nav id="dropdown">
								<ul>
                                    
                                    <li><a href="${path}/index.jsp">HOME</a></li>
							<li><a href="#">카테고리</a>
								<ul class="sub-menu">
									<li><a href="${path}/tmouse/list.do">마우스</a></li>
									<li><a href="${path}/keyboard/list.do">키보드</a></li>
								</ul> <c:choose>
									<c:when test="${empty sessionScope.id }">
										<li><a href="#">마이페이지</a> 
											<ul class="sub-menu">
												<li><a href="${path}/login/login.do">로그인</a></li>
												<li><a href="about.html">주문내역</a></li>
												<li><a href="about.html">찜</a></li>
												<li><a href="about.html">취소및교환</a></li>
												<li><a href="about.html">1:1문의</a></li>
											</ul></li>
									</c:when>
									<c:otherwise>
										<li><a href="#">마이페이지</a>
											<ul class="sub-menu">
												<li><a href="${path}/login/logout.do">로그아웃</a></li>
												<li><a href="about.html">주문내역</a></li>
												<li><a href="about.html">찜</a></li>
												<li><a href="about.html">취소및교환</a></li>
												<li><a href="about.html">1:1문의</a></li>
											</ul></li>
									</c:otherwise>
								</c:choose>
							<li><a href="${path}/gallery/list.do">갤러리 게시판</a></li>
							<li><a href="#">고객센터</a>
								<ul class="sub-menu">

									<li><a href="${path}/community/list.do">공지사항</a></li>
									<li><a href="${path}/community/list.do">FAQ</a></li>
								</ul>
    
							</nav> 
						</div>
					</div>
				</div>
			</div> 
		</div>		
		<!-- Mobile Menu End -->       
							