<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PressFit</title>
<%@ include file="/resources/include/header.jsp"%>
<script>
	// 원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해 
	function list(page) {
		location.href = "${path}/business/keyboardList.do?curPage=" + page
				+ "&searchOption=${map.searchOption}"
				+ "&keyword=${map.keyword}";
	}
	$(document).ready(function() {
		$("#btnWrite1").click(function() {
			// 페이지 주소 변경(이동)
			location.href = "${path}/tmouse/write.do";
		});
		$("#btnWrite2").click(function() {
			// 페이지 주소 변경(이동)
			location.href = "${path}/keyboard/write.do";
		});
	});
</script>
<style>
.breadcrumbs-area {
 background-image: url('${path}/resources/writer/img/bigpicture/keyboard_img.jpg');
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
.info_basket .list_basket {
    overflow: hidden;
    margin-top: 27px;
}
.info_basket .list_basket li {
    position: relative;
    float: left;
    width: 100%;
    padding: 25px 0 30px;
    border-bottom: 1px solid #efefef;
}
.info_basket .list_basket .link_thumb {
    overflow: hidden;
    position: relative;
    float: left;
    width: 120px;
    height: 120px;
    margin: 5px 50px 0 0;
}
.thumb_g {
    display: block;
    width: 100%;
    height: auto;
}
.info_basket .list_basket .desc_basket {
    overflow: hidden;
}
.list_basket .desc_basket .tit_product {
    display: block;
    padding-right: 50px;
    font-size: 20px;
    line-height: 22px;
}
.desc_basket .tit_product .link_product {
    color: #1e1e1e;
}
.list_basket .desc_basket .list_append {
    overflow: hidden;
    width: 335px;
    margin-top: 46px;
    font-size: 16px;
    color: #222;
    line-height: 24px;
}
.list_basket .list_append li {
    padding: 0;
    border-bottom: 0 none;
    text-align: right;
}
.list_basket .list_append .tit_append {
    float: left;
    color: #999;
    font-style: normal;
    font-weight: 400;
}
.productRemove {
    color: #666666;
    font-size: 25px;
    position: absolute;
    right: 0;
    bottom: 30px;
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
</head>
<body>
	<!-- Breadcrumbs Area Start -->
	<div class="breadcrumbs-area">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
				   	<div class="breadcrumbs">
				       <h2>키보드 제품리스트</h2> 
					</div>
				</div>
			</div>
		</div>
	</div> 
	<!-- Breadcrumbs Area End --> 
		
	<!-- Cart Area Start -->
	<div class="shopping-cart-area section-padding">
	    <div class="container">
		    <div class="p-details-tab" style="margin-top: 30px;">
            	<ul class="p-details-nav-tab">
                	<li role="presentation" class=""><a href="${path}/business/mouseList.do?searchOption=id" id="btnone">마우스</a></li>
                	<li role="presentation" class="active"><a href="#" id="btntwo">키보드</a></li>
                </ul>
      		</div>
      		<div class="info_basket">
      			<p class="desc_total">총 <em class="emph_total">${map.count}개</em> 의 상품이 조회되었습니다.</p>
				<ul class="list_basket">
					<c:forEach var="row" items="${map.list}">
						<li class="check_on">
							<a href="${path}/keyboard/view.do?idx=${row.idx}&curPage=${map.boardPager.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}" class="link_thumb">
								<img src="${path}/resources/upload/${row.fullName}" class="thumb_g" alt="">
							</a>
							<div class="desc_basket">
								<strong class="tit_product">
									<a href="${path}/keyboard/view.do?idx=${row.idx}&curPage=${map.boardPager.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}" class="link_product">
										${row.modelname}
									</a>
								</strong>
								<ul class="list_append">
									<li>
										<em class="tit_append">금액 :</em>
										<span class="product_price">${row.price}</span>원
										<input type="hidden" class="inp_price" value="${row.price}">
									</li>
									<li>
										<em class="tit_append">수량 :</em>
										<span class="product_price">${row.amount}</span>개
									</li>
								</ul>
							</div>
							<a href="${path}/business/mouseDelete.do?idx=${row.idx}" class="productRemove">
                            	<i class="flaticon-delete"></i>
                            </a>
						</li>
					</c:forEach>
				</ul>
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
				<div class="paging_friends">
	      			<button id="btnWrite2" style="float:right;">키보드 추가</button>
	      			<button id="btnWrite1" style="float:right; margin-right:10px">마우스 추가</button>
	      		</div>
			</div>
		</div>
	</div>
	<!-- Cart Area End -->
       
    <!-- Footer Area Start -->
	<%@ include file="/resources/include/footer.jsp"%>
	<!-- Footer Area End -->
</body>
</html>