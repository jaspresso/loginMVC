<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 세션 사용 옵션 -->    
<%@ page session="true" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/header.jsp" %>
<title>관리자 사이트</title>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>관리자 사이트</h2>
<%-- <c:if test="${sessionScope.userid != null }">
	<h2>
		${sessionScope.name}
		(${sessionScope.userid})님의 방문을 환영합니다.
	</h2>
</c:if> --%>

<% if (session.getAttribute("userid") != null) { %>
	<h2>
		<%= session.getAttribute("userid") %>님의 방문을 환영합니다.
	</h2>
<% } %>



</body>
</html>