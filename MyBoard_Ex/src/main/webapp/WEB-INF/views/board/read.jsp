<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>read</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script src="/resources/js/test.js" type="text/javascript"></script>

<style type="text/css">
	.ellpsisTarget{
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
	}
		h1{
	text-align : center;
	}
	
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<h1 class="jumbotron"><span class="glyphicon glyphicon-search">글 자세히보기</h1>		
		</div>
		
		<div class="row">
			<div class="panel panel-default">
			  <div class="panel-heading">
			    <span>NO.${vo.bno}</span>
			    <span><span class="glyphicon glyphicon-user"></span>${vo.writer}</span>
			    <span>&nbsp<span class="glyphicon glyphicon-pencil">${vo.title}</span>
			    <span class="pull-right"><span class="glyphicon glyphicon-time"></span>${vo.updatedate}</span>
			  </div>
			  <div class="panel-body" style="height: 400px;">
			   	<textarea style="width: 100%; height: 100%" readonly>${vo.content}</textarea>
			  </div>
			  <div class="uploadedList">	</div>
			</div>
		</div>
		
		<div class="panel-footer" style="text-align: center;">
			<a class="btn btn-warning update">수정 <span class="glyphicon glyphicon-pencil"></a>
			<a class="btn btn-danger delete">삭제 <span class="glyphicon glyphicon-trash"></a>
			<a class="btn btn-primary reply">댓글 <span class="glyphicon glyphicon-comment"></a>
			<a class="btn btn-info list">목록 <span class="glyphicon glyphicon-home"></a>
		</div>
		
	
	<div class="row">
		<div class="collapse" id="myCollapse">
			<div class="form-group">
				<label for="replyer">replyer</label>
			    <input type="text" class="form-control" id="replyer">
			</div>
			
			<div class="form-group">
				<label for="replytext">replytext</label>
			    <input type="text" class="form-control" id="replytext">
			</div>
			
			<div class="form-group">
				<button class="btn btn-success reply_insert_btn">댓글 등록</button>
			</div>
		</div>
	</div>
		<div id="repliesList" class="row"></div><!--댓글 리스트  -->
	</div>
	
	<div class="row">

		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="modal_rno">1</h4>
		      </div>
		      <div class="modal-body">
		        <div class="form-group">
					<label for="replyer_update">replyer</label>
			    	<input value="홍길동" type="text" class="form-control" id="replyer_update">
				</div>
				
				<div class="form-group">
					<label for="replytext_update">replytext</label>
			    	<input value="홍길동" type="text" class="form-control" id="replytext_update">
				</div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" id="reply_update_btn" data-dismiss="modal">댓글 수정</button>
		        <button type="button" class="btn btn-default"  data-dismiss="modal">취소</button>
		      </div>
		    </div>
		  </div>
		</div>
	</div>
	<form action="/board/delete/${vo.bno}?curPage=${curPage}" method="post"></form>
	
	
	
	<script type="text/javascript">
	$(document).ready(function() {
		var bno = ${vo.bno};	
		
		$("#repliesList").on("click", ".reply_btn_udate_from", function(event) {
			event.preventDefault(); 
			
			var that = $(this);
			var rno = that.parent().attr("data-rno");
			var replyer = that.parent().attr("data-replyer");
			var replytext = that.parent().prev("p").text();
			
			$("#modal_rno").text(rno);
			$("#replyer_update").val(replyer);
			$("#replytext_update").val(replytext);
			
			$("#reply_update_btn").click(function(event) {
				event.preventDefault();
				var rno = $("#modal_rno").text();
				var replyer = $("#replyer_update").val();
				var replytext = $("#replytext_update").val();
				
				$.ajax({
					type : 'put',
					url : '/replies/reply',
					headers : {
						'Content-Type':'application/json',
						'X-HTTP-Method-Override':'PUT'
					},
					data : JSON.stringify({
						rno : rno,
						replyer : replyer,
						replytext : replytext
					}),
					dataType : 'text',
					success : function(result) {
						if (result == 1) {
							alert("수정되었습니다.");
							$("#repliesList").html('');
							getReplyList(bno);
						} else {
							alert("수정 실패했습니다.");
						}
					}
				});
			});
		});
		
		$("#repliesList").on("click", ".reply_btn_delete", function(event) {
			event.preventDefault();
			
			var that = $(this);
			var rno = that.parent().attr("data-rno");
			
			$.ajax({
				type : 'delete',
				url : '/replies/reply',
				headers : {
					'Content-Type':'application/json',
					'X-HTTP-Method-Override':'DELETE'
				},
				data : JSON.stringify({
					rno : rno
				}),
				dataType : 'text',
				success : function(result) {
					if (result == 1) {
						alert("삭제되었습니다.");
						that.parent().parent().parent().remove();
						
					} else {
						alert("삭제 실패했습니다.");
					}
				}
			});
		});
		
		$(".reply_insert_btn").click(function(event) {
			event.preventDefault();
			
			$.ajax({
				type : 'post',
				url : '/replies/reply',
				headers : {
					'Content-Type':'application/json',
					'X-HTTP-Method-Override':'POST'
				},
				data : JSON.stringify({
					bno : bno,
					replyer : $("#replyer").val(),
					replytext : $("#replytext").val()
				}),
				dataType : 'text',
				success : function(result) {
					alert(result);
					$("#repliesList").html('');
					$("#replyer").val('');
					$("#replytext").val('');
					getReplyList(bno);
					
				}
			});
		});
		
		$(".reply").click(function() {
			$("#myCollapse").toggle();
		});
		
		$(".delete").click(function() {
			$("form").submit();
		});
		
		$(".update").click(function() {
			location.assign("/board/update/${vo.bno}?curPage=${curPage}");
		});
		
		$(".list").click(function() {
			location.assign("/board/list/${curPage}");
		});
		
		getReplyList(bno);
		getAttach(bno);
	});
	
	function getReplyList(bno) {
		$.getJSON("/replies/reply/"+bno, function(data) {
			for (var i = 0; i < data.length; i++) {
				var obj = data[i];
				var msg = repliesList(obj.rno, obj.replyer, obj.updatedate, obj.replytext);
				$("#repliesList").append(msg);
			}
		});
	}
	
	function getAttach(bno) {
		$.getJSON("/board/getAttach/"+bno, function(result) {
			for (var i = 0; i < result.length; i++) {
				var filename = result[i];
				
				var msg = uploadViewForm(getLinkText(filename),filename,getOriginalName(filename));
				$(".uploadedList").append(msg);
			}
		});
	}
	</script>

</body>
</html>