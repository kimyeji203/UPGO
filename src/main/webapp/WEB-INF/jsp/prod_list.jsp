<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>
<layoutTag:layout>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품게시판</title>
<script type="text/javaScript" language="javascript" defer="defer">
function fn_search() {
	document.listForm.action = "<c:url value='/selectSubjectList'/>";
	document.listForm.submit();
}
function fn_select(pno) {
	location.href = "/prod_detail?no="+pno;
}
function fn_regist(){
	location.href = "/prod_regist"
}
</script>
</head>
<body>
<div class="container" style="border-left:1px solid grey; border-right:1px solid grey;">
	<input type="text" id="txt_keyword" value=""></input>
	<input type="button" id="btn_search" class="btn btn-default" value="상품검색"></input>
	<input type="button" id="btn_regist" class="btn btn-default"  value="상품등록" onClick="javascript:fn_regist()"></input>
	<table id="tb" class="table">
		<colgroup>
			<col width="150" />
			<col width="150" />
			<col width="150" />
			<col width="150" />
			<col width="100" />
			<col width="300" />
		</colgroup>
		<tr>
			<th align="center" style="border-bottom:1px solid #000000;">상품번호</th>
			<th align="center" style="border-bottom:1px solid #000000;">업체번호</th>
			<th align="center" style="border-bottom:1px solid #000000;">상품명</th>
			<th align="center" style="border-bottom:1px solid #000000;">단품 가격</th>
			<th align="center" style="border-bottom:1px solid #000000;">재고</th>
			<th align="center" style="border-bottom:1px solid #000000;">등록일</th>
		</tr>
		<c:forEach var="item" items="${ProdData}" varStatus="status">
			<tr class="tbl_tr" onClick="javascript:fn_select('${item.prod_no}')">
				<td align="center" style="border-bottom:1px solid #000000;"><c:out value="${item.prod_no}"></c:out></td>
				<td align="center" style="border-bottom:1px solid #000000;"><c:out value="${item.cop_no}"></c:out></td>
				<td align="center" style="border-bottom:1px solid #000000;"><c:out value="${item.prod_name}"></c:out></td>
				<td align="center" style="border-bottom:1px solid #000000;"><c:out value="${item.prod_price}"></c:out></td>
				<td align="center" style="border-bottom:1px solid #000000;"><c:out value="${item.prod_stock}"></c:out></td>
				<td align="center" style="border-bottom:1px solid #000000;"><c:out value="${item.prod_date}"></c:out></td>
			</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>
</layoutTag:layout>