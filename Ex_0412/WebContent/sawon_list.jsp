<%@page import="vo.SawonVO"%>
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
   
 	//sawon_list.jsp?deptno=10
  	//deptno라는 이름의 파라미터 값을 수신
  	int no = Integer.parseInt(request.getParameter("deptno"));
   
   //쿼리문 저장
   String sql = "SELECT * FROM SAWON WHERE DEPTNO="+no;
  
   //접속 후, 쿼리문 실행
   //PreparedStatement : 문자열을 쿼리문으로 전환해준다.
   PreparedStatement pstmt = conn.prepareStatement(sql);
   
	//실행된 sql문장을 통해 얻어진 결과를 실제로 vo객체에 담아준다.
   ResultSet rs = pstmt.executeQuery();
	
	//부서목록을 저장할 ArrayList만들기
	List<SawonVO> Sawon_list = new ArrayList<>();
	
	//rs.next() = 반환형 bool 
	while(rs.next()){//rs.next() : 다음행이 있으면 true, 없으면 false
		SawonVO vo = new SawonVO();
		//컬럼 이름을 적어준다.
		vo.setSabun(rs.getInt("sabun"));
		vo.setSaname(rs.getString("saname"));
		vo.setDeptno(rs.getInt("deptno"));
		vo.setSapay(rs.getInt("sapay"));
		//컬렉션에 담기
		Sawon_list.add(vo);
	}
   //연결후 사용한 DB는 종료코드를 통해 마무리 지어야 한다.
   //DB접속과 관련된 모든 객체는 생성된 역순으로 닫아주어야 한다.
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
		<tr>
			<th>사원번호</th>
			<th>사원이름</th>
			<th>부서번호</th>
			<th>급여</th>
		</tr>
		<% for(int i = 0; i < Sawon_list.size(); i++){
			SawonVO vo = Sawon_list.get(i);%>
			<tr>
				<td><%= vo.getSabun() %></td>
				<td><%= vo.getSaname() %></td>
				<td><%= vo.getDeptno() %></td>
				<td><%= vo.getSapay() %></td>
			
			</tr>
			
			
			
			
		<%} %>
		
	</table>
</body>
</html>