<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 작성</title>
<%@ include file="/resources/include/header.jsp" %>
<script src="<c:url value='/resources/include/commons.js' />"></script>
<style>
.breadcrumbs-area {
	background-image:
		url('${path}/resources/writer/img/bigpicture/office_img.png');
}

.lineheight {
  border: solid 3px;
}
</style>
<script>
    $(document).ready(function(){
        /* 게시글 관련 */
        // 1. 게시글 수정
        $("#btnUpdete").click(function(){
        	location.href="${path}/community/update.do?idx=${dto.idx}";
        });
        $("#btnCmt").click(function(){
        	location.href="${path}/community/cmt.do?idx=${dto.idx}";
        });
        // 2. 게시글 삭제
        // 삭제 버튼 클릭 
		$("#btnDelete").click(function(){
		    // 댓글이 존재하는 게시물의 삭제처리 방지
		    var count = "${count}";
		    // 댓글의 수가 0보다 크면 팝업, 함수 종료
		    if(count > 0) {
		    	if(confirm("댓글이 많이 있습니다. 삭제하시겠습니까?")){
		    		document.form1.action = "${path}/community/delete.do?idx=${dto.idx}";
			        document.form1.submit();
		    	}else{return;}
		    }
		    // 댓글의 수가 0이면 삭제처리
		    if(confirm("삭제하시겠습니까?")){
		        document.form1.action = "${path}/community/delete.do?idx=${dto.idx}";
		        document.form1.submit();
		        }
		});

        
        // 3. 게시글 목록으로 이동 - 버튼 클릭시 상세보기화면에 있던 페이지, 검색옵션, 키워드 값을 가지로 목록으로 이동
        $("#btnList").click(function(){
            location.href="${path}/community/list.do?curPage=${curPage}&searchOption=${searchOption}&keyword=${keyword}";
        });
        
     	// 1. 첨부파일 목록 불러오기 함수 호출
        listAttach();
        
        // 4. 게시글 수정버튼 클릭 이벤트 처리
        $("#btnUpdete").click(function(){
        	location.href="${path}/community/update.do?idx=${dto.idx}";
        });
    });
    
   
 	// 첨부파일 목록 ajax요청 처리
    function listAttach(){
        $.ajax({
            type: "post",
            url: "${path}/community/getAttach/${dto.idx}",
            success: function(list){
                $(list).each(function(){ 
                var fileInfo = getFileInfo(this);
                var str = "";
                // 이미지 파일이면 썸네일 이미지 출력
                if(checkImageType(this)){ 
                    str = "<div><a href='"+fileInfo.imgsrc+fileInfo.fileName+"'>";
                    str += "<img src='"+fileInfo.imgsrc+fileInfo.fileName+"' ></a>";
                // 일반파일이면 다운로드링크
                } else { 
                    str = "<div><a href='"+fileInfo.getLink+"'>"+fileInfo.fileName+"</a>";
                }
                // 삭제 버튼
                //str += "<span data-src="+fileInfo.fileName+">[삭제]</span></div>";
                $(".uploadedList").append(str);
                
                });
            }
            
        });
    }

</script>
<style>
    #modifyReply {
        width: 600px;
        height: 130px;
        background-color: gray;
        padding: 10px;
        z-index: 10; 
        visibility: hidden;
    }
</style>
</head>
<body>

<%@ include file="/resources/include/mobile.jsp" %>
 <!-- Breadcrumbs Area Start -->
        <div class="breadcrumbs-area">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
					    <div class="breadcrumbs">
					       <h2>About Us</h2> 
					       <ul class="breadcrumbs-list">
						        <li>
						            <a title="Return to Home" href="index.html">Home</a>
						        </li>
						        <li>About Us</li>
						    </ul>
					    </div>
					</div>
				</div>
			</div> 
		</div> 
		<!-- Breadcrumbs Area Start --> 
        <!-- Single Product Area Start -->
        <div class="single-product-area section-padding">
            <div class="container">
                <div class="row">
                    <div class=""></div>
                    <div class="">
                        <div class="single-product-details">
                            <h2>${dto.title}</h2>
                            <hr class="lineheight"/>
                            ${dto.writer} / 	 
                            <fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd a HH:mm:ss"/> / 조회수 : ${dto.viewcnt} <br/><br/>
                            <p>${dto.content}</p>
		         			<!-- 게시물번호를 hidden으로 처리 -->
		            		<input type="hidden" name="boardno" value="${dto.idx}">
                            <div class="social-share">
                                <label>Share: </label>
                                <ul class="social-share-icon">
                                    <li><a href="#"><i class="flaticon-social"></i></a></li>
                                    <li><a href="#"><i class="flaticon-social-1"></i></a></li>
                                    <li><a href="#"><i class="flaticon-social-2"></i></a></li>
                                </ul> 
                            </div>
                            <button type="button" id="btnList">목록</button>
							</div>
                        </div>
                    </div>
                </div>
                 
            </div>
        <!-- Single Product Area End -->
        </body>
        </html>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
   
<%@ include file="/resources/include/footer.jsp" %>
</body>
</html>
