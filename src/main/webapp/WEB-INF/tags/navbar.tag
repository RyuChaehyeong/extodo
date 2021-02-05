<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
    </ul>
    
      </div>
</nav>

</div>