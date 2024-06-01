<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
#error{color:green}
#com{color:blue}
</style>
<title>JSON 이용하기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
/*
 $.ajax(object)
  url : 요청 전송 url,
  type : 전송 방식(get(기본) 또는 post),
  data : 전송할 자료들,
  dataType : return data의 type(에이잭스 성공 후 돌려받은 자료의 형을 정의-"json","xml","html"),
  success : HTTP 요청이 성공한 경우 실행할 함수 정의,
  complete : 요청의 실패, 성공과 상관 없이 완료 될 경우 실행할 함수 정의
 
 */
 
 $(function() {
	 $("button").click(function() { //버튼을 클릭하면
		$.ajax({
			url : "item.json", 
			dataType : "json",
			success : function(rdata){
				//이런식으로 쓴다.
			},
		}); //ajax end	 
	 }); //click end
 });
</script>
</head>
<body>

</body>
</html>