<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>제품군 작성</title>
<%@ include file="/resources/include/header.jsp" %>
<script src="<c:url value='/resources/ckediter/ckeditor.js' />"></script>
<script src="<c:url value='/resources/include/commons.js' />"></script>
<script>
$(document).ready(function(){
    $("#btnSave").click(function(){
        var modelname = $("#modelname").val();
        var price = $("#price").val();
        var d_price = $("#d_price").val();
        var manufacturecompany = $("#manufacturecompany").val();
        var registrationyear = $("#registrationyear").val();
        var amount =$("#amount").val();
        if(modelname == "" && price == "" && d_price == "" && manufacturecompany == "" && registrationyear == "" && amount == ""){
            alert("필수 사항을 입력해주세요~!!!!!");
            document.form1.modelname.focus();
            return;
        }
        document.form1.submit();
    }); 
    
        // 파일 업로드 영역에서 기본효과를 제한
        $(".fileDrop").on("dragenter dragover", function(e){
            e.preventDefault(); // 기본효과 제한
        });
        // 드래그해서 드롭한 파일들 ajax 업로드 요청
         $(".fileDrop").on("drop", function(e){
            e.preventDefault(); // 기본효과 제한
            var files = e.originalEvent.dataTransfer.files; // 드래그한 파일들
            var file = files[0]; // 첫번째 첨부파일
            var formData = new FormData(); // 폼데이터 객체
            formData.append("file", file); // 첨부파일 추가
            $.ajax({
                url: "${path}/tmouse/upload/uploadAjax.do",
                type: "post",
                data: formData,
                dataType: "text",
                processData: false, // processType: false - header가 아닌 body로 전달
                contentType: false,
                // ajax 업로드 요청이 성공적으로 처리되면
                success: function(data){
                    // 첨부 파일의 정보
                    var fileInfo = getFileInfo(data);
                    // 하이퍼링크
                    var html = "<a href='"+fileInfo.getLink+"'>"+fileInfo.fileName+"</a><br>";
                 	// 삭제 버튼
                    html += "<a href='#' class='fileDel' data-src='"+this+"'>[삭제]</a></div>"
                    var str = "<input type='hidden' name = 'filelist' class='filelist' value='"+fileInfo.fullName+"'>";
                    // div에 추가
                    $("#uploadedList").append(html);
                    $("#form1").append(str);
            }
        });
    }); 
        $(".uploadedList").on("click", "#fileDel", function(event){
            alert("이미지 삭제")
            var that = $(this); // 여기서 this는 클릭한 span태그
            $.ajax({
                url: "${path}/upload/deleteFile",
                type: "post",
                // data: "fileName="+$(this).attr("date-src") = {fileName:$(this).attr("data-src")}
                // 태그.attr("속성")
                data: {fileName:$(this).attr("data-src")}, // json방식
                dataType: "text",
                success: function(result){
                    if( result == "deleted" ){
                        // 클릭한 span태그가 속한 div를 제거
                        that.parent("div").remove();
                    }
                }
            });
        });
});

</script>

