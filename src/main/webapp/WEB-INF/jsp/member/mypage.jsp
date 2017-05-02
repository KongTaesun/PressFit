<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${path}/include/js/common.js"></script>
<%@ include file="/resources/include/header.jsp"%>
<style>
.breadcrumbs-area {
	background-image:
		url('${path}/resources/writer/img/bigpicture/mypage_img.png');
}
</style>
<style>
.fileDrop {
	width: 100%;
	height: 200px;
	border: 1px dotted blue;
}
small {
	margin-left: 3px;
	font-weight: bold;
	color: gray;
}
</style>

<script>
$(document).ready(function(){
// # : id , . : class
// 태그.on("이벤트", "자손태그", 이벤트핸들러 )
// data: "fileName="+$(this).attr("data-src")
// 태그.attr("속성")
// $("#userid").attr("type")
 	$(".uploadedList").on("click","span",function(event){
		var that=$(this); //클릭한 span 태그
		$.ajax({
			url: "${path}/upload/deleteFile",
			type: "post",
			data: {fileName:$(this).attr("data-src")},
			dataType: "text",
			success: function(result){
				if( result == "deleted") {
		// 클릭한 span 태그가 속한 div를 제거					
					that.parent("div").remove();
				}
			}
		});
	});
	// 클래스가 fileDrop인 태그
	$(".fileDrop").on("dragenter dragover", function(event){
		event.preventDefault(); //기본 효과를 막음
	});
// event : jquery의 이벤트
// originalEvent : javascript의 이벤트
	$(".fileDrop").on("drop",function(event){
		//기본 효과를 막음
		event.preventDefault();
		//드래그된 파일 정보
		var files=event.originalEvent.dataTransfer.files;
		//첫번째 파일
		var file=files[0];
		console.log(file);
		//ajax로 전달할 폼 객체
		var formData = new FormData();
		//폼 객체에 파일 추가, append("변수명",값)
		formData.append("file",file);
// processData:false=> post방식
// contentType: false=> multipart/form-data		
		$.ajax({
			type: "post",
			url: "${path}/upload/uploadAjax",
			data: formData,
			dataType: "text",
			processData: false,
			contentType: false,
			success: function(data){
				//alert(data);
console.log(data);
var str="";
if(checkImageType(data)){ //이미지 파일일 경우
	str= 
"<div><a href='${path}/upload/displayFile?fileName="
+getImageLink(data)+"'>";
	str+=
"<img src='${path}/upload/displayFile?fileName="
			 +data+"'></a>";
}else{ //이미지가 아닐 경우
	str= "<div>"
	str+=
	 "<a href='${path}/upload/displayFile?fileName="
	 +data+"'>"+getOriginalName(data)+"</a>";
}
str+= "<span data-src="+data+">[삭제]</span></div>";
$(".uploadedList").append(str);
			}
		});
	});	
});
function getOriginalName(fileName){
	if( checkImageType(fileName)){
		return;
	}
	//uuid를 제외한 원래 파일 이름을 리턴
	var idx=fileName.indexOf("_")+1;
	return fileName.substr(idx);
}
function getImageLink(fileName){
	if(!checkImageType(fileName)){ //이미지 형식이 아니면
		return; //함수 종료
	}
	//이미지 파일이면
//   /2016/11/29/s_05ad4ecf-475a-4463-840c-50476423d9d4_Jellyfish.jpg	
	var front=fileName.substr(0,12); //연월일 경로 추출
	var end=fileName.substr(14); //s_ 제거
	console.log(front);
	console.log(end);
	return front+end;
}
function checkImageType(fileName){
// i : ignore case(대소문자 무관)	
	var pattern= /jpg|gif|png|jpeg/i; //정규표현식
	return fileName.match(pattern); //규칙에 맞으면 true
}
</script>

<body>
<!-- Breadcrumbs Area Start -->
	<div class="breadcrumbs-area">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="breadcrumbs">
						<h2>My Account</h2>
						<ul class="breadcrumbs-list">
							<li><a title="Return to Home" href="index.html">Home</a></li>
							<li>My Account</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

<div class="login-account section-padding">
		<div class="container" style="display:table ;width: 700px;text-align: center">

	<!-- About Us Area Start -->
		<div class="about-us-area section-padding">
		    <div class="container">
                <div class="row">
                    <div class="about-top-inner">
                        <div class="col-md-6">
                            <div class="about-inner">
                                <div class="about-title">
                                    <h2>마이페이지</h2>
                                </div>
                                <div class="about-content">
                                   
                                     <p class="form-row">
						아이디 ${vo.id} 
					</p>
								
					<p class="form-row">
						이름  ${vo.name} 
					</p>

					<p class="form-row">
						성별
					</p>

					<p class="form-row">
						생년월일 ${vo.birth} 
					</p>

					<p class="form-row">
						이메일 ${vo.email}
					</p>
					<p class="form-row">
						전화번호 ${vo.hp}
					</p>					
					<p class="form-row">
						주소
						${vo.address} 
					</p>
                                         
                                    <p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="about-image">
                                <div class="card animated fadeIn">
                                
                                
                                
         <center><img class="center animated rollIn" src="${path}/resources/writer/img/ava.png" alt="avatar"></center>
<h2>Ajax File Upload</h2>
<!-- 파일을 업로드할 영역 -->
<div class="fileDrop"></div>

         
         
         
         
         <hr>
         <div class="name">
            ${vo.id} 
         </div>
         <p class="subtitle">Student</p>
         <p class="icons animated pulse">
            <a href="https://twitter.com/" target="_blank">
            <span class="fa-stack fa-lg">
                <i class="fa fa-circle-thin fa-stack-2x"></i> 
                <i class="fa fa-twitter fa-stack-1x"></i>
            </span>
            </a>
            <a href="https://www.facebook.com/" target="_blank">
            <span class="fa-stack fa-lg">
                <i class="fa fa-circle-thin fa-3x fa-stack-2x"></i>     
                <i class="fa fa-facebook fa-stack-1x"></i>
            </span>
            </a>
            <a href="https://google.com/" target="_blank">
            <span class="fa-stack fa-lg">
                <i class="fa fa-circle-thin fa-stack-2x"></i>
                <i class="fa fa-google-plus fa-stack-1x"></i>
            </span>
            </a>
            <a href="https://www.instagram.com/" target="_blank">
            <span class="fa-stack fa-lg">
                <i class="fa fa-circle-thin fa-stack-2x"></i>
                <i class="fa fa-instagram fa-stack-1x"></i>
            </span>
            </a>
            <a href="https://github.com/" target="_blank">
            <span class="fa-stack fa-lg">
                <i class="fa fa-circle-thin fa-stack-2x"></i>
                <i class="fa fa-github fa-stack-1x"></i>
            </span>
            </a>
         </p>
      </div>
	</div>
</div>
                            </div>
                        </div>
                    </div>
                    <div class="about-bottom-inner">
                        <div class="col-md-6">
                            <div class="about-image">
                                <img src="img/about/2.jpg" alt="">
                            </div>
                        </div>
                        <div class="col-md-6">  
                            <div class="about-inner">
                                <div class="about-title">
                                    <h2>Mission and Vission</h2>
                                </div>
                                <div class="about-content">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elitss ed do eiusmod tempor incididunt ut labore et dolore mag na aliqua. Utes enim ad minim veniam, quis nostrud exerck itation ullam co laboris nisi ut aliquip ex ea commodo coes nsequat. Duis aute irure dolor in reprehenderit in.</p>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elitss ed do eiusmod tempor incididunt ut labore et dolore mag na aliqua. Utes enim ad minimLorem ipsum dolor sit amet, consectetur adipisicing elitss ed do eiusmod tempor incididunt ut labore et dolore mag na aliqua. </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
		    </div>
		</div>
		<!-- About Us Area End -->
 
	<h2>마이페이지</h2>  
	
   
	
	<%@ include file="/resources/include/footer.jsp"%>
	
</body>
</html>

















