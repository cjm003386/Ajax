<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>ajax</title>
<link href="../css/form.css" rel="stylesheet" type="text/css">
<script src="../js/jquery-3.6.0.js"></script>

<script>
$(function(){
	$("form").submit(function(e){ //전송 버튼 클릭 시
		e.preventDefault();
		//서버로 보낼 데이터를 폼에서 얻어옵니다.
		//입력 양식에 적힌 값을 쿼리 문자열로 바꿉니다.
		var data=$('form').serialize();
		console.log(data);
		// $("div").load("process.jsp","name=love&age=21&address=서울시");
		$("div").load("process.jsp",data);
	
	});
});
</script>
</head>
<body>
	<form>
		<span>이름</span><input type="text" placeholder="이름" id="name" name="name" required><br>
		<span>나이</span><input type="text" placeholder="나이" id="age" name="age" required><br>
		<span>주소</span><input type="text" placeholder="주소" id="address" name="address" required><br>
		<input type="submit" value="전송">
	</form>
	<div></div>
</body>
</html>