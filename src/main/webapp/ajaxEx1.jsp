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


<script>
$(document).ready(function(){
	$("#btn-1").click(function(){
		$.ajax({
			method: "POST",
			url: "/controller/replies/new",
			data: '{"num":221, "reply":"ajax new reply", "replyer":"mini-27"}',
			contentType: "application/json"
		});
	});
	
	
	$("#btn-2").click(function(){
		$.ajax({
			method: "GET",
			url: "/controller/replies/pages/221/1"
			
		});
	});
	
	$("#btn-3").click(function(){
		$.ajax({
			method: "DELETE",
			url: "/controller/replies/2"
		});
	});
	
	
	$("#btn-4").click(function(){
		$.ajax({
			method: "PUT",
			url: "/controller/replies/8",
			data: '{"reply":"updated updated test ajax"}',
			contentType: "application/json"
		});
	});
	
	$("#btn-5").click(function(){
		$.ajax({
			method: "GET",
			url: "/controller/replies/9"
		});
	});
});
</script>

</head>


<body>
<h1>ajax Ex1</h1>

<button id="btn-1">create reply</button>
<button id="btn-2">get a reply list</button>
<button id="btn-3">delete a reply</button>
<button id="btn-4">update a reply</button>
<button id="btn-5">get a reply</button>
</body>
</html>