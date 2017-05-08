<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jstl 시간 출력 태그 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 목록</title>
<%@ include file="/resources/include/header.jsp"%>
<style>

.breadcrumbs-area {
   background-image:
      url('${path}/resources/writer/img/bigpicture/q&a_img.png');
}
.list_board {
    border-bottom: 1px solid #222; 
}
.list_board li:first-child {
    border-top: 0 none;
}
.list_board li {
    border-top: 1px solid #c7c7c7;
}
.list_board .link_board {
    display: block;
    position: relative;
    padding: 31px 123px 57px 11px;
    cursor: pointer;
}
.list_board .txt_info {
    display: block;
    font-size: 0;
}
.list_board .txt_info .txt_cate {
    font-weight: 700;
    font-size: 16px;
    color: #1e1e1e;
}
.list_board .txt_info .txt_date {
    padding-left: 8px;
    font-size: 16px;
    color: #999;
}
.list_board .tit_board {
    display: block;
    padding-top: 48px;
    font-weight: 400; 
    font-size: 20px;
    color: #1e1e1e;
}
.list_board .subject_board {
    display: none;
    padding: 26px 30px 41px;
    font-size: 16px;
    color: #1e1e1e;
    background-color: #f9f9f9;
}
.ico_friends {
    
    background: url('${path}/resources/writer/icon/icon_down.png');
    vertical-align: top;
}
.list_board .ico_arr {
    position: absolute;
    right: 12px;
}
wishlist-table-area1 {
    font-size: 14px;
    line-height: 1.5;
    font-family: 'Apple SD Gothic Neo',AppleSDGothicNeo,'Malgun Gothic','맑은 고딕',sans-serif;
    color: #333;
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
    $(document).ready(function(){
        $("#btnWrite").click(function(){
            // 페이지 주소 변경(이동)
            location.href = "${path}/community/write.do";
        });
        $("#btnWrite").click(function(){
            // 페이지 주소 변경(이동)
            location.href = "${path}/community/list.do?curPage="+page+"&searchOption=${map.searchOption}"+"&keyword=${map.keyword}";
        });
        
    });
    // 원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해 
    function list(page){
        location.href="${path}/community/list.do?curPage="+page+"&searchOption=${map.searchOption}"+"&keyword=${map.keyword}";
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
						<h2>공지사항</h2> 
						<!-- <ul class="breadcrumbs-list">
							<li><a title="Return to Home" href="index.html">Home</a></li>
							<li>NOTICE</li>
						</ul> -->
					</div>
				</div>
			</div>
		</div>
	</div>
	 <!-- About Us Area Start -->
   <div class="about-us-area section-padding">
      <div class="container">
         <div class="about-inner">
            <div class="about-title1">
               <div class="p-details-tab" style="margin-top: 30px;">
               	<ul class="p-details-nav-tab">
               		<li role="presentation" class="active"><a href="#" id="btnone">공지사항</a></li>
               		<li role="presentation"><a href="${path}/faq/list.do" id="btntwo">FAQ</a></li>
               	</ul>
               </div>
               <div class="row"> 
                  <div class="col-md-12">
                     <div class="wishlist-table-area1 table-responsive1">
                     <c:choose>
                        <c:when test="${fn:length(map.list)>0 }">
                           <div class="panel-group" id="accordion" role="tablist"
                              aria-multiselectable="true">
                              <ul class="list_board">
                              <c:forEach var="row" items="${map.list}" varStatus="status">
                              <li>
                                 <div class="panel">
                                 
                                    <div class="panel-heading" role="tab" id="headingOne">
                                       <h4 class="panel-title"> 
                                          <a class="link_board" data-toggle="collapse" data-parent="#accordion"
                                             href="#collapse${status.index}" aria-expanded="true"
                                             aria-controls="collapseOne">
                                             	<span class="txt_info">
                                           
                                             	<span class="txt_cate">
                                             	  ${row.idx}
                                             	 </span> 
                                             	 <span class="txt_sub">
                                             	 ${row.subtitle}
                                             	 </span>
                                             	  
                                             	 <span class="txt_date">
                                             	 <fmt:formatDate pattern="yyyy.mm.dd" value="${row.regdate}"/>
                                             	    
                                             	 </span>
                                             </span>
                                             <strong class="tit_board">
                                             	 ${row.title}
                                             </strong>
                                             <span class="ico_friends ico_arr">
                                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                             </span>
                                          </a>
                                       </h4>
                                    </div>
                                    
                                    <%-- <div id="collapse${status.index}"
                                       class="${status.index eq 0 ? 'panel-collapse collapse in':'panel-collapse collapse ${i}'} "
                                       role="tabpanel" aria-labelledby="headingOne"> --%>
                                   <div id="collapse${status.index}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                                       <div class="subject_board" style="display: block;">
                                          	<%-- 내용 "${row.content}"
                                          --%> <c:out escapeXml="false" value="${fn:replace(row.content,ENTER,'<br>')}" />
                                       </div>
                                    </div>
                                    
                                 </div>
                                 </li>
                              </c:forEach>
                              </ul>
                           </div>
                        </c:when>
                        </c:choose>
                     

                        <div class="searchbar1">
                           <form name="form1" method="post" action="${path}/faq/list.do">
                              <select name="searchOption">
                                 <!-- 검색조건을 검색처리후 결과화면에 보여주기위해  c:out 출력태그 사용, 삼항연산자 -->
                                 <option value="all"
                                    <c:out value="${map.searchOption == 'all'?'selected':''}"/>>제목+이름+제목</option>
                                 <option value="name"
                                    <c:out value="${map.searchOption == 'writer'?'selected':''}"/>>이름</option>
                                 <option value="content"
                                    <c:out value="${map.searchOption == 'content'?'selected':''}"/>>내용</option>
                                 <option value="title"
                                    <c:out value="${map.searchOption == 'title'?'selected':''}"/>>제목</option>
                              </select> 
                              
                              
                              <input name="keyword" value="${map.keyword}"> 
                              
                                <button type="submit" class="btn1">조회</button>
                              <!-- 로그인한 사용자만 글쓰기 버튼을 활성화 -->
                              <c:if test="${sessionScope.id != null}">
                                 <button type="button" id="btnWrite" class="btn1">글쓰기</button></c:if>
                           </form>
                        </div>

                     </div>
                  </div>
               </div>
            </div>
         </div>
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
            </div>   
            </div>
                
               
              
</body>
<%@ include file="/resources/include/footer.jsp"%>
</html>