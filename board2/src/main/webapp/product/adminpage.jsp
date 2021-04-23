<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@include file="/menu.jsp" %>

<%
		// include의 menu에 user 세션 존재
	if(!user.equals("admin")) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		
			script.println("alert('일반회원은 접근 불가입니다.');");
			script.println("location.href='/board2/main.jsp'");
		
		script.println("</script>");
	}

%>

<div class="container">

	<div class="col-md-3"> <!-- 공백 -->
	
	<%@include file="adminsidebar.jsp" %>
	
	</div>
	
	<div class="col-md-1"></div>
	
	<div class="col-md-5">

		공지사항
		
	</div>

</div>

<%@include file="/footer.jsp" %>

</body>
</html>