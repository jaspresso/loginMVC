<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="admin.AdminDTO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>

<script type="text/javascript">
$(function() {
	$("#btnUpdate").click(function() {
		//폼 데이터를 제출할 주소
		document.form1.action="${path}/admin_servlet/update.do";
		document.form1.submit();
	});
	$("#btnDelete").click(function() {
		//폼 데이터를 제출할 주소
		if(confirm("관리자를 삭제하시겠습니까?")){
			document.form1.action="${path}/admin_servlet/delete.do";
			document.form1.submit();
		}
	});
});
</script>

</head>
<body>
<%@ include file="../include/menu.jsp" %>
<%
AdminDTO dto=(AdminDTO)request.getAttribute("dto");
%>
<form name="form1" method="post">
<table>
 <tr>
  <td>아이디</td>
  <td><%= dto.getUserid()%></td>
 </tr>
 <tr>
  <td>비밀번호</td>
  <td><input type="password" name="passwd" value="<%= dto.getPasswd()%>"></td>
 </tr>
 <tr>
  <td>이름</td>
  <td><input name="name" value="<%= dto.getName()%>"></td>
 </tr>
 <tr>
  <td>부서번호</td>
  <td><input name="deptno" value="<%= dto.getDeptno()%>"></td>
 </tr>
 <tr>
  <td>이메일</td>
  <td><input name="email" value="<%= dto.getEmail()%>"></td>
 </tr>
 <tr>
  <td>관리자 등록일자</td>
  <td><%= dto.getJoin_date()%></td>
 </tr>
 <tr>
	<td>휴대폰</td>
	<td><input name="hp" value="<%=dto.getHp()%>"></td>
 </tr>
 <tr>
  <td colspan="2" align="center">
   <!-- userid가 반드시 필요하기 때문에 hidden 타입으로 넘긴다. -->
   <input type="hidden" name="userid" value="<%=dto.getUserid()%>">
	 <button type="button" id="btnUpdate">수정</button>
	 <button type="button" id="btnDelete">삭제</button>
  </td>
 </tr>
</table>
</form>
</body>
</html>