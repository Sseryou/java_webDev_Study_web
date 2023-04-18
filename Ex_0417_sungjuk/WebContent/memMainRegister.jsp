<%@page import="dao.MemDAO"%>
<%@page import="vo.MemVO"%>
<%@page import="service.DBService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	String name = request.getParameter("name");
    	String id = request.getParameter("id");
    	String pw = request.getParameter("pw");
    	String email = request.getParameter("email");
    	
    	MemVO vo = new MemVO();
    	vo.setName(name);
    	vo.setId(id);
    	vo.setPw(pw);
    	vo.setEmail(email);
    			
    
     	int res = MemDAO.getInstance().insert(vo); // 1
     	
     	if(res > 0){
     		//location.href = 'student.jsp';
     		response.sendRedirect("member.jsp");
     	}
    
    %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
	
	</body>
</html>