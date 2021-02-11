<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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
     <u:navbar></u:navbar>
<div class="container-sm mb-3">
	<div class="row" style="margin-left: 5px;">
		<div class="col-12">
		<h1>게시물 수정</h1>
		</div>
	</div>
	
	<div class="row">
		<div class="col-12">
		<form id="modify-form" method="post" action="${root }/todo/modify" style="border: 1px solid gray; padding: 20px; margin: 15px">
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}"/>

		  <div class="form-column">
		   <div class="form-group col-md-12">
		      <label for="input-num">번호</label>
		      <input name="num" type="text" class="form-control"  value='<c:out value="${todo.num }"/>' id="input-num" readonly>
		    </div>
		    <div class="form-group col-md-12">
		      <label for="input-title">제목</label>
		      <input value='<c:out value="${todo.title }"/>' name="title" type="text" class="form-control" id="input-title">
		    </div>
		    <div class="form-group col-md-12">
		      <label for="input-writer">쓴이</label>
		      <input value='<c:out value="${todo.writer }"/>' name="writer" type="text" class="form-control" id="input-writer" readonly>
		    </div>
		  </div>
	  	
	  	<input type="hidden" value="${cri.pageNum }" name="pageNum"/>
	  	<input type="hidden" value="${cri.amount }" name="amount"/>
	  	<input type="hidden" value="${cri.type }" name="type"/>
	  	<input type="hidden" value="${cri.keyword }" name="keyword"/>
	  	
	  	<sec:authentication property="principal" var="pinfo"/>
	  	
	  	<sec:authorize access="isAuthenticated()">
	  		<c:if test="${pinfo.username eq todo.writer }">
			  	<button type="submit" class="btn btn-primary" style="margin: 17px;">수정완료</button>
			  	<button id="remove-btn" type="submit" class="btn btn-primary" style="margin: 17px;">삭제</button>
	  		</c:if>
	  	</sec:authorize>
		</form>
		</div>
	</div>
</div>
<script>
$(document).ready(function(){
	$("#remove-btn").click(function(e) {
		e.preventDefault();
		
		$("#modify-form").attr("action", "${root}/todo/remove");
		
		$("#modify-form").submit();
	});
});
</script>
</body>
</html>