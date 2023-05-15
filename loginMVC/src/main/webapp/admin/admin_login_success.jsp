<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 세션 사용 옵션 -->
<%@ page session="true" %>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인 성공 페이지</title>
<%@ include file="../include/header.jsp" %>
<!-- 사용여부에 관계없이 각 페이지마다 세션체크하는 기능을 추가해주는 것이 좋다. -->
<%@ include file="../include/admin_session_check.jsp" %>
<script type="text/javascript">
$(function(){
	$("#btnLogout").click(function(){
		location.href="${path}/admin_servlet/logout.do";
	});
});
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<!-- 세션에 저장된 값을 조회 session.getAttribute("변수명") -->
<!-- 세션은 기본적으로 30분을 유지시킨다. -->
<h2><%=session.getAttribute("message") %></h2>
접속중인 관리자 아이디는 <%=session.getAttribute("userid") %>입니다.
<button type="button" id="btnLogout">로그아웃</button>
</body>
</html>
