<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.domain.QNABoardVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<style type="text/css">

div.questionContent {
	min-height: 120px;
}

.answerContent {
	min-height: 120px;
}

hr {
	margin-top: 15px;
    margin-bottom: 15px;
}

hr.mainHorizental {
	background-color: DimGray;
	width: 680px;
	height: 3px;
	margin-left: -15px;
}

.pagination {
	display: flex;
	justify-content: center;
}

.pagination a.active:hover {
	background-color: CornflowerBlue;
	color: white;
}

.pagination a:hover:not(.active) {
	background-color: silver;
	color: white;
}

.pagination a.active {
	background-color: RoyalBlue;
	color: white;
}

a {
	color: black;
	text-decoration: none;
}

a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: black;
	text-decoration: none;
}

a:active {
	color: red;
	text-decoration: none;
}
</style>
<body>
	<br>
	<div class="container qnaBoard" style="border: 2px solid grey; width: 750px; margin: auto">
		<br>
		<div class="row" style="width: 650px; margin: auto;">
			<h1
				style="float: left; margin-top: 15px; margin-left: 30px; font-size: 30px; font-weight: bold;">μνλ¬Έμ</h1>
			<a class="btn btn-primary insertBtn" data-toggle="modal"
				data-target="#questionModal"
				style="float: right; margin-top: 10px; margin-right: 30px; font-size: 15px; color: white;">λ¬ΈμνκΈ°</a>
			<br> <br> <br>
			<hr class="mainHorizental">
			<div class="qnaList" id="qnaList"></div>
			<br>
			<div class="page" id="page" style="text-align: center; margin-bottom: 0px;"></div>
			<button type="button" class="btn btn-primary btn-xs goFirst"
				style="height: 30px; margin-top: -52px;">μ²μμΌλ‘</button>
		</div>
		<br>
	</div>
	<br>
	<!-- νμμ°½ -->
	<div class="low">
		<!-- Modal -->
		<div class="modal fade" id="questionModal" tabindex="-1" role="dialog"
			aria-labelledby="questionModalLabel" data-backdrop="static">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="modal_rno" style="text-align: center;">λ¬Έμ
							μμ±</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="id" style="margin-left: 3px;">μμ±μ</label>
							<input class="form-control" type="text" id="name" name="name"
								style="width: 200px;"> 
							<label for="password"
								style="float: right; margin-right: 140px; margin-top: -59px;">λΉλ°λ²νΈ</label>
							<p style="text-align: right;  margin-top: -59px;">
								<span style="color: RoyalBlue;" class="passwordTotalLength">0</span><span>/50</span>
							</p>
							<input type="password" class="form-control" id="password"
								name="password"
								style="float: right; width: 200px; margin-top: -33px;" />
						</div>
						<br><br>
						<div class="form-group">
							<label for="title">μ λͺ©</label> <input type="text"
								class="form-control" id="title" name="title" />
						</div>
						<div class="form-group">
							<label for="contentText">λ³Έλ¬Έ</label>
							<textarea style="resize: horizontal; height: 150px;" class="form-control" rows="10"
								id="contentText" name="contentText" placeholder="300μ μ΄λ΄λ‘ μλ ₯ν΄μ£ΌμΈμ."></textarea>
							<p style="text-align: right;">
								<span style="color: RoyalBlue;" class="contentTotalLength">0</span><span> / 300</span>
							</p>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default cancelInsert" data-dismiss="modal">μ·¨μ</button>
						<button id="question_insert_btn" type="button"
							class="btn btn-primary">μμ± μλ£</button>
					</div>
				</div>
			</div>
		</div>

		<!-- Modal -->
		<div class="modal fade" id="answerModal" tabindex="-1" role="dialog"
			aria-labelledby="answerModalLabel" data-backdrop="static">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="modal_rno" style="text-align: center;">λ΅λ³
							μμ±</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="answerName" style="margin-left: 3px;">μμ±μ</label>
							<c:choose>
								<c:when test="${empty login }">
									<input class="form-control" type="text" id="answerName"
										name="answerName" style="width: 200px;">
								</c:when>
								<c:otherwise>
									<input class="form-control" type="text" id="answerName"
										name="answerName" value="${login.userName }"
										style="width: 200px;" readonly>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="form-group">
							<label for="answertitle">μ λͺ©</label> <input type="text"
								class="form-control" id="answertitle" name="answertitle" />
						</div>
						<div class="form-group">
							<label for="answercontentText">λ³Έλ¬Έ</label>
							<textarea style="resize: horizontal; height: 150px;" class="form-control" rows="10"
								id="answercontentText" name="answercontentText" placeholder="300μ μ΄λ΄λ‘ μλ ₯ν΄μ£ΌμΈμ."></textarea>
							<p style="text-align: right;">
								<span style="color: RoyalBlue;" class="answercontentTotalLength">0</span><span> / 300</span>
							</p>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default answercancelInsert" data-dismiss="modal">μ·¨μ</button>
						<button id="answer_insert_btn" type="button"
							class="btn btn-primary">μμ± μλ£</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="/resources/js/qna.js"></script>
	<script type="text/javascript">
	//< λ‘κ·ΈμΈ μ λ³΄
	var userId = "${login.userId}";
	var userName = "${login.userName}";
	var userGrade = "${login.userGrade}";
	
	//< κ²μκΈ λ²νΈ λ³μ
	var qBno = ${vo.prodBno};
	var qQno;
	
	//< pagination λ³μ
	var curPage = 1;
	var beginPageNum;
	var finishPageNum;
	var totalPage;
	
	//< κ΄λ¦¬μ νμΈ λ° κΈ°λ₯ λ³κ²½μ© λΌλ¦¬μλ£ν
	var isAdministrator = false;
	var isUpdate = false;
	
	//< κ΄λ¦¬μ λ΅λ³ μ μμ΄λ μΈμμ©
	var questionId;
	
	$(document).ready(function() {
		
		//< κ΄λ¦¬μ κΆν μ²΄ν¬
		checkGrade(userGrade);
		
		//< μ²« νλ©΄ λ¦¬μ€νΈ μΆλ ₯
		getPageList(qBno, curPage);
		
		//< (μ μ²΄) νμ₯ κΈ°λ₯
		$("#qnaList").on("click", ".toggleText", function() {

			//< κ΄λ¦¬μ κΆν μ²΄ν¬
			checkGrade(userGrade);
			
			//< Qno κ°μ Έμ€κΈ°
			qQno = $(this).parent().next().next().next().children('div.qQno').text();
			
			//< μ λͺ©~λ³Έλ¬Έ κ΅¬λΆμ 
			var hr = $(this).parent().next().next().next().next("div");
			
			//< μμ±μμ λ‘κ·ΈμΈ μ λ³΄κ° λμΌνμ§ id μ²΄ν¬μ© λΌλ¦¬μλ£ν / default: false;
			var isWriter = false;
			
			//< μμ±μ μ λ³΄
			var qWriterId = $(this).prev().text();
			
			//< λΉλ°λ²νΈμλ ₯, λ³Έλ¬Έ λ΄μ©, λ΅κΈ λ΄μ©
			var passwordBox = $(this).parent().next().next("div");
			var contentBox = $(this).parent().next().next().next("div");
			
			//< λ³Έλ¬Έκ³Ό λ΅κΈ κ΅¬λΆμ© (λ€μ¬μ°κΈ° 0 : λ³Έλ¬Έ / 1 : λ΅κΈ)
			var checkRepRoot = $(this).parent().next().next().next("div").children('div.qRepindent').text();
			
			//< λ²νΌ μ’ν μ μ₯μ© (κΆν νΉμ μμ±μ λ³ΈμΈμΈμ§ νμΈ ν λ²νΌ μμ± or μ­μ )
			var optionBtns = $(this).parent().next().next().next().children('div.buttonDiv');
			
			//< μμ±μ μ λ³΄μ λ‘κ·ΈμΈ μ λ³΄ λΉκ΅ λ° λ°νκ°(λΌλ¦¬μλ£ν, true/false)
			isWriter = checkId(userId, qWriterId);
			
			//< λ³Έλ¬Έ μμ±μμ ID μ λ³΄ μ μ₯
			questionId = qWriterId;
			
			//< λ²νΌ μ μ₯μ© div νκ·Έ μ΄κΈ°ν
			optionBtns.empty();
			
			//< λ³Έλ¬Έ
			if(parseInt(checkRepRoot) != 1)
			{
				//< κ΄λ¦¬μ
				if(isAdministrator)
				{
					var questionMsg = `
						<button type="button" class="btn btn-outline-info btn-xs answer">
							Answer
						</button>
						&nbsp;
						<button type="button" class="btn btn-outline-dark btn-xs delete">
							Delete
						</button>
					`;
					
					optionBtns.html(questionMsg);
				}
				//< μμ±μ
				else if(isWriter)
				{
					var questionMsg = `
						<button type="button" class="btn btn-outline-dark btn-xs delete">
							Delete
						</button>
					`;
			
					optionBtns.html(questionMsg);
				}
				//< λΉνμ, textμ΄λ―λ‘ "null" λ‘ λΉκ΅ν΄μΌν¨, ===λ λ¬Έμμ΄ λΉκ΅
				else if(qWriterId === "null")
				{
					var questionMsg = `
						<button type="button" class="btn btn-outline-dark btn-xs delete">
							Delete
						</button>
					  `;

					optionBtns.html(questionMsg);
				}
			}
			//< λ΅κΈ
			else	
			{
				//< κ΄λ¦¬μλ§ 
				if(isAdministrator)
				{
					var answerMsg = `
						<button type="button" class="btn btn-outline-info btn-xs modify">
							Modify
						</button>
						&nbsp;
						<button type="button" class="btn btn-outline-dark btn-xs AnswerDelete">
							Delete
						</button>
					`;
					
					optionBtns.html(answerMsg);
				}
			}
			
			//< κ΄λ¦¬μκ±°λ μμ±μ λ³ΈμΈμΌ κ²½μ°
			if(isAdministrator || isWriter)
			{
				//< λΉλ°λ²νΈ μλ ₯μ°½μ΄ νμ₯λμ΄ μμ κ²½μ°
				if( passwordBox.is(":visible") ){
					//< μΆμ
					passwordBox.slideUp();
				}
				//< λ³Έλ¬Έλ΄μ©μ΄ νμ₯ λμ΄μμ κ²½μ°
				else if( contentBox.is(":visible") ){
					//< μΆμ
					contentBox.slideUp();
				}
				else{
					//< μΆμλ λ³Έλ¬Έλ΄μ© νμ₯
					contentBox.slideDown();
				}
			}
			//< μΌλ°νμ λ° λΉνμμΌ λ
			else
			{
				if( passwordBox.is(":visible") ){
					passwordBox.slideUp();
				}
				else{
					if(contentBox.is(":visible"))
					{
						contentBox.slideUp();
					}
					else
					{
						passwordBox.slideDown();
					}				
				}
			}
			
			//< λ²νΌ μ μ₯μ© div λ° νμ₯ μ€λΈμ νΈ κ΅¬λΆμ  μ κΈ°/νΌμΉκΈ° μ€μ 
			if( optionBtns.is(":visible") ){
				//< μΆμ
				optionBtns.slideUp();
			}
			else{
				//< μΆμλ λ³Έλ¬Έλ΄μ© νμ₯
				optionBtns.slideDown();
			}

			if( hr.is(":visible") ){
				hr.slideUp();
			}
			else{
				hr.slideDown();
			}
		});
		
		//< (λ³Έλ¬Έ) λΉλ°λ²νΈ μλ ₯
		$("#qnaList").on("click", ".enter", function() {
			
			var that = $(this).prev("input").val();
			var contentBox = $(this).parent().parent().next();
			var passwordBox = $(this).parent().parent();
			var inputPw = $(this).prev("input");
			
			$.ajax({
				type : "post",
				url : "/qna/getPw",
				headers : {
					'Content-Type' : 'application/json',
					'X-HTTP-Method-Override' : 'post'
				},
				data : JSON.stringify({
					qQno : qQno
				}),
				dataType : 'text',
				success : function(pw) {

					//< λΉλ°λ²νΈ μλ ₯μ΄ μΌμΉνμ κ²½μ°
					//< login μμ΄λμ λΉκ΅νλ κ²½μ°λ μΆκ°ν΄μΌν¨
					if(that.trim() === pw)
					{
						contentBox.show();
						passwordBox.hide();
						inputPw.val("");
					}
					else
					{
						alert("λΉλ°λ²νΈκ° μΌμΉνμ§ μμ΅λλ€.");
						$(this).prev("input").val("");
					}
				}
			});
		});
		
		//< λ¬ΈμνκΈ° λ²νΌ
		$(".insertBtn").click(function(event){
			
			//< λ΄λΆ μλ ₯ μν μ΄κΈ°ν
			$("#title").val("");
			$("#contentText").val("");
			$("#password").val("");
			$(".contentTotalLength").text(0);
			$(".passwordTotalLength").text(0);
			
			if(userId.length > 1)
			{
				//< μ½κΈ° μ μ© μ€μ 
				$("#name").attr('readonly', 'readonly');
				
				$("#name").val(userId);
			}
			else
			{
				//< μ½κΈ° μ μ© ν΄μ 
				$("#name").removeAttr('readonly');
			}
		});

		//< μ΅λ κΈμ μ μλ ₯ μ ν, νμΈνκΈ° νλ  λΉλ°λ²νΈ, λ³Έλ¬Έλ§ μ²΄ν¬
		$("#password").keyup(function(event){
			event.preventDefault();
			var contentText = $(this);
			var contentTextLength = stringLength(contentText.val());
			
			$(".passwordTotalLength").text(contentTextLength);
		});

		$("#contentText").keyup(function(event){
			event.preventDefault();
			var contentText = $(this);
			var contentTextLength = stringLength(contentText.val());
			
			$(".contentTotalLength").text(contentTextLength);
		});
		
		$("#answercontentText").keyup(function(event){
			event.preventDefault();
			var contentText = $(this);
			var contentTextLength = stringLength(contentText.val());
			
			$(".answercontentTotalLength").text(contentTextLength);
		});
		
		//< (λ³Έλ¬Έ) μλ ₯ κΈ°λ₯
		$("#question_insert_btn").click(function(event){
			event.preventDefault();
			
			console.log($("#contentText").val());
			
			var name = $("#name").val();
			var title = $("#title").val();
			var content = $("#contentText").val();
			var password = $("#password").val();
			
			if(stringLength($("#name").val()) > 30)
			{
				alert("λλ€μμ 30μ κΉμ§λ§ κ°λ₯ν©λλ€.");
			}
			else if(stringLength($("#contentText").val()) > 300)
			{
				alert("λ³Έλ¬Έμ 300μ κΉμ§λ§ κ°λ₯ν©λλ€.");
			}
			else if(stringLength($("#title").val()) > 50)
			{
				alert("μ λͺ©μ 50μ κΉμ§λ§ κ°λ₯ν©λλ€.");
			}
			else if(stringLength($("#password").val()) > 50)
			{
				alert("λΉλ°λ²νΈλ 50μ κΉμ§λ§ κ°λ₯ν©λλ€.");
			}
			else
			{
				$.ajax({
					type : "post",
					url : "/qna/insert",
					headers : {
						'Content-Type' : 'application/json',
						'X-HTTP-Method-Override' : 'post'
					},
					data : JSON.stringify({
						qBno : qBno,
						qTitle : title,
						qWriter : name,
						qContent : content,
						qPassword : password,
						qUserId : userId
					}),
					dataType : 'text',
					success : function(result) {
						
						$("#name").val("");
						$("#title").val("");
						$("#contentText").val("");
						$("#password").val("");
						
						getPageList(qBno, 1);
					}
				});

				$("#questionModal .close").click();
				$("#questionModal .close").trigger("click");
			}
		});
		
		//< (λ³Έλ¬Έ) λ΅κΈ μμ±
		$("#qnaList").on("click", ".answer", function() {
			
			$("#answertitle").val("");
			$("#answercontentText").val("");
			$(".answercontentTotalLength").text(0);
			
			//< κ΄λ¦¬μ κΆν μ²΄ν¬
			checkGrade(userGrade);
			
			var questionTitle = $(this).parent().parent().prev().prev().prev().children('a.toggleText').text().trim();

			if(isAdministrator)
			{
				$("#answerModal").modal("show");
				
				if(questionTitle.length > 40)
				{
					$("#answertitle").val("[λ΅λ³] " + questionTitle.substring(0, 25) + "...");
				}
				else
				{
					$("#answertitle").val("[λ΅λ³] " + questionTitle);
				}
				
				qQno = $(this).parent().next().text();
			}
		});
		
		//< (λ΅κΈ) μμ 
		$("#qnaList").on("click", ".modify", function() {
			
			$("#answerName").val("");
			$("#answertitle").val("");
			$("#answercontentText").val("");
			$(".answercontentTotalLength").text(0);
			
			//< κ΄λ¦¬μ κΆν μ²΄ν¬
			checkGrade(userGrade);
			
			var answerTitle = $(this).parent().parent().prev().prev().prev().children('a.toggleText').text().trim();
			
			answerTitle = answerTitle.replace("βͺ", "").trim();
			
			if(isAdministrator)
			{
				$("#answerModal").modal("show");
				
				$("#answerName").val(userId);
				$("#answertitle").val(answerTitle);
				$("#answercontentText").val($(this).parent().prev().prev().text());
				
				qQno = $(this).parent().next().text();
				isUpdate = true;
			}
		});
		
		//< (λ΅κΈ) λ΅λ³ μλ ₯ κΈ°λ₯
		$("#answer_insert_btn").click(function(event){
			event.preventDefault();
			
			var name = $("#answerName").val();
			var title = $("#answertitle").val();
			var content = $("#answercontentText").val(); 
			var password;
			
			if(stringLength($("#answerName").val()) > 30)
			{
				alert("λλ€μμ 30μ κΉμ§λ§ κ°λ₯ν©λλ€.");
			}
			else if(stringLength($("#answertitle").val()) > 50)
			{
				alert("μ λͺ©μ 50μ κΉμ§λ§ κ°λ₯ν©λλ€.");
			}
			else if(stringLength($("#answercontentText").val()) > 300)
			{
				alert("λ³Έλ¬Έμ 300μ κΉμ§λ§ κ°λ₯ν©λλ€.");
			}
			else
			{
				//< μμ  / μλ ₯ μ ν
				//< μμ  μ€μ΄λΌλ©΄
				if(isUpdate)
				{
					//< update κΈ°λ₯ νμ±
					$.ajax({
						type : "post",
						url : "/qna/update",
						headers : {
							'Content-Type' : 'application/json',
							'X-HTTP-Method-Override' : 'post'
						},
						data : JSON.stringify({
							qQno: qQno,
							qTitle : title,
							qContent : content,
						}),
						dataType : 'text',
						success : function(result) {
							
							$("#answerName").val("");
							$("#answertitle").val("");
							$("#answercontentText").val("");
							
							getPageList(qBno, curPage);
						}
					});
					
					//< κΈ°λ₯ μ΄κΈ°ν
					isUpdate = false;
				}
				//< μλ ₯ μ€μ΄λΌλ©΄
				else
				{
					//< λΉλ°λ²νΈ κ°μ Έμ€κΈ°
					$.ajax({
						type : "post",
						url : "/qna/getPw",
						headers : {
							'Content-Type' : 'application/json',
							'X-HTTP-Method-Override' : 'post'
						},
						data : JSON.stringify({
							qQno : qQno
						}),
						dataType : 'text',
						success : function(pw) {
							
							//< answer(insert) κΈ°λ₯ νμ±
							$.ajax({
								type : "post",
								url : "/qna/answer",
								headers : {
									'Content-Type' : 'application/json',
									'X-HTTP-Method-Override' : 'post'
								},
								data : JSON.stringify({
									qQno: qQno,
									qBno : qBno,
									qTitle : title,
									qWriter : name,
									qContent : content,
									qPassword : pw,
									qUserId : questionId
								}),
								dataType : 'text',
								success : function(result) {
									
									$("#answertitle").val("");
									$("#answercontentText").val("");
									
									getPageList(qBno, curPage);
								}
							});
						}
					});
				}
			}
			
			$("#answerModal .close").click();
			$("#answerModal .close").trigger("click");
		});
		
		//< (λ³Έλ¬Έ) μ­μ  (μ°κ²°λ λ΅κΈλ κ°μ΄ μ­μ )
		$("#qnaList").on("click", ".delete", function() {
			qQno = $(this).parent().next().text();
			
			$.ajax({
				type : "delete",
				url : "/qna/deleteqReproot",
				headers : {
					'Content-Type' : 'application/json',
					'X-HTTP-Method-Override' : 'delete'
				},
				data : JSON.stringify({
					qQno : qQno
				}),
				dataType : 'text',
				success : function(result) {
					
					getPageList(qBno, curPage);
					
					alert("μ­μ  λμμ΅λλ€.");
				}
			});
		});
		
		//< (λ΅κΈ) μ­μ 
		$("#qnaList").on("click", ".AnswerDelete", function() {
			qQno = $(this).parent().next().text();
			
			$.ajax({
				type : "delete",
				url : "/qna/delete",
				headers : {
					'Content-Type' : 'application/json',
					'X-HTTP-Method-Override' : 'delete'
				},
				data : JSON.stringify({
					qQno : qQno
				}),
				dataType : 'text',
				success : function(result) {
					
					getPageList(qBno, curPage);
					
					alert("μ­μ  λμμ΅λλ€.");
				}
			});
		});
		
		//< μ²« νμ΄μ§μΌλ‘ μ΄λ
		$(".goFirst").click(function(event){
			if(curPage != 1)
			{
				getPageList(qBno, 1);
			}
			else
			{
				alert("μ²μ νμ΄μ§ μλλ€.");
			}
		});
		
		//< pagination κΈ°λ₯
		//< μ«μλ²νΌ
		$("#page").on("click", ".pageNum", function() {
			curPage = $(this).text();
			
			getPageList(qBno, curPage);
		});
		
		//< μ΄μ μΌλ‘
		$("#page").on("click", ".prev", function() {
			
			if(curPage != beginPageNum)
			{
				getPageList(qBno, beginPageNum);
			}
			else
			{
				getPageList(qBno, beginPageNum - 5);
			}
			
		});
		
		//< λ€μμΌλ‘
		$("#page").on("click", ".next", function() {
			
			if(curPage != finishPageNum)
			{
				getPageList(qBno, finishPageNum);
			}
			else
			{
				getPageList(qBno, beginPageNum + 5);
			}
		});
	});
	
	function getPageList(qBno,pageIndex) {
		$("#qnaList").empty();
		
		//< qTitle, qWriter, qUpdatedate, qPassword, qContent
		$.getJSON("/qna/list/" + qBno + "/" + pageIndex , function(data){
			
			curPage = data.curPage;
			beginPageNum = data.beginPageNum;
			finishPageNum = data.finishPageNum;
			totalPage = data.totalPage;
			
			var page =   makePage(data.beginPageNum, data.finishPageNum, data.curPage);
			$("#page").html(page);
			
			
			if(curPage == 1){
				$("#prev").hide();
			} else {
				$("#prev").show();
			}
			if(curPage ==totalPage){
				$("#next").hide();
			} else {
				$("#next").show();
			}

			var qnaList = data.list;
			for(var i = 0; i < qnaList.length; i++)
			{
				var obj = qnaList[i];
				
				//< λ΅κΈμΌ κ²½μ°
				if(obj['qRepindent'] != 0)
				{
					var list = getAnswerList(obj['qTitle'], obj['qWriter'], obj['qUpdatedate'], obj['qContent'], obj['qQno'], obj['qRepindent'], obj['qUserId']);
				}
				//< λ³Έλ¬ΈμΌ κ²½μ°
				else
				{
					var list = getList(obj['qTitle'], obj['qWriter'], obj['qUpdatedate'], obj['qContent'], obj['qQno'], obj['qRepindent'], obj['qUserId']);
				}
				
				list.replace(/\n/gi, "<br>");
				
				$("#qnaList").append(list);
			}
		});
	}
	
	//< κ΄λ¦¬μ νμΈ
	function checkGrade(grade)
	{
		if(grade.length < 1)
		{
			console.log("λΉνμ λ‘κ·ΈμΈ μλλ€.");
		}
		else if(parseInt(grade) > 1)	
		{
			isAdministrator = true;
			
			$(".insertBtn").hide();
		}
		else
		{
			isAdministrator = false;
		}
	}
	
	//< λ¬Έμμ΄ κΈΈμ΄ (νκΈ ν¬ν¨)
	//< νκΈμ 3λ°°
	function stringLength(str) {
    	var len = 0;
    	
    	for (var i = 0; i < str.length; i++) {
        	if (escape(str.charAt(i)).length == 6) {
        	    len+=2;
    	    }
    	    len++;
    	}
    	
    	return len;
	}
	
	function checkId(id, writer){
		
		if(id === writer)
		{
			return true;
		}
		
		return false;
	}
	
	</script>
</body>
</html>