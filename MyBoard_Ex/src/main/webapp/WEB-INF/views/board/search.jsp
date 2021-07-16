<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>search</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">
		h1{
	text-align : center;
	}
	
		#paging{
	text-align: center;
	}
		th,td{
	text-align: center;
}
	
</style>
</head>
<body>
<div class="container">
	<div class="row">
		<h1 class="jumbotron">검색 목록</h1>
	</div>

<table class="table table-hover">
				<thead>
					<tr>
						<th>글번호</th>
						<th>글제목</th>
						<th>작성자</th>
						<th>조회수</th>
						<th>올린시간</th>
					</tr>
				</thead>
				
				<tbody>
				<c:forEach items="${to.list}" var="vo">
					<tr>
						<td>${vo.bno}</td>
						<td><a href="/board/read/${vo.bno}?curPage=${to.curPage}">${vo.title}</a></td>
						<td>${vo.writer}</td>
						<td>${vo.readcnt}</td>
						<td>${vo.updatedate}</td>
					</tr>
				</c:forEach>
				</tbody>
				<div id="paging">
					<jsp:include page="paging_part_search.jsp"/>
				</div>
			</table>
</div>

</body>
</html>