<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    	
    
    //톰캣이 JNDI를 검색하기 위해서 필요한 클래스(JNDI기법 : Java Naming Directory Interface )
    InitialContext ic = new InitialContext();
    //javax -> 라이브러리에서 왔다고 생각하면 된다.
    //javax.naming 쪽을 임포트해야 한다.
    
    //Resource위치 검색 -> 프로그램을 구성할만한 모든 참조파일을 리소스라고 한다.
    //lookup의 반환형이 object이기 때문에 형변환 필요.
    Context ctx = (Context)ic.lookup("java:comp/env");
    //lookup -> 조회, jsp에서 db에 대한 리소스가 저장되어 있는 위치 검색
    //java:comp/env -> 자바에 내장되어 있는 리소스 자원을 검색하는 상수(고정)
    
    //오라클 이름을 검색해 준다.(name="jdbc/oracle_test")
    //반환형 object, 형변환 필요
    //검색된 Resource를 통해 필요한 JNDI의 Resource를 검색
    //context.xml파잏의 Resource영역에 참조되어 있는 name 속성값
    DataSource ds = (DataSource)ctx.lookup("jdbc/oracle_test");
    
    //위에서 준비해둔 경로로 로그인 시도(접속)
	Connection conn = ds.getConnection();
    
    System.out.println("---DB접속 성공!!---");
    
    
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