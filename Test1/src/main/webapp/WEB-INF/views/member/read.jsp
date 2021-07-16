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
<h1>${dto.userName}회원님의 정보 자세히보기<%-- .${test} --%></h1>

userId : ${dto.userId}<br>
userName : ${dto.userName}<br>
email: ${dto.email }<br>
regDate : ${dto.regDate}<br>
updateDate : ${dto.updateDate}<br>
<br>
<a href="/member/update/${dto.userId}">수정</a> | <a id="del" href="/member/delete/${dto.userId}">삭제</a> | <a href="/member/list">목록</a>

<form action="/member/delete" method="post">
	<input type="hidden" name="userId" value="${dto.userId}">
</form>

<script type="text/javascript">
   $(document).ready(function() {
      $("#del").click(function(event) {
         event.preventDefault();
         $("form").submit();
      });
   });
</script>

</body>
</html>