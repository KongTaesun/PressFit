<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<%@ include file="adminheader.jsp"%>
<link rel="stylesheet" media="screen" href="${path}/resources/recommendation/particles/css/style.css">
<div class="wrapper">
<%@ include file="adminsidebar.jsp"%>
    <div class="main-panel">
<%@ include file="admininsideheader.jsp"%>
        <div id="particles-js" class="content">
            <div class="container-fluid">
			<!-- scripts -->
			<script src="${path}/resources/recommendation/particles/particles.js"></script>
			<script src="${path}/resources/recommendation/particles/js/app.js"></script>  	
                <div class="row">
                </div>
            </div>
        </div>
<%@ include file="adminfooter.jsp"%>
    </div>
</div>
</body>
</html>
