<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- views/member/write.jsp -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 등록</title>
<%@ include file="../include/header.jsp" %>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>관리자 등록</h2>
<form name="form1" method="post"
	action="${path}/admin_servlet/join.do">
<table border="1" width="20%;">
  <tr>
		<td>아이디</td>
		<td><input name="userid"></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="passwd"></td> 
	</tr>
	<tr>
		<td>이름</td>
		<td><input name="name"></td>
	</tr>
	<tr>
		<td>부서번호</td>
		<td><input name="deptno"></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><input name="email"></td>
	</tr>
	<tr>
		<td>hp</td>
		<td><input name="hp"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="확인">	</td>
	</tr>
</table>	
</form>
</body>
</html>
