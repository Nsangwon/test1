<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>    
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<h1>회원목록</h1>
<a href="/member/insert">글쓰기</a>

	<table border="1px">
		<tr>
			<th>userId</th>			
			<th>userName</th>			
			<th>regDate</th>		
		
		</tr>
		
	

	<c:forEach items="${list}" var="dto">
	<tr>
		<td>${dto.userId}</td>
		<td><a href="/member/read/${dto.userId}">${dto.userName}</a> </td>
		<td>${dto.regDate}</td>
	</tr>
</c:forEach>
	
</table>

	 
<!-- <script src="/resources/js/test.js" type="text/javascript"></script>	 
<script type="text/javascript">
	$(document).ready(function() {
		me1("당근","생선");
		var msg2 = me2("hello","world");
		$("body").append(msg2);
	});
</script> -->
	 
</body>
</html>