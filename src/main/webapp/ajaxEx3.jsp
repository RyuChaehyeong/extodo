<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
  src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
	$("#btn-1").click(function(){
		$.ajax({
			type: "post",
			url: "/controller/replies/new",
			contentType: "application/json",
			data: '{"num":221, "reply":"새댓 new reply ajax!!", "replyer":"mini-27"}',
			success: function(data, status, xhr){
				console.log(data),
				console.log(status)
			}
			
		});
	});
	$("#btn-2").click(function(){
		$.ajax({
			type: "post",
			url: "/controller/replies/new",
			contentType: "application/json",
			data: '{"reply":"새댓 new reply ajax!!", "replyer":"mini-27"}',
			complete: function(jqXHR, status) {
				console.log("complete");
				console.log(status);
			}
		});
	});
	
	$("#btn-3").click(function(){
		$.ajax({
			type: "post",
			url: "/controller/replies/new",
			contentType: "application/json",
			data: '{"num":221, "reply":"새댓 new reply ajax!!", "replyer":"mini-27"}',
			success: function(data, status, xhr){
				console.log("등록성공");
				//console.log(jqXHR.responseText); 아래랑 같은일
				console.log(data);
			},
			error: function(){
				console.log("등록실패")
			}
		});
	});
	
	$("#btn-4").click(function(){
		$.ajax({
			type: "get",
			url: "/controller/replies/pages/221/4",
			success: function(data, status, xhr){
				console.log(data),
				console.log(status)
			}
		
		});
	});
	
	$("#btn-5").click(function(){
		$.ajax({
			type: "delete",
			url: "/controller/replies/4",
			success: function(data, status, xhr) {
				console.log(data),
				console.log(status)
			}
		});
	});
	
	$("#btn-6").click(function(){
		$.ajax({
			type: "put",
			url: "/controller/replies/164",
			contentType: "application/json",
			data: '{"reply":"수정수정수정 reply ajax하하하"}',
			success: function(data, status, xhr) {
				console.log(data), 
				console.log(status)
			}
		});
	});
	
	$("#btn-7").click(function(){
		$.ajax({
			type:"get",
			url: "/controller/replies/164",
			success: function(data, status, xhr) {
				console.log(data),
				console.log(status)
			}
		});
	});
	
});

</script>
</head>
<body>
<h1>ajax3333333333</h1>
<div>
<button id="btn-1">create a reply 성공</button>
</div>
<div>
<button id="btn-2">create a reply 실패</button>
</div>
<div>
<button id="btn-3">create a reply 성공 or 실패</button>
</div>
<div>
<button id="btn-4">get a reply list</button>
</div>
<div>
<button id="btn-5">remove a reply</button>
</div>
<div>
<button id="btn-6">update a reply</button>
</div>
<div>
<button id="btn-7">get a reply</button>
</div>

</body>
</html>