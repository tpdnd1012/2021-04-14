<%@page import="DAO.MemberDao"%>
<%@page import="DTO.MemberDto"%>
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
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		MemberDao dao = MemberDao.getinstance();
		
		int result = dao.login(id, password);
	
		if (result == 1) {
			
			// 로그인 성공 시 세션 할당
				// 세션 : 서버에 데이터 저장 [ 보안 높음 ]
				// 쿠키 : 클라우드px에 저장 [ 보안 낮음 ]
			session.setAttribute("user", id);
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			
				script.println("alert('로그인 성공!!');");
				script.println("location.href='/board2/main.jsp'");
			
			script.println("</script>");
			
		} else {
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			
				script.println("alert('로그인 실패...[ 관리자에게 문의해주세요. ]');");
				script.println("location.href='/board2/member/login.jsp?cancel=1'");
			
			script.println("</script>");
			
		}
	%>

</body>
</html>