<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <!-- JSP(Java Server Page) : 연산 능력을 가지고 있는 html
    Java 코드도 사용할 수 있고 자바스크립트를 사용하는데도 제한이 없다. -->
<%
 	//이 영역 안에서만 자바코드를 작성 할 수 있습니다.
 	//스크립트릿(Scriptlet) : jsp에서 자바코드를 사용하기 위해 지정하는 영역
 	
 	//jsp가 웹과 통신할 때 서블릿이라는 클래스를 거치게 된다.
 	//요청과 응답과 관련된 여러 메서드들이 있다.
 	//서블릿에 있는 객체를 사용 가능하다.
 	String ip = request.getRemoteAddr();
 	 
  %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%= ip %>
</body>
</html>