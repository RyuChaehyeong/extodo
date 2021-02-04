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
</head>
<body>
<div class="container-sm mb-3">
	<div class="row" style="margin-left: 5px;">
		<div class="col-12">
		<h1>게시물 확인</h1>
		</div>
	</div>
	
	<div class="row">
		<div class="col-12">
		<form method="post" action="${pageContext.request.contextPath }/todo/register" style="border: 1px solid gray; padding: 20px; margin: 15px">


		  <div class="form-column">
		 	 <div class="form-group col-md-12">
		      <label for="input-num">번호</label>
		      <input name="num" type="text" class="form-control"  value='<c:out value="${todo.num }"/>' id="input-num" readonly>
		    </div>
		    <div class="form-group col-md-12">
		      <label for="input-title">제목</label>
		      <input name="title" type="text" class="form-control"  value='<c:out value="${todo.title }"/>' id="input-title" readonly>
		    </div>
		    <div class="form-group col-md-12">
		      <label for="input-writer">쓴이</label>
		      <input name="writer" type="text" class="form-control" value='<c:out value="${todo.writer }"/>' id="input-writer" readonly>
		    </div>
		  </div>
	  
		</form>
		
	  	
		</div>
	</div>
	
	<div class="row" style="margin: 3px;">
		<div class="col-12">
			<c:url value="/todo/modify" var="modifyLink">
				<c:param name="num" value="${todo.num }"></c:param>
			</c:url>
			
			<a href="${modifyLink }" class="btn btn-secondary"> 수정 </a>
			
		</div>
	</div>
</div>
</body>
</html>