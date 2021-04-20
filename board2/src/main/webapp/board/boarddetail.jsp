<%@page import="DTO.ReplyDto"%>
<%@page import="DAO.ReplyDao"%>
<%@page import="DTO.BoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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

<%@include file="/menu.jsp" %>

<%
	int id = Integer.parseInt(request.getParameter("id"));
	
	BoardDao dao = BoardDao.getinstance();
	
	BoardDto dto = dao.getboard(id);

%>

<!-- 부트스트랩 테이블 -->

<div class="container">
	<div>
		<table class="table table-striped" style="text-align:center; border: solid gray 1px;">
		
			<thead>
				<tr>
					<th colspan="3" style="background-color: #eeeeee; text-align: center;">게시물<br>조회수<%=dto.getCount() %></th>
				</tr>
			</thead>
			
			<tbody>
			
				<tr>
					<td style="border-right: dotted 1px black; width: 300px;">게시물 제목</td>
					<td colspan="2" style="text-align: left; border-right: dotted gray 1px;"><%=dto.getTitle() %></td>
				</tr>
				
				<tr>
					<td style="border-right: dotted 1px black; width: 300px;">게시물 이미지</td>
					<td colspan="2" style="text-align: left; border-right: dotted gray 1px;">
						<img alt="" src="../upload/<%=dto.getFile() %>" width="50%">
					</td>
				</tr>
				
				<tr>
					<td style="border-right: dotted 1px black; width: 300px;">게시물 작성자</td>
					<td colspan="2" style="text-align: left; border-right: dotted gray 1px;"><%=dto.getUserID() %></td>
				</tr>
				
				
				<%
				
					if(dto.getFile() == null) {
						%>
						<tr>
							<td style="border-right: dotted 1px black; width: 300px;">첨부파일</td>
							<td colspan="2" style="text-align: left; border-right: dotted gray 1px;"></td>
						</tr>
						<%
						
					} else {
						%>
				<tr>
					<td style="border-right: dotted 1px black; width: 300px;">첨부파일</td>
					<td colspan="2" style="text-align: left; border-right: dotted gray 1px;">
						<a href="filecontroller.jsp?file=<%=dto.getFile() %>"><%=dto.getFile() %></a>
					</td>
				</tr>
				<%
				}
				%>
				
				<tr>
					<td style="border-right: dotted 1px black; width: 300px;">게시물 내용</td>
					<td colspan="2" style="height: 300px; text-align: left; border-right: dotted gray 1px;"><%=dto.getContents() %></td>
				</tr>
				
			</tbody>
		
		</table>
		
		<a href="boardmodify.jsp?id=<%=dto.getID() %>" class="btn btn-primary pull-right" style="margin-left: 10px;">글수정</a>
		<a onclick="delete2('<%=dto.getID() %>')" class="btn btn-primary pull-right">글삭제</a>
		<a href="board.jsp" class="btn btn-primary pull-left">글목록</a>
		
	</div>
</div>


<!-- ////////////// 댓글 작성 코드 ////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->

<div class="container">
	<div>
	<br><br><br>
		<form action="replycontroller.jsp?id=<%=id %>" method="post">
	
			<table class="table table-striped" style="text-align:center; border:1px;">
			
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">댓글</th>
					</tr>
				</thead>
				
				<tbody> 
					
					<tr>
						<td>
							<textarea name="contents" placeholder="글 내용" class="form-control" maxlength="3000" 
								style="height:50px;"></textarea>
						</td>
					</tr>
				</tbody>
			
			</table>
			
			<input type="submit" value="댓글 등록" class="btn btn-primary pull-right">
			
		</form>
	</div>
</div>




<!-- ////////////// 댓글 목록 ////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->

<br><br><br>


<%

	ReplyDao replyDao = ReplyDao.getinstance();

	ArrayList<ReplyDto> list = replyDao.getreplylist(id);

%>

<div class="container">
	<div>
		<table class="table table-striped" style="text-align:center; border:1px;">
		
			<thead>
				<tr>
					<th style="background-color: #eeeeee; text-align: center; width: 100px;">작성자</th>
					<th style="background-color: #eeeeee; text-align: left;">내용</th>
				</tr>
			</thead>

				<%
				for(int i = 0; i < list.size(); i++) {
							
							ReplyDto replyDto = list.get(i);
				%>
				<tr>
					<td><%=replyDto.getReply_userid() %></td>
					<td style="text-align: left;"><%=replyDto.getReply_contents() %></td>
				</tr>

				<%
				}
				%>

				<tbody>
				
			</tbody>
		
		</table>
		
	</div>
</div>

<%@include file="/footer.jsp" %>

</body>
</html>