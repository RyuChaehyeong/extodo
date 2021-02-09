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
			complete: function(jqXHR, status) {
				console.log("complete");
				console.log(status);
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
			complete: function(jqXHR, status) {
				if (status === "success") {
					console.log("등록 성공");
					console.log(jqXHR.responseText);
				} else if (status === "error") {
					console.log("등록 실패");
				}
			}
		});
	});
	
	$("#btn-4").click(function(){
		$.ajax({
			type: "get",
			url: "/controller/replies/pages/221/1",
			complete: function(jqXHR, status) {
				if(status === "success") {
					console.log(jqXHR.responseText);
				}
			}
		});
	});
	
	$("#btn-5").click(function(){
		$.ajax({
			type: "delete",
			url: "/controller/replies/1",
			complete: function(jqXHR, status) {
				if(status === "success") {
					console.log(jqXHR.responseText);
				}
			}
		});
	});
	
	$("#btn-6").click(function(){
		$.ajax({
			type: "put",
			url: "/controller/replies/164",
			contentType: "application/json",
			data: '{"reply":"수정수정수정 reply ajax하하하"}',
			complete: function(jqXHR, status) {
				if (status === "success") {
					console.log(jqXHR.responseText)
				}
			}
		});
	});
	
	$("#btn-7").click(function(){
		$.ajax({
			type:"get",
			url: "/controller/replies/164",
			complete: function(jqXHR, status) {
				if (status === "success") {
					console.log(jqXHR.responseText)
				}
			}
		});
	});
	
});

</script>
</head>
<body>
<h1>ajax2</h1>
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