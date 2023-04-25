<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
   
    
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/httpRequest.js"></script>
<script type="text/javascript">
	function del(idx){
		//Ajax로 삭제하고 콜백함수로 돌아오기
		//delete.do
			if(confirm("정말 삭제하시겠습니까?") == false){
				//아니오 버튼 클릭시
				return;
			}
			
			var url = "user_del.do";
			var param ="idx="+idx
			
			sendRequest(url,param,resultFn,"POST");
	}
	function resultFn(){
		if(xhr.readyState == 4 && xhr.status == 200){
			//서블릿으로부터 도착한 데이터 읽어오기
			var data = xhr.responseText;
			
			//넘겨받은 데이터는 ""로 묶여짐
			//JSON형식으로 변경해줘야한다.
			var json = eval(data);
			if(json[0].res == 'yes'){
				alert("삭제성공");
			}else{
				alert("삭제실패");
			}
			
			location.href="user_list.do";
		}
	}

</script>

</head>
<body>
	<table border="1">
		<tr>
			<td colspan="5" align="center">
			<input type="button" value="회원가입" onclick="location.href='user_insert_form.jsp'">
			</td>
		</tr>
		<tr>
			<th>회원번호</th>
			<th>이름</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>비고</th>
		</tr>
		<c:forEach var="vo" items="${list}">
		<tr>
			<td>${vo.idx}</td>
			<td>${vo.name}</td>
			<td>${vo.id}</td>
			<td>${vo.pwd}</td>
			<td>
				<input type="button" value="삭제" onclick="del('${vo.idx}')">
			</td>
		</tr>
		</c:forEach>
	</table>

</body>
</html>