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

<link rel="stylesheet" href="/resource/res/css/cop.css">
</head>


<body>
<div class="container" >
<form id="publicForm" name="cop_listForm" action="/cop_regist.do">
	<div class="col-xs-12">
		<label style="font-size:20px;"><span class="glyphicon glyphicon-list-alt"></span>업체 리스트</label>
		<input type="submit" class="btn btn-default float-r" value="업체 등록">
	</div>

	
	<div>
		<c:forEach var="copOne" items="${copList}" varStatus="status">
			<div class="copDiv" onclick="location.href='/cop_detaile.do?cop_no=${copOne.cop_no}'">
				<div class="info">
					<p>${copOne.cop_no }</p>
					${copOne.cop_name}
				</div>
			</div>
		</c:forEach>
	</div>
</form>
</div>
</body>
</html>
</layoutTag:layout>