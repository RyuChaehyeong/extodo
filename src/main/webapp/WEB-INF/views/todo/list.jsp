<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>

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
<title>게시물 목록</title>

</head>
<body>
<div class="container-sm mb-3">
	<div class="row" style="margin-left: 5px;" >
		<div class="col-12 my-5">
		<h1>게시물 목록</h1>
		
		</div>
	</div>
	
	<u:navbar></u:navbar>
	
	<div class="row">
		<div class="col-12">
			<table class="table table-dark">
			  <thead>
			    <tr>
			      <th scope="col">#</th>
			      <th scope="col">제목</th>
			      <th scope="col">등록일</th>
			      <th scope="col">쓰니</th>
			      
			    </tr>
			  </thead>
			  <tbody>
			  <c:forEach items="${list }" var="todo">
			      <tr>
			      <th scope="row">${todo.num }</th>
			      <td>
			      <c:url value="/todo/get" var="boardLink">
			      	<c:param value="${todo.num }" name="num"></c:param>
			      </c:url>
			      <a href="${boardLink }"><c:out value="${todo.title }"/></a>
			      </td>
			      <td><fmt:formatDate pattern="yyyy/MM/dd" value= "${todo.dueDate }"/></td>
			      <td><c:out value="${todo.writer }"/></td>
			     
			    </tr>
			  </c:forEach>
			  </tbody>
			</table>
		</div>
	</div>
	</div>


<div class="modal" tabindex="-1" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">알림</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>처리가 완료되었습니다.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>

      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
$(document).ready(function(){
	var result = '<c:out value="${result}"/>';
	var message = '<c:out value="${message}"/>';
	
	//checkModal(result);
	checkModal2(message);
	
	history.replaceState({}, null, null);
	
	function checkModal2(message) {

		if (message && history.state == null) {
			$("#myModal .modal-body p").html(message);
			$("#myModal").modal("show");
		}
	}
	
	function checkModal(result) {
		if (result === '' || history.state) {
			return;
		}
		
		if (parseInt(result) > 0) {
			$("#myModal .modal-body p")
			.html("게시글 " + result + "번이 등록되었습니다.")
		}
		$("#myModal").modal("show");
		
	}
});
</script>
</body>
</html>