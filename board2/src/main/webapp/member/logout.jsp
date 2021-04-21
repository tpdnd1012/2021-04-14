<%@page import="java.io.PrintWriter"%>
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
	// 세션 초기화
	
	// 1. 모든 세션 초기화
		//session.invalidate(); // 모든 세션 초기화
	
	// 2.
	session.setAttribute("user", null);
	
	PrintWriter script = response.getWriter();
	script.println("<script>");
	
		script.println("alert('로그아웃 완료');");
		script.println("location.href='/board2/main.jsp'");
	
	script.println("</script>");
%>

</body>
</html>