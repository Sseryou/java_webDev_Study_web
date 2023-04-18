<%@page import="dao.MemDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    	//수신시 인코딩(POST일때는 한글이 깨진다.)
    	//그러나 GET일때도 습관처럼 써주는 것이 좋다.
    	request.setCharacterEncoding("utf-8");
    		

    	//sung_del.jsp?no=1
		int idx = Integer.parseInt(request.getParameter("idx"));
    	
    	int res = MemDAO.getInstance().delete(idx);
    	
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