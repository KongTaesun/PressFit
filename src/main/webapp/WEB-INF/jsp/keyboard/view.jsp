<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글</title>
<%@ include file="/resources/include/header.jsp" %>
<style>
.table-data-sheet1 {
  background: #f3f3f3 none repeat scroll 0 0;
  border: 1px solid #d6d4d4;
  width: 100%;
}
.table-data-sheet1 tr {
  border-top: 1px solid #d6d4d4;
  border-bottom: 1px solid #d6d4d4;
}
.table-data-sheet1 tr th {
  background: #E3FFDB none repeat scroll 0 0;
  border : 1px solid #d6d4d4;
  padding: 10px 20px 11px;
  color: #FF0000;
}
.table-data-sheet1 tr td{
  border-right: 1px solid #d6d4d4;
  color: #333333;
  font-weight: 400;
  width: 20%;
  padding: 10px 20px 11px;
}
.table-data-sheet1 tr td:first-child{
  font-weight: 900;
}
.table-data-sheet1 tr td:nth-child(3){
  font-weight: 900;
}


</style>
<script src="<c:url value='/resources/include/commons.js' />"></script>
<script>
    $(document).ready(function(){
        $("#btnCmt").click(function(){
        	location.href="${path}/keyboard/cmt.do?idx=${dto.idx}";
        });
        // 2. 게시글 삭제
        // 삭제 버튼 클릭 
		$("#btnDelete").click(function(){
		    // 댓글이 존재하는 게시물의 삭제처리 방지
		    var count = "${count}";
		    // 댓글의 수가 0보다 크면 팝업, 함수 종료
		    if(count > 0) {
		    	if(confirm("댓글이 많이 있습니다. 삭제하시겠습니까?")){
		    		document.form1.action = "${path}/keyboard/delete.do?idx=${dto.idx}";
			        document.form1.submit();
		    	}else{return;}
		    }
		    // 댓글의 수가 0이면 삭제처리
		    if(confirm("삭제하시겠습니까?")){
		        location.href = "${path}/keyboard/delete.do?idx=${dto.idx}";
		        }
		    else{
		    }
		});

        
        // 3. 게시글 목록으로 이동 - 버튼 클릭시 상세보기화면에 있던 페이지, 검색옵션, 키워드 값을 가지로 목록으로 이동
        $("#btnList").click(function(){
            location.href="${path}/keyboard/list.do?curPage=${curPage}&searchOption=${searchOption}&keyword=${keyword}";
        });
        
        /* 댓글 관련 */
        // 1. 댓글 입력
        $("#btnReply").click(function(){
            replyJson(); // json 형식으로 입력
        });
        
        // 2. 댓글 목록
        listReply("1"); // rest방식
        
     	// 1. 첨부파일 목록 불러오기 함수 호출
        listAttach();
        
        // 4. 게시글 수정버튼 클릭 이벤트 처리
        $("#btnUpdete").click(function(){
        	location.href="${path}/keyboard/update.do?idx=${dto.idx}";
        });
    	 
    	$("#inCart").click(function() {
    		addCart();
    	});
    });
    	function addCart(){
    		var amount=$("#amount").val();
    		if(amount < 1){
        		alert("수량을 체크해주세요!");
        	} else{
        		$.ajax({
                    type: "get",
                    url: "${path}/shop/cart/insert.do?price=${dto.price}&amount="+ amount +"&modelname=${dto.modelname}&manufacturecompany=${dto.manufacturecompany}&idx=${dto.idx}&fullName=${dto.fullName}&kind=keyboard&crea_id=${dto.crea_id}",
                    success: function(){
                    	var result = confirm("장바구니에 추가되었습니다. 바로 확인하시겠습니까?");
                		if(result){
                			location.href="${path}/shop/cart/cartList.do";
                		} else{
                		}
                    },
                    error: function(){
                    	alert("실패");
                    }
                });
        	}
        }    
    	
    	
 	// 첨부파일 목록 ajax요청 처리
    function listAttach(){
        $.ajax({
            type: "post",
            url: "${path}/keyboard/getAttach/${dto.idx}",
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
    // 1_2. 댓글 입력 함수(json방식)
    function replyJson(){
        var replytext=$("#replytext").val();
        var idx="${dto.idx}"
        // 비밀댓글 체크여부
        var secretReply = "n";
        // 태그.is(":속성") 체크여부 true/false
        if( $("#secretReply").is(":checked") ){
            secretReply = "y";
        }
        $.ajax({                
            type: "post",
            url: "${path}/keyboard/reply/insertRest.do",
            headers: {
                "Content-Type" : "application/json"
            },
            dateType: "text",
            // param형식보다 간편
            data: JSON.stringify({
            	boardno : idx,
                replytext : replytext,
                secretReply : secretReply
            }),
            success: function(){
                alert("댓글이 등록되었습니다.");
                // 댓글 입력 완료후 댓글 목록 불러오기 함수 호출
                //listReply("1");     // 전통적인 Controller방식
                //listReply2();     // json리턴 방식
                listReply("1"); // Rest 방식
            }
        });
    }
    // 2_2. 댓글 목록 - 날짜 형식 변환 함수 작성
    function changeDate(date){
        date = new Date(parseInt(date));
        year = date.getFullYear();
        month = date.getMonth();
        day = date.getDate();
        hour = date.getHours();
        minute = date.getMinutes();
        second = date.getSeconds();
        strDate = year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;
        return strDate;
    }
    
    // 2_3. 댓글 목록 - Rest방식
    function listReply(num){
        $.ajax({
            type: "get",
            url: "${path}/keyboard/reply/list/${dto.idx}/"+num,
            success: function(result){
            	console.log(result);
            // responseText가 result에 저장됨.
                $("#listReply").html(result);
            }
        });
    }    
    
    // **댓글 수정화면 생성 함수
    function showReplyModify(num){
        $.ajax({
            type: "get",
            url: "${path}/keyboard/reply/detail/"+num,
            success: function(result){
                $("#modifyReply").html(result);
                // 태그.css("속성", "값")
                $("#modifyReply").css("visibility", "visible");
            }
        })
    }
    // **댓글 답글화면 생성 함수
    function showReplyCmtModify(num){
        $.ajax({
            type: "get",
            url: "${path}/keyboard/reply/Cmtdetail/"+num,
            success: function(result){
                $("#modifyReply").html(result);
                $("#modifyReply").css("visibility", "visible");
            }
        })
    }
</script>
	<!-- 업로드된 파일 목록 -->
	<!-- <div class="uploadedList" id="uploadedList"></div> -->
 <!-- Breadcrumbs Area Start -->
        <div class="breadcrumbs-area"><form>
			<div class="container">
				<div class="row">
					<div class="col-md-12">
					    <div class="breadcrumbs">
					       <h2>PRODUCT DETAILS</h2> 
					       <ul class="breadcrumbs-list">
						        <li>
						            <a title="Return to Home" href="index.html">Home</a>
						        </li>
						        <li>Product Details</li>
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
                    <div class="col-md-6 col-sm-7">
                        <div class="single-product-image-inner">
                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane active" id="one">
                                    <a class="venobox" href="${path}/resources/upload${dto.fullName}" data-gall="gallery" title="">
                                        <img src="${path}/resources/upload/${dto.fullName}"
                                        style="width:570 ;height:550 "
                                         alt="">
                                    </a>
                                </div>
                                <div role="tabpanel" class="tab-pane" id="two">
                                    <a class="venobox" href="${path}/resources/upload${dto.fullName}" data-gall="gallery" title="">
                                        <img src="${path}/resources/upload${dto.fullName}"
                                        style="width:570 ;height:550 
                                         alt="">
                                    </a>
                                </div>
                                <div role="tabpanel" class="tab-pane" id="three">
                                    <a class="venobox" href="${path}/resources/upload${dto.fullName}" data-gall="gallery" title="">
                                        <img src="${path}/resources/upload${dto.fullName}"
                                        style="width:570 ;height:550 
                                         alt="">
                                    </a>
                                </div>
                            </div>
                            <!-- Nav tabs -->
                            <ul class="product-tabs" role="tablist">
                                <li role="presentation" class="active">
                                <a href="#one" aria-controls="one" role="tab" data-toggle="tab">
                                <img src="img/single-product/1.jpg" alt=""></a></li>
                                <li role="presentation">
                                <a href="#two" aria-controls="two" role="tab" data-toggle="tab">
                                <img src="img/single-product/2.jpg" alt="">
                                </a></li>
                                <li role="presentation">
                                <a href="#three" aria-controls="three" role="tab" data-toggle="tab">
                                <img src="img/single-product/3.jpg" alt="">
                                </a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-5">
                        <div class="single-product-details">
                            <div class="list-pro-rating">
                                <i class="fa fa-star icolor"></i>
                                <i class="fa fa-star icolor"></i>
                                <i class="fa fa-star icolor"></i>
                                <i class="fa fa-star icolor"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <h2>${dto.modelname}</h2>
                            
                            <div class="availability"> 
                                <span>마우스</span>
                            </div>
                            <p> 제조사 : ${manufacturecompany} </p>
                            <div class="single-product-price">
                                <h2>${dto.price}$</h2>
                                <input type="hidden" name="price" value="${dto.price}" />
                            </div>
                            
                            <div class="product-attributes clearfix">
                                <p><span class="pull-left" id="quantity-wanted-p">
									<!-- <span class="dec qtybutton">-</span> -->
									수량 : <input type="number" style="width: 40px" id="amount" name="amount" value="0" min="0" class="cart-plus-minus-box" >
									<!-- <span class="inc qtybutton">+</span> -->	
								</span></p> 
                               <span>
                                    <button type="button" class="cart-btn btn-default" id="inCart">Add to cart</button>
                               </span>
                            </div>
                            
                            <div class="add-to-wishlist">
                                <a class="wish-btn" href="cart.html">
                                    <i class="fa fa-heart-o"></i>
                                    ADD TO WISHLIST
                                </a>
                            </div>
                            <div>
                            	<!-- 게시물번호를 hidden으로 처리 -->
						        <input type="hidden" name="boardno" value="${dto.idx}">

						        <!-- 본인이 쓴 게시물만 수정, 삭제가 가능하도록 처리 -->
						        <c:if test="${sessionScope.id == dto.crea_id}">
						            <button type="button" id="btnUpdete">수정</button>
						            <button type="button" id="btnDelete">삭제</button>
						        </c:if>
						        <!-- 상세보기 화면에서 게시글 목록화면으로 이동 -->
						        <button type="button" id="btnList">목록</button>
                            </div>
                            <div class="single-product-categories">
                               <label>Categories:</label>
                                <span>e-book, biological, business</span>
                            </div>
                            <div class="social-share">
                                <label>Share: </label>
                                <ul class="social-share-icon">
                                    <li><a href="#"><i class="flaticon-social"></i></a></li>
                                    <li><a href="#"><i class="flaticon-social-1"></i></a></li>
                                    <li><a href="#"><i class="flaticon-social-2"></i></a></li>
                                </ul> 
                            </div>
                            <div id="product-comments-block-extra">
								<ul class="comments-advices">
									<li>
										<a href="#" class="open-comment-form">Write a review</a>
									</li>
								</ul>
							</div>
                        </div>
                    </div>
                </div>
                <div class="row">
					<div class="col-md-9">
                        <div class="p-details-tab-content">
                            <div class="p-details-tab">
                                <ul class="p-details-nav-tab" role="tablist">
                                    <li role="presentation" class="active"><a href="#more-info" aria-controls="more-info" role="tab" data-toggle="tab">판매자제공</a></li>
                                    <li role="presentation"><a href="#data" aria-controls="data" role="tab" data-toggle="tab">스펙</a></li>
                                    <li role="presentation"><a href="#reviews" aria-controls="reviews" role="tab" data-toggle="tab">댓글</a></li>
                                </ul>
                            </div>
                            <div class="clearfix"></div>
                            <div class="tab-content review">
                                <div role="tabpanel" class="tab-pane active" id="more-info">
                                    <p>${dto.content}</p>
                                </div>
                                <div role="tabpanel" class="tab-pane" id="data">
                                    <table class="table-data-sheet1">
                                        <tbody>
                                            <tr class="odd">
                                                <td>제조사</td>
                                                <td>${dto.manufacturecompany}</td>
                                                <td>등록년월</td>
                                                <td>${dto.registrationyear}</td>
                                            </tr>
                                             <tr class="odd">
                                                <td>연결방식</td>
                                                <td>${dto.connectionmethod }</td>
                                                <td>블루투스 버전</td>
                                                <td>${dto.bluetoothversion }</td>
                                            </tr>
                                             <tr class="odd">
                                                <td>배터리</td>
                                                <td>${dto.battery }</td>
                                                <td>키 배열</td>
                                                <td>${dto.keyarray }</td>
                                            </tr>
                                             <tr class="odd">
                                                <td>인터페이스</td>
                                                <td>${dto.interface1 }</td>
                                                <td>접점 방식</td>
                                                <td>${dto.contactsystem }</td>
                                            </tr>
                                            <tr class="odd">
                                                <td>스위치</td>
                                                <td>${dto.keyswitch }</td>
                                                <td>키보드 형태</td>
                                                <td>${dto.keyboardform }</td>
                                            </tr>
                                            <tr>
                                            	<th colspan="4">기능</th>
                                            </tr>
                                             <tr class="odd">
                                                <td>기능 키</td>
                                                <td>${dto.functionkey }</td>
                                                <td>매크로 기능</td>
                                                <td>${dto.macrofunction }</td>
                                            </tr>
                                             <tr class="odd">
                                                <td>동시입력</td>
                                                <td>${dto.simultaneousinput }</td>
                                                <td>응답속도</td>
                                                <td>${dto.responsevelocity }</td>
                                            </tr>
                                            <tr>
                                            	<th colspan="4">키 잠금</th>
                                            </tr>
                                             <tr class="odd">
                                                <td>윈도우 키 잠금</td>
                                                <td>${dto.windowskeylocking }</td>
                                                <td>전체 키 잠금</td>
                                                <td>${dto.fullkeylock }</td>
                                             </tr>
                                             <tr>
                                            	<th colspan="4">외형</th>
                                            </tr>
                                             <tr>
                                                <td>스텝스컬쳐2</td>
                                                <td>${dto.stepsculture2 }</td>
                                                <td>비키스타일</td>
                                                <td>${dto.vikistyle }</td>
                                             </tr>
                                             <tr>
                                                <td>금속 하우징</td>
                                                <td>${dto.metalhousing }</td>
                                                <td>외국어 전용</td>
                                                <td>${dto.foreignlanguageonly }</td>
                                             </tr>
                                             <tr>
                                                <td>키캡 재질</td>
                                                <td>${dto.keycapmaterial }</td>
                                                <td>키캡 각인방식</td>
                                                <td>${dto.keycapburningmethod }</td>
                                             </tr>
                                             <tr class="odd">
                                                <td>LED 백라이트</td>
                                                <td>${dto.ledbacklight}</td>
                                            </tr>
                                            <tr>
                                            	<th colspan="4">케이블</th>
                                            </tr>
                                             <tr class="odd">
                                                <td>직조(패브릭) 케이블</td>
                                                <td>${dto.fabriccable }</td>
                                                <td>착탈식 케이블</td>
                                                <td>${dto.removablecable}</td>
                                             </tr>
                                            <tr>
                                            	<th colspan="4">부가 기능</th>
                                            </tr>
                                            <tr>
                                                <td>멀티페어링</td>
                                                <td>${dto.multipairing}</td>
                                                <td>USB허브 내장</td>
                                                <td>${dto.builtinusbhub }</td>
                                            </tr>
                                            <tr>
                                                <td>체리식 스테빌라이저</td>
                                                <td>${dto.cherrystylestabilizer}</td>
                                                <td>생활방수</td>
                                                <td>${dto.lifewaterproofing }</td>
                                            </tr>
                                            <tr>
                                                <td>터치패드</td>
                                                <td>${dto.touchpad}</td>
                                                <td>트랙볼</td>
                                                <td>${dto.trackball }</td>
                                            </tr>
                                            <tr>
                                                <td>모션센서</td>
                                                <td>${dto.motionsensor}</td>
                                                <td>스마트키보드</td>
                                                <td>${dto.smartkeyboard }</td>
                                            </tr>
                                            <tr>
                                                <td>방향키 전환</td>
                                                <td>${dto.switchrudder}</td>
                                            </tr>
                                            <tr>
                                            	<th colspan="4">추가 구성</th>
                                            </tr>
                                            <tr>
                                                <td>실리콘 키스킨</td>
                                                <td>${dto.siliconkeyskin}</td>
                                                <td>플라스틱 덮개</td>
                                                <td>${dto.plasticcover }</td>
                                            </tr>
                                            <tr>
                                                <td>키캡 리무버</td>
                                                <td>${dto.keycapremover}</td>
                                                <td>청소용 브러쉬</td>
                                                <td>${dto.cleaningbrush }</td>
                                            </tr>
                                            <tr>
                                                <td>교체용 키캡</td>
                                                <td>${dto.replacementkeycaps}</td>
                                            </tr>
                                            <tr>
                                            	<th colspan="4">크기(가로x세로x높이)</th>
                                            </tr>
                                            <tr>
                                                <td>가로</td>
                                                <td>${dto.width}</td>
                                                <td>세로</td>
                                                <td>${dto.length }</td>
                                            </tr>
                                            <tr>
                                            	<td>높이</td>
                                                <td>${dto.height}</td>
                                                <td>무게</td>
                                                <td>${dto.weight}</td>
                                            </tr>
                                            <tr>
                                            	<td>케이블 길이</td>
                                                <td>${dto.cablelength}</td>
                                            </tr>
                                        </tbody>
                                   </table>
                                </div>
                                <div role="tabpanel" class="tab-pane" id="reviews">
                                    <div id="product-comments-block-tab">
                                            <div style="width:650px; text-align: center;">
									        <br>
									        <!-- 로그인 한 회원에게만 댓글 작성폼이 보이게 처리 -->
									        <c:if test="${sessionScope.id != null}">    
									            <textarea rows="5" cols="80" id="replytext" placeholder="댓글을 작성해주세요"></textarea>
									            <br>
									            <!-- 비밀댓글 체크박스 -->
									            <input type="checkbox" id="secretReply">비밀 댓글
									            <button type="button" id="btnReply">댓글 작성</button>
									        </c:if>
									    </div>
									    <!-- 댓글 목록 출력할 위치 -->
									    <div id="listReply"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
					</div>
				</div>  
            </div>
        </div>
        <!-- Single Product Area End -->
        <!-- Related Product Area Start -->
        <div class="related-product-area">
            <h2 class="section-title">RELATED PRODUCTS</h2>
            <div class="container">
                <div class="row">
                    <div class="related-product indicator-style">
                        <div class="col-md-3">
                            <div class="single-banner">
                                <div class="product-wrapper">
                                    <a href="#" class="single-banner-image-wrapper">
                                        <img alt="" src="img/featured/1.jpg">
                                        <div class="price"><span>$</span>160</div>
                                        <div class="rating-icon">
                                            <i class="fa fa-star icolor"></i>
                                            <i class="fa fa-star icolor"></i>
                                            <i class="fa fa-star icolor"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                    </a>
                                    <div class="product-description">
                                        <div class="functional-buttons">
                                            <a href="#" title="Add to Cart">
                                                <i class="fa fa-shopping-cart"></i>
                                            </a>
                                            <a href="#" title="Add to Wishlist">
                                                <i class="fa fa-heart-o"></i>
                                            </a>
                                            <a href="#" title="Quick View">
                                                <i class="fa fa-compress"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="banner-bottom text-center">
                                    <a href="#">People of the book</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="single-banner">
                                <div class="product-wrapper">
                                    <a href="#" class="single-banner-image-wrapper">
                                        <img alt="" src="img/featured/2.jpg">
                                        <div class="price"><span>$</span>160</div>
                                        <div class="rating-icon">
                                            <i class="fa fa-star icolor"></i>
                                            <i class="fa fa-star icolor"></i>
                                            <i class="fa fa-star icolor"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                    </a>
                                    <div class="product-description">
                                        <div class="functional-buttons">
                                            <a href="#" title="Add to Cart">
                                                <i class="fa fa-shopping-cart"></i>
                                            </a>
                                            <a href="#" title="Add to Wishlist">
                                                <i class="fa fa-heart-o"></i>
                                            </a>
                                            <a href="#" title="Quick view" data-toggle="modal" data-target="#productModal">
                                                <i class="fa fa-compress"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="banner-bottom text-center">
                                    <a href="#">East of eden</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="single-banner">
                                <div class="product-wrapper">
                                    <a href="#" class="single-banner-image-wrapper">
                                        <img alt="" src="img/featured/3.jpg">
                                        <div class="price"><span>$</span>160</div>
                                        <div class="rating-icon">
                                            <i class="fa fa-star icolor"></i>
                                            <i class="fa fa-star icolor"></i>
                                            <i class="fa fa-star icolor"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                    </a>
                                    <div class="product-description">
                                        <div class="functional-buttons">
                                            <a href="#" title="Add to Cart">
                                                <i class="fa fa-shopping-cart"></i>
                                            </a>
                                            <a href="#" title="Add to Wishlist">
                                                <i class="fa fa-heart-o"></i>
                                            </a>
                                            <a href="#" title="Quick view" data-toggle="modal" data-target="#productModal">
                                                <i class="fa fa-compress"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="banner-bottom text-center">
                                    <a href="#">Lone some dove</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="single-banner">
                                <div class="product-wrapper">
                                    <a href="#" class="single-banner-image-wrapper">
                                        <img alt="" src="img/featured/4.jpg">
                                        <div class="price"><span>$</span>160</div>
                                        <div class="rating-icon">
                                            <i class="fa fa-star icolor"></i>
                                            <i class="fa fa-star icolor"></i>
                                            <i class="fa fa-star icolor"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                    </a>
                                    <div class="product-description">
                                        <div class="functional-buttons">
                                            <a href="#" title="Add to Cart">
                                                <i class="fa fa-shopping-cart"></i>
                                            </a>
                                            <a href="#" title="Add to Wishlist">
                                                <i class="fa fa-heart-o"></i>
                                            </a>
                                            <a href="#" title="Quick view" data-toggle="modal" data-target="#productModal">
                                                <i class="fa fa-compress"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="banner-bottom text-center">
                                    <a href="#">The secret garden</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="single-banner">
                                <div class="product-wrapper">
                                    <a href="#" class="single-banner-image-wrapper">
                                        <img alt="" src="img/featured/5.jpg">
                                        <div class="price"><span>$</span>160</div>
                                        <div class="rating-icon">
                                            <i class="fa fa-star icolor"></i>
                                            <i class="fa fa-star icolor"></i>
                                            <i class="fa fa-star icolor"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                    </a>
                                    <div class="product-description">
                                        <div class="functional-buttons">
                                            <a href="#" title="Add to Cart">
                                                <i class="fa fa-shopping-cart"></i>
                                            </a>
                                            <a href="#" title="Add to Wishlist">
                                                <i class="fa fa-heart-o"></i>
                                            </a>
                                            <a href="#" title="Quick view" data-toggle="modal" data-target="#productModal">
                                                <i class="fa fa-compress"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="banner-bottom text-center">
                                    <a href="#">Twilight</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                               <div class="single-banner">
                                <div class="product-wrapper">
                                    <a href="#" class="single-banner-image-wrapper">
                                        <img alt="" src="img/featured/6.jpg">
                                        <div class="price"><span>$</span>160</div>
                                        <div class="rating-icon">
                                            <i class="fa fa-star icolor"></i>
                                            <i class="fa fa-star icolor"></i>
                                            <i class="fa fa-star icolor"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                    </a>
                                    <div class="product-description">
                                        <div class="functional-buttons">
                                            <a href="#" title="Add to Cart">
                                                <i class="fa fa-shopping-cart"></i>
                                            </a>
                                            <a href="#" title="Add to Wishlist">
                                                <i class="fa fa-heart-o"></i>
                                            </a>
                                            <a href="#" title="Quick view" data-toggle="modal" data-target="#productModal">
                                                <i class="fa fa-compress"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="banner-bottom text-center">
                                    <a href="#">Cold mountain</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Related Product Area End -->
	<!-- Footer Area Start -->
	<%@ include file="/resources/include/footer.jsp"%>
</body>
</html>