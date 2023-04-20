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
				var photo = f.photo.value.trim();
				
				if(title == ''){
					alert("제목을 입력하십시오.");
					return;
				}
				if(photo == ''){
					alert("파일을 입력하십시오.");
					return;
				}
				//jsp에서는 java클래스를 호출할 수 없다.
				//대신 Servlet을 호출할 수 있다.
				f.action = "upload.do";
				f.submit();
				
			}
			
		
		</script>
		
		
	</head>
	<body>
		<!-- 파일 업로드의 주의사항
			1) form태그의 전송방식은 반드시 post
			2) enctype="multipart/form-data" 필수
			enctype : form 태그의 파일 데이터를 전송할 때 사용하는 인코딩 기법 -->
			<form method="POST" enctype="multipart/form-data">
			제목 : <input name="title"><br>
			첨부 : <input type="file" name="photo">
			<!-- 웹에서 사용자의 로컬 파일을 입력받기 위해서 input 태그의 타입을
			 file로 지정하는 방법을 사용한다.-->
			<input type="button" value="업로드" onclick="send(this.form)">
		
		
		</form>
	
	</body>
</html>