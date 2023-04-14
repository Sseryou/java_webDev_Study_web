<%@page import="vo.SawonVO"%>
<%@page import="dao.SawonDAO"%>
<%@page import="vo.DeptVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.DeptDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
    	SawonDAO dao = SawonDAO.getInstance(); //싱글톤 기법의 DeptDAO 형태 객체를 만듬.
    	List<SawonVO> list = dao.SelectList(); //selectList 내부에서 이미 DBService 호출.
    	//임포트 할 필요 없음
    	
    
    
    %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		<table border="1">
			<tr>
				<th>사원번호</th>
				<th>부서번호</th>
				<th>사원이름</th>
				<th>사원직종</th>
				<th>입사날짜</th>
			</tr>
			<% for(int i = 0; i < list.size(); i++){ 
					SawonVO vo = list.get(i); %>
			<tr>
				<td><%= vo.getSabun() %></td>
				<td><%= vo.getDeptno() %></td>
				<td><%= vo.getSaname() %></td>
				<td><%= vo.getSajob() %></td>
				<td><%= vo.getSahire() %></td>			
			</tr>
			<% } %>	
		</table>
	</body>
</html>