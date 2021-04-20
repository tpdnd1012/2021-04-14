<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 부트스트랩 테이블 -->

<div class="container">
	<div>
	
		<form action="boardwritecontroller.jsp" method="post" enctype="multipart/form-data">
	
			<table class="table table-striped" style="text-align:center; border:1px;">
			
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">게시물 작성</th>
					</tr>
				</thead>
				
				<tbody> 
					<tr>
						<td>
							<input type="text" name="title" placeholder="글 제목" class="form-control" maxlength="40">
						</td>
					</tr>
					
					<tr>
						<td>
							<textarea name="contents" placeholder="글 내용" class="form-control" maxlength="3000" 
								style="height:400px;"></textarea>
						</td>
					</tr>
				</tbody>
			
			</table>
			
			<input type="file" name="file">
			<input type="submit" value="등록" class="btn btn-primary pull-right">
			
		</form>
	</div>
</div>

</body>
</html>