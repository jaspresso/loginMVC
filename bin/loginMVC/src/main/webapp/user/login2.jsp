<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<title>로그인 페이지</title>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/menu.jsp" %>
<script type="text/javascript">
$(function() {
	$("#btnLogin").click(function() {
		var param="email="+$("#email").val()+"&passwd="+$("#passwd").val();
		$.ajax({
			type: "post",
			url: "${path}/user_servlet/login.do",
			data: param,
			success: function(result) {
				$("#result").html(result);
			}
		});
	});
$("#btnLogout").click(function() {
		$.ajax({
			type: "post",
			url: "${path}/user_servlet/logout.do",
			success: function(result) {
			$("#result").html(result);
			}
		});
	});
});

/* function check() {
	//아이디 체크
	var email = document.getElementById("email");
	if(email.value == ""){
		alert("이메일은 필수 입력입니다.");
		userid.focus();
		return;
	}
	
	//비밀번호 체크
	var passwd = document.getElementById("passwd");
	if (passwd.value == ""){
		alert("비밀번호는 필수 입력입니다.");
		passwd.focus();
    return;
	}
	document.form1.location.href="${path}/user_servlet/login.do";
	document.form1.submit();
} */
</script>
</head>
<body>
<div class="container">
 <h2>로그인</h2>
 <form>
  <div class="form-group">
   <label for="email">Email : </label>
   <input type="email" class="form-control" id="email" 
   placeholder="Enter email" name="email">
  </div>
  <div class="form-group">
   <label for="passwd">Password : </label>
   <input type="password" class="form-control" id="passwd" 
   placeholder="Enter password" name="passwd">
  </div>
  <div class="form-check">
   <input type="checkbox" class="form-check-input" id="pwdCheck">
    <label class="form-check-label" for="pwdCheck">Remember me</label>
  </div>
  <button type="button" class="btn btn-primary" id="btnLogin">로그인</button>
 </form>
 <div class="dropdown-divider"></div>
  <a class="dropdown-item" href="join.jsp">회원가입</a>
  <a class="dropdown-item" href="#">아이디 찾기</a>
  <a class="dropdown-item" href="#">비밀번호 찾기</a>
  <div id="result"></div>
</div>

</body>
</html>