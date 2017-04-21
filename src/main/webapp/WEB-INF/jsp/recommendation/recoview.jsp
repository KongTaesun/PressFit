<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 작성</title>

  <link rel="stylesheet" href="<c:url value='/resources/recommendation/css/style.css' />" />
  <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
  <script type='text/javascript' src="<c:url value='/resources/recommendation/jquery.particleground.js' />"></script>

  <%@ include file="/resources/include/header.jsp"%>
  <script src="<c:url value='/resources/include/commons.js' />"></script>
<script>
document.addEventListener('DOMContentLoaded', function () {
	  particleground(document.getElementById('particles'), {
	    dotColor: '#32B5F3',
	    lineColor: '#32B5F3'
	  });
	  var intro = document.getElementById('intro');
	  intro.style.marginTop = - intro.offsetHeight / 2 + 'px';
	}, false);
</script>

</head>
<body>

<div id="particles">
  <div id="intro">
    
  </div>
</div>

</body>
	<%@ include file="/resources/include/footer.jsp" %>
</html>