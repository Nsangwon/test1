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
			<h1 class="jumbotron">글목록<span class="glyphicon glyphicon-home"></h1>
			<a href="/board/insert">글쓰기<span class="glyphicon glyphicon-pencil"></a>
		</div>
		
		<div class="row">
		 <form target="_blank" action="/board/search">
      <select name="criteria">
         <option value="writer">작성자</option>
         <option value="title">제목</option>
         <option value="content">내용</option>
      </select>  
      <input name="keyword"> <input type="submit" value="검색">
   	</form>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>글번호</th>
						<th>글제목<span class="glyphicon glyphicon-font"></th>
						<th>작성자<span class="glyphicon glyphicon-user"></th>
						<th>조회수<span class="glyphicon glyphicon-heart"></th>
						<th >올린시간<span class="glyphicon glyphicon-time"></th>
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
				
				
			</table>
			<div id="paging">
		<jsp:include page="paging_part.jsp"/>
			</div>
		
		</div>
		
	</div>

	

</body>
</html>