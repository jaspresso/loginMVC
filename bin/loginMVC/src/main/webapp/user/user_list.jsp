<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/menu.jsp" %>
<script type="text/javascript">
function view(email) {
	document.form1.email.value = email;
	document.form1.submit();
}
</script>
</head>
<body>
<div class="container my-5">
  <h3 class="text-center mb-3">등록된 회원수 : ${map.count}명</h3>
  <table class="table table-striped table-bordered table-hover">
    <thead>
      <tr>
        <th>이메일</th>
        <th>이름</th>
        <th>핸드폰</th>
        <th>가입일자</th>
      </tr>
    </thead>
    <tbody>
     <c:forEach var="dto" items="${map.list}">
      <tr>
        <td>${dto.email}</td>
        <td><a href="#" onclick="view('${dto.email}')">${dto.name}</a> </td>
        <td>${dto.hp}</td>
        <td>${dto.join_date}</td>
      </tr>
     </c:forEach>
    </tbody>
  </table>
  <form name="form1" method="post" action="${path}/user_servlet/view.do">
    <input type="hidden" name="email">
  </form>
</div>
</body>
</html>
