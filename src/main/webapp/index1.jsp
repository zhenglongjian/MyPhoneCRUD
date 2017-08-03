<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${ ctp }/plugin/bootstrap-3.3.7/css/bootstrap.min.css" />
<script type="text/javascript" src="${ ctp }/script/jquery-2.1.1.min.js"></script>
<script type="text/javascript"
	src="${ ctp }/plugin/bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#myButton").click(function(){
			$.get(
				"${ctp}/list",
				function(data){
					var str = JSON.stringify(data);
					console.log(str);
					$("div#list").append(str);
				}
			);
			
		});
		
	});
</script>
</head>
<body>
	<h1>
		<a href="${ ctp }/helloworld">HelloWorld</a>
	</h1>
	<button type="button" id="myButton" class="btn btn-primary" data-toggle="button" aria-pressed="false" autocomplete="off">
  		
	</button>
	<div id="list"></div>
<!-- 	<table> -->
<!-- 		<thead> -->
<!-- 			<tr> -->
<!-- 				<th>编号</th> -->
<!-- 				<th>姓名</th> -->
<!-- 				<th>邮箱</th> -->
<!-- 				<th>生日</th> -->
<!-- 			</tr> -->
<!-- 		</thead> -->
<!-- 		<tbody> -->
<%-- 			<c:forEach items="info"> --%>
<!-- 				<tr> -->
					
<!-- 				</tr> -->
<%-- 			</c:forEach> --%>
			
<!-- 		</tbody> -->
<!-- 	</table> -->
	
</body>
</html>