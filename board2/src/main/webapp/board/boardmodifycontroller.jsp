<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
		
	// 1. 업로드 파일 서버에 저장
		String realFolder = "C:/Users/User/git/2021-04-14/board2/src/main/webapp/upload"; // 폴더명
			
		MultipartRequest multi = new MultipartRequest(request, realFolder, 1024*1024*10, "UTF-8", new DefaultFileRenamePolicy());
														// 요청방식, 저장위치, "파일최대용량", "인코딩값", "보안식"
														// DefaultFileRenamePolicy() : 업로드시 중복된 파일명 제거
	
	
		request.setCharacterEncoding("UTF-8");
	
		int id = Integer.parseInt(multi.getParameter("id"));
		String title = multi.getParameter("title");
		String contents = multi.getParameter("contents");
		String file = multi.getFilesystemName("file");
		
		if(file == null) {
			
			file = multi.getParameter("file2");
			
		}
	
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