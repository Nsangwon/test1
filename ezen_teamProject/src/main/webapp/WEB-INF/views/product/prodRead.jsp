<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<meta charset="UTF-8">
<title>prodRead</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/resources/css/read.css">

</head>
<body>
	<div class="container">
	
		<div class="logo">    
		<a href="/product/prodList"><img src="/resources/img/3.jpg" height="16px;"/></a>
		</div> 
	
<div class="menu_wrap">
		<ul class="dep1">
			<li>
				<a href="/product/prodList?prodCategory=&prodOrder=${prodOrder}">shop</a>
				<ul class="dep2">
					<li><a href="/product/prodList?prodCategory=top&prodOrder=${prodOrder}">top</a></li>
					<li><a href="/product/prodList?prodCategory=bottom&prodOrder=${prodOrder}">bottom</a></li>
					<li><a href="/product/prodList?prodCategory=outer&prodOrder=${prodOrder}">outer</a></li>
					<li><a href="/product/prodList?prodCategory=acc&prodOrder=${prodOrder}">acc</a></li>			            		
				</ul>
			</li>
			<li>
				<a href="#">lookbook</a>
				<ul class="dep2">
					<li><a href="#">21ss</a></li>
					<li><a href="#">20fw</a></li>
					<li><a href="#">20ss</a></li>
					<li><a href="#">19fw</a></li>			            		
				</ul>
			</li>
			<li>
				<a href="#">community</a>
				<ul class="dep2">
					<li><a href="#">notice</a></li>
					<li><a href="#">Q/A</a></li>
					<li><a href="#">review</a></li>
					<li><a href="#">event</a></li>			            		
				</ul>
			</li>
			<li>
				<a href="#">account</a>
				<ul class="dep2">
					<li><a href="/member/loginGet">login</a></li>
					<c:choose>
					<c:when test="${empty login}">
						<li><a id="orderTracking" href="/member/loginGet">ORDER</a></li>
						<script>
						$("a#orderTracking").click(function() {
							alert("로그인이 필요한 작업입니다.")
						});
						</script>
					</c:when>
					<c:otherwise>
						<li><a id="orderTracking"
							href="/member/orderTracking/${login.userId}">ORDER</a></li>
					</c:otherwise>
				</c:choose>
					<li><a href="#" id="moveReadSelf">mypage</a></li>
					<li><a href="/member/cartlist/${login.userId}">cart</a></li>
				</ul>
			</li>
			<li>
			<c:choose>
					<c:when test="${login.userGrade ==1}">
				<a href="#">admin</a>
				<ul class="dep2">
					
						<li><a href="/member/list">member list</a></li>
						<li><a href="/member/managementlist">order list</a></li>
						<li><a href="/product/prodInsert">register product</a></li>
				</ul>
				</c:when>
			<c:otherwise>

			</c:otherwise>

			</c:choose>
			</li>
		</ul>  
	</div>
	
	
		<div class="row left" id="img">
			<img src="${vo.prodThumbnail }">	
		</div>
		
		
		<div class="row" id="info">
			<p style="font-size: 30px;">${vo.prodName}</p>
			<p style="font-size: 20px;">${vo.prodTitle}</p>
			<p style="font-size: 15px;">PRICE : &nbsp;&nbsp;&nbsp; ${vo.prodPrice}</p>
			<p id="sizes">S사이즈 수량 : ${dto.prodStockSSize}</p>
   			<p id="sizem">M사이즈 수량 : ${dto.prodStockMSize}</p>
   	   	    <p id="sizel">L사이즈 수량 : ${dto.prodStockLSize}</p>
			<span style="font-size: 15px;">SIZE &nbsp;:&nbsp;&nbsp;&nbsp;</span>
				<select class="form-select" name="prodSize" id="prodSize">
					<option value="${dto.prodStockSSize}">S</option>
					<option value="${dto.prodStockMSize}">M</option>
					<option value="${dto.prodStockLSize}">L</option>
				</select><br>
				<br>
				<button type ="button" onclick="amountCount('p')">+</button>
				<input type="number" id="amount" name="amount" value="1" min="1" style="text-align:center;"/>
				<button type="button" onclick="amountCount('m')">-</button>
				
				<br>
				<a class="cart_insert_btn">CART&nbsp;</a>|<a class="#">&nbsp;ORDER</a>
				
		</div> <!-- end of row -->
		
		<div class="row" id="content">
		<p>${vo.prodContent}</p>
		</div>
		<div class="row" id="button">
		<c:choose>
		<c:when test="${login.userGrade ==1}">
		<a class="update">&nbsp;&nbsp;UPDATE&nbsp;&nbsp;</a>|
		<a class="list">&nbsp;&nbsp;LIST&nbsp;&nbsp;</a>|
		<a class="delete">&nbsp;&nbsp;DELETE</a>
		</c:when>
		</c:choose>
		</div>
		<form id="deleteForm" action="/product/prodDelete/${vo.prodName}?prodBno=${vo.prodBno}" method="post"></form>
		</div> <!-- end of container -->
		<form action="/member/readSelf" method="post" hidden="" id="readSelf">
		<input type="hidden" id="readuserId" name="readuserId"
		value="${login.userId}"> <input type="submit" value="회원정보 수정1">
		</form>
		
	<jsp:include page="/WEB-INF/views/qna/qnaPage.jsp" />
	<jsp:include page="/WEB-INF/views/prodBoard/review.jsp"/>
<script type="text/javascript">
	$(document).ready(function() {
		
		var userId = $("#readuserId").val();

		$("#moveReadSelf").click(function() {

			$("#readSelf").submit();

		})
		
		$("#sizes").hide();
		$("#sizem").hide();
		$("#sizel").hide();
		
		
		 $(".cart_insert_btn").click(function() {
	    		event.preventDefault();

				$.ajax({
					type : 'post',
					headers : {
						'Content-Type' : 'application/json',
						'X-HTTP-Method-Override' : 'POST'
					},
					url : '/carts/cart',
					data : JSON.stringify({
						userId : '${login.userId}',
						prodName : '${vo.prodName}',
						prodSize : $("#prodSize option:selected").text(),
						amount : $("#amount").val()
					}),
					dataType : 'text',
					success : function(result) {
						if (result == "1") {
							alert("저장하였습니다. \n(중복된 상품이면 상품 개수만 추가됩니다.)");
						} else {
							alert("장바구니 저장에 실패하였습니다.");
						}
					}
				});
			
	    	  
	      });
	      
	  
		
		$(".list").click(function() {
			location.assign("/product/prodList");
		});
		
		
		$(".update").click(function() {
			location.assign("/product/prodUpdate/${vo.prodName}");
		});
		
		$(".delete").click(function() {
			$("#deleteForm").submit();
		});
		
	});
	
	function amountCount(type){
		   var amount = Number($("#amount").val());
		   
		    if(type == 'p') {
		    	if (amount < $('#prodSize option:selected').val()) {
		    		$("#amount").val(Number(amount)+1);
				}
		        
		    } else {
		        if(amount > 1) {
		        	$("#amount").val(Number(amount)-1);
		        }
		    }
		}

</script>
	

</body>
</html>