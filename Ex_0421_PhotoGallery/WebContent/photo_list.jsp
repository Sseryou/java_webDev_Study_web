<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="css/photo.css">
		<script src="js/httpRequest.js"></script>
		<script type="text/javascript">
			function del(f){
				var idx = f.idx.value;
				alert(idx);
				
				if(!comfirm("삭제하시겠습니까?")){
					return;
				}
				//삭제를 원하는 idx를 서버로 전송
				var url = "photo_del.do";
				var param = "idx="+idx+"&filename="+f.filename.value;
				
				sendRequest(url,param,finRes,"POST");
			}
			
			function finRes(){
				if(xhr.readyState == 4 && xhr.status == 200){
					//서블릿으로부터 도착한 데이터 읽어오기
					var data = xhr.responseText;
					
					//넘겨받은 데이터는 ""로 묶여짐
					//JSON형식으로 변경해줘야한다.
					var json = eval(data);
					if(json[0].param == 'yes'){
						alert("삭제성공");
					}else{
						alert("삭제실패");
					}
					
					location.href="list.do";
				}
			}			
		</script>
		
	</head>
	<body>
		<div id="main_box">
			<h1>:::Photo Gallery:::</h1>
			<div align="center">
				<input type="button" value="사진등록" onclick="location.href='insert_form.jsp'">
			</div>
			<!-- for(PhotoVO vo : list){
				System.out.println(vo.getTitle());
				Syetem.out.println(vo.getFilename());
				...
			 }-->
			<div id="photo_box">
			<!-- for(PhotoVO vo : list){
			
					} -->
				<c:forEach var="vo" items="${list}">
				
				<div class="photo_type">
					<img src="upload/${vo.filename}">
					<div class="title">"${vo.title}"</div>
					
					<form>
					<input type="hidden" name="idx" value="${vo.idx}">
					<input type="hidden" name="filename" value="${vo.filename}">
					<div>
						<input type="button" value="삭제" onclick="del(this.form)">
					</div>
					</form>
					
				</div>
				
				</c:forEach>
			</div>
		</div>
	</body>
</html>