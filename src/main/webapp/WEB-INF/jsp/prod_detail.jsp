<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>
<layoutTag:layout>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세보기</title>
<script type="text/javaScript" language="javascript" defer="defer">
function fn_prod_list() {
	location.href = "/prod_list"
}
function fn_prod_update(pno) {
	location.href = "/prod_update?no="+pno
}
function fn_prod_delete(pno) {
	location.href = "/prod_delete.do?no="+pno
}
</script>
</head>
<body>
<div class="container" style="border-left:1px solid grey; border-right:1px solid grey;">
	<table class="table table-hover">
		<c:forEach var="item" items="${ProdData}" varStatus="status">
			<tr>
				<td>업체번호</td>
				<td><c:out value="${item.cop_no}"></c:out></td>
			</tr>
			<tr>
				<td>상품번호</td>
				<td><c:out value="${item.prod_no}"></c:out></td>
			</tr>
			<tr>
				<td>등록일자</td>
				<td><c:out value="${item.prod_date}"></c:out></td>
			</tr>		
			<tr>
				<td>상품명</td>
				<td><c:out value="${item.prod_name}"></c:out></td>
			</tr>
			<tr>
				<td>단품 가격</td>
				<td><c:out value="${item.prod_price}"></c:out></td>
			</tr>
			<tr>
				<td>재고</td>
				<td><c:out value="${item.prod_stock}"></c:out></td>
			</tr>
			<tr>
				<td>상품 설명</td>
				<td><c:out value="${item.prod_content}"></c:out></td>
			</tr>
			<tr>
				<td>상품 사진</td>
				<td></td>
			</tr>
			<input type="button" id="btn_submit" class="btn btn-default"  value="목록보기" onClick="javascript:fn_prod_list()"></input>
			<input type="button" id="btn_submit" class="btn btn-default"  value="수정하기" onClick="javascript:fn_prod_update(${item.prod_no})"></input>
			<input type="button" id="btn_delete" class="btn btn-default"  value="삭제하기" onClick="javascript:fn_prod_delete(${item.prod_no})"></input>
		</c:forEach>
	</table>
</div>
</body>
</html>
</layoutTag:layout>