</head>
<body>
<!-- Breadcrumbs Area Start -->
        <div class="breadcrumbs-area">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
					    <div class="breadcrumbs">
					       <h2>제품등록수정</h2> 
					       <ul class="breadcrumbs-list">
						        <li>
						            <a title="Return to Home" href="index.html">Home</a>
						        </li>
						        <li>제품등록수정</li>
						    </ul>
					    </div>
					</div>
				</div>
			</div>
		</div> 
		<!-- Breadcrumbs Area Start -->
		<!-- My Account Area Start -->
		<div class="my-account-area section-padding">
			<div class="container">
				<form method="POST" name="form1" id="form1" action="${path}/tmouse/updateinsert.do">
				<div class="section-title2">
					<p>수정♥</p>
				</div>
				<div class="row">
					<div class="addresses-lists">
						<div class="col-xs-12 col-sm-12 col-lg-12">
							<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
								<div class="panel panel-default">
									<div class="panel-heading" role="tab" id="headingOne">
										<h4 class="panel-title">
											<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
												<i class="fa fa-building"></i>
											   <span>필수입력사항</span>
											</a>
										</h4>
									</div>
									<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
										<div class="panel-body">
											<div class="coupon-info">
												<h1 class="heading-title">필수입력사항</h1>
												<p class="coupon-text">제품 등록을 위한 필수사항들을 입력해주세요.</p>
												<p class="required">*기본사항</p>
													<p class="form-row">
														<input type="text" id="modelname" name="modelname" placeholder="제목 겸 모델명 *" value="${dto.modelname}" />
													</p>
													<p class="form-row">
														<input type="text" id="price" name="price" placeholder="가격 *" value="${dto.price}" />
													</p>
													<p class="form-row">
														<input type="text" id="d_price" name="d_price" placeholder="배송비 *" value="${dto.d_price}" />
													</p>
													<p class="form-row">
														<input type="text" id="manufacturecompany" name="manufacturecompany" placeholder="제조사  *" value="${dto.manufacturecompany}" />
													</p>
													<p class="form-row">
														<input type="text" id="registrationyear" name="registrationyear" placeholder="제조년월  *"  value="${dto.registrationyear}" />
													</p>
													<p class="form-row">
														<input type="text"  name="amount" placeholder="수량  *"  value="${dto.amount}" />  
													</p> 
													<input type="hidden" id="idx" name="idx" value="${dto.idx }" />
												</div>											
											</div>
										</div>
									</div>
								</div>
							<div class="panel panel-default">
									<div class="panel-heading" role="tab" id="headingThree">
										<h4 class="panel-title">
											<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
												<i class="fa fa-file-o"></i>
												<span>선택입력사항</span>
											</a>
										</h4>
									</div>
									<div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
										<div class="panel-body">
											<div class="coupon-info">
												<h1 class="heading-title">선택입력사항</h1>
												<p class="coupon-text">제품 등록을 위한 선택사항들을 입력해주세요.</p>
												<p class="required">*Option</p>
												<div class="shop-select">
													<label>responsivemethod <span class="required">*</span></label>
													<select id="responsivemethod" name="responsivemethod" >
														<option value="광">광</option>
														<option value="레이저">레이저</option>
														<option value="적외선">적외선</option>
													</select> 										
												</div>
												<div class="shop-select">
													<label>numberofbuttons <span class="required">*</span></label>
													<select id="numberofbuttons" name="numberofbuttons" >
														<option value="1">1</option>
														<option value="2">2</option>
														<option value="3">3</option>
														<option value="4">4</option>
														<option value="5">5</option>
														<option value="6">6</option>
														<option value="7">7</option>
														<option value="8">8</option>
														<option value="9">9</option>
														<option value="10">10</option>
														<option value="11">11</option>
														<option value="12">12</option>
													</select> 									
												</div>
												<div class="shop-select">
													<label>connectionmethod <span class="required">*</span></label>
													<select id="connectionmethod" name="connectionmethod" >
														<option value="유선">유선</option>
														<option value="무선">무선</option>
														<option value="유.무선">유.무선</option>
													</select> 									
												</div>
												<p class="form-row">
													<input type="text" id="bluetoothversion" name="bluetoothversion" placeholder="bluetoothversion *" />
												</p>
												<p class="form-row">
													<input type="text" id="battery" name="battery" placeholder="battery *" />
												</p>
												<div class="shop-select">
													<label>goldbraidedUSBterminal <span class="required">*</span></label>
													<select id="goldbraidedUSBterminal" name="goldbraidedUSBterminal" >
														<option value="">no</option>
														<option value="금도금">yes</option>
													</select> 									
												</div>
												<div class="shop-select">
													<label>interface1<span class="required">*</span></label>
													<select id="interface1" name="interface1" >
														<option value="USB">USB</option>
														<option value="other">other</option>
													</select> 									
												</div>
												<div class="shop-select">
													<label>wheeladjustment<span class="required">*</span></label>
													<select id="wheeladjustment" name="wheeladjustment" >
														<option value="상하">상하</option>
														<option value="상하좌우">상하좌우</option>
													</select> 									
												</div>
												<p class="form-row">
													<input type="text" id="mousesensor" name="mousesensor" placeholder="mousesensor *" />
												</p>
												<p class="form-row">
													<input type="text" id="maximumsensitivity" name="maximumsensitivity" placeholder="maximumsensitivity(DPI) *" />
												</p>
												<div class="shop-select">
													<label>changedpi<span class="required">*</span></label>
													<select id="changedpi" name="changedpi" >
														<option value="불가능">불가능</option>
														<option value="변경가능">변경가능</option>
													</select> 									
												</div>
												<p class="form-row">
													<input type="text" id="scanrate" name="scanrate" placeholder="scanrate(FPS) *" />
												</p>
												<p class="form-row">
													<input type="text" id="accelerationsupport" name="accelerationsupport" placeholder="accelerationsupport *" />
												</p>
												<p class="form-row">
													<input type="text" id="responsespeed" name="responsespeed" placeholder="responsespeed *" />
												</p>
												<p class="form-row">
													<input type="text" id="macrofunction" name="macrofunction" placeholder="macrofunction *" />
												</p>
												<div class="shop-select">
													<label>softwaresupport<span class="required">*</span></label>
													<select id="softwaresupport" name="softwaresupport" >
														<option value="소프트웨어 미지원">소프트웨어 미지원</option>
														<option value="소프트웨어 지원">소프트웨어 지원</option>
													</select> 									
												</div>
												<div class="shop-select">
													<label>builtinmemory<span class="required">*</span></label>
													<select id="builtinmemory" name="builtinmemory" >
														<option value="메모리없음">메모리없음</option>
														<option value="내장 메모리">내장 메모리</option>
													</select> 									
												</div>
												<div class="checkbox">
													<label>
														<span><input type="checkbox" id="wristtunnelsyndrome" name="wristtunnelsyndrome" /></span>
														wristtunnelsyndrome
													</label>
												</div>
												<div class="checkbox">
													<label>
														<span><input type="checkbox" id="ledtuningproducts" name="ledtuningproducts" /></span>
														ledtuningproducts
													</label>
												</div>
												<p class="form-row">
													<input type="text" id="mousecoating" name="mousecoating" placeholder="mousecoating *" />
												</p>
												<div class="checkbox">
													<label>
														<span><input type="checkbox" id="gamingmouse" name="gamingmouse" /></span>
														gamingmouse
													</label>
												</div>
												<div class="checkbox">
													<label>
														<span><input type="checkbox" id="weightapplication" name="weightapplication" /></span>
														weightapplication
													</label>
												</div>
												<div class="checkbox">
													<label>
														<span><input type="checkbox" id="customfirmwaresupport" name="customfirmwaresupport"  /></span>
														customfirmwaresupport
													</label>
												</div>
												<div class="checkbox">
													<label>
														<span><input type="checkbox" id="possiblechangeparts" name="possiblechangeparts" /></span>
														possiblechangeparts
													</label>
												</div>
												<div class="checkbox">
													<label>
														<span><input type="checkbox" id="dpishift" name="dpishift" /></span>
														dpishift
													</label>
												</div>
												<div class="checkbox">
													<label>
														<span><input type="checkbox" id="multipairing" name="multipairing" /></span>
														multipairing
													</label>
												</div>
												<div class="shop-select">
													<label>switch<span class="required">*</span></label>
													<select id="switch1" name="switch1" >
														<option value="OMRON 스위치">OMRON 스위치</option>
														<option value="무소음 스위치">무소음 스위치</option>
													</select> 									
												</div>
												<p class="form-row">
													<input type="text" id="length" name="length" placeholder="length(mm) *" />
												</p>
												<p class="form-row">
													<input type="text" id="width" name="width" placeholder="width(mm) *" />
												</p>
												<p class="form-row">
													<input type="text" id="height" name="height" placeholder="height(mm) *" />
												</p>
												<p class="form-row">
													<input type="text" id="weight" name="weight" placeholder="weight(g) *" />
												</p>
											</div>											
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading" role="tab" id="headingFour">
										<h4 class="panel-title">
											<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
												<i class="fa fa-building"></i>
												<span>제품내용</span>
											</a>
										</h4>
									</div>
									<div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
										<div class="panel-body">
											<div class="coupon-info">
												<h1 class="heading-title">제품내용</h1>
												<p class="coupon-text">니 제품의 내용을 적으셍.</p>
												<p class="required">*Content</p>
													<textarea name="content" id="content" rows="4" cols="80" placeholder="${dto.idx }"></textarea>
													<script>
													CKEDITOR.replace("content",{
														filebrowserUploadUrl : "${path}/tmouse/imageUpdate.do"
													});
													</script>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
						<div class="create-account-button pull-left">
							<a href="index.html" class="btn button button-small" title="Home">
								<span>
									  취소
									<i class="fa fa-chevron-right"></i>
								</span>
							</a>
							<a title="Save" id="btnSave" name="btnSave" class="btn button button-small">
								<span>
									등록
									<i class="fa fa-chevron-right"></i>
								</span>
							</a>
						</div>
				</form>
				</div>

			</div>
		</div>
		<!-- My Account Area End -->
		<%@ include file="/resources/include/footer.jsp" %>
    </body>
</html>
