<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<script>
var app = '${root}';
var num = ${todo.num };
var replyer = null;
<sec:authorize access="isAuthenticated()">
replyer = '<sec:authentication property="principal.username"/>';
</sec:authorize>
var csrfHeaderName = "${_csrf.headerName}"
var csrfTokenValue = "${_csrf.token}"

</script>

<meta charset="UTF-8">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
  src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${root }/resources/js/reply.js"></script>
<script>
/*

replyService.add({
	num:221, 
	reply:"new20210209", 
	replyer:"tester"
	}, function(result){
		console.log(result);
	}, function(err){
		console.log(err);
	}
);
replyService.getList(
		 {num:221, page:1}, 
		 function(data){
			 console.log(data);

		 }, function (){
			 console.log("error");
		 }
);
 
replyService.remove(
		9,
		function(result) {
			console.log(result);
		},
		function(error) {
			console.log(error);
		}
);
 replyService.update (
		{rno:183, reply:"update20210209"},
		function(result) {
			console.log(result);
		},
		function(error) {
			console.log(error);
		}
);
 replyService.get(
	88,
	function(result) {
		console.log(result);
	},
	function(error) {
		console.log(error);
	}
 );
 */
</script>

<script>
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	});

	$(document).ready(function(){
		//날짜 형식 바꾸는 함수 dateString
		function dateString(date) {
			var d = new Date(date);
			return d.toISOString().split("T")[0];
		}
		
		
		//댓글 목록 가져오기 function
		function showList() {
			
			replyService.getList(
					{num: num}, 
					function(list){
				//console.log(list);
				//위에 list는 controller에서 ResponseEntity에 붙여준 list
					var replyUl = $("#reply-ul");
				
					//이전에 append된 것 비우기
					replyUl.empty();
					for (var i = 0; i < list.length; i++) {
						var replyLi = '<li class="media" data-rno="' 
						+ list[i].rno + '"><div class="media-body"><h5>' 
						+ list[i].replyer + '<small class="float-right"> '
						+ dateString(list[i].replyDate) + '</small></h5>' +
						list[i].reply + '<hr></div></li>';
						
						replyUl.append(replyLi);
					}
			});
		}
			
		
		//새 댓글 버튼 클릭 이벤트 처리
		$("#new-reply-btn").click(function(){
			$("#replyer-input").val(replyer);
			$("#new-reply-modal").modal("show");
		});
		
		
		//새 댓글 등록버튼 클릭 이벤트 처리
		$("#reply-submit-btn").click(function(){
			var reply = $("#reply-input").val();
			var data = {num:num, reply:reply, replyer:replyer};
			
			replyService.add(data, 
					function(){
						//성공했을 때 실행
						showList();
						alert("댓글 등록에 성공하였습니다.");
					},
					
					function(){
						alert("댓글 등록에 실패하였습니다.");
				
			});
			
			//모달 닫기
			$("#new-reply-modal").modal("hide");
			
			//모달 내 input element value 초기화
			$("#new-reply-modal input").val("");
			
		});
		
		$("#reply-ul").on("click", "li", function(){
			//li들 중 click받은 li의 data-rno를 출력하도록
			console.log($(this).attr("data-rno"));
			
			//modify modal form으로 댓글내용 get
			var rno = $(this).attr("data-rno");
			
			replyService.get(rno, function(data) {
				$("#rno-input2").val(rno);
				$("#reply-input2").val(data.reply);
				$("#replyer-input2").val(data.replyer);
				//modal show도 replyService.get이 성공하면!
				$("#modify-reply-modal").modal("show");
			});
			
			
		});
		
		//수정 버튼 이벤트 처리
		$("#reply-modify-btn").click(function(){
			var originalReplyer = $("#replyer-input2").val();
			console.log("Original Replyer: " + originalReplyer);
			
			var rno = $("#rno-input2").val();
			var reply = $("#reply-input2").val();
			var data = {rno: rno, reply: reply, replyer: originalReplyer};
			
			if (!replyer) {
				alert("로그인 후에 수정이 가능합니다.");
				$("#modify-reply-modal").modal("hide");
				return;
				
			}
			
			
			if (replyer != originalReplyer) {
				alert("자신이 작성한 댓글만 수정이 가능합니다.");
				$("#modify-reply-modal").modal("hide");
				return;
			}
			
			
			replyService.update(
				data,
				function() {
					alert("수정이 완료되었습니다.");
					showList();
				}
			);
			
			$("#modify-reply-modal").modal("hide");
		});
		
		$("#reply-delete-btn").click(function(){
			var rno = $("#rno-input2").val();
			console.log("RNO: " + rno);
			console.log("REPLYER: " + replyer);
			
			if (!replyer) {
				alert("로그인 후에 삭제가 가능합니다.");
				$("#modify-reply-modal").modal("hide");
				return;
				
			}
			var originalReplyer = $("#replyer-input2").val();
			console.log("Original Replyer: " + originalReplyer);
			
			if (replyer != originalReplyer) {
				alert("자신이 작성한 댓글만 삭제가 가능합니다.");
				$("#modify-reply-modal").modal("hide");
				return;
			}
			
			replyService.remove(
					rno, replyer,
					function(){
						alert("삭제가 완료되었습니다.");
						showList();
			});
			
			$("#modify-reply-modal").modal("hide");
			
		});
		//댓글 목록 가져오기 실행
		showList();
		

		
		
		
	});
