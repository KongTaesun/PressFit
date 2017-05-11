<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<head>
	<meta charset="utf-8" />
	<link rel="icon" type="image/png" href="assets/img/favicon.ico">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<style>@font-face{font-family: 'Connoisseurs';src: url('${path}/resources/font/Connoisseurs.ttf')}
	/* @font-face{font-family: 'yanolja';src: url('${path}/resources/font/야놀자 야체 Bold.ttf')} */</style>
	<title>Admin</title>
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
    <!-- Bootstrap core CSS     -->
    <link href="${path}/resources/admin/assets/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Animation library for notifications   -->
    <link href="${path}/resources/admin/assets/css/animate.min.css" rel="stylesheet"/>
    <!--  Light Bootstrap Table core CSS    -->
    <link href="${path}/resources/admin/assets/css/light-bootstrap-dashboard.css" rel="stylesheet"/>
    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="${path}/resources/admin/assets/css/demo.css" rel="stylesheet" />
    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
    <link href="${path}/resources/admin/assets/css/pe-icon-7-stroke.css" rel="stylesheet" />
    <!--   Core JS Files   -->
    <script src="${path}/resources/admin/assets/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="${path}/resources/admin/assets/js/bootstrap.min.js" type="text/javascript"></script>
	<!--  Checkbox, Radio & Switch Plugins -->
	<script src="${path}/resources/admin/assets/js/bootstrap-checkbox-radio-switch.js"></script>
	<!--  Charts Plugin -->
	<script src="${path}/resources/admin/assets/js/chartist.min.js"></script>
    <!--  Notifications Plugin    -->
    <script src="${path}/resources/admin/assets/js/bootstrap-notify.js"></script>
        <!--  Light Bootstrap Table core CSS    -->
    <link href="${path}/resources/admin/assets/css/light-bootstrap-dashboard.css" rel="stylesheet"/>
    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="${path}/resources/admin/assets/css/demo.css" rel="stylesheet" />
</head>
<style>
.dialog__trigger, .dialog__action {
  border: 3px solid #ffffff;
  background: #ffffff;
  padding: 15px 20px;
  font-size: 1.1rem;
  text-transform: uppercase;
  display: block;
  -webkit-transition: all 150ms ease-out;
  transition: all 150ms ease-out;
  float: left;
  -webkit-transform: translateY(0px);
          transform: translateY(0px);
}
.dialog__trigger:hover, .dialog__trigger:focus, .dialog__action:hover, .dialog__action:focus {
  outline: 0;
  -webkit-transform: translateY(-5px);
          transform: translateY(-5px);
  -webkit-transition: all 100ms ease-in;
  transition: all 100ms ease-in;
  box-shadow: 0 5px 10px rgba(51, 51, 51, 0.4);
  float: left;
}
.dialog__trigger:active, .dialog__action:active {
  -webkit-transform: translateY(-3px);
          transform: translateY(-3px);
}

.dialog {
  background: #ffffff;
  width: 70%;
  position: absolute;
  left: calc(50% - 35%);
  top: 0;
  padding: 30px;
  box-shadow: 0 10px 30px rgba(51, 51, 51, 0.4);
  border: 3px solid #333333;
  visibility: hidden;
  opacity: 0;
  -webkit-transition: all 180ms ease-in;
  transition: all 180ms ease-in;
  float: left;
}
@media (max-width: 600px) {
  .dialog {
    width: 90%;
    left: calc(50% - 45%);
  }
}
.dialog.dialog--active {
  top: 10%;
  visibility: visible;
  opacity: 1;
  -webkit-transition: all 250ms ease-out;
  transition: all 250ms ease-out;
}
.dialog .dialog__close {
  font-size: 2rem;
  line-height: 2rem;
  position: absolute;
  right: 15px;
  top: 15px;
  cursor: pointer;
  padding: 15px;
  -webkit-transition: color 150ms ease;
  transition: color 150ms ease;
}
.dialog .dialog__close:hover {
  color: #E74C3C;
}
.dialog .dialog__title {
  font-size: 2rem;
  font-family: 'Slabo 27px', serif;
  font-weight: 100;
  margin: 0;
  padding: 0 0 15px 0;
  border-bottom: 2px solid #333333;
}
.dialog .dialog__content {
  font-size: 1.1rem;
  line-height: 2rem;
}
.dialog .dialog__action {
  margin: 0;
  font-size: 1rem;
}
</style>