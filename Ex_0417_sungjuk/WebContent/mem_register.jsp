<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	//보낼때는 자바스크립트, 받을때는 자바
	function send(f){
		var name = f.name.value.trim();
		var id = f.id.value.trim();
		var pw = f.pw.value.trim();
		var email = f.email.value.trim();
		
		if(name == ''){
			alert("이름을 입력하세요");
			return;
		}
		
		
		
		if(name.length < 2) {
			alert("이름은 2자 이상이어야 합니다.");
			return;
		}
		if(id.length < 3) {
			alert("아이디는 3자 이상이어야 합니다.");
			return;
		}
		if(pw.length < 3) {
			alert("비밀번호는 3자 이상이어야 합니다.");
			return;
		}
		if(email.length < 5) {
			alert("이메일은 5자(?) 이상이어야 합니다.");
			return;
		}
		
		f.action = "memMainRegister.jsp";
		f.method = "GET";
		f.submit();
		
		
	}

</script>


</head>
<body>
	<form>	
	<table border="1">
		<caption>회원 정보를 입력하세요.</caption>
		<tr>
			<th>이름</th>
			<td><input name="name"></td>
		</tr>
		<tr>
			<th>아이디</th>
			<td><input name="id"></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input name="pw"></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input name="email"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="등록" onclick="send(this.form)">
				<input type="button" value="취소" onclick="location.href('member.jsp')">
			</td>
		</tr>	
	</table>
</form>

</body>
</html>