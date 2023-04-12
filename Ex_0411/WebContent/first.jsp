<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 	
<%@ page import="java.util.Random" %>

    <!-- JSP(Java Server Page) : 연산 능력을 가지고 있는 html
    Java 코드도 사용할 수 있고 자바스크립트를 사용하는데도 제한이 없다. -->
<%
 	//이 영역 안에서만 자바코드를 작성 할 수 있습니다.
 	//스크립트릿(Scriptlet) : jsp에서 자바코드를 사용하기 위해 지정하는 영역
 	//request(요청객체), response(응답객체)등의 객체는
 	//jsp가 web페이지로 전환되는 과정에서 만나는 Servlet클래스가 가진 객체이므로
 	//jsp에서는 Servlet클래스가 허용하는 범위 내에서 객체를 마음대로 가져다
 	//사용할 수 있다.
 	
 	//jsp가 웹과 통신할 때 서블릿이라는 클래스를 거치게 된다.
 	//요청과 응답과 관련된 여러 메서드들이 있다.
 	//서블릿에 있는 객체를 사용 가능하다.
 	String ip = request.getRemoteAddr();
 	
 	Random rand = new Random();
 	
 	int rnd = rand.nextInt(5)+1;
 	
 	 
  %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%= ip %>
	<!-- 엔티티 코드! <와 >.... -->
	<p>&lt;%@내용%&gt; : jsp 헤더 - 실행시 인코딩, import등을 위해
	반드시 지정해야 하는 영역</p>
	<p>&lt;% 자바코드 %&gt; : 스크립트릿 - jsp에서 자바코드를 작성하기위해 
	생성하는 영역</p>
	<p>&lt;%= 변수명 %&gt; : 스크립트릿의 출력코드</p>
	난수 : <%= rnd %>
</body>
</html>