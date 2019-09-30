<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>
<layoutTag:layout>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-Latest.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="container" style="border-left:1px solid grey; border-right:1px solid grey;">
	<div class="col-xs-12" style="margin:15px auto;">
    	<label style="font-size:20px;"><span class="glyphicon glyphicon-list-alt"></span>게시글 상세</label>
	</div>
		<div class="form-group">
			<label>업체 번호</label>
			<p>${detail.cop_no}</p>
		</div>
		<div class="form-group">
			<label>제품 번호</label>
			<p>${detail.prod_no}</p>
		</div>
		<div class="form-group">
			<label>제목</label>
			<p>${detail.b_title}</p>
		</div>
		<div class="form-group">
			<label>작성자</label>
			<p>${detail.b_writer}
		</div>
		<div class="form-group">
			<label>작성 날짜</label>
			<p>${detail.b_date}
		</div>
		<div class="form-group">
			<label>내용</label>
			<p>${detail.b_content}
		</div>
		<div class="btn-group btn-group-sm" role="group" style="float:right;">
          <button type="button" class="btn btn-default" id="box_authenticated1" onclick="location.href='/delete/${detail.b_no}'">삭제</button>
          <button type="button" class="btn btn-default" id="box_authenticated2" onclick="location.href='/update/${detail.b_no}'">수정</button>
          <button type="button" class="btn btn-default" onclick="location.href='/list'"> 목록 </button>
        </div>
</div>

<div class="container">
	<label for="content">댓글</label>
	<form name="commentInsertForm">
		<div class="input-group">
			<input type="hidden" name="b_no" value="${detail.b_no}"/>
			<input type="text" class="form-control" id="c_content" name="c_content" placeholder="내용을 입력하세요!">
			<span class="input-group-btn">
				<button class="btn btn-default" type="button" name="commentInsertBtn">등록</button>
			</span>
		</div>
	</form>
</div>

<div class="container">
	<div class="commentList"></div>
</div>
</body>
</html></layoutTag:layout>
<%@ include file="commentS.jsp" %>