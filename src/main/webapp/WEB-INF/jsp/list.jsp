<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>
<layoutTag:layout>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
</head>
<body>
<div class="container" style="border-left:1px solid grey; border-right:1px solid grey;">
	<div class="col-xs-12" style="margin:15px auto;">
        <label style="font-size:20px;"><span class="glyphicon glyphicon-list-alt"></span>게시글 목록</label>
        <button class="btn btn-primary btn-sm" onclick="location.href='/insert'" style="float:right">글쓰기</button>
    </div>
	<table class="table table-hover">
		<tr>
			<th>No</th>
			<th>제목</th>
			<th>작성자</th>
			<th>등록일</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="item" items="${list}">
			<tr onclick="location.href=`/detail/${item.b_no}`">
				<td>${item.b_no}</td>
				<td style="cursor:pointer">${item.b_title}</td>
				<td>${item.b_writer}</td>
				<td>${item.b_date}</td>
				<td>${item.b_hits}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
</layoutTag:layout>