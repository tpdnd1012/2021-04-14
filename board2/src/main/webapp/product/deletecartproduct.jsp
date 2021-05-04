<%@page import="DTO.ProductDto"%>
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

	int id = Integer.parseInt(request.getParameter("id"));
	// 장바구니카드 null 로 지정
	ArrayList<ProductDto> list = (ArrayList<ProductDto>)session.getAttribute("cartlist");
	
	for(int i = 0; i < list.size(); i++) {
		
		if(list.get(i).getProduct_id() == id) {
			list.remove(i); // 리스트에서 삭제
			session.setAttribute("cartlist", list); // 세션 재설정
			break;
		}
		
	}
	
	// 페이지 이동
	response.sendRedirect("cartlist.jsp");

%>

</body>
</html>