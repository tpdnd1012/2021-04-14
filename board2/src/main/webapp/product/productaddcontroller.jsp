<%@page import="DAO.ProductDao"%>
<%@page import="DTO.ProductDto"%>
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
<%@include file="/menu.jsp" %>

	<%
	
		// cos 라이브러리
		
		// 1. 업로드 파일 서버에 저장
		String realFolder = "C:/Users/User/git/2021-04-14/board2/src/main/webapp/upload"; // 폴더명
		
		MultipartRequest multi = new MultipartRequest(request, realFolder, 1024*1024*10, "UTF-8", new DefaultFileRenamePolicy());
													// 요청방식, 저장위치, "파일최대용량", "인코딩값", "보안식"
													// DefaultFileRenamePolicy() : 업로드시 중복된 파일명 제거
		
	
		request.setCharacterEncoding("UTF-8");
		
		// 첨부파일 사용시 enctype : 타입으로 변경 request -> multi
		// 2. 파일명은 DB에 저장
		String name = multi.getParameter("name");
		int price = Integer.valueOf(multi.getParameter("price"));
		String manufacturer = multi.getParameter("manufacturer");
		String category = multi.getParameter("category");
		int stock = Integer.valueOf(multi.getParameter("stock"));
		int conditions = Integer.valueOf(multi.getParameter("conditions"));
		
		String file = multi.getFilesystemName("file");
					// filesystemName : 첨부파일명
					
		int activation = 0; // 활성화
    	int salesrate = 0; // 판매수
	
		ProductDto productDto = new ProductDto(name, price, manufacturer, category, stock, conditions, file, activation, salesrate);
    	
    	ProductDao dao = ProductDao.getinstance();
	
		int result = dao.productadd(productDto);
	
		if (result == 1) {
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			
				script.println("alert('제품 등록 완료');");
				script.println("location.href='/board2/main.jsp'");
			
			script.println("</script>");
			
		} else {
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			
				script.println("alert('제품 등록 오류[ 관리자에게 문의해주세요. ]');");
				script.println("location.href='/board2/main.jsp'");
			
			script.println("</script>");
			
		}
	%>

</body>
</html>