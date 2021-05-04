<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript">

	function checkadd() {
		
		if(!signupform.id.value){
			alert('아이디를 입력해주세요.');
			signupform.id.focus();
			return false;
		}
		
		// 영문, 숫자만 id로 사용
		var regx = /^[a-zA-Z0-9]*$/; // 자바 스크립트 정규 표현식 (중요)
		
		if(!regx.test(signupform.id.value)) {
			// 현재 정규표현식이 포함되어 있지 않으면
			alert('영문과 숫자만 입력해주세요.');
			return false;
			
		}
		
		if(!signupform.password.value){
			alert('패스워드를 입력해주세요.');
			signupform.password.focus();
			return false;
		}
		
		if(signupform.password.value != signupform.passwordcheck.value){
			alert('패스워드가 일치하지 않습니다.');
			signupform.passwordcheck.focus();
			return false;
		}
		
		if(!signupform.name.value){
			alert('이름을 입력해주세요.');
			signupform.name.focus();
			return false;
		}
		
	}
	
	function checkadd2() {
		
		if(addform.name.value.length < 4 || addform.name.value.length >= 50){
			alert("상품명[최소 4글자 ~ 50글자] 입력해주세요.");
			return false;
		}
		
		// 가격이 입력이 안되어 있거나 가격이 문자가 포함되어 있으면
		if(addform.price.value.length == 0 || isNaN(addform.price.value)){
											// isNaN(숫자) : flase
											// isNaN("숫자") : flase => 숫자반환
											// isNaN(숫자 + 문자) : true
			alert("가격은 숫자만 입력해주세요.");
			return false;
		}
		
		if(addform.price.value < 0) {
			alert("가격은 양수로만 입력가능합니다.");
			return false;
		}
		
		// 재고 입력이 안되어 있거나 가격이 문자가 포함되어 있으면
		if(addform.stock.value.length == 0 || isNaN(addform.stock.value)){
											// isNaN(숫자) : flase
											// isNaN("숫자") : flase => 숫자반환
											// isNaN(숫자 + 문자) : true
			alert("재고는 숫자만 입력해주세요.");
			return false;
		}
		
		if(addform.stock.value < 0) {
			alert("재고는 양수로만 입력가능합니다.");
			return false;
		}
		
	}

</script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>

<script type="text/javascript">

	var sell_price; // 변수
	var amount; // 변수
	
	function init() { // 메소드 정의
		
		sell_price = document.form.sell_price.value; // form 안에 있는 가격 값 가져오기
		
		amount = document.form.amount.value; // form 안에 있는 수량 값 가져오기
		
		max = document.form.max.value;
		
		document.form.sum.value = sell_price.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","); // 총 가격 넣기
		
	}
	
	function add() {
		
		hm = document.form.amount;
		sum = document.form.sum;
		
		if(hm.value >= parseInt(max)) { // 수량이 재고수보다 커지면 중지
			
			alert("최대수량 입니다.")
			return;
			
		}
		
		hm.value++;
		sum.value = (parseInt(hm.value) * sell_price).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","); // 총금액 = 수량 * 가격
		
	}
	
	function del() {
		
		hm = document.form.amount;
		sum = document.form.sum;
		
		if(hm.value > 1) {
			
			hm.value--;
			sum.value = (parseInt(hm.value) * sell_price).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","); // 총금액 = 수량 * 가격
			
		}
		
	}
	
	function addtocart() {
		
		if(confirm("상품을 장바구니에 추가하시겠습니까?")) {
			
			form.submit();
		
		}
		
	}

</script>

<script type="text/javascript">

	function deletecart() {
		
		if(confirm("장바구니를 모두 비우시겠습니까?")) {
			
			location.href="deletecart.jsp"
			
		}
		
	}
	
	function deletecartproduct(id) {
		
		if(confirm("해당 상품을 삭제하겠습니까?")) {
			
			location.href="deletecartproduct.jsp?id=" + id;
			
		}
		
	}

</script>

<script>

	$("#check_module").click(function () {
	
	var IMP = window.IMP; // 생략가능
	
	IMP.init('imp70847576');
	
	// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	
	// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
	
	IMP.request_pay({
	
	pg: 'danal', // version 1.1.0부터 지원.
	
	/*
	
	'kakao':카카오페이,
	
	html5_inicis':이니시스(웹표준결제)
	
	'nice':나이스페이
	
	'jtnet':제이티넷
	
	'uplus':LG유플러스
	
	'danal':다날
	
	'payco':페이코
	
	'syrup':시럽페이
	
	'paypal':페이팔
	
	*/
	
	pay_method: 'phone',
	
	/*
	
	'samsung':삼성페이,
	
	'card':신용카드,
	
	'trans':실시간계좌이체,
	
	'vbank':가상계좌,
	
	'phone':휴대폰소액결제
	
	*/
	
	merchant_uid: 'merchant_' + new Date().getTime(),
	
	/*
	
	merchant_uid에 경우
	
	https://docs.iamport.kr/implementation/payment
	
	위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
	
	참고하세요.
	
	나중에 포스팅 해볼게요.
	
	*/
	
	name: '스포츠 쇼핑몰',
	
	//결제창에서 보여질 이름
	
	amount: parseInt(document.form2.payment.value),
	
	//가격
	
	buyer_email: document.form.email.value,
	
	buyer_name: document.form.name.value,
	
	buyer_tel: document.form.phone.value,
	
	buyer_addr: document.form2.sendaddress2.value+"/"+document.form2.sendaddress3.value+"/"+document.form2.sendaddress4.value,
	
	buyer_postcode: document.form2.sendaddress1.value,
	
	m_redirect_url: 'https://www.yourdomain.com/payments/complete'
	
	/*
	
	모바일 결제시,
	
	결제가 끝나고 랜딩되는 URL을 지정
	
	(카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
	
	*/
	
	}, function (rsp) {
	
	console.log(rsp);
	
	if (rsp.success) {
	
	var msg = '결제가 완료되었습니다.';
	
	msg += '고유ID : ' + rsp.imp_uid;
	
	msg += '상점 거래ID : ' + rsp.merchant_uid;
	
	msg += '결제 금액 : ' + rsp.paid_amount;
	
	msg += '카드 승인번호 : ' + rsp.apply_num;
	
	} else {
	
	var msg = '결제에 실패하였습니다.';
	
	msg += '에러내용 : ' + rsp.error_msg;
	
	}
	
	alert(msg);
	
	});
	
	});

</script>

</body>
</html>