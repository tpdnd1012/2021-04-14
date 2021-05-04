<%@page import="java.text.DecimalFormat"%>
<%@page import="DTO.MemberDto"%>
<%@page import="DAO.MemberDao"%>
<%@page import="DTO.ProductDto"%>
<%@page import="java.util.ArrayList"%>
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
	DecimalFormat df = new DecimalFormat("###,###원"); // 천단위 쉼표 만들기 = 형식 클래스 [ DecimalFormat ]
	%>

	<%
	ArrayList<ProductDto> list = (ArrayList<ProductDto>) session.getAttribute("cartlist");

	if (list == null) { // 장바구니가 비어있으면
		PrintWriter script = response.getWriter();
		script.println("<script>");

		script.println("alert('주문할 상품이 없습니다.');");
		script.println("location.href='/board2/product/cartlist.jsp'");

		script.println("</script>");
	}

	// include의 menu에 user 세션 존재
	if (user == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");

		script.println("alert('로그인 후 주문 가능합니다.');");
		script.println("location.href='/board2/member/login.jsp'");

		script.println("</script>");
	}

	if (list == null) { // 장바구니가 비어있으면
		list = new ArrayList<>();
	}

	int total = 0;
	%>
	<div class="container">
		<table class="table table-hover">
			<tr>
				<th>제품사진</th>
				<th>제품명</th>
				<th>구매수량</th>
				<th>배송비</th>
				<th>가격</th>
			</tr>

			<%
			if (list.size() == 0) {
			%>
			<td colspan="6" style="text-align: center;">장바구니에 상품이 없습니다.</td>
			<%
			} else {
			%>

			<%
			for (int i = 0; i < list.size(); i++) {

				ProductDto dto = list.get(i);

				int sum = dto.getAmount() * dto.getProduct_price();

				total += sum;
			%>
			<tr>
				<td><img alt="" src="/board2/upload/<%=dto.getProduct_file()%>" style="width: 75px;"></td>
				<td><%=dto.getProduct_name()%></td>
				<td><%=dto.getAmount()%></td>
				<td>2,500원</td>
				<td><%=df.format(sum)%></td>
				<%
				}
				%>

			</tr>
			<%
			}
			%>
		</table>
		<%
	
		MemberDao dao = MemberDao.getinstance();
	
		MemberDto dto = dao.getmember(user);
		
		int shippingfee = 2500;
		int payment = total + shippingfee;
	
	%>
	<div class="container">
		구매자 정보
		<form name="form" action="/board2/product/paymentcontroller.jsp">
			이름 : <input type="text" value="<%=dto.getMember_name() %>" name="name"><br>
			연락처 : <input type="text" value="<%=dto.getMember_phone() %>" name="phone"><br>
			이메일 : <input type="text" value="<%=dto.getMember_email() %>" name="email"><br>
		
		<hr>
		
		<div>
			<input type="radio"> 회원과 동일
		</div>
		
		<hr>
		
		받는사람 정보
			이름 : <input type="text" value="<%=dto.getMember_name() %>" name="name2"><br>
			연락처 : <input type="text" value="<%=dto.getMember_phone() %>" name="phone2"><br>
			배송요청사항 : <input type="text" value="" name="textrequest"><br>
			
			<input type="hidden" name="payment" value="<%=payment %>">
			
			
			<% // 주소 분리하기
				String[] address = dto.getMember_address().split("/");
			%>
			
			<div class="form-group">
							
				<label class="form-control-label">USER Address</label>
				<input type="text" id="sample4_postcode" placeholder="우편번호" name="sendaddress1" value=<%=address[0] %>>
				<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="sendaddress2" value=<%=address[1] %>>
				<input type="text" id="sample4_jibunAddress" placeholder="지번주소" name="sendaddress3" value=<%=address[2] %>>
				<span id="guide" style="color:#999;display:none"></span>
				<input type="text" id="sample4_detailAddress" placeholder="상세주소" name="sendaddress4" value=<%=address[3] %>>
				<input type="text" id="sample4_extraAddress" placeholder="참고항목">
							
			</div>
		

		<table class="table" style="margin-top: 100px;">

			<tr>
				<th>총 상품금액</th>
				<th>총 배송비</th>
				<th>결제예정금액</th>
			</tr>

			<tr>
				<td><%=df.format(total)%></td>
				<td><%=df.format(shippingfee)%></td>
				<td><%=df.format(payment)%></td>
			</tr>

		</table>
		
		<hr>
		<!-- 결제수단<br>
		
		신용카드 : <input type="radio" value="국민카드" name="contact"> 국민카드
		<input type="radio" value="신한카드" name="contact"> 신한카드
		<input type="radio" value="롯데카드" name="contact"> 롯데카드 -->
		
		<!-- <button id="check_module"type="button"> 카드 결제 </button> -->
		<!-- <button id="check_module"type="button"> 모바일 결제 </button> -->
		<input type="submit" value="결제완료">
		</form>
		
	</div>

<%@include file="/footer.jsp" %>

</body>
</html>