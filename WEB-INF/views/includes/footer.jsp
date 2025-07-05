<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

<script>
 $(document).ready(function() {
	 $('#dataTables-example').DataTable({
	  responsive: ture
	 });
	 $(".sidebar-nav")
	 .attr("class", "sidebar-nav navbar-collapse collapse")
	 .attr("aria-expanded", 'false')
	 .attr("style", "height:1px");
 });
</script>
 
</body>
</html>