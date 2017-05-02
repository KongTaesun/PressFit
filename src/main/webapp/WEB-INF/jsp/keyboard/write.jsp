<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>제품군 작성</title>
<%@ include file="/resources/include/header.jsp" %>
<%@ include file="/resources/include/sessionCheck.jsp" %>
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
                url: "${path}/keyboard/upload/uploadAjax.do",
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
					       <h2>제품등록</h2> 
					       <ul class="breadcrumbs-list">
						        <li>
						            <a title="Return to Home" href="index.html">Home</a>
						        </li>
						        <li>제품등록</li>
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
				<form method="post" name="form1" id="form1" action="${path}/keyboard/insert.do">
				<div class="section-title2">
					<h2>--제 품 등 록--</h2>
					<p>귀사의 제품 등록을 환영합니다 ♥</p>
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
														<input type="text" id="modelname" name="modelname" placeholder="제목 겸 모델명 *">
													</p>
													<p class="form-row">
														<input type="text" id="price" name="price" placeholder="가격 *">
													</p>
													<p class="form-row">
														<input type="text" id="d_price" name="d_price" placeholder="배송비 *" />
													</p>
													<p class="form-row">
														<input type="text" id="manufacturecompany" name="manufacturecompany" placeholder="제조사  *" />
													</p>
													<p class="form-row">
														<input type="text" id="registrationyear" name="registrationyear" placeholder="제조년월  *" />
													</p>
													<p class="form-row">
														<input type="text"  name="amount" placeholder="수량  *" />  
													</p> 
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
													<input type="text" id="bluetoothversion" name="bluetoothversion" placeholder="bluetoothversion" />
												</p>
												<p class="form-row">
													<input type="text" id="battery" name="battery" placeholder="battery" />
												</p>
												<p class="form-row">
													<input type="text" id="keyarray" name="keyarray" placeholder="keyarray" />
												</p>
												<div class="shop-select">
													<label>goldbraidedusbterminal <span class="required">*</span></label>
													<select id="goldbraidedusbterminal" name="goldbraidedusbterminal" >
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
													<label>contactsystem<span class="required">*</span></label>
													<select id="contactsystem" name="contactsystem" >
														<option value="기계식">기계식</option>
														<option value="플런저">플런저</option>
														<option value="멤브레인">멤브레인</option>
														<option value="펜타그래프">펜타그래프</option>
														<option value="무접점">무접점 방식</option>
														<option value="no">no</option>
													</select> 									
												</div>
												<div class="shop-select">
													<label>switch<span class="required">*</span></label>
													<select id="switch" name="switch" >
														<option value="오테뮤">기계식</option>
														<option value="카일">카일</option>
														<option value="체리">체리</option>
														<option value="Romer-G">Romer-G</option>
														<option value="no">no</option>
													</select> 									
												</div>
												<div class="shop-select">
													<label>keyswitch<span class="required">*</span></label>
													<select id="keyswitch" name="keyswitch" >
														<option value="청축">청축</option>
														<option value="백축">백축</option>
														<option value="적축">적축</option>
														<option value="갈축">갈축-G</option>
														<option value="은축">은축</option>
														<option value="녹축">녹축</option>
													</select> 									
												</div>
												<div class="checkbox">
													<label>
														<span><input type="checkbox" id="keyboardform" name="keyboardform" /></span>
														텐키레스 키보드
													</label>
												</div>
												<div class="shop-select">
													<label>functionKey<span class="required">*</span></label>
													<select id="functionKey" name="functionKey" >
														<option value="게이밍, 멀티미디어">게이밍, 멀티미디어</option>
														<option value="멀티미디어">멀티미디어</option>
														<option value="단순">단순</option>
														<option value="no">no</option>
													</select> 									
												</div>
												<div class="shop-select">
													<label>macrofunction<span class="required">*</span></label>
													<select id="macrofunction" name="macrofunction" >
														<option value="S/W 매크로">S/W 매크로</option>
														<option value="H/W 매크로">H/W 매크로</option>
														<option value="no">no</option>
													</select> 									
												</div>
												<div class="shop-select">
													<label>simultaneousinput<span class="required">*</span></label>
													<select id="simultaneousinput" name="simultaneousinput" >
														<option value="무한입력">무한입력</option>
														<option value="최대 26키">최대 35키</option>
														<option value="최대 26키">최대 26키</option>
														<option value="최대 26키">최대 24키</option>
														<option value="최대 26키">최대 6키</option>
														<option value="최대 26키">no</option>
													</select> 									
												</div>
												<div class="checkbox">
													<label>
														<span><input type="checkbox" id="responsevelocity" name="responsevelocity" /></span>
														1ms 응답속도
													</label>
												</div>
												<div class="checkbox">
													<label>
														<span><input type="checkbox" id="windowskeylocking" name="windowskeylocking" /></span>
														O
													</label>
												</div>
												<div class="checkbox">
													<label>
														<span><input type="checkbox" id="fullkeylock" name="fullkeylock" /></span>
														O
													</label>
												</div>
												<div class="checkbox">
													<label>
														<span><input type="checkbox" id="stepsculture2" name="stepsculture2" /></span>
														O
													</label>
												</div>
												<div class="checkbox">
													<label>
														<span><input type="checkbox" id="vikistyle" name="vikistyle" /></span>
														O
													</label>
												</div>
												<div class="checkbox">
													<label>
														<span><input type="checkbox" id="metalhousing" name="metalhousing" /></span>
														O
													</label>
												</div>
												<div class="checkbox">
													<label>
														<span><input type="checkbox" id="foreignlanguageonly" name="foreignlanguageonly" /></span>
														foreignlanguageonly
													</label>
												</div>
												<div class="shop-select">
													<label>simultaneousinput<span class="required">*</span></label>
													<select id="keycapmaterial" name="keycapmaterial" >
														<option value="ABS">ABS</option>
														<option value="PBT">PBT</option>
														<option value="no">no</option>
													</select> 									
												</div>
												<div class="shop-select">
													<label>simultaneousinput<span class="required">*</span></label>
													<select id="keycapburningmethod" name="keycapburningmethod" >
														<option value="이중사출 키캡">이중사출 키캡</option>
														<option value="한/영 이중사출 키캡">한/영 이중사출 키캡</option>
														<option value="레이저각인 키캡">레이저각인 키캡</option>
														<option value="no">no</option>
													</select> 									
												</div>
												<div class="shop-select">
													<label>simultaneousinput<span class="required">*</span></label>
													<select id="ledbacklight" name="ledbacklight" >
														<option value="레인보우 백라이트">레인보우 백라이트</option>
														<option value="RGB 백라이트">RGB 백라이트</option>
														<option value="단색 백라이트">단색 백라이트</option>
														<option value="no">no</option>
													</select> 									
												</div>
												<div class="checkbox">
													<label>
														<span><input type="checkbox" id="fabriccable" name="fabriccable" /></span>
														fabriccable
													</label>
												</div>
												<div class="checkbox">
													<label>
														<span><input type="checkbox" id="removablecable" name="removablecable" /></span>
														removablecable
													</label>
												</div>
												<div class="checkbox">
													<label>
														<span><input type="checkbox" id="multipairing" name="multipairing" /></span>
														multipairing
													</label>
												</div>
												<div class="checkbox">
													<label>
														<span><input type="checkbox" id="builtinusbhub" name="builtinusbhub" /></span>
														builtinusbhub
													</label>
												</div>
												<div class="checkbox">
													<label>
														<span><input type="checkbox" id="cherrystylestabilizer" name="cherrystylestabilizer" /></span>
														cherrystylestabilizer
													</label>
												</div>
												<div class="checkbox">
													<label>
														<span><input type="checkbox" id="lifewaterproofing" name="lifewaterproofing" /></span>
														lifewaterproofing
													</label>
												</div>
												<div class="checkbox">
													<label>
														<span><input type="checkbox" id="touchpad" name="touchpad" /></span>
														touchpad
													</label>
												</div>
												<div class="checkbox">
													<label>
														<span><input type="checkbox" id="trackball" name="trackball" /></span>
														trackball
													</label>
												</div>
												<div class="checkbox">
													<label>
														<span><input type="checkbox" id="motionsensor" name="motionsensor" /></span>
														motionsensor
													</label>
												</div>
												<div class="checkbox">
													<label>
														<span><input type="checkbox" id="smartkeyboard" name="smartkeyboard" /></span>
														smartkeyboard
													</label>
												</div>
												<div class="checkbox">
													<label>
														<span><input type="checkbox" id="switchrudder" name="switchrudder" /></span>
														switchrudder
													</label>
												</div>
												<div class="checkbox">
													<label>
														<span><input type="checkbox" id="siliconkeyskin" name="siliconkeyskin" /></span>
														siliconkeyskin
													</label>
												</div>
												<div class="checkbox">
													<label>
														<span><input type="checkbox" id="plasticcover" name="plasticcover" /></span>
														plasticcover
													</label>
												</div>
												<div class="checkbox">
													<label>
														<span><input type="checkbox" id="Integralwristrest" name="Integralwristrest" /></span>
														Integralwristrest
													</label>
												</div>
												<div class="checkbox">
													<label>
														<span><input type="checkbox" id="detachablewristrest" name="detachablewristrest" /></span>
														detachablewristrest
													</label>
												</div>
												<div class="checkbox">
													<label>
														<span><input type="checkbox" id="keycapremover" name="keycapremover" /></span>
														keycapremover
													</label>
												</div>
												<div class="checkbox">
													<label>
														<span><input type="checkbox" id="cleaningbrush" name="cleaningbrush" /></span>
														cleaningbrush
													</label>
												</div>
												<div class="shop-select">
													<label>replacementkeycaps<span class="required">*</span></label>
													<select id="replacementkeycaps" name="replacementkeycaps" >
														<option value="3개">3개</option>
														<option value="8개">8개</option>
														<option value="10개">10개</option>
														<option value="no">no</option>
													</select> 									
												</div>
												<p class="form-row">
													<input type="text" id="width" name="width" placeholder="width" />
												</p>
												<p class="form-row">
													<input type="text" id="length" name="length" placeholder="length" />
												</p>
												<p class="form-row">
													<input type="text" id="height" name="height" placeholder="height" />
												</p>
												<p class="form-row">
													<input type="text" id="weight" name="weight" placeholder="weight" />
												</p>
												<p class="form-row">
													<input type="text" id="cablelength" name="cablelength" placeholder="cablelength" />
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
													<textarea name="content" id="content" rows="4" cols="80" placeholder="내용을 입력해주세요"></textarea>
													<script>
													CKEDITOR.replace("content",{
														filebrowserUploadUrl : "${path}/keyboard/imageUpload.do"
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