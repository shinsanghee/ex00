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


<div class="row">
	<div class="col-lg-12">
		<h1 class='page-header'> Board Read </h1>
	</div>
	
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
		
		<div class="panel-heading">Board Read Page</div>		
		<div class="panel=body">
		
			<div class="form-group">
				<label>Bno</label> <input class="form-control" name='bno'
				  value='<c:out value="${board.bno}"/>' readonly="readonly">
			</div>
			
			<div class="form-group">
				<label>Title</label>
				<textarea class="form-control" rows="3" name='title'
				value='<c:out value="${board.content}" />' readonly="readonly">
				</textarea>
			</div>
			
			<div class="form-group">
				<label>Text area</label>
				<textarea class="form-control" rows="3" name='content'
				readonly="readonly"><c:out value="${board.content}" />
				</textarea>
			</div>
			
			<div class="form-group">
				<label>Writer</label><input class="form-control" name='writer' 
				value='<c:out value="${board.writer }" />'
				readonly="readonly">
			</div>
			
			<button data-oper='modify' class="btn btn-default
			onclick="location.href='/board/modify?bno=<c:out value="${board.bno }" />'">
								Modify
			</button>
			
			<button data-oper='list' class="btn btn-info"
			onclick="location.href='/board/lis'">
						      List
			</button>
			
			<button data-oper='modify' class="btn btn-default">Modify</butoon>
			<button data-oper='list' class="btn btn-info">List</button>
			
			<form id='operForm' action="/board/modify" method="get">
			   <input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>'>
			  
			  
			<form id='operForm' action="/board/modify" method="get">
				<input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/'>
				<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
				<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
				<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
				<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
			</form>
			   
			</form>			
		</div>
		</div>	
	</div>
</div>


<script type="text/javascript">
$(document).ready(function() {
	
	var operForm = $("#operForm");
	
	$("button[data-oper='modify']").on("click", function(e) {
		
		operForm.attr("action", "/board/modify").submit();
	});
	
	$("button[data-oper='list']").on("click", function(e){
		
		operForm.find("#bno").remove();
		operForm.attr("action","/board/list")
		operForm.submit();
	});
});
</script>

<%@include file="../includes/footer.jsp"%>