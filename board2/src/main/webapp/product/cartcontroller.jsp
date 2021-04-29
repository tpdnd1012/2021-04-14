<%@page import="java.util.ArrayList"%>
<%@page import="DTO.ProductDto"%>
<%@page import="DAO.ProductDao"%>
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
	int amount = Integer.parseInt(request.getParameter("amount"));
	
	ProductDao dao = ProductDao.getinstance();
	
	ProductDto productDto = dao.getproduct(id);
	
	productDto.setAmount(amount);
	
	// 장바구니 [ 세션 ]
			
	ArrayList<ProductDto> list = (ArrayList<ProductDto>)session.getAttribute("cartlist");
								// 세션 자료형x => 형변환
	
	if(list == null) { // 세션이 없으면
		
		list = new ArrayList<ProductDto>(); // 메모리 할당
		session.setAttribute("cartlist", list); // 세션생성
		
	}
	
								
	int count = 0;
	
	// 해당 제품이 있는 경우
	for(int i = 0; i < list.size(); i++) {
		
		if(list.get(i).getProduct_id() == id) { // 동일한 제품 번호가 있으면
			
			list.get(i).setAmount(list.get(i).getAmount() + amount);
			count = 1;	
		
		}
		
	}
								
	
	// 리스트에 저장
	if(count == 0){
		
		list.add(productDto);
		
	}
	
	response.sendRedirect("productview.jsp?product_id=" + id);
										
%>

</body>
</html>