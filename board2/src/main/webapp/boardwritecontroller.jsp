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
	
		BoardDao boardDao = BoardDao.getinstance();
	
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		//String file = request.getParameter("file");
	
		BoardDto boardDto = new BoardDto();
	
		// ID 생략
		boardDto.setTitle(title);
		boardDto.setContents(contents);
		boardDto.setUserID("유재석");
		// Date 생략
		boardDto.setAvailable(1);
		boardDto.setFile("파일");
	
		int result = boardDao.write(boardDto);
	
		if (result == 1) {
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			
				script.println("alert('등록 완료');");
				script.println("location.href='board.jsp'");
			
			script.println("</script>");
			
		} else {
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			
				script.println("alert('삭제 오류[ 관리자에게 문의해주세요. ]');");
				script.println("location.href='board.jsp'");
			
			script.println("</script>");
			
		}
	%>

</body>
</html>