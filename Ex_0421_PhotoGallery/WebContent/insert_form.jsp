<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	function send(f){
		var title = f.title.value.trim();
		var pwd = f.pwd.value.trim();
		var photo = f.photo.value;
		
		if(title == ''){
			alert("제목을 입력해야 합니다.");
			return;
		}
		f.submit();
		
	}

</script>



</head>
<body>
	<form action="insert.do" method="post" enctype="multipart/form-data">
		<table border="1" align="center">
			<caption>사진 등록하기</caption>
			<tr>
				<th>제목</th>
				<td><input name="title"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input name="pwd" type="password"></td>
			</tr>
			<tr>
				<th>등록할 사진</th>
				<td><input name="photo" type="file"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<input type="button" value="등록하기" onclick="send(this.form)">
				<input type="button" value="취소하기" onclick="location.href='list.do'">
			</tr>
		</table>
	</form>
</body>
</html>