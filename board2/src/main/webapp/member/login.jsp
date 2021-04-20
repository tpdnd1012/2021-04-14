<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

.login-box {
	margin-top: 75px;
	height: auto;
	text-align: center;
	box-shadow: 0 3px 6px black;
}

.login-key {
	height: 100px;
	font-size: 80px;
	line-height: 100px;
	background-image: url("/board2/img/mainlogo2.png");
	background-repeat: no-repeat;
	background-position: center;
}

.login-title {
	margin-top: 15px;
	text-align: center;
	font-size: 30px;
	letter-spacing: 2px;
	font-weight: bold;
}

.login-form {
	margin-top: 25px;
	text-align: left;
}

input[type=text] {
	border: none;
	border-bottom: 2px solid skyblue;
	font-weight: bold;
	margin-bottom: 20px;
}

input[type=password] {
	border: none;
	border-bottom: 2px solid skyblue;
	font-weight: bold;
	margin-bottom: 20px;
}

.form-group {
	margin-bottom: 40px;
}

.form-control:focus {
	border-bottom: 4px solid skyblue;
	box-shadow: none;
}

.form-control-label {
	font-size: 10px;
	color: #cccccc;
	font-weight: bold;
	letter-spacing: 1px;
}

.btn-outline-primary {
	color: skyblue;
	font-weight: bold;
	letter-spacing: 1px;
	box-shadow: 0 1px 3px lightgray;
}

.btn-outline-primary:hover {
	background-color: #0DB8DE;
}

.login-btm {
	float: left;
}

.login-button {
	margin-bottom: 30px;
	text-align: right;
}

.login-text {
	text-align: left;
	font-weight: bold;
}

</style>

</head>
<body>

<%@include file="/menu.jsp" %>

<div class="container">

	<div class="row">
	
		<div class="col-lg-3 col-md-2"></div><!-- 공백 -->
		
		<div class="col-lg-6 col-md-8 login-box">
		
			<div class="col-lg-12 login-key">
			
				<i class="fa fa-key" aria-hidden="true"></i>
			
			</div>
			
			<div class="col-lg-12 login-title">
			
				Member Login
			
			</div>
			
			<div class="col-lg-12 login-form">
				
					<form method="post" action="logincontroller.jsp">
					
						<div class="form-group">
						
							<label class="form-control-label">USER ID</label>
							
							<input type="text" class="form-control" maxlength="30">
						
						</div>
						
						<div class="form-group">
						
							<label class="form-control-label">USER Password</label>
							
							<input type="password" class="form-control" maxlength="30">
						
						</div>
						
						<div class="col-lg-12 loginbttm">
						
							<div class="col-lg-6 login-btm login-text">
							
								알림 : 회원정보가 없습니다.
								
							
							</div>
							
							<div class="col-lg-6 login-btm login-button">
							
								<button type="submit" class="btn btn-outline-primary">LOGIN</button>
							
							</div>
						
						</div>
					
					</form>
				
				</div>
			
		</div>
	
	</div>

</div>

<%@include file="/footer.jsp" %>

</body>
</html>