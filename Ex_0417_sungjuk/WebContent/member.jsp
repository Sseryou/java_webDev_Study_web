<%@page import="vo.MemVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.MemDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    	MemDAO dao = MemDAO.getInstance();
    	List<MemVO> list = dao.selectList();
    
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function del(idx){
		if(confirm("정말 삭제하시겠습니까?") == false){
			return;
		}
		location.href='mem_del.jsp?idx='+idx;		
	} //del
	
	function modify(idx,name,id,pw,email){
		location.href='mem_update.jsp?idx='+idx+"&name="+name+"&id="+id+"&pw="+pw+"&email="+email;
	}
	
	
	
</script>



</head>
<body>
		<table border="1">
			<tr>
				<th>회원번호</th>
				<th>이름</th>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이메일</th>
				<th>비고</th>
			</tr>
			<% for(int i = 0; i < list.size(); i++){ 
					MemVO vo = list.get(i); %>
			<tr>
				<td><%= vo.getIdx() %></td>
				<td><%= vo.getName() %></td>
				<td><%= vo.getId() %></td>
				<td><%= vo.getPw() %></td>
				<td><%= vo.getEmail() %></td>
				<td><input type="button" value="삭제" onclick="del('<%=vo.getIdx()%>')">
				<input type="button" value="수정" onclick="modify('<%= vo.getIdx()%>',
																	 '<%= vo.getName()%>',
																	 '<%= vo.getId()%>',
																	  '<%= vo.getPw()%>',
																	   '<%= vo.getEmail()%>')"></td>	
			</tr>
			<% } %>	
			<tr>
				<td colspan = "9" align="center">
				<input type="button" value="회원정보 추가하기" onclick="location.href='mem_register.jsp'">
			</tr> 
		</table>
	</body>
</html>