</script>

<title>Insert title here</title>
</head>
<body>
<u:navbar></u:navbar>

	<!-- 본문 하나 get -->
	<div class="container-sm mb-3">
		<div class="row" style="margin-left: 5px;">
			<div class="col-12">
			<h1>게시물 확인</h1>
			</div>
		</div>
		
		<div class="row">
			<div class="col-12">
			<form method="post" action="${root }/todo/register" style="border: 1px solid gray; padding: 20px; margin: 15px">
	
	
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
					<c:param value="${todo.num }" name="num"></c:param>
					<c:param value="${cri.pageNum }" name="pageNum"></c:param>
					<c:param value="${cri.amount }" name="amount"></c:param>
					<c:param value="${cri.type }" name="type"></c:param>
					<c:param value="${cri.keyword }" name="keyword"></c:param>
				</c:url>
				<sec:authentication property="principal" var="pinfo"/>
					<sec:authorize access="isAuthenticated()">
						<c:if test="${pinfo.username eq todo.writer }">
							<a href="${modifyLink }" class="btn btn-secondary"> 수정 </a>
						</c:if>
					</sec:authorize>			

				
			</div>
		</div>
	</div>

	<!-- 댓글 목록 container -->
	<div class="container-sm my-3">
		<div class="row" style="margin-left: 5px;">
			<div class="col-12">
				<div class="card">
				
					<div class="card-header d-flex justify-content-between align-items-center">
						<span>댓글 목록</span>
						<sec:authorize access="isAuthenticated()">
						<button class="btn btn-info" id="new-reply-btn">댓글 쓰기</button>
						</sec:authorize>
					</div>
					
					<div class="card-body">
						<ul class="list-unstyled" id="reply-ul">
							
						</ul>
						
					</div>
				</div>
			
			</div>
		</div>
	</div>

	
	
	<!-- 새 댓글 modal form -->
	
	<div class="modal fade" id="new-reply-modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">
						새 댓글
					</h5>
					<button type="button" class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
				</div>
				
				<div class="modal-body">
					<div class="form-group">
						<label for="reply-input" class="col-form-label">댓글</label>
						<input type="text" class="form-control" id="reply-input">
					</div>
					<div class="form-group">
						<label for="replyer-input" class="col-form-label">작성자</label>
						<input type="text" class="form-control" id="replyer-input" readonly>
					</div>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
					<button id="reply-submit-btn" type="button" class="btn btn-primary" >등록</button>
				</div>
			
			
			</div>
			
		</div>
	</div>
	
	<!-- 수정용 modal form -->	
	<div class="modal fade" id="modify-reply-modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">
						수정/삭제
					</h5>
					<button type="button" class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
				</div>
				
				<div class="modal-body">
					<input type="hidden" id="rno-input2" type="text" class="form-control" id="reply-input2">
					<div class="form-group">
						<label for="reply-input2" class="col-form-label">댓글</label>
						<input type="text" class="form-control" id="reply-input2">
					</div>
					<div class="form-group">
						<label for="replyer-input2" class="col-form-label">작성자</label>
						<input readonly type="text" class="form-control" id="replyer-input2">
					</div>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
					<button id="reply-modify-btn" type="button" class="btn btn-primary" >수정</button>
					<button id="reply-delete-btn" type="button" class="btn btn-danger" >삭제</button>
				</div>
			
			
			</div>
			
		</div>
	</div>
	
</body>
</html>