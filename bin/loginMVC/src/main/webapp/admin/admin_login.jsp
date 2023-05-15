<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인 페이지</title>
<%@ include file="../include/header.jsp" %>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>관리자 로그인</h2>
<form name="form1" method="post" action="${path}/admin_servlet/login.do">
아이디 <input name="userid"><br>
비밀번호 <input type="password" name="passwd"><br>
<input type="submit" value="로그인">

</form>
<!-- 로그인 실패, 로그아웃 메시지를 출력할 태그 -->
<%
String message=request.getParameter("message");
if(message != null){
%>
	<span style="color: red;"><%=message%></span>
<%
}
%>

</html>
