<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<%@ include file="../include/header.jsp" %>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<div class="container">
<h2>로그인</h2>
<form name="form1" method="post" action="${path}/user_servlet/login.do">
 <div class="form-group">
  <label for="email">Email : </label>
  <input type="email" class="form-control" id="email" name="email" placeholder="Enter email" >
 </div>
 <div class="form-group">
   <label for="passwd">Password : </label>
   <input type="password" class="form-control" id="passwd" name="passwd" placeholder="Enter password" >
 </div>

<input type="submit" class="btn btn-primary" value="로그인">
</form>
 <div class="dropdown-divider"></div>
  <a class="dropdown-item" href="${path}/user/join.jsp">회원가입</a>
  <a class="dropdown-item" href="#">아이디 찾기</a>
  <a class="dropdown-item" href="#">비밀번호 찾기</a>
 <div>
		<!-- 로그인 실패, 로그아웃 메시지를 출력할 태그 -->
		<%
		String message=request.getParameter("message");
		if(message != null){
		%>
			<span style="color: red;"><%=message%></span>
		<%
		}
		%>
	</div>
</div>
</html>
