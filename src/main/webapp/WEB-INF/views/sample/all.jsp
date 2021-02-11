<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<h1>모든 사람에 접근 가능한 uri를 가지는 페이지</h1>

<sec:authorize access="isAnonymous()">
	<div class="card">
	  <div class="card-body">
	    	모든 사람이 다보이는 카드 부분입니다.
	    		isAnonymous() 사용
	  </div>
	</div>
</sec:authorize>

<sec:authorize access="permitAll">
	<div class="card">
	  <div class="card-body">
	    	모든 사람이 다보이는 카드 부분입니다.
	    		permitAll 사용
	    	
	  </div>
	</div>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
	<div class="card">
	  <div class="card-body">
	    	로그인한 멤버와 관리자만 보입니다.	
	  </div>
	</div>
</sec:authorize>


<sec:authorize access="hasRole=('ROLE_ADMIN')">
	<div class="card">
	  <div class="card-body">
	    	로그인한 멤버와 관리자만 보입니다.	
	  </div>
	</div>
</sec:authorize>


<sec:authorize access="hasAnyRole=('ROLE_ADMIN', 'ROLE_MEMBER')">
	<div class="card">
	  <div class="card-body">
	    	로그인한 멤버와 관리자만 보입니다.	
	  </div>
	</div>
</sec:authorize>

</body>
</html>