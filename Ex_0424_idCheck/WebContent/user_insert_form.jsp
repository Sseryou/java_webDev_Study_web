<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="js/httpRequest.js"></script>
		<script type="text/javascript">
		var b_idCheck = false;
		function send(f){
			
			//아이디 중복체크 여부
			
			if(!b_idCheck){
				alert("아이디 중복체크를 하세요.")
				return;
			}
			
			
			f.action ="insert.do";//url 매핑 / 실제 파일 이름과 다를수 있다.
			f.method ="GET";
			f.submit();
			
		}	
		//아이디 중복체크
		function check_id(){
			var id = document.getElementById("id").value.trim();
			
			if(id == ''){
				alert("아이디를  입력하세요");
				return;
			}
			//id를 Ajax를 통해서 서버로 전송
			var url = "check_id.do";
			
			//id에 @와 같은 특수문자가 들어가 있는 경우를 대비하여 인코딩하여 보낸다.
			var param = "id="+encodeURIComponent(id);
			sendRequest(url,param,resultFn,"POST");
		}
		function resultFn(){
			if(xhr.readyState == 4 && xhr.status == 200){
				//"[{'res':'%s'}]"
				var data = xhr.responseText;
				
				var json = eval(data);
				
				if(json[0].res == 'no'){
					alert("이미 사용중인 id입니다.");
					return;
				}else{
					alert("사용 가능한 아이디 입니다.");
					b_idCheck = true;
					return;
				}
			}
		}
		function che(){
			b_idCheck = false;
		}
		
		
		</script>
	</head>
	<body>
		<form action="insert.do" method="post">
		<table border="1">
		<caption>:::회원가입:::</caption>
				<tr>
					<th>아이디</th>
					<td>
					<!-- onchange : input태그의 포커스가 벗어났을 때(즉, 입력이 끝났을때) 이벤트 발생 -->
						<input type="text" name="id" id="id" onchange="che()">
						<input type="button" value="중복체크" onclick="check_id()">
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pwd"></td>
				</tr>
				
				<tr>
				<td colspan="2" align="center">
				<input type="button" value="가입" onclick="send(this.form)">
				<input type="button" value="취소" onclick="location.href='user_list.do'">
			</tr>		
		</table>
		</form>
	
	
	</body>
</html>