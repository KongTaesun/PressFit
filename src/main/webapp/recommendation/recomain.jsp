<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 작성</title>
<%@ include file="/resources/include/header.jsp"%>
<script src="<c:url value='/resources/include/commons.js' />"></script>
<script>
	$(document).ready(function() {

	});

	// 2_3. 댓글 목록 - Rest방식
	function listReply(num) {
		$.ajax({
			type : "get",
			url : "${path}/gallery/reply/list/${dto.idx}/" + num,
			success : function(result) {
				console.log(result);
				// responseText가 result에 저장됨.
				$("#listReply").html(result);
			}
		});
	}

	// **댓글 수정화면 생성 함수
	function showReplyModify(num) {
		$.ajax({
			type : "get",
			url : "${path}/gallery/reply/detail/" + num,
			success : function(result) {
				$("#modifyReply").html(result);
				// 태그.css("속성", "값")
				$("#modifyReply").css("visibility", "visible");
			}
		})
	}
	// **댓글 답글화면 생성 함수
	function showReplyCmtModify(num) {
		$.ajax({
			type : "get",
			url : "${path}/gallery/reply/Cmtdetail/" + num,
			success : function(result) {
				$("#modifyReply").html(result);
				$("#modifyReply").css("visibility", "visible");
			}
		})
	}
</script>
</head>
        <!-- slider Area Start -->     
		<div class="slider-area"> 
			<div class="bend niceties preview-1">  
				<div id="ensign-nivoslider" class="slides">	   
					<img src="${path}/resources/upload/main.jpg" alt="" title="#slider-direction-1"  />
					<img src="${path}/resources/upload/main2.jpg" alt="" title="#slider-direction-2"  />
				</div>  
				<!-- direction 1 -->   
				<div id="slider-direction-1" class="text-center slider-direction">   
					<!-- layer 1 -->    
					<div class="layer-1">    
						<h2 class="title-1">Recommender system</h2>    
					</div>    
					   
 					<!-- layer 2 -->      
					<div class="layer-2"> 
						<p class="title-2">베이지안 뉴런 모듈을 통한 추천 시스템. 검색어를 입력해 보세요.</p>
					</div>  
					<!-- layer 3 --> 
					<div class="layer-3"> 
						<a href="#" class="title-3">설명이 필요하신가요?</a>  
					</div>
					<!-- layer 4 -->   
					<div class="layer-4"> 
                        <form action="#" class="title-4"> 
                            <input type="text" placeholder="상품검색">
                            <button type="submit"><i class="fa fa-search"></i></button>
                        </form>
					</div> 
				</div>  
			</div>  
		</div>
		<!-- slider Area End-->     

		<!-- Counter Area Start -->
		<div class="counter-area section-padding text-center">
		    <div class="container">
		        <div class="row">
		            <div class="col-md-3 col-sm-3 col-xs-6">
						<div class="single-counter wow" data-wow-duration="1.5s" data-wow-delay=".3s">
							<div class="counter-info">
								<span class="fcount">
									<span class="counter">3725</span>
								</span>
								<h3>BOOKS READ</h3>								
							</div>
						</div>		                
		            </div>
		            <div class="col-md-3 col-sm-3 col-xs-6">
						<div class="single-counter wow" data-wow-duration="1.5s" data-wow-delay=".3s">
							<div class="counter-info">
								<span class="fcount">
									<span class="counter">950</span>
								</span>
								<h3>ONLINE USERS</h3>								
							</div>
						</div>		                
		            </div>
		            <div class="col-md-3 col-sm-3 col-xs-6">
						<div class="single-counter wow" data-wow-duration="1.5s" data-wow-delay=".3s">
							<div class="counter-info">
								<span class="fcount">
									<span class="counter">1450</span>
								</span>
								<h3>BEST AUTHORS</h3>								
							</div>
						</div>		                
		            </div>
		            <div class="col-md-3 col-sm-3 col-xs-6">
						<div class="single-counter wow" data-wow-duration="1.5s" data-wow-delay=".3s">
							<div class="counter-info">
								<span class="fcount">
									<span class="counter">62</span>
								</span>
								<h3>AWARDS</h3>								
							</div>
						</div>		                
		            </div>
		        </div>
		    </div>
		</div>
		<!-- Counter Area End -->
        <!--Quickview Product Start -->
        <div id="quickview-wrapper">
            <!-- Modal -->
            <div class="modal fade" id="productModal" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        </div>
                        <div class="modal-body">
                            <div class="modal-product">
                                <div class="product-images">
                                    <div class="main-image images">
                                        <img alt="" src="img/quick-view.jpg">
                                    </div>
                                </div>
                                <div class="product-info">
                                    <h1>Frame Princes Cut Diamond</h1>
                                    <div class="price-box">
                                        <p class="s-price"><span class="special-price"><span class="amount">$280.00</span></span></p>
                                    </div>
                                    <a href="product-details.html" class="see-all">See all features</a>
                                    <div class="quick-add-to-cart">
                                        <form method="post" class="cart">
                                            <div class="numbers-row">
                                                <input type="number" id="french-hens" value="3">
                                            </div>
                                            <button class="single_add_to_cart_button" type="submit">Add to cart</button>
                                        </form>
                                    </div>
                                    <div class="quick-desc">
                                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum. Morbi ornare lectus quis justo gravida semper. Nulla tellus mi, vulputate adipiscing cursus eu, suscipit id nulla.
                                    </div>
                                    <div class="social-sharing">
                                        <div class="widget widget_socialsharing_widget">
                                            <h3 class="widget-title-modal">Share this product</h3>
                                            <ul class="social-icons">
                                                <li><a target="_blank" title="Facebook" href="#" class="facebook social-icon"><i class="fa fa-facebook"></i></a></li>
                                                <li><a target="_blank" title="Twitter" href="#" class="twitter social-icon"><i class="fa fa-twitter"></i></a></li>
                                                <li><a target="_blank" title="Pinterest" href="#" class="pinterest social-icon"><i class="fa fa-pinterest"></i></a></li>
                                                <li><a target="_blank" title="Google +" href="#" class="gplus social-icon"><i class="fa fa-google-plus"></i></a></li>
                                                <li><a target="_blank" title="LinkedIn" href="#" class="linkedin social-icon"><i class="fa fa-linkedin"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

	<%@ include file="/resources/include/footer.jsp" %>
</body>
</html>