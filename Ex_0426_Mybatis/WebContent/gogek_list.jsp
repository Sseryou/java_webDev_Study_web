<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<table border="1">
			<caption>:::고객목록:::</caption>
			<tr>
				<th>고객번호</th>
				<th>담당자</th>
				<th>이름</th>
				<th>주소</th>
				<th>주민번호</th>
			</tr>
			<c:forEach var="vo" items="${list}">
				<tr>
					<td>${vo.gobun}</td>
					<td>${vo.godam}</td>
					<td>${vo.goname}</td>
					<td>${vo.goaddr}</td>
					<c:set var="gojumin" value="${vo.gojumin}"/>
					<td>${fn:split(gojumin, ' ')[0]}</td>
				</tr>
			</c:forEach>
		</table>
	</body>
</html>