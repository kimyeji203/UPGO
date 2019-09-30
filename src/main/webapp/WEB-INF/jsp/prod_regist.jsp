<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>
<layoutTag:layout>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록</title>
<script type="text/javaScript" language="javascript" defer="defer">
function fn_submit() {
	location.href = "/prod_regist.do"
}
</script>
</head>
<body>
<div class="container">
<!--<input type="button" id="btn_submit" value="등록하기" onClick="javascript:fn_submit()"></input>-->
<form id="registProdForm" name="registProdForm" action="/prod_regist.do" method="post">
	<table>
		<tr>
			<td>업체번호</td>
			<td><input type="text" id="cop_no" name="cop_no" placeholder="ww"></td>
		</tr>
		<tr>
			<td>상품명</td>
			<td><input type="text" id="prod_name" name="prod_name" placeholder="ww"></td>
		</tr>
		<tr>
			<td>단품 가격</td>
			<td><input type="text" id="prod_price" name="prod_price" placeholder="ww"></td>
		</tr>
		<tr>
			<td>재고</td>
			<td><input type="text" id="prod_stock" name="prod_stock" placeholder="ww"></td>
		</tr>
		<tr>
			<td>상품 설명</td>
			<td><input type="text" id="prod_content" name="prod_content" placeholder="ww"></td>
		</tr>
<!--		<tr> 
			<td>상품 사진</td>
			<td><input type="file" id="prod_photo" name="prod_img" accept="image/*"></td>
		</tr> -->
	</table>
	<input type="submit" value="등록하기"></input>
</form>
</div>
</body>
</html>
</layoutTag:layout>