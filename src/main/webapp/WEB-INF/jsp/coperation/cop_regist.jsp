<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>
<layoutTag:layout>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>

<script src="http://code.jquery.com/jquery.js"></script>


<body>
<div class="container" style="border-left:1px solid grey; border-right:1px solid grey;">
	<div class="col-xs-12" style="margin:15px auto;">
		<label style="font-size:20px;"><span class="glyphicon glyphicon-list-alt"></span>업체 등록</label>
	</div>
<form id="publicForm" name="cop_registForm" action="/copRegist.do">
	<table class="table table-hover">
		<tr>
			<th>업체명</th>
			<td><input type="text"  class="form-control" name="cop_name" placeholder="업체명을 입력해 주세요"></td>
		</tr>
		<tr>
			<th>업체 전화번호</th>
			<td><input type="text" class="form-control" name="cop_call" placeholder="-을 제외한 전화번호를 입력해 주세요"></td>
		</tr>
		<tr>
			<th>업체 주소</th>
			<td><input type="text" class="form-control" name="cop_addr" placeholder="업체의 주소를 입력해 주세요"></td>
		</tr>
		<tr>
			<th>업체 소개</th>
			<td><textarea class="form-control" name="cop_content" placeholder="당신의 업체게 대해 간단히 소개 해주세요"></textarea>
		</tr>
	</table>
	<div id="btnDiv">
		<input type="button" class="btn btn-default" onclick="fnc_cancel()" value="취소">
		<input type="submit" class="btn btn-default" value="등록">
	</div>
</form>
</div>
</body>
</html>
</layoutTag:layout>
<script>
function fnc_cancel(){
	location.href="/cop_list.do";
}
</script>