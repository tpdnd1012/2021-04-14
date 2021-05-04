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

	// 장바구니 세션 null 로 설정
	session.setAttribute("cartlist", null);
	// 페이지 이동
	response.sendRedirect("cartlist.jsp");

%>

</body>
</html>