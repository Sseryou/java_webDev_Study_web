<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	제목 : ${title} <br>
	<!-- jsp는 프로젝트 외부의 경로까지 접근을 할 수 없다. -->
	<img src="upload/${filename}" width="200">
</body>
	<!-- 상대경로 : 프로젝트 내의 눈에 보이는 폴더가 있는 경로
		절대경로 : 컴퓨터 내의 특정 경로에 상대경로가 연결이 되어있는 폴더 
		
		상대경로에 넣은 이미지는 절대경로에도 들어간다.
		절대경로에 넣은 이미지는 상대경로에서 안보인다.-->
			


</html>