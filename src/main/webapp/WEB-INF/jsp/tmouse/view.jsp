<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
.availability1 > span{
    background: #32b5f3 none repeat scroll 0 0;
    border: 1px solid #0a74a7;
    color: #ffffff;
    display: inline-block;
    font-weight: 600;
    margin-bottom: 20px;
    padding: 3px 12px;
}
.availability2 {
    background: #32b5f3 none repeat scroll 0 0;
    border: 1px solid #0a74a7;
    color: #ffffff;
    display: inline-block;
    font-weight: 600;
    margin-bottom: 20px;
    padding: 3px 12px;
}

.single-product-details > p {
  color: #191919;
  font-size: 13px;
  font-weight: 600;
  margin-bottom: 20px;
}

.single-product-price > h2 {
  display: inline-block;
  margin-bottom: 20px;
  padding: 11px 0;
  position: relative;
}

.breadcrumbs-area {
 background-image: url('${path}/resources/writer/img/bigpicture/mouse_img3.png');
}
</style>
<script src="<c:url value='/resources/include/commons.js' />"></script>
<script>
    $(document).ready(function(){
        $("#btnCmt").click(function(){
        	location.href="${path}/tmouse/cmt.do?idx=${dto.idx}";
        });
        // 2. 게시글 삭제
        // 삭제 버튼 클릭 
		$("#btnDelete").click(function(){
		    // 댓글이 존재하는 게시물의 삭제처리 방지
		    var count = "${count}";
		    // 댓글의 수가 0보다 크면 팝업, 함수 종료
		    if(count > 0) {
		    	if(confirm("댓글이 많이 있습니다. 삭제하시겠습니까?")){
		    		document.form1.action = "${path}/tmouse/delete.do?idx=${dto.idx}";
			        document.form1.submit();
		    	}else{return;}
		    }
		    // 댓글의 수가 0이면 삭제처리
		    if(confirm("삭제하시겠습니까?")){
		        location.href = "${path}/tmouse/delete.do?idx=${dto.idx}";
		        }
		    else{
		    }
		});

        
        // 3. 게시글 목록으로 이동 - 버튼 클릭시 상세보기화면에 있던 페이지, 검색옵션, 키워드 값을 가지로 목록으로 이동
        $("#btnList").click(function(){
            location.href="${path}/tmouse/list.do?curPage=${curPage}&searchOption=${searchOption}&keyword=${keyword}";
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
        	location.href="${path}/tmouse/update.do?idx=${dto.idx}";
        });
    	 
    	$("#inCart").click(function() {
    		addCart();
    	});
    	
    	$("#btnBuy").click(function(){
    		btnBuy();
    	});
    });
    	function addCart(){
    		var amount=$("#amount").val();
    		if(amount < 1){
        		alert("수량을 체크해주세요!");
        	} else{
        		$.ajax({
                    type: "get",
                    url: "${path}/shop/cart/insert.do?price=${dto.price}&amount="+ amount +"&modelname=${dto.modelname}&manufacturecompany=${dto.manufacturecompany}&idx=${dto.idx}&fullName=${dto.fullName}&kind=tmouse&crea_id=${dto.crea_id}",
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
    	
    	function btnBuy(){
    		var amount=$("#amount").val();
    		if(amount < 1){
        		alert("수량을 체크해주세요!");
        	} else{
        		$.ajax({
                    type: "get",
                    url: "${path}/shop/cart/insert.do?price=${dto.price}&amount="+ amount +"&modelname=${dto.modelname}&manufacturecompany=${dto.manufacturecompany}&idx=${dto.idx}&fullName=${dto.fullName}&kind=tmouse&crea_id=${dto.crea_id}",
                    success: function(){
                    	var result = confirm("구매 페이지로 넘어갑니다.");
                		if(result){
                			location.href="${path}/shop/cart/buy.do";
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
        <div class="breadcrumbs-area">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
					    <div class="breadcrumbs">
					       <h2>MOUSE PRODUCT</h2> 
					       <ul class="breadcrumbs-list">
						        <!-- <li>
						            <a title="Return to Home" href="index.html">Home</a>
						        </li> --> 
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
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-5">
                        <div class="single-product-details">
                           <!--  <div class="list-pro-rating">
                                <i class="fa fa-star icolor"></i>
                                <i class="fa fa-star icolor"></i>
                                <i class="fa fa-star icolor"></i>
                                <i class="fa fa-star icolor"></i>
                                <i class="fa fa-star"></i>
                            </div> -->
                            <h2>${dto.modelname}</h2>
                            
                            <div class="availability1"> 
                                 <c:if test="${dto.gamingmouse eq '○'}">
      							    <a href="${path}/tmouse/list.do?searchOption=gamingmouse">
      							    	<span class="availability2">게이밍 마우스</span>
      							    </a>
						     	 </c:if>
						     	 <c:if test="${fn:contains(dto.connectionmethod,'무선')||fn:contains(dto.connectionmethod,'블루투스')}">
							        <a href="${path}/tmouse/list.do?searchOption=connectionmethod">
							        	<span class="availability2">${dto.connectionmethod}</span>
							        </a>
							      </c:if>
 							      <c:if test="${dto.wristtunnelsyndrome eq '○'}">
 							      	<a href="${path}/tmouse/list.do?searchOption=wristtunnelsyndrome">
							        	<span class="availability2">손목보호 마우스</span>
							       	</a>
							      </c:if>
							      <c:if test="${dto.connectionmethod eq '무소음 스위치'}">
							      	<a href="${path}/tmouse/list.do?searchOption=switch1">
							         	<span class="availability2">무소음 마우스</span>
							         </a>
							      </c:if>
                            </div>
                            <p> 제조사 : ${dto.manufacturecompany} </p>
                            <p> 등록년월 : ${dto.regdate} </p>
                            
                            <div class="single-product-price">
                                <h2>${dto.price}￦</h2>
                                <input type="hidden" name="price" value="${dto.price}" />
                            </div>
                            
                            
                            
                            <!-- ================================================================================================================================================================================================================ -->
                            
                            <div class="product-attributes clearfix">
                                <p  style="margin-bottom: 5px;"><span class="pull-left" id="quantity-wanted-p">
									<!-- <span class="dec qtybutton">-</span> -->
									수량 : <input type="number" style="width: 50px" id="amount" name="amount" value="1" min="1" max="10"/>
									<!-- <span class="inc qtybutton">+</span> -->	
								</span></p> 
                               <span>
                                    <button type="button" class="cart-btn btn-default" id="inCart">Add to cart</button>
                               </span>
                            </div>
                            
                             
                            
                            
                            <!-- ================================================================================================================================================================================================================ -->
                            
                           <!--  <div class="add-to-wishlist">
                                <a class="wish-btn" href="cart.html">
                                    <i class="fa fa-heart-o"></i>
                                    ADD TO WISHLIST
                                </a>
                            </div> -->
                            <div>
                            	<!-- 게시물번호를 hidden으로 처리 -->
						        <input type="hidden" name="boardno" value="${dto.idx}">

						        <!-- 본인이 쓴 게시물만 수정, 삭제가 가능하도록 처리 -->
						        <c:if test="${sessionScope.id == dto.crea_id}">
						            <button type="button" id="btnUpdete">수정</button>
						            <button type="button" id="btnDelete">삭제</button>
						        </c:if>
						        
						        <!-- 바로 구매하기 버튼 -->
						        <button type="button" class="btn-default" id="btnBuy">구매하기</button>
						        <!-- 상세보기 화면에서 게시글 목록화면으로 이동 -->
						        <button type="button" class="btn-default" id="btnList">목록</button>
                            </div> 
                        </div> 
                    </div>
                    
                </div>
                <div class="row">
					<div class="col-md-12">
                        <div class="p-details-tab-content">
                            <div class="p-details-tab">
                                <ul class="p-details-nav-tab" role="tablist">
                                    <li role="presentation" class="active"><a href="#more-info" aria-controls="more-info" role="tab" data-toggle="tab">판매자제공</a></li>
                                    <li role="presentation"><a href="#data" aria-controls="data" role="tab" data-toggle="tab">스펙</a></li>
                                    <li role="presentation"><a href="#reviews" aria-controls="reviews" role="tab" data-toggle="tab">상품문의 / 구매후기</a></li>
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
                                                <td>출시년월</td>
                                                <td>${dto.registrationyear}</td>
                                            </tr>
                                            <tr class="even">
                                                <td>광/볼 마우스</td>
                                                <td>${dto.responsivemethod}</td>
                                                <td>버튼갯수</td>
                                                <td>${dto.numberofbuttons }</td>
                                            </tr>
                                             <tr class="odd">
                                                <td>유/무선</td>
                                                <td>${dto.connectionmethod }</td>
                                                <td>블루투스 버전</td>
                                                <td>${dto.bluetoothversion }</td>
                                            </tr>
                                             <tr class="odd">
                                                <td>배터리</td>
                                                <td>${dto.battery }</td>
                                                <td>인터페이스</td>
                                                <td>${dto.interface1 }</td>
                                            </tr>
                                             <tr class="odd">
                                                <td>휠 조정</td>
                                                <td>${dto.wheeladjustment }</td>
                                                <td>마우스 센서</td>
                                                <td>${dto.mousesensor }</td>
                                            </tr>
                                            <tr>
                                            	<th colspan="4">기능</th>
                                            </tr>
                                             <tr class="odd">
                                                <td>최대 감도</td>
                                                <td>${dto.maximumsensitivity }</td>
                                                <td>DPI 변경</td>
                                                <td>${dto.changedpi }</td>
                                            </tr>
                                             <tr class="odd">
                                                <td>스캔율</td>
                                                <td>${dto.scanrate }</td>
                                                <td>가속도 지원</td>
                                                <td>${dto.accelerationsupport }</td>
                                            </tr>
                                             <tr class="odd">
                                                <td>응답속도</td>
                                                <td>${dto.responsespeed }</td>
                                             </tr>
                                             <tr>
                                            	<th colspan="4">매크로</th>
                                            </tr>
                                             <tr>
                                                <td>매크로 기능</td>
                                                <td>${dto.macrofunction }</td>
                                                <td>소프트웨어 지원</td>
                                                <td>${dto.softwaresupport }</td>
                                             </tr>
                                             <tr class="odd">
                                                <td>내장 메모리 지원</td>
                                                <td>${dto.builtinmemory}</td>
                                            </tr>
                                            <tr>
                                            	<th colspan="4">외형</th>
                                            </tr>
                                             <tr class="odd">
                                                <td>손목터널증후군 방지</td>
                                                <td>${dto.wristtunnelsyndrome }</td>
                                                <td>LED 튜닝제품</td>
                                                <td>${dto.ledtuningproducts}</td>
                                             </tr>
                                             <tr class="odd">
                                                <td>마우스 코팅</td>
                                                <td>${dto.mousecoating }</td>
                                             </tr>
                                                <tr>
                                            	<th colspan="4">부가 기능</th>
                                            </tr>
                                            <tr>
                                                <td>게이밍 마우스</td>
                                                <td>${dto.gamingmouse}</td>
                                                <td>무게추 적용</td>
                                                <td>${dto.weightapplication }</td>
                                            </tr>
                                            <tr>
                                                <td>커스텀펌웨어 지원</td>
                                                <td>${dto.customfirmwaresupport}</td>
                                                <td>파츠 변경 가능</td>
                                                <td>${dto.possiblechangeparts }</td>
                                            </tr>
                                            <tr>
                                                <td>DPI Shift</td>
                                                <td>${dto.dpishift}</td>
                                                <td>멀티페어링</td>
                                                <td>${dto.multipairing }</td>
                                            </tr>
                                            <tr>
                                                <td>스위치</td>
                                                <td>${dto.switch1}</td>
                                                <td>세로</td>
                                                <td>${dto.length }</td>
                                            </tr>
                                            <tr>
                                            	<th colspan="4">크기</th>
                                            </tr>
                                            <tr>
                                                <td>가로</td>
                                                <td>${dto.width}</td>
                                                <td>높이</td>
                                                <td>${dto.height }</td>
                                            </tr>
                                            <tr>
                                                <td>무게</td>
                                                <td>${dto.weight}</td>
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
    <!--    <div class="related-product-area">
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
        </div> -->
        <!-- Related Product Area End -->
	<!-- Footer Area Start -->
	<%@ include file="/resources/include/footer.jsp"%>
</body>
</html>