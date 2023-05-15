<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
$(document).ready(function() {
	  // 로그인 상태에 따라 메뉴와 메인 페이지를 업데이트하는 함수
	  function updateMenuAndMainPage(loggedIn) {
	    if (loggedIn) {
	      // 로그인한 경우 메뉴와 메인 페이지 업데이트
	      $('#loginStatus').html('로그아웃');
	      // 추가적인 로그인 상태에 따른 업데이트 로직
	      // ...
	    } else {
	      // 로그아웃한 경우 메뉴와 메인 페이지 업데이트
	      $('#loginStatus').html('로그인');
	      // 추가적인 로그아웃 상태에 따른 업데이트 로직
	      // ...
	    }
	  }

	  // 초기 로그인 상태 설정 (예를 들어, 쿠키나 세션을 기반으로 로그인 상태를 가져옴)
	  var loggedIn = false;

	  // 메뉴와 메인 페이지 업데이트
	  updateMenuAndMainPage(loggedIn);

	  // 로그인/로그아웃 버튼 클릭 이벤트 처리
	  $('#loginStatus').click(function() {
	    loggedIn = !loggedIn; // 로그인 상태 토글
	    updateMenuAndMainPage(loggedIn);
	  });
	});

</script>
</head>
<body>
<div id="menu">
    <ul>
      <li><a href="#">홈</a></li>
      <li><a href="#">프로필</a></li>
      <li id="loginStatus"></li>
    </ul>
  </div>
  <div id="main">
    <h1>메인 페이지</h1>
    <p>이곳은 메인 페이지입니다.</p>
  </div>
</body>
</html>