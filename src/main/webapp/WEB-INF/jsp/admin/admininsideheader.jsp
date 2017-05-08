<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
function searchcard(){
  if($("#searchcard").css("display") == "none"){
      $("#searchcard").show();
  } else {
      $("#searchcard").hide();
  }
}
</script>
<nav class="navbar navbar-default navbar-fixed">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example-2">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#" style="font-size: 15px">${sessionScope.admin}관리자님 환영합니다.</a>
                    
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                           <a href="${path}/admin/inter/login.do">
                               <p>Change admin</p>
                            </a>
                        </li>
						<c:if test="${sessionScope.adminlevel == 's'}" >
                        <li class="dropdown">
                              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <p>
										Super Admin
										<b class="caret"></b>
									</p>
                              </a>
	                              <ul class="dropdown-menu">
	                                <!-- <li class="divider"></li> -->
	                                <li><a href="#">관리자 현황</a></li>
	                                <li><a href="#">관리자 관리</a></li>
	                              </ul>						
                        </li>
	    				</c:if>
                        <li>
                            <a href="#">
                                <p>Log out</p>
                            </a>
                        </li>
						<li class="separator hidden-lg hidden-md"></li>
                    </ul>
                </div>
                 <div class="row" id="searchcard" style="display:none">
		                    <div class="col-md-12">
		                        <div class="card">
		                            <div class="content">
		                                <form>
		                                    <div class="row">
		                                        <div class="col-md-6">
		                                            <div class="form-group">
		                                                <label>기간~</label>
		                                                <input type="text" id="datepicker1" class="form-control" placeholder="" >
		                                            </div>
		                                        </div>
		                                        <div class="col-md-6">
		                                            <div class="form-group">
		                                                <label>기간</label>
		                                                <input type="text"  id="datepicker2"class="form-control" placeholder="">
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="row">
		                                        <div class="col-md-8">
		                                            <div class="form-group">
		                                                <label>검색어</label>
		                                                <input type="text" class="form-control" placeholder="" >
		                                            </div>
		                                        </div>
		                                        <div class="col-md-4" style=" padding: 27px 1% 1% 1%;">
		                                            <button type="submit" class=" " style="margin 0;width:80px;">검색</button>                                       
		                                        </div>
		                                    </div>
		                                    <div class="clearfix"></div>
		                                </form>
		                            </div>
		                        </div>
		                    </div>
            </div>
		   		 	</div>
        </nav>
