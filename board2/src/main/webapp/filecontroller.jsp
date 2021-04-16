<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.File"%>
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

	// 1. 파일이름 가져오기
	String filename = request.getParameter("file");

	// 2. 파일이름 변경
	//String filename2 = new String(filename.getBytes("UTF-8"));
	
	// 3. 해당파일 자바로 가져오기
	File file = new File("C:/Users/User/git/2021-04-14/board2/src/main/webapp/upload/" + filename);
	
	// 4. 첨부파일 형식으로 열기 [ 브라우저 마다 다름 ]
	response.setHeader("Content-Disposition", "attachment;filename=" + filename + ";");
					// "형식", 첨부파일 이름
	
	// 5. 입출력 스트림 [ 바이트 단위 ]
	byte[] b = new byte[(int)file.length()];
						// 파일의 크기만큼 바이트 배열 생성
	
	// 6. 출력 스트림으로 내보내기
	if(file.isFile()){
		
		// 입력 스트림
		BufferedInputStream fin = new BufferedInputStream(new FileInputStream(file));
		
		// 출력 스트림
		BufferedOutputStream fout = new BufferedOutputStream(response.getOutputStream());
		
		int count;
		
		while((count = fin.read(b)) != -1) { // 입력스트림 바이트가 없을때 까지 읽어오기
			
			fout.write(b, 0, count);
			
		}
		
		// 출력 스트림 종료
		fout.close();
		
		// 입력 스트림 종료
		fin.close();
		
	}

%>

</body>
</html>