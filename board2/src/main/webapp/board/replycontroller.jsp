<%@page import="DTO.ReplyDto"%>
<%@page import="DAO.ReplyDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
	
		request.setCharacterEncoding("UTF-8");
		
		String contents = request.getParameter("contents");
		int id = Integer.parseInt(request.getParameter("id"));
		
		ReplyDao replyDao = ReplyDao.getinstance();
		
		ReplyDto replyDto = new ReplyDto();
		
		replyDto.setReply_boardid(id);
		replyDto.setReply_contents(contents);
		replyDto.setReply_userid("유재석");
		
		int result = replyDao.re_write(replyDto);
	
		if (result == 1) {
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			
				script.println("alert('댓글 등록 완료');");
				
				script.println("location.href='boarddetail.jsp?id=" + id + "'");
			script.println("</script>");
			
			/*response.sendRedirect("boarddetail.jsp?id=" + id);*/
			
		} else {
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			
				script.println("alert('댓글 등록 오류[ 관리자에게 문의해주세요. ]');");
				script.println("location.href='board.jsp'");
			
			script.println("</script>");
			
		}
	%>

</body>
</html>