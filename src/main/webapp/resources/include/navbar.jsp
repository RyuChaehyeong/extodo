<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
.navbar {
width: 1400px;
}
li {
	font-weight: bold;

}
</style>
</head>
<body>
<div class="container-sm mb-3">

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="${root }/todo/list">게시판</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
	    <ul class="navbar-nav mr-auto">
	      <li class="nav-item active">
			<c:url value="/todo/list" var="listLink">
				<c:param name="pageNum" value="${cri.pageNum }"/>
				<c:param name="amount" value="${cri.amount }"/>
				<c:param name="type" value="${cri.type }"/>
				<c:param name="keyword" value="${cri.keyword }"/>
			</c:url>
	        <a class="nav-link" href="${listLink }">목록 <span class="sr-only">(current)</span></a>
	      </li>
	      
	      <li class="nav-item">
	     	 <c:url value="/todo/register" var="registerLink">
				<c:param name="pageNum" value="${cri.pageNum }"/>
				<c:param name="amount" value="${cri.amount }"/>
			</c:url>
	        <a class="nav-link" href="${registerLink }">글쓰기</a>
	      </li>
    
	      
	      <sec:authorize access="isAnonymous()">
		      <li class="nav-item">
		        <a class="nav-link" href="/customLogin">로그인</a>
		      </li>
	      </sec:authorize>
	      
	      <sec:authorize access="isAuthenticated()">
		      <li class="nav-item">
	      	<form action="/logout" method="post">
		        <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		        <input type="submit" value="로그아웃"/>
	      	</form>
		      </li>
	      </sec:authorize>
	      
	    </ul>
    
	     <form action="${root }/todo/list" id="searchForm" class="form-inline my-2 my-lg-0">
		     <select name="type" class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref">
			    <option value="W" ${cri.type eq 'W' ? 'selected' : ''} >쓰니</option>
			    <option value="T" ${cri.type eq 'T' ? 'selected' : '' }>제목</option>
			    <option value="WT" ${cri.type eq 'WT' ? 'selected' : '' }>전체</option>
			  </select>
		  
		      <input required="required" name="keyword"	value="${cri.keyword }" class="form-control mr-sm-2" type="search" placeholder="검색어를 입력하세요." aria-label="Search">
		      <input type="hidden" name="pageNum" value="1"/>
		      <input type="hidden" name="amount" value="${cri.amount}"/>
		      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
	    </form>
      </div>
</nav>

</div>
<c:if test="${param.logout != null }">
	<script type="text/javascript">
		$(document).ready(function(){
			alert("로그아웃하였습니다.");
		});
	</script>
</c:if>
</body>
</html>