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
		$.ajax("/controller/replies/new", {
			type: "post",
			contentType: "application/json",
			data: '{"num":221, "reply":"새댓 new reply ajax!!", "replyer":"mini-27"}'	
		}).done(function(data, status, xhr){
			console.log("등록성공");
			//console.log(jqXHR.responseText); 아래랑 같은일
			console.log(data);
		}).fail(function(){
			console.log("등록실패")
		});
	});
	
	$("#btn-4").click(function(){
		$.ajax("/controller/replies/pages/221/4", {
			type: "get"
		}).done(function(data, status, xhr){
			console.log(data),
			console.log(status)
		});
	});
	
	$("#btn-5").click(function(){
		$.ajax("/controller/replies/8", {
			type: "delete"
		}).done(function(data, status, xhr) {
			console.log(data),
			console.log(status)
		});
	});
	
	$("#btn-6").click(function(){
		$.ajax("/controller/replies/164", {
			type: "put",
			contentType: "application/json",
			data: '{"reply":"수정수정수정 reply ajax하하하"}'
		}).done(function(data, status, xhr) {
			console.log(data), 
			console.log(status)
		});
	});
	
	$("#btn-7").click(function(){
		$.get("/controller/replies/164")
		.done(function(data, status, xhr) {
			console.log(data),
			console.log(status)
		});
	});
	
	
	$("#btn-8").click(function(){
		$.get("/controller/replies/164", function(data, status) {
			console.log(data),
			console.log(status)
		});
		
	});
	
	$("#btn-9").click(function(){
		$.get("/controller/replies/164", function(data, status) {
			console.log(data),
			console.log(data.rno),
			console.log(data.num),
			console.log(data.reply),
			console.log(data.replyer)
		}, "json");
		
	});
	
	$("#btn-10").click(function(){
		$.get("/controller/replies/164", function(data, status) {
			console.log(data),
			console.log(data.rno),
			console.log(data.num),
			console.log(data.reply),
			console.log(data.replyer)
		}, "text");
		
	});
	
	$("#btn-11").click(function(){
		$.getJSON("/controller/replies/164", function(data, status) {
			console.log(data),
			console.log(data.rno),
			console.log(data.num),
			console.log(data.reply),
			console.log(data.replyer)
		});
		
	});
	
});

</script>
</head>
<body>
<h1>ajax ex6</h1>
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
<div>
<button id="btn-8">get a reply (8)</button>
</div>
<div>
<button id="btn-9">get a reply (9)</button>
</div>
<div>
<button id="btn-10">get a reply (10)</button>
</div>
<div>
<button id="btn-11">get a reply (11)</button>
</div>

</body>
</html>