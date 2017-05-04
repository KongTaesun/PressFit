<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

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

</body>
</html>