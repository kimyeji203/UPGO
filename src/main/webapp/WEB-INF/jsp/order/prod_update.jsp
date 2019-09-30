<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>
<layoutTag:layout>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품수정</title>
<!-- <script type="text/javaScript" language="javascript" defer="defer">
</script> -->
</head>
<body>
<div class="container">
<form id="updateProdForm" name="updateProdForm" action="/prod_update.do" method="post">
	<table class="table">
		<c:forEach var="item" items="${ProdData}" varStatus="status">
			<input type="hidden" id="prod_no" name="prod_no" value="${item.prod_no}"></input>
			<tr>
				<td>업체번호</td>
				<td><input type="text" class="form-control" id="cop_no" name="cop_no" value="${item.cop_no}"></td>
			</tr>
			<tr>
				<td>상품명</td>
				<td><input type="text" class="form-control" id="prod_name" name="prod_name" value="${item.prod_name}"></td>
			</tr>
			<tr>
				<td>단품 가격</td>
				<td><input type="text" class="form-control" id="prod_price" name="prod_price" value="${item.prod_price}"></td>
			</tr>
			<tr>
				<td>재고</td>
				<td><input type="text" class="form-control" id="prod_stock" name="prod_stock" value="${item.prod_stock}"></td>
			</tr>
			<tr>
				<td>상품 설명</td>
				<td><input type="text" class="form-control" id="prod_content" name="prod_content" value="${item.prod_content}"></td>
			</tr>
	<!--		<tr> 
				<td>상품 사진</td>
				<td><input type="file" id="prod_photo" name="prod_img" accept="image/*"></td>
			</tr> -->
		</c:forEach>
	</table>
	<input type="submit" class="btn btn-default" value="수정하기"></input>
</form>
</div>
</body>
</html>
</layoutTag:layout>