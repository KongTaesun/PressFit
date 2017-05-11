<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PressFit</title>
</head>

<%@ include file="/resources/include/header.jsp" %> 
<body>


 <h3>주문/배송상세</h3>
 
 결제 정보
 
 	<div id="collapseFive" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFive">
									<div class="panel-body no-padding">
										<div class="order-review" id="checkout-review">    
											<div class="table-responsive" id="checkout-review-table-wrapper">
												<table class="data-table" id="checkout-review-table">
													<thead>
														<tr>
															<th rowspan="1" style="width:50%">상품명</th>
															<th colspan="1" style="width:25%">주문금액</th>
															<th rowspan="1" style="width:25%">수량 합계 금액</th>
														</tr>
													</thead>
													<tbody>
													<c:forEach var="row" items="${map.list}">
														<tr>
															<td id="aaa">${row.modelname}</td>
															<td id="aaa"><fmt:formatNumber pattern="###,###,###" value="${row.price}"/>원</td>
															<td id="aaa"><fmt:formatNumber pattern="###,###,###" value="${row.money}"/>원</td>
														</tr>
													</c:forEach>
													</tbody>
													<tfoot id="bbb">
														<tr>
															<td colspan="2">전체 합계 금액 : </td>
															<td><fmt:formatNumber pattern="###,###,###" value="${map.sumMoney}"/>원</td>
															<td></td>
														</tr>
														<tr>
															<td colspan="2">배송비 (10만원 이상 배송비 무료)</td>
															<td><span class="check-price"><fmt:formatNumber pattern="###,###,###" value="${map.fee}"/>원</span></td>
														</tr>
														<tr>
															<td colspan="2"><strong>총 결제 금액 (전체 합계 금액 + 배송비)</strong></td>
															<td><strong><fmt:formatNumber pattern="###,###,###" value="${map.allSum }"/>원</strong></td>
														</tr>
													</tfoot>
												</table>
											</div>
										</div>
									</div>
								</div>
 <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                            <div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingTwo">
									<h4 class="panel-title">
										<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
										   <span>1</span>
										   배송 정보
										</a>
									</h4>
								</div>
								<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
									<div class="panel-body">
										<div class="row">
											<c:forEach var="row" items="${map.memberInfo}">
											<div class="col-md-12"><p>
													받으시는 분 : <input type="text" value="${row.name}" style="border:0" readonly="readonly">
													</p>
											</div><br/>
											<div class="col-md-12"><p>
													주소 : <input type="text" value="${row.address}" style="border:0" readonly="readonly">
													</p>
											</div>
											<div class="col-md-12"><p>
													휴대전화 : <input type="text" value="${row.hp}" style="border:0" readonly="readonly">
													</p>
											</div>
											<div class="col-md-12"><p>
													e-mail : <input type="text" value="${row.email}" style="border:0" readonly="readonly">
													</p>
											</div>
											</c:forEach>									
										</div>
									</div>
								</div>
                            </div>

<div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
									<div class="panel-body no-padding">
										<div class="payment-met">
											
												<ul class="form-list">
													<li class="control">
														<input type="radio" class="radio" name="methodpayment" id="methodpayment" value="무통장입금">
														<label for="p_method_checkmo">무통장입금</label>
													</li>
													<li class="control">
														<input type="radio" class="radio" name="methodpayment" id="methodpayment" value="신용카드">
														<label for="p_method_ccsave">신용카드</label>
													</li>
												</ul>
										
											<div class="buttons-set">
												<button class="btn btn-default">CONTINUE</button>
											</div>
										</div>
									</div>
								</div>


</body>
</html>