<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 목록</title>
<%@ include file="/resources/include/header.jsp"%>

<style>
.breadcrumbs-area {
 background-image: url('${path}/resources/writer/img/bigpicture/gallery_img.png');
}
.info_basket {
    position: relative;
    width: 100%;
    margin: 30px auto 0;
}
.desc_total {
    padding: 0 0 7px;
    font-size: 18px;
    color: #666;
}
.desc_total .emph_total {
    font-weight: 700;
    color: #222; 
    font-style: normal;
}
.paging_friends {
    width: 100%;
    padding-top: 30px;
    text-align: center;
}
.paging_friends .inner_paging {
    display: inline-block;
    margin-left: -5px;
    vertical-align: top;
}
.screen_out {
    position: absolute;
    width: 0;
    height: 0;
}
.paging_friends em.link_page {
    border-color: #d2d2d2;
    font-weight: 700;
    color: #1e1e1e;
}
.paging_friends .link_page {
    display: inline;
    float: left;
    min-width: 30px;
    height: 30px;
    margin-left: 5px;
    border: 1px solid #efefef;
    line-height: 30px;
    color: #666;
    text-align: center;
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
</style>

<script>
	$(document).ready(function() {
		$("#btnWrite").click(function() {
			// 페이지 주소 변경(이동)
			location.href = "${path}/gallery/write.do";
		});
	});
	// 원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해 
	function list(page) {
		location.href = "${path}/gallery/list.do?curPage=" + page
						+ "&searchOption=${map.searchOption}"
						+ "&keyword=${map.keyword}";
	}
	function imgError(image) {
	    image.onerror = "";
	    image.src = "${path}/resources/writer/icon/keyboard.png";
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
						<h2>GALLERY</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumbs Area End -->

	<!-- Gallery-list Area Start -->
	<div class="shopping-area section-padding">
		<div class="container">
			<div class="p-details-tab" style="margin-top: 30px;">
            	<ul class="p-details-nav-tab">
                	<li role="presentation" class="active"><a href="#" id="btnone">후기게시판</a></li>
                </ul>
      		</div>
      		<div class="info_basket">
      			<p class="desc_total">총 <em class="emph_total">${map.count}개</em> 의 게시물이 있습니다.</p>
      		</div>
      		
      		<!-- List Area Start -->
         	<div class="row" >
         		 <div class="col-md-9 col-sm-9 col-xs-12" style="width:100%">
					<div class="shop-tab-area">
						<div class="tab-content">
							<div class="row tab-pane fade in active" id="home">
								<div class="shop-single-product-area">
									<c:forEach var="row" items="${map.list}">
										<div class="col-md-4 col-sm-6">
											<div class="single-banner" style="width:100%;">
                                    			<div class="product-wrapper"  style="width: 100%; height: 260px;">
                                    				<a href="${path}/gallery/view.do?idx=${row.idx}&curPage=${map.boardPager.curPage}&searchOption=${map.searchOption}&keyword=${map.gallery}"
                                          				class="single-banner-image-wrapper">
                                          				<img alt="" src="${path}/resources/upload/${row.fullName}" style="width: 100%; height: 260px;" onerror="imgError(this);">
                                          			</a>
                                    			</div>
                                    			<div class="banner-bottom text-center" style="width:100%;height:100px;"> 
                                    				<div class="banner-bottom-title">
                                    				<div>${row.subtitle}</div>
                                    			 
                                    					<a href="${path}/gallery/view.do?idx=${row.idx}&curPage=${map.boardPager.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}">
                                    						${row.title}
                                    						<c:if test="${row.recnt >= 0}">
																<span style="color: red;">(${row.recnt})</span>
															</c:if>
														</a>
                                    				</div>
                                    				
                                    				<div style="margin-top:5px;">${row.writer}</div>
                                    				<div><fmt:formatDate pattern="yyyy.MM.dd" value="${row.regdate}"/>
                                       				</div>
                                    			</div>
                                    		</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
         		 </div>
         	</div>
         	<!-- List Area End -->
      		
      		<!-- 페이징 시작  -->
      		<div class="paging_friends">
				<span class="inner_paging">
					<!-- 처음페이지로 이동 : 현재 페이지가 1보다 크면  [처음]하이퍼링크를 화면에 출력--> 
					<c:if test="${map.boardPager.curBlock > 1}">
						<a href="javascript:list('1')" class="link_page">[처음]</a>
					</c:if> 
					<!-- 이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 --> 
					<c:if test="${map.boardPager.curBlock > 1}">
						<a href="javascript:list('${map.boardPager.prevPage}')" class="link_page">[이전]</a>
					</c:if> <!-- **하나의 블럭 시작페이지부터 끝페이지까지 반복문 실행 --> 
					<c:forEach var="num" begin="${map.boardPager.blockBegin}" end="${map.boardPager.blockEnd}">
						<!-- 현재페이지이면 하이퍼링크 제거 -->
						<c:choose>
							<c:when test="${num == map.boardPager.curPage}">
								<span class="screen_out"></span><em class="link_page">${num}</em>
						    </c:when>
							<c:otherwise>
								<a href="javascript:list('${num}')" class="link_page">${num}</a>
						    </c:otherwise>
						</c:choose>
					</c:forEach>
					<!-- 다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
					<c:if test="${map.boardPager.curBlock <= map.boardPager.totBlock}">
						<a href="javascript:list('${map.boardPager.nextPage}')" class="link_page">[다음]</a>
					</c:if> <!-- 끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 --> 
					<c:if test="${map.boardPager.curPage <= map.boardPager.totPage}">
						<a href="javascript:list('${map.boardPager.totPage}')" class="link_page">[끝]</a>
					</c:if>
				</span>
			</div>
      		<!-- 페이징 끝  --> 
      		
      		<!-- 글작성 버튼 시작-->
      		<div class="paging_friends">
      			<button id="btnWrite" style="float:right;">글작성</button>
      		</div>
      		<!-- 글작성 버튼 끝 -->
		</div>
	</div>
	<!-- Gallery-list Area End -->
   
	<!-- Footer Start -->
	<%@ include file="/resources/include/footer.jsp"%>
	<!-- Footer End -->
</body>
</html>