<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	 
	 <div class="panel-heading">Board Modify Page</div>
	 <div class="panel-body">
	 	<form role="form" action="/board/modify" method="post">
	 	</form>
	 </div>
	 
	 <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
	 <input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
	 <input type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
	 <input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>'>	 
</body>

<script type="text/javascript">
$(document).ready(function() {
	
	var formObj = $("form");
	
	$('button').on("click", function(e){
		
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		console.log(operation);
		
		if(operation === 'remove'){
			formObj.attr("action", "/board/remove");
		}else if(operation === 'list'){
			//move to list
			formObj.attr("action", "board/list").attr("method", "get");
			
			var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();
			var keywordTag = $("input[name='keyword']").clone();
			var typeTag = $("input[name='type']").clone();
			
			formObj.empty();
			
			formObj.append(pageNumTag);
			formObj.append(amountTag);
			formObj.append(keywordTag);
			formObj.append(typeTag);
		}
		
		formObJ.submit();
		
		});
	});
</script>
</html>