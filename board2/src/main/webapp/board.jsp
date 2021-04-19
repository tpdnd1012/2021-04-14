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
</head>
<body>

<%

	// 게시물 갯수에 따른 페이지 나누기
	int pagenumber = 1; // 기존 1페이지 부터 시작
	
	if(request.getParameter("pagenumber") != null) { // 페이지 요청이 있으면
		
		pagenumber = Integer.parseInt(request.getParameter("pagenumber")); // 요청페이지로 바꾸기
		
	}
	
	// 페이지 요청이 없으면 1페이지

%>

<!-- 부트스트랩 테이블 -->

<div class="container">
	<div>
		<table class="table table-striped" style="text-align:center; border:1px;">
		
			<thead>
				<tr>
					<th style="background-color: #eeeeee; text-align: center;">번호</th>
					<th style="background-color: #eeeeee; text-align: center;">대표이미지</th>
					<th style="background-color: #eeeeee; text-align: center;">제목</th>
					<th style="background-color: #eeeeee; text-align: center;">작성자</th>
					<th style="background-color: #eeeeee; text-align: center;">작성일</th>
				</tr>
			</thead>
			
			<tbody>
			
			<%
				request.setCharacterEncoding("UTF-8");

				BoardDao dao = BoardDao.getinstance();
				
				ArrayList<BoardDto> list = new ArrayList<>();
			
				String key = request.getParameter("key");
				String keyword = request.getParameter("keyword");
			
				// 검색이 없는 경우
				if(key == null || keyword == null) {

					list = dao.boardlist(pagenumber); // 모든 조회 메소드
				
				} else { // 검색이 있을 경우
				
					list = dao.getboardsearch(key, keyword); // 검색 조회 메소드
				
				}
			
			
				for(int i = 0; i < list.size(); i++){
					
					BoardDto dto = list.get(i);

					
			%>
				<tr onclick="location.href='boarddetail.jsp?id='+<%=dto.getID() %>"> <!-- DB에 있는 데이터를 for문으로 반복 -->
					<td><%=dto.getID() %></td>
					<td><img alt="" src="upload/<%=dto.getFile() %>" width="30px"></td>
					<td><%=dto.getTitle()%></td>
					<td><%=dto.getUserID() %></td>
					<td><%=dto.getDate() %></td>
				</tr>
				
			<%
				}
			%>
				
			</tbody>
		
		</table>

			<%
		
			if(pagenumber != 1) {
				
			%>
			
				<a href="board.jsp?pagenumber=<%=pagenumber - 1 %>" class="btn btn-success btn-arrow-left">이전</a>
				
			<%
			} if(dao.nextpage(pagenumber + 1)){ // 만약에 다음 페이지가 존재하면
			%>
				
				<a href="board.jsp?pagenumber=<%=pagenumber + 1 %>" class="btn btn-success btn-arrow-right">다음</a>
				
			<%
			}
			%>

			<!----------------- 검색 ---------------------->
		<form action="board.jsp" method="post">
			<!-- 게시판 목록 -->
			<table style="margin: 0 auto;">
				<tr>
					<td>
						<select name="key" class="form-control">
							<option value="board_title">제목</option> <!-- value="필드명" -->
							<option value="board_contents">내용</option>
							<option value="board_userid">작성자</option>
						</select>
					</td>
					
					<td>
						<input type="text" name="keyword" value="" size=20 class="form-control">
					</td>								<!-- 필드 값 -->
					
					<td>
						<input type="submit" value="검색" class="btn btn-default">
					</td>
					
				</tr>
			</table>
			
		</form>
		
		<a href="boardwrite.jsp" class="btn btn-primary pull-right">글작성</a>
		
	</div>
</div>


<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.js"></script>

</body>
</html>