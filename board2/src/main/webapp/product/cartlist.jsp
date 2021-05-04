<%@page import="java.text.DecimalFormat"%>
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

	<%@include file="../menu.jsp"%>

	<%
	DecimalFormat df = new DecimalFormat("###,###원"); // 천단위 쉼표 만들기 = 형식 클래스 [ DecimalFormat ]
	%>

	<%
	// 세션 장바구니 가져오기
	ArrayList<ProductDto> list = (ArrayList<ProductDto>) session.getAttribute("cartlist");

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
				<th>비고</th>
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
				<td><a href="#" onclick="deletecartproduct('<%=dto.getProduct_id()%>')">삭제</a></td>
				<%
				}
				%>

			</tr>
			<%
			}
			%>
		</table>

		<a href="#" onclick="deletecart()" class="btn btn-info">모두 비우기</a>

		<%
		int shippingfee = 2500;
		int payment = total + shippingfee;
		%>

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

			<a href="#" class="btn btn-info">쇼핑계속하기</a>
			<a href="payment.jsp" class="btn btn-success" style="margin: 50px 50px;">주문하기</a>
		
		<div style="border: 1px solid black; padding: 30px;">
			<div style="margin-bottom: 20px; font-size: 20px;">
				이용안내
			</div>
			
			<div>
				장바구니 이용안내
					<ol>
						<li>해외배송 상품과 국내배송 상품은 함께 결제하실 수 없으니 장바구니 별로 따로 결제해 주시기 바랍니다.</li>
						<li>해외배송 가능 상품의 경우 국내배송 장바구니에 담았다가 해외배송 장바구니로 이동하여 결제하실 수 있습니다.</li>
						<li>선택하신 상품의 수량을 변경하시려면 수량변경 후 [변경] 버튼을 누르시면 됩니다.</li>
						<li>[쇼핑계속하기] 버튼을 누르시면 쇼핑을 계속 하실 수 있습니다.</li>
						<li>장바구니와 관심상품을 이용하여 원하시는 상품만 주문하거나 관심상품으로 등록하실 수 있습니다.</li>
						<li>파일첨부 옵션은 동일상품을 장바구니에 추가할 경우 마지막에 업로드 한 파일로 교체됩니다.</li>
					</ol>
				
				할부 안내
					<ol>
						<li>상품별 무이자할부 혜택을 받으시려면 무이자할부 상품만 선택하여 [주문하기] 버튼을 눌러 주문/결제 하시면 됩니다.</li>
						<li>[전체 상품 주문] 버튼을 누르시면 장바구니의 구분없이 선택된 모든 상품에 대한 주문/결제가 이루어집니다.</li>
						<li>단, 전체 상품을 주문/결제하실 경우, 상품별 무이자할부 혜택을 받으실 수 없습니다.</li>
					</ol>
			</div>
		</div>
	</div>
	<%@include file="../footer.jsp"%>
</body>
</html>