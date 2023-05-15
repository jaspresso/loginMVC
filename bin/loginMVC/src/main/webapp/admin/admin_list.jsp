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
function view(userid) {
	document.form1.userid.value = userid;
	document.form1.submit();
}
</script>
</head>
<body>
<div class="container my-5">
  <h3 class="text-center mb-3">등록된 관리자 수 : ${map.count}명</h3>
  <table class="table table-striped table-bordered table-hover">
    <thead>
      <tr>
        <th>아이디</th>
        <th>이름</th>
        <th>부서번호</th>
        <th>이메일</th>
        <th>핸드폰</th>
        <th>가입일자</th>
      </tr>
    </thead>
    <tbody>
     <c:forEach var="dto" items="${map.list}">
      <tr>
        <td>${dto.userid}</td>
        <td><a href="#" onclick="view('${dto.userid}')">${dto.name}</a> </td>
        <td>${dto.deptno}</td>
        <td>${dto.email}</td>
        <td>${dto.hp}</td>
        <td>${dto.join_date}</td>
      </tr>
     </c:forEach>
    </tbody>
  </table>
  <form name="form1" method="post" action="${path}/admin_servlet/view.do">
    <input type="hidden" name="userid">
  </form>
</div>
</body>
</html>
