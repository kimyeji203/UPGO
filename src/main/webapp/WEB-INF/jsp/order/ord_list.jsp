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

</script>

<body>
<div class="container">
<form id="publicForm" name="cop_listForm" action="/ord_regist.do">
	<div class="col-xs-12">
		<label style="font-size:20px;"><span class="glyphicon glyphicon-list-alt"></span>주문 목록</label>
		<input type="submit" class="btn btn-default float-r" value="주문하기">
	</div>

	<table class="table">
		<tr class="titleTR">
			<td>주문 번호</td>
			<td>주문자</td>
			<td>업체명</td>
			<td>상품명</td>
			<td>주문일</td>
		</tr>
		<c:forEach var="ordOne" items="${ordList}" varStatus="status">
			<tr class="contentTr" onclick="location.href='/ord_detaile.do?ord_no=${ordOne.ord_no}'">
				<td>${ordOne.ord_no}</td>
				<td>${ordOne.ord_name }</td>
				<td>${ordOne.cop_name }</td>
				<td>${ordOne.prod_name }</td>
				<td>${ordOne.ord_date }</td>
			</tr>
		</c:forEach>
	</table>
	
</form>
</div>
</body>
</html>
</layoutTag:layout>