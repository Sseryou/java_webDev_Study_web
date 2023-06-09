<%@page import="vo.GogekVO"%>
<%@page import="vo.DeptVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%  
    InitialContext ic = new InitialContext();
  
    Context ctx = (Context)ic.lookup("java:comp/env");
  
    DataSource ds = (DataSource)ctx.lookup("jdbc/oracle_test");
   
	Connection conn = ds.getConnection();
    
    System.out.println("---DB접속 성공!!---");
    
    String sql = "SELECT * FROM GOGEK";
   
    PreparedStatement pstmt = conn.prepareStatement(sql);
   
    ResultSet rs = pstmt.executeQuery();
	
	List<GogekVO> gogek_list = new ArrayList<>();
	
	
	while(rs.next()){
		GogekVO vo = new GogekVO();
		//컬럼 이름을 적어준다.
		vo.setGobun(rs.getInt("gobun"));
		vo.setGoname(rs.getString("goname"));
		vo.setGoaddr(rs.getString("goaddr"));
		vo.setGojumin(rs.getString("gojumin"));
		//컬렉션에 담기
		gogek_list.add(vo);
	}
    
    rs.close();
    pstmt.close();
    conn.close();
    
    %>
    
    
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<table border="1">
			<caption>고객목록</caption>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>주소</th>
				<th>주민번호</th>
			</tr>
			<% for(int i = 0; i < gogek_list.size(); i++) {
					GogekVO vo = gogek_list.get(i); %>
			<tr>
				<td><%= vo.getGobun() %></td>
				<td><%= vo.getGoname() %></td>
				<td><%= vo.getGoaddr() %></td>
				<td><%= vo.getGojumin() %></td>
			</tr>
			<% } %>
		</table>
	</body>
</html>