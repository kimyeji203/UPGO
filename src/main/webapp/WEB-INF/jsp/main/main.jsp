<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

</head>
<style>
	#imgDiv{
	}
	img#backImg{width:100%;}
	#textImg{
		width:auto;
		height:220px;
		margin-left:35%;
	}
</style>
<body>

	<div id="imgDiv">
		<img id="backImg" src="/resource/res/img/mainImg.PNG"/>

	</div>
	<layoutTag:layout>
	</layoutTag:layout>
	<img id="textImg" src="/resource/res/img/mainText.png" onclick="location.href='/'"/>
</body>
</html>
