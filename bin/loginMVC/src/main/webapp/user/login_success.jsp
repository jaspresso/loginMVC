<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인 성공 페이지</title>
<%@ include file="../include/header.jsp" %>
<!-- 사용여부에 관계없이 각 페이지마다 세션체크하는 기능을 추가해주는 것이 좋다. -->
<%@ include file="../include/session_check.jsp" %>
<script type="text/javascript">
$(function(){
	$("#btnLogout").click(function(){
		location.href="${path}/user_servlet/logout.do";
	});
});
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<!-- 세션에 저장된 값을 조회 session.getAttribute("변수명") -->
<!-- 세션은 기본적으로 30분을 유지시킨다. -->
<h2><%=session.getAttribute("message") %></h2>
접속중인 이메일은 <%=session.getAttribute("email") %>입니다.
<button type="button" id="btnLogout">로그아웃</button>
</body>
</html>
