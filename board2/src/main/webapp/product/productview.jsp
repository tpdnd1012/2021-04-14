<%@page import="DTO.ProductDto"%>
<%@page import="DAO.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

.view {
	margin-left: 30px;
	padding: 10px;
	border: solid 1px lightgray;
}

input {
	border: none;
}

input:hover {
	text-decoration: none;
}

</style>

</head>
<body onload="init();"> <!-- body 가 실행될때 바로 스크립트 실행 -->

<%@include file="/menu.jsp" %>

<%

	int id = Integer.parseInt(request.getParameter("product_id"));

	ProductDao dao = ProductDao.getinstance();
	
	ProductDto dto = dao.getproduct(id);

%>

<div class="container">

	<div class="row"> <!-- col-md-12 -->
	
		<div class="col-md-5">
			<img alt="" src="/board2/upload/<%=dto.getProduct_file() %>" style="width: 100%">
		</div>
				<div class="col-md-7">
				
				<div class="view">
				
					<%
						if(dto.getProduct_conditions() == 1) {
							%>
							<p>신상품</p>
							<%
						}
					%>
					
					<p><%=dto.getProduct_manufacturer() %></p>
				
					<h3><%=dto.getProduct_name() %></h3>
					
					<p><%=dto.getProduct_price() %></p>
					
				<form name="form" method="post" action="cartcontroller.jsp">
				
					<input type="hidden" name="max" value="<%=dto.getProduct_stock() %>">
					<input type="hidden" name="id" value="<%=id %>">
				
					<input type="hidden" name="sell_price" value="<%=dto.getProduct_price() %>">
					
					<p style="margin-top: 30px;">
						<input type="button" value="+" onclick="add()">
						수량 : <input type="text" name="amount" value="1" size="3">
						<input type="button" value="-" onclick="del()">
					</p>
					
					<p>총 금액 : <input type="text" name="sum" size="10" disabled="disabled">원</p>
					
					<a href="#" class="btn btn-info" style="margin-top: 30px;" onclick="addtocart()">장바구니</a>
					<a href="#" class="btn btn-info" style="margin-top: 30px;">구매하기</a>
					
				</form>
				</div>
				</div>
	
	</div>

</div>

<%@include file="/footer.jsp" %>

</body>
</html>