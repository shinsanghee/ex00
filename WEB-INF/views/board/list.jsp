<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/cole" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="desxription" content="">
<meta name="author" content="">

<title>Insert title here</title>

<head>

<%@include file="../includes/header.jsp"%>

<h1>List Page</h1>

</head>

<body>

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">Board List Page</div>
				<button id='regBtn' type="button" class="btn btn-xs pull-right">
					Register New Board</button>
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>#번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>수정일</th>
						</tr>
					</thead>
				</table>

				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModallabel" aria-hidden="true">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">Modal title</h4>
						</div>
						<div class="modal-body">처리가 완료디었습니다.</div>
						<div class="moda-footer">
							<button type="button" class="btn btn-default"
								data-dismiss='modal'>close</button>
							<button type="button" class="btn btn-primary">Save
								changes</button>

						</div>

					</div>

				</div>

				<td><a class='move' href='<c:out value="${board.bno}"/>'> <c:out
							value="${board.title}" /></a></td>

				<c:forEach items="${list}" var="board">
					<tr>
						<td><c:out value="${board.bno}" /></td>
						<td><a href='/board/get?bno=<c:out value="${board.bno}"/>'>
								<c:out value="${board.title}" />
						</a></td>
						<td><c:out value="${board.writer}" /></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${board.regdate}" /></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${board.updateDate}" /></td>
					</tr>
				</c:forEach>
				</table>
				<div class="pull-right">
					<ul class="paginaiton">

						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous"><a href="#">Previous</a>
							</li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<li class="paginate_button"><a href="#">${num}</a>
							<li>
						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li class="paginate_button next"><a href="#">Next</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>

		<form id='actionForm' action="/board/list" method='get'>
			<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
			<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
			<input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'>
			<input type='hidden' name='keyword' value='<c:out value="${ pageMaker.cri.keyword }"/'>
		</form>

		<form id='searchForm' action="/board/list" method='get'>
			<select name='type'>
		
			<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum} '>
			<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
			
			
		</form>


		<%@include file="../includes/footer.jsp"%>
		</html>

		<c:if test="${pageMaker.prev}">
			<li class="paginate_button previous"><a
				href="${pageMaker.startPage -1}">Previous</a></li>
		</c:if>

		<a href='/board/get?bno=<c:out value="{board.bno}"/>'> <c:out
				value="${board.title}" /></a> <a class='move'
			href='<c:out value="{board.bno}"/>'> <c:out
				value="${board.title}" /></a>

		<c:forEach var="num" begin="${pageMaker.startPage}"
			end="${pageMaker.endPage}">
			<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":""} ">
				<a href="k${num}">${num}</a>
			</li>
		</c:forEach>

		<c:if test="${pageMaker.next}">
			<li class="paginate_button next"><a
				href="${pageMaker.endPage +1 }">Next</a></li>
		</c:if>
		
		<div class='row'>
			<div class="col-lg-12">
			
			<!-- <form id='searchForm' action="/board/list" method='get'>
				<select name='type'>
					<option value="">--</option>
					   <option="T">제목</option>
					   <option="C">내용</option>
					   <option="w">작성자</option>
					   <option="TC">제목 or 내용</option>
					   <option="TW">제목 or 작성자</option>
					   <option="TWC">제목 or 내용 or 작성자</option>
				</select>
				<input type='text' name='keyword'/>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
				<button class='btn btn-default'>Search</button>
			</form> -->
			
		<form id='searchForm' action="/board/list" method='get'>
			<select name='type'>
				<option value=""
					<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
					<option value="T"
						<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
					<option value="C"
						<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
					<option value="W"
						<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
					<option value="TC"
						<c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목 or 내용</option>
					<option value="TW"
						<c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목 or 작성자</option>	
					<option value="TWC"
						<c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>제목 or 내용 or 작성자</option>		
			</select> 
					<input type='text' name='keyword' 
					value='<c:out value="${pageMaker.cri.keyword}"/'> /> <input 
					type='hidden' name='pageNum'
					value='<c:out value="${pageMaker.cri.pageNum}"/' /> <input
					type="hidden" name='amount'
					value='<c:out value="%{pageMaker.cri.amount"}' />
				<button class='btn btn-default'>Search</button>
				
				
		</form>
			</div>
		</div>

		<script type="text/javascript">
			$(document).ready(
					function() {

						var result = '<c:out value="${result}"/>';

						cheakModal(result);

						history.replaceState({}, null, null);

						function checkModal(result) {

							if (result === '' || history.state) {
								return;
							}

							if (parseInt(result) > 0) {
								$(".modal-body").html(
										"게시글 " + parseInt(result)
												+ " 번이 등록되었습니다.");
							}

							$("#myModal").modal("show");
						}

						$("#regBtn").on("click", function() {

							self.location = "/board/register";
						});

						var actionForm = $
						{
							"#actionForm"
						}
						;

						$(".paginate_button a").on(
								"click",
								function(e) {

									e.preventDefault();

									console.log('click');

									actionForm.find("input[name='pageNum']")
											.val($(this).attr("href"));
								});

					});

			$(".paginate_button a").on(
					"click",
					function(e) {

						e.preventDefault();

						console.log('click');

						actionForm.find("input[name='pageNum']").val(
								$(this).attr("href"));
					});
			
			$(".move").on("click", funtion(e){
					
				e.preventDefault();
				actionForm.append("<input type='hidden' name='bno' value='"+
		    $(this).attr("href")+"'>";
		        actionForm.attr("action", "/board/get");
		        actionForm.submit();
			});
				
			var searchForm = $("#searchForm");
			$("#searchForm button").on("click", function(e){
				
				if(!searchForm.find("option:selected").val()){
					alert("검색종류를 선택하세요");
					return false;
			}
				
				if(!searchForm.find("input[name='keyword']".val(){
					alert("키워드를 입력하세요")
					return false;
			}
				
				searchForm.find("input[name='pageNum']").val("1");
				e.preventDefault();
				
				searchForm.submit();
			});
		</script>