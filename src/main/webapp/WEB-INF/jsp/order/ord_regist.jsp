<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>
<layoutTag:layout>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resource/res/css/ord.css">
</head>

<script src="http://code.jquery.com/jquery.js"></script>
<script>
$(function(){
	$("#prod_no").change(function(){
		$("#ord_count").val("");
		$("#ord_price").val("");
	});
	$("#ord_count").change(function(){
	    var user = $("#prod_no option:selected");

	    var count = $("#ord_count").val().trim();
		var prod = user.attr("data-price");

		if(prod == "none"){
			alert("상품을 먼저 선택해주시기 바랍니다.");
			$("#ord_count").val("");
		}else{
			var price = Number(count) * Number(prod);
			$("#ord_price").val(price);
		}
	});

});
</script>

<body>
<div class="container">
<div class="col-xs-12">
	<label style="font-size:20px;"><span class="glyphicon glyphicon-list-alt"></span>주문 하기</label>
</div>
<form id="publicForm" name="registForm" action="/ordRegist.do">
	<table class="table">
		<tr>
			<th>주문자</th>
			<td colspan="3"><input type="text"  class="form-control" name="ord_name" placeholder="이름"></td>
			
		</tr>
		<tr>
			<th>주문 업체</th>
			<td>
				<select name="cop_no" id="cop_no" class="form-control">
					<option value="" selected>선      택</option>
					<c:forEach var="cop" items="${copList }" varStatus="status">
						<option value="${cop.cop_no }">${cop.cop_no}  |  ${cop.cop_name}</option>
					</c:forEach>
				</select>
			</td>
			<th>상품 명</th>
			<td>
				<select name="prod_no" id="prod_no" class="form-control">
					<option value='' data-price="none">선     택</option>
					<c:forEach items='${showProd}' var='item'>
						<option value='${item.prod_no}' data-cop="${item.cop_no }" data-price="${item.prod_price }">${item.cop_no}  | ${item.prod_name}</option>
					</c:forEach>
				</select>
			</td>

		</tr>
		<tr>
			<th>주문 수량</th>
			<td><input type="text" class="form-control" id="ord_count" name="ord_count" placeholder="주문할 상품의 수량"></td>
			<th>결제 가격</th>
			<td><input type="text" id="ord_price" class="form-control" name="ord_price" placeholder="자동계산 됩니다." readonly></td>
		</tr>
		<tr>
			<th>연락 이메일</th>
			<td colspan="3"><input type="text" id="ord_email" class="form-control" name="ord_email" placeholder="연락받을 이메일을 입력해 부세요."></td>
		</tr>
		<tr>
			<th>배송지</th>
			<td colspan="3"><input type="text" id="ord_addr" class="form-control" name="ord_addr" placeholder="주문을 수령할 배송지를 입력해주세요."></td>
		</tr>
		<tr>
			<th>요구사항</th>
			<td colspan="3"><textarea class="form-control" name="ord_want" placeholder="주문시 요구사항을 작성해 주세요."></textarea></td>
		</tr>
	</table>
	<div id="btnDiv">
		<input type="button" class="btn btn-default" onclick="fnc_cancel()" value="취소">
		<input type="button" class="btn btn-default" value="주문" onclick="fnc_check()">
	</div>
</form>
</div>
</body>
</html>
</layoutTag:layout>

<script>
function fnc_cancel(){
	location.href="/ord_list.do";
}
function fnc_check(){
	var prod = $("#prod_no option:selected");
	var cop = $("#cop_no option:selected");

	if(cop.attr("value") != prod.attr("data-cop")){
		alert("업체와 상품이 일치하지 않습니다.");
		$("#cop_no").val("");
		$("#prod_no").val("");

	}else{
		document.registForm.submit();
	}
}
</script>