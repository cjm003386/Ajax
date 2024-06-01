<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<style>
	.container{width:50%}
</style>
</head>
<body>
	<div class="container">
	 <form id="insert_form">
	  <fieldset>
	   <legend>데이터 추가</legend>
	    <table class="table">
	     <tr>
	      <th><label>상품명</label></th>
	      <td><input type="text" name="name" id="name" class="form-control" required></td>
	     </tr>
	     <tr>
	      <th><label>가격</label></th>
	      <td><input type="text" name="price" id="price" class="form-control" required></td>
	      </tr>
	     <tr>
	      <th><label>메이커</label></th>
	       <td><input type="text" name="maker" id="maker" class="form-control" required></td>
	     </tr>
	     <tr>
	      <td colspan=2>
	        <button type="submit" class="btn btn-primary btn-block" >추가</button>
	      </td>
	     </tr>
	    </table>
	  </fieldset>
	 </form>
	</div>
	<script>
		//get방식 전송시 데이터 가져오기, post방식 전송시 삽입과 데이터 가져오기
	function selectData(m){
		 $("#result").remove()
		 var senddata = $("#insert_form").serialize();
			//Ajax를 수행합니다.
		 $.ajax({
			type: m, //"get" "post", -전송방식
			url : "${pageContext.request.contextPath}/servlet_gson.bo", 
			data : senddata, //보낼 데이터
			dataType : "json",
			success : function(rdata){ //http 요청이 성공한 경우 실행할 함수 정의(이벤트 핸들러)
				console.log("성공"+rdata); //rdata는 서버에서 보낸 데이터입니다.
				if(rdata.length>0){
				var output = "<div id='result'><table class='table'>"
						   + "<thead><tr><th>아이디</th><th>상품명</th><th>가격</th><th>메이커</th></thead>"
						   + "<tbody>";
				$(rdata).each(function(index,item){
					output+='<tr>';
					output+='	<td>' + item.id + '</td>';
					output+='	<td>' + item.name  + '</td>';
					output+='	<td>' + item.price.toLocaleString() + '</td>';
					//output+='	<td>' + item.price + '</td>';	// ,<< 사라진다. 
					output+='	<td>' + item.maker + '</td>';
					output+='</tr>';
				}); //each end
				output += '</tbody></table></div>';
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

		
				}//error end

		}); //ajax end	
	}//function getData() end
	
	selectData("get");
	
	//데이터를 추가합니다.
	$('#insert_form').submit(function (event){
		
		// 기본 이벤트를 제거합니다.
		event.preventDefault();
		
		selectData("post");
	}); //submit end
	</script>
	
</body>
</html>