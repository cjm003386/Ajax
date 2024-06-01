<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>


</head>
<body>

	<div class="container">
     <h3 class="mt-5">검색할 부서 번호를 입력하세요</h3>
     <form class="mb-3">
       <div class="row">
     	<input type='search' name='deptno' required pattern="[0-9]{2}" class="form-control col-8 ml-3"> 
     	<button class="btn btn-info" >검색</button>
     	</div>
     </form>
  </div>
	
<script>
function getData(go, senddata){ //수정
	console.log(senddata);
	 $.ajax({
		type:"post",
		url : "${pageContext.request.contextPath}/" + go, //요청 전송 url 
		data : {"deptno":senddata},
		dataType : "json",
		success : function(rdata){ //http 요청이 성공한 경우 실행할 함수 정의(이벤트 핸들러)
			console.log("성공"+rdata); //rdata는 서버에서 보낸 데이터입니다.
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
				$('input').val('');
			}else{
				$('.container').append('<div id="result">데이터가 존재하지 않습니다.</div>');
			}
		},//success end					

		error : function(request, status, error){
			$("body").append("<div id='error'>code :" 
       			 + request.status  + "<br>"
       			 + "받은 데이터 :" + request.responseText  + "<br>"
       			 + "error status : " + status + "<br>"
       	         + "error 메시지 : " + error +"</div>");

	
			},//error end

	}); //ajax end	
}//function getData() end

	
	
	getData('dept_lib');
	$("form").submit(function(event){
		event.preventDefault();
		$("#result").remove();
		var senddata = $("input[name='deptno']").val();
		getData('dept_lib_search', senddata);
	}); //form submit
	
</script>


</body>
</html>