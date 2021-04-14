<%@page import="java.io.PrintWriter"%>
<%@page import="DTO.BoardDto"%>
<%@page import="DAO.BoardDao"%>
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
		request.setCharacterEncoding("UTF-8");
	
		int id = Integer.parseInt(request.getParameter("id"));
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		String file = request.getParameter("file");
	
		BoardDao dao = BoardDao.getinstance();
		
		BoardDto dto = dao.getboard(id);
		
		int result = dao.updateboard(title, contents, file, id);
	
		if (result == 1) {
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			
				script.println("alert('수정 완료');");
				script.println("location.href='board.jsp'");
			
			script.println("</script>");
			
		} else {
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			
				script.println("alert('수정 오류[ 관리자에게 문의해주세요. ]');");
				script.println("location.href='board.jsp'");
			
			script.println("</script>");
			
		}
	%>

</body>
</html>