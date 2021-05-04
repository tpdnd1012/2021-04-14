<%@page import="DAO.*"%>
<%@page import="DTO.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	// 세션 장바구니 가져오기
	ArrayList<ProductDto> list = (ArrayList<ProductDto>) session.getAttribute("cartlist");

	String name = request.getParameter("name");
	String orders_name = request.getParameter("name2");
	
	String address1 = request.getParameter("sendaddress1");
	String address2 = request.getParameter("sendaddress2");
	String address3 = request.getParameter("sendaddress3");
	String address4 = request.getParameter("sendaddress4");
	
	String orders_address = address1 + "/" + address2 + "/" + address3 + "/" + address4;
	
	String orders_request = request.getParameter("textrequest");
	int orders_fee = Integer.parseInt(request.getParameter("payment"));

	// orders
	OrdersDto ordersDto = new OrdersDto();
	
	ordersDto.setOrders_memberid(name);
	ordersDto.setOrders_name(orders_name);
	ordersDto.setOrders_address(orders_address);
	ordersDto.setOrders_request(orders_request);
	ordersDto.setOrders_fee(orders_fee);
	
	// DAO
	OrdersDao ordersDao = OrdersDao.getinstance();
	
	int result = ordersDao.Orderadd(ordersDto);
	
	if(result == 1){
		
		
		
	} else {
		
	}


/* 	// detail
	DetailDto detailDto = new DetailDto();
	
	detailDto.setDetail_product_id(detail_product_id);
	detailDto.setDetail_orders_id(detail_orders_id);
	detailDto.setDetail_amount(detail_amount);
 */
%>

</body>
</html>