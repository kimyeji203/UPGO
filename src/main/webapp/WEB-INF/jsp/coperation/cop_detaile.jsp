<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>
<layoutTag:layout>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resource/res/css/cop.css">
</head>

<script src="http://code.jquery.com/jquery.js"></script>
<script>
function fnc_delete(no){
	if(confirm("삭제하시겠습니까?")){
		location.href="/copDelete.do?cop_no=" + no;
	}
}
function fnc_update(){
	if(confirm("수정하시겠습니까?")){
		document.detailForm.submit();
	}
}
</script>

<body>
<div class="container">
	<div class="col-xs-12">
		<label style="font-size:20px;"><span class="glyphicon glyphicon-list-alt"></span>업체 보기</label>
	</div>
<form id="publicForm" name="detaileForm" action="/copUpdate.do">
	<table class="table">
		<tr>
			<th>업체 코드</th>
			<td><input type="text" class="form-control" name="cop_no" value="${myCop.cop_no }"></td>
		</tr>
		<tr>
			<th>업체명</th>
			<td><input type="text"  class="form-control" name="cop_name" value="${myCop.cop_name }"></td>
		</tr>
		<tr>
			<th>업체 전화번호</th>
			<td><input type="text" class="form-control" name="cop_call" value="${myCop.cop_call }"></td>
		</tr>
		<tr>
			<th>업체 주소</th>
			<td><input type="text" class="form-control" name="cop_addr" value="${myCop.cop_addr }"></td>
		</tr>
		<tr>
			<th>업체 소개</th>
			<td><textarea class="form-control" name="cop_content">${myCop.cop_content }</textarea>
		</tr>
	</table>
	<div id="btnDiv">
		<button class="btn btn-default" onclick="fnc_update()">수정</button>
		<input type="button" class="btn btn-default" onclick="fnc_delete(${myCop.cop_no})" value="삭제">
		<input type="button" class="btn btn-default" onclick="location.href='/cop_list.do'" value="목록">
		
	</div>
</form>
<div id="reviewDiv">
	<c:choose>
		<c:when test="${empty list }">
			댓글이 아직 없습니다.
		</c:when>
		<c:otherwise>
			<table class="table reviewTB">
			<tr>
			<td style="border:none;"><a href="/insert">리뷰 작성하기</a>
			</td>
			</tr>
				<c:forEach var="item" items="${list}" varStatus="status">
					<tr>
						<td class="writerTD">${item.b_writer}</td>
						<td class="dateTD">${item.b_date}</td>
						<td class="linkTD" rowspan="2" style="width:3%;" onclick="location.href=`/detail/${item.b_no}`">></td>
					</tr>
					<tr class="dtgTR">
						<td class="dtgTD" colspan="2">${item.b_content }</td>
					</tr>
				</c:forEach>
			</table>
		</c:otherwise>
	</c:choose>
</div>
</div>
</body>
</html>
</layoutTag:layout>