<%-- sample1.txt를 파일  -> properties -> utf-8로 작성합니다.--%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>sample1</title>
<link href="../css/ex1.css" rel="stylesheet" type="text/css">
<script src="../js/jquery-3.6.0.js"></script>
<script>
$(function() {
	function error(responseTxt, status, xhr){
		console.log(responseTxt);
		if(xhr.status=="404"){
			alert("해당 파일이 존재하지 않습니다.")
		}
	}
	
	$("button").click(function() {  //변경을 클릭하면
		  
		  $("button").text('로딩완료').css('color','red');
	  
		  //<p>태그 영역에 "sample2.txt"의 내용을 불러옵니다.
		  $("p").load("sample12.txt",error); 
		  $("pre").load("sample1.txt",error); 
	  });
});


</script>


</head>
<body>
	<button>변경</button>
	<p>변경전 : 줄이 안바뀌어요</p>
	<br>
	<pre>변경 전 : 줄이 바뀝니다.(입력한 대로 출력됩니다.)</pre>

</body>
</html>