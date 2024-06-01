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
	   <legend>데이터 추가 삭제 예정</legend>
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
		//get방식 전송시 데이터 가져오기, post방식 전송시 삽입, 삭제, 수정과 데이터 가져오기
	function selectData(method, label){
		 $("#result").remove()
		 if(label == '추가' || label =='수정완료'){
		 var senddata = $("#insert_form").serialize() + "&label=" +label;
		 }else if(label == '삭제'){
			 var senddata = {id: $('input:hidden').val(), label : label}; // a : a <<콜론 앞에는 속성 뒤에는 값을 표현
		 }
		 
			//Ajax를 수행합니다.
		 $.ajax({
			type: method, //"get" "post", -전송방식
			url : "${pageContext.request.contextPath}/servlet_gson.bo2",  
			data : senddata, //보낼 데이터
			dataType : "json",
			success : function(rdata){ //http 요청이 성공한 경우 실행할 함수 정의(이벤트 핸들러)
				console.log("성공"+rdata); //rdata는 서버에서 보낸 데이터입니다.
				if(rdata.length>0){
				var output = "<div id='result'><table class='table'>"
						   + "<thead><tr><th>아이디</th><th>상품명</th><th>가격</th><th>메이커</th><th>수정</th><th>삭제</th></thead>"
						   + "<tbody>";
				$(rdata).each(function(index,item){
					output+='<tr>';
					output+='	<td>' + item.id + '</td>';
					output+='	<td>' + item.name  + '</td>';
					output+='	<td>' + item.price.toLocaleString() + '</td>';
					output+='	<td>' + item.maker + '</td>';
					output+='	<td><button type=button class="btn btn-warning btn-sm">수정</button></td>';
					output+='	<td><button type=button class="btn btn-danger btn-sm">삭제</button></td>';
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

		
				}//error end
				, complete:function(){
					console.log('.complete');
					$('input[type=hidden]').remove();
				}

		}); //ajax end	
	}//function getData() end
	
	//초기 화면에 데이터를 표시합니다.
	selectData("get");
	
	//데이터를 추가 또는 수정합니다.
	$('#insert_form').submit(function(event){
		
		// 기본 이벤트를 제거합니다.
		event.preventDefault();
		
		//폼안의 button을 찾아 텍스트 노드값을 구합니다.
		var label = $(this).find('button').text();
		selectData('post', label);
		
		if(label == '수정완료'){
			$('button:submit').text('추가').removeClass('btn-success').addClass('btn-primary');
			$('button.btn-danger').prop("disabled", false) //수정완료 버튼을 클릭하면 삭제 버튼 사용가능합니다.
		}
	}); //submit end
	
	
	//수정 버튼 클릭 시 폼 화면의 input에 각각의 데이터가 나타납니다.
	//$(".btn.btn-warning").on('click', function(){//작동안합니다.
		$("body").on('click','.btn.btn-warning',function(){
			
			//클릭한 수정 버튼의 tr 객체를 구합니다.
			var tr = $(this).parent().parent()
			
			//tr객체의 첫번째 자식 td의 텍스트 노드값을 구합니다.
			var id = tr.find('td:nth-child(1)').text();
			
			var name = tr.find('td:nth-child(2)').text();
			var price = tr.find('td:nth-child(3)').text();
			var maker = tr.find('td:nth-child(4)').text();
			$("#name").val(name); //아이디 name요소에 값을 설정합니다.
			$("#price").val(price);
			$("#maker").val(maker);
			
			//추가 버튼이 수정완료버튼으로 label과 색상을 바꿉니다.
			$('button:submit').text('수정완료').removeClass('btn-primary').addClass('btn-success');
			
			$('input:hidden').remove(); //수정 버튼을 여러번 누른 경우 아래의 문장 수행으로 input 태그가 여러 개 생길 수 있어 제거 합니다.
			
			//id값을 폼안의 버튼 뒤에 보이지 않게 추가합니다.
			$('button:submit').after("<input type='hidden' name='id' value='" + id +"'>");
			
			
			$('button.btn-danger').prop('disabled',true);//수정을 클릭시 수정 완료 버튼을 클릭 전까지는 삭제 버튼 비활성화로 만듭니다.
		});
		
	
		//삭제 클릭시
		$("body").on('click','.btn.btn-danger',function(){
			
			if(confirm('정말 삭제하시겠습니까?')){
				var tr = $(this).parent().parent()
				var id = tr.find('td:nth-child(1)').text();
				$('button:submit').after("<input type='hidden' name='id' value='" + id +"'>"); //id가 몇번인지 보낸다
				selectData('post', "삭제");
			}
		
		})
		
	
	
	
</script>
	
</body>
</html>