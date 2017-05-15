<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<%@ include file="adminheader.jsp"%>
<script src="${path}/resources/admin/num/jquery.color.min.js"></script>
<script src="${path}/resources/admin/num/jquery.animateNumber.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
});
</script>
<link rel="stylesheet" media="screen" href="${path}/resources/recommendation/particles/css/style.css">
<div class="wrapper">
<%@ include file="adminsidebar.jsp"%>
    <div class="main-panel" style=" overflow-x: hidden;">
<%@ include file="admininsideheader.jsp"%>
        <div class="content" style="width: 100%;height: 130%;">
            <div id="particles-js" class="container-fluid" style="width: 100%;height: 100%;">
			<!-- scripts -->
			<script src="${path}/resources/recommendation/particles/particles.js"></script>
			<script src="${path}/resources/recommendation/particles/js/app.js"></script>  	
                <div class="row" style="padding-top: 5%;">
                     <div class="col-md-2"></div>
                     <div class="col-md-4">
                        <div class="card">
                            <div class="header" style="text-align: center">
                            	<h4 class="title" style="font-family: yanolja;font-size: 37px">
                            	<i class="pe-7s-diskette"></i>공태선</h4>
                            	<h4 class="title" id="one" 
                                style="padding:10px;margin: 5px;font-family: yanolja;font-size: 20px">총괄 및 기획<br/>
                                </h4>
                            </div>
                        </div>
                    </div>
                     <div class="col-md-4">
                        <div class="card">
                            <div class="header" style="text-align: center">
                            	<h4 class="title" style="font-family: yanolja;font-size: 37px">
                            	<i class="pe-7s-crop"></i>김한상</h4>
                            	<h4 class="title" id="one" 
                                style="padding:10px;margin: 5px;font-family: yanolja;font-size: 20px">Spring & Web<br/>
                                </h4>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                     <div class="col-md-2"></div>
                     <div class="col-md-4">
                        <div class="card">
                            <div class="header" style="text-align: center">
                            	<h4 class="title" style="font-family: yanolja;font-size: 37px">
                            	<i class="pe-7s-edit"></i>오세덕</h4>
                            	<h4 class="title" id="one" 
                                style="padding:10px;margin: 5px;font-family: yanolja;font-size: 20px">크롤링 & UI<br/>
                                </h4>
                            </div>
                        </div>
                    </div>
                     <div class="col-md-4">
                        <div class="card">
                            <div class="header" style="text-align: center">
                            	<h4 class="title" style="font-family: yanolja;font-size: 37px">
                            	<i class="pe-7s-display1"></i>양태욱</h4>
                            	<h4 class="title" id="one" 
                                style="padding:10px;margin: 5px;font-family: yanolja;font-size: 20px">검색엔진 & 알고리즘<br/>
                                </h4>
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
<%@ include file="adminfooter.jsp"%>
    </div>
</div>
</body>
</html>
