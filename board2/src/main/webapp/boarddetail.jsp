<%@page import="DTO.BoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="content-Type" content="text/html; charset = UTF-8"> <%// html 페이지 속성 %>
<meta name="viewport" content ="width=device-width initial-scale = 1 "> <%// 반응형 웹 만들기 %>
<link rel="stylesheet" href="css/bootstrap.css"> <%// 링크 스타일 %>

<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

	function delete2(id){
		
		if(confirm('정말 삭제하시겠습니까?')) {
			
			location.href='boarddeletecontroller.jsp?id='+id;
			
		} else {
			
			return;
			
		}
		
	}

</script>

</head>
<body>

<%
	int id = Integer.parseInt(request.getParameter("id"));
	
	BoardDao dao = BoardDao.getinstance();
	
	BoardDto dto = dao.getboard(id);

%>

<!-- 부트스트랩 테이블 -->

<div class="container">
	<div>
		<table class="table table-striped" style="text-align:center; border:1px;">
		
			<thead>
				<tr>
					<th colspan="3" style="background-color: #eeeeee; text-align: center;">게시물번호</th>
				</tr>
			</thead>
			
			<tbody>
			
				<tr>
					<td>게시물 제목</td>
					<td colspan="2" style="text-align: left;"><%=dto.getTitle() %></td>
				</tr>
				
				<tr>
					<td>게시물 작성자</td>
					<td colspan="2" style="text-align: left;"><%=dto.getUserID() %></td>
				</tr>
				
				<tr>
					<td>첨부파일</td>
					<td colspan="2" style="text-align: left;"><%=dto.getFile() %></td>
				</tr>
				
				<tr>
					<td>게시물 내용</td>
					<td colspan="2" style="min-height: 300px; text-align: left;"><%=dto.getContents() %></td>
				</tr>
			
			</tbody>
		
		</table>
		
		<a href="boardmodify.jsp?id=<%=dto.getID() %>" class="btn btn-primary pull-right" style="margin-left: 10px;">글수정</a>
		<a onclick="delete2('<%=dto.getID() %>')" class="btn btn-primary pull-right">글삭제</a>
		<a href="board.jsp" class="btn btn-primary pull-left">글목록</a>
		
	</div>
</div>


<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.js"></script>

</body>
</html>