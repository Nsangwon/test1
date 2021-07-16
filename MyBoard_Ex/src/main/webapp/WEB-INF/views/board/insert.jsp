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
<script type="text/javascript" src="/resources/js/test.js"></script>

<style type="text/css">
	.fileDrop{
		width: 100%;
		height: 250px;
		border: 1px solid red;
		margin: 20px 0;
	}
	
	h1{
	text-align : center;
	
	}
		.ellpsisTarget{
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
	}
</style>
</head>
<body>
<div class="container">
	<div class="row">
		<h1 class="jumbotron">글쓰기<span class="glyphicon glyphicon-pencil"></h1>
	</div>
	
	<div class="row">
		<form action="/board/insert" method="post">
		  <div class="form-group">
		     <label for="writer">writer</label>
		    <input name="writer" type="text" class="form-control" id="writer" placeholder="writer">
		  </div>
		  <div class="form-group">
		    <label for="title">title</label>
		    <input name="title" type="text" class="form-control" id="title" placeholder="title">
		  </div>
		  <div class="form-group">
		     <label for="content">content</label>
		    <textarea rows="10" name="content" type="text" class="form-control" id="content" placeholder="content"></textarea>
		  </div>
		
		</form>
	</div>
	<div class="row">
		<div class="fileDrop" style="text-align: center;">
			<span class="glyphicon glyphicon-floppy-open">
				파일을 드래그하여 드랍하세요.
			</div>
		<div class="uploadedList">
			
		</div>
	</div>
		  <button type="submit" class="btn btn-default">글등록<span class="glyphicon glyphicon-pencil"></button>
	
	
</div>

<script type="text/javascript">
	$(document).ready(function() {
		
		var checkUnload = true;
			$(window).on("beforeunload", function() {
				if(checkUnload){
					event.preventDefault();
					$("#writer").val("");
					$("#title").val("");
					$("#content").val("");
					
					$(".delFile").each(function(index) {
						var filename = $(this).attr("data-filename");
						
						$.ajax({
							type : 'post',
							url : '/board/deleteFile',
							data : {
								filename : filename
								},
							dataType : 'text',
							});
					});
					return "이 페이지를 벗어나면 작성된 내용은 저장되지 않습니다.";
				}
			});
		$("button[type='submit']").click(function(event) {
			event.preventDefault();
			checkUnload = false;
			
			var str ='';
			
			$(".delFile").each(function(index) {
				var filename = $(this).attr("data-filename");
				str += getFileUploadFilenameInput(index, filename);
			});
			$("form").append(str);
			$("form").submit();
			
		});
		
		$(".uploadedList").on("click","small.delFile",function() {
			var that = $(this);
			$.ajax({
				type : 'post',
				url : '/board/deleteFile',
				data : {
					filename : that.attr("data-filename")
				},
				dataType : 'text',
				success : function(result) {
					that.parent("p").parent("div").remove();
				}
				
			});
			
		});
		
		$(".fileDrop").on("dragenter dragover", function(event) {
			event.preventDefault();
		});
		$(".fileDrop").on("drop", function(event) {
			event.preventDefault();
			
			var files =event.originalEvent.dataTransfer.files
			var file = files[0];
			var formData = new FormData();
			formData.append("file", file);
			$.ajax({
				type : 'post',
				url : '/board/uploadfile',
				processData:false,
				contentType:false,
				data : formData,
				dataType : 'text',
				success : function(filename) {
					var msg = uploadUpdateForm(getLinkText(filename),filename,getOriginalName(filename));
					$(".uploadedList").append(msg);
				}
				
			});
			
		});

	});
</script>



</body>
</html>