<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>
<layoutTag:layout>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
</head>
<body>
<div class="container" style="border-left:1px solid grey; border-right:1px solid grey;">
	<div class="col-xs-12" style="margin:15px auto;">
        <label style="font-size:20px;"><span class="glyphicon glyphicon-edit"></span>게시글 수정</label>
    </div>

	<form action="/updateProc" method="post">
		<div class="form-group">
			<label for="title">제목</label>
			<input type="text" class="form-control" id="title" name="b_title" value="${detail.b_title}">
		</div>
		<div class="form-group">
			<label for="content">내용</label>
			<input type="text" class="form-control" id="title" name="b_content" value="${detail.b_content}">
		</div>
		<input type="hidden" name="b_no" value="${b_no}"/>
		<button type="submit" class="btn btn-primary">수정</button>
	</form>
</div>
</body>
</html>
</layoutTag:layout>