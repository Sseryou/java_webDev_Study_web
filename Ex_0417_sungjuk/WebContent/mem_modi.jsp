<%@page import="dao.MemDAO"%>
<%@page import="vo.MemVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    	request.setCharacterEncoding("utf-8");
    	
    	int idx = Integer.parseInt(request.getParameter("idx"));
    	String name = request.getParameter("name");
    	String id = request.getParameter("id");
    	String pw = request.getParameter("pw");
    	String email = request.getParameter("email");
    	
    	MemVO vo = new MemVO();
    	vo.setIdx(idx);
    	vo.setName(name);
    	vo.setId(id);
    	vo.setPw(pw);
    	vo.setEmail(email);
    
    	int res = MemDAO.getInstance().update(vo);
    	
    	if(res > 0){
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