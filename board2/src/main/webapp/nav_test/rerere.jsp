<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {box-sizing: border-box;}
 
body { 
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}
 
#navbar {
  overflow: hidden;
  background-color: #f1f1f1;
  padding: 90px 10px;
  transition: 0.4s;
  position: fixed;
  width: 100%;
  top: 0;
  z-index: 99;
}
 
#navbar a {
  float: left;
  color: black;
  text-align: center;
  padding: 12px;
  text-decoration: none;
  font-size: 18px; 
  line-height: 25px;
  border-radius: 4px;
}
 
#navbar #logo {
  font-size: 35px;
  font-weight: bold;
  transition: 0.4s;
}
 
#navbar a:hover {
  background-color: #ddd;
  color: black;
}
 
#navbar a.active {
  background-color: dodgerblue;
  color: white;
}
 
#navbar-right {
  float: right;
}
 
@media screen and (max-width: 580px) {
  #navbar {
    padding: 20px 10px !important;
  }
  #navbar a {
    float: none;
    display: block;
    text-align: left;
  }
  #navbar-right {
    float: none;
  }
}
</style>
</head>
<body>
 
<div id="navbar">
  <a href="#default" id="logo">아싸! 자드</a>
  <div id="navbar-right">
    <a class="active" href="#home">홈</a>
    <a href="#contact">자드</a>
    <a href="#about">만나기</a>
  </div>
</div>
 
<div style="margin-top:210px;padding:15px 15px 2500px;font-size:30px">
  <p><b>스크롤시 크기가 변경되는 상단 메뉴.</b></p>
  <p>ZARD는 1991년에 첫 번째 싱글 《Good-bye My Loneliness》로 데뷔하였다. 5번째 싱글 《In my arms tonight》 발표 직후, 베이스를 담당하는 호시 히로야스(星弘泰)가 탈퇴하고 곧바로 다음 6번째 싱글 《負けないで》 직후, 기타를 맡던 마치다 후미토(町田文人)와 베이스 담당 미치쿠라 코스케(道倉康介), 키보드 담당 이케자와 기미타카(池澤公隆)가 탈퇴를 선언한 것으로 추측된다. 1991년에서 1993년에 걸쳐 탈퇴한 것이다. 2006년 데뷔 15주년을 기념하여 10월 25일 특별 앨범을 발매하였다.사카이 이즈미는 2007년 5월 27일 죽을 때까지 B-Gram Records, Inc.(지금의 Being Inc.)을 소속사로 활동하였다.</p>
</div>
 
<script>
// When the user scrolls down 80px from the top of the document, resize the navbar's padding and the logo's font size
window.onscroll = function() {scrollFunction()};
function scrollFunction() {
  if (document.body.scrollTop > 80 || document.documentElement.scrollTop > 80) {
    document.getElementById("navbar").style.padding = "30px 10px";
    document.getElementById("logo").style.fontSize = "25px";
  } else {
    document.getElementById("navbar").style.padding = "80px 10px";
    document.getElementById("logo").style.fontSize = "35px";
  }
}
</script>
 
</body>
</html>