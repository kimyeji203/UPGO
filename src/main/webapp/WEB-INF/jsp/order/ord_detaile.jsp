<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
$(document).ready(function(){
	if("${myOrd.cop_no}" != ""){
		$("#cop_no").val("${myOrd.cop_no}").prop("selected",true);
	}
	if("${myOrd.prod_no}"!=""){
		$("#prod_no").val("${myOrd.prod_no}").prop("selected",true);
	}
	
	$("#prod_no").change(function(){
		$("#ord_count").val("");
		$("#ord_price").val("");
	});
	$("#ord_count").change(function(){
	    var user = $("#prod_no option:selected");
		
		var count = $("#ord_count").val().trim();
		var prod = user.attr("data-price");
		var price = Number(count) * Number(prod);
		$("#ord_price").val(price);
	});


});
</script>

<body>
<div class="container">
<div class="col-xs-12">
<label style="font-size:20px;"><span class="glyphicon glyphicon-list-alt"></span>주문 상세 보기</label>
</div>
<form id="publicForm" name="detailForm" action="/ordUpdate.do">
	<table class="table">
		<tr>
			<th>주문 번호</th>
			<th><input type="text" readonly class="form-control" name="ord_no" value="${myOrd.ord_no }"></th>
			<th>주문 날짜</th>
			<td colspan="2"><input type="text" class="form-control" name="ord_date" value="${myOrd.ord_date} "></td>
		</tr>
		<tr>
			<th>주문자</th>
			<td><input type="text" class="form-control" name="ord_name" value="${myOrd.ord_name}"></td>
			<th>주문 업체</th>
			<td colspan="2">
				<select id="cop_no" name="cop_no" class="form-control">
					<option value="">선택</option>
					<c:forEach var="cop" items="${copList }" varStatus="status">
						<option value="${cop.cop_no }">${cop.cop_no}  |  ${cop.cop_name}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<th>주문 상품</th>
			<td>
				<select name="prod_no" id="prod_no" class="form-control">
					<option value=''>선     택</option>
					<c:forEach items='${showProd}' var='item'>
						<option value='${item.prod_no}' data-cop="${item.cop_no }" data-price="${item.prod_price }">${item.cop_no}  | ${item.prod_name}</option>
					</c:forEach>
				</select>
			</td>
			<th>주문 수량</th>
			<td><input type="text" class="form-control" id="ord_count" name="ord_count" value="${myOrd.ord_count}"></td>
			<td><input type="text" class="form-control" readonly id="ord_price" name="ord_price" value="${myOrd.ord_price }"></td>
		</tr>
		<tr>
			<th>연락 이메일</th>
			<td colspan="4"><input type="text" class="form-control" id="ord_email" name="ord_email" value="${myOrd.ord_email }"></td>
		</tr>
		<tr>
			<th>배송지</th>
			<td colspan="4"><input type="text" class="form-control" id="ord_addr" name="ord_addr" value="${myOrd.ord_addr }"></td>
		</tr>
		<tr>
			<th>요구사항</th>
			<td colspan="4"><textarea class="form-control" name="ord_want">${myOrd.ord_want }</textarea></td>
		</tr>
	</table>
	<div id="btnDiv">
		<input type="button" class="btn btn-default" onclick="fnc_update()" value="수정">
		<input type="button" class="btn btn-default" onclick="fnc_delete(${myOrd.ord_no})" value="삭제">
		<input type="button" class="btn btn-default" onclick="location.href='/ord_list.do'" value="목록">
	</div>
</form>

</div>
</body>
</html>

<script>
function fnc_delete(no){
	if(confirm("삭제하시겠습니까?")){
		location.href="/ordDelete.do?ord_no=" + no;
	}
}
function fnc_update(){
	if(confirm("수정하시겠습니까?")){

		if(fnc_check()){
			document.detailForm.submit();
		}
		
	}
}
function fnc_check(){
	   var prod = $("#prod_no option:selected");
	   var cop = $("#cop_no option:selected");
		
	   if(cop.attr("value") != prod.attr("data-cop")){
	      alert("업체와 상품이 일치하지 않습니다.");
			return false;
	   }else{
	      return true;
	   }
	}

</script>
</layoutTag:layout>