<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>

<script>
$(function() {
	 $("button").click(function() { //버튼을 클릭하면
		 $.ajax({
			type:"post",
			url : "${pageContext.request.contextPath}/dept_lib_bean", //요청 전송 url 
			dataType : "json",
			success : function(rdata){ //http 요청이 성공한 경우 실행할 함수 정의(이벤트 핸들러)
				console.log("성공"+rdata); //rdata는 서버에서 보낸 데이터입니다.
				$(".container div").remove();
				if(rdata.length>0){
				var output = "<div id='result'><table class='table'>"
						   + "<thead><tr><th>부서번호</th><th>부서명</th><th>지역</th></thead>"
						   + "<tbody>";
				$(rdata).each(function(index,item){
					output+='<tr>';
					output+='	<td>' + item.deptno + '</td>';
					output+='	<td>' + item.dname  + '</td>';
					output+='	<td>' + item.loc + '</td>';
					output+='</tr>';
				}); //each end
				output += '</tbody></tabel></div>';
					$('.container').append(output);
				}else{
					$('.container').append('<div>데이터가 존재하지 않습니다.</div>');
				}
			},//success end					
		 
										
			error : function(request, status, error){
				$(".container").append("<div id='error'>code :" 
	        			 + request.status  + "<br>"
	        			 + "받은 데이터 :" + request.responseText  + "<br>"
	        			 + "error status : " + status + "<br>"
	        	         + "error 메시지 : " + error +"</div>");

			},
			complete : function(){//요청의 실패, 성공과 상관 없이 완료 될 경우 호출
				$(".container").append("<div id='com'>Ajax가 완료되었습니다.</div>")	
			}
		}); //ajax end	 
	 }); //click end
});

</script>
</head>
<body>
<div class="container">
	<button class="btn btn-info">라이브러리를 이용한 json 형식으로 dept 내용 가져오기(자바빈이용).</button> 
</div>


</body>
</html>