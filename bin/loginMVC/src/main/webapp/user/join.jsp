<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- views/member/write.jsp -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script>
function emailCheck() {
	   var email = $('#email').val();
	   $.ajax({
		   type: 'POST',
		   url: '${path}/user_servlet/emailCheck.do',
		   data: {email: email},
		   success: function(result) {
			   if(result == 0){
				   $('#checkMessage').html('사용할 수 있는 아이디입니다.');
				   $('#checkType').attr('class', 'modal-content panel-success');
			   }else if(result == 1){
				   $('#checkMessage').html('사용할 수 없는 아이디입니다.');
				   $('#checkType').attr('class', 'modal-content panel-warning');
			   }
			   $('#checkModal').modal("show");
		   }
	   });
}

function insert() {
	var password = $("#passwd").val();
	var confirmPasswd = $("#confirmPasswd").val();
	
	if (password !== confirmPasswd) {
		$('#passwordCheckMessage').html('비밀번호가 서로 일치하지 않습니다.');
		return;
	}
	
	var param="email="+$("#email").val()
	+"&passwd="+$("#passwd").val()
	+"&name="+$("#name").val()
	+"&hp="+$("#hp").val();
	$.ajax({
		type: "post",
		url : "${path}/user_servlet/join.do",
		data : param,
		success : function(){
			//입력값 초기화
			$("#email").val("");
			$("#passwd").val("");
			$("#name").val("");
			$("#hp").val("");
			$("#confirmPasswd").val("");
		}
	});
}
</script>
<!-- 테스트용 : ajax에서 result 값이 올 때의 오류 디버깅중 -->
<!-- 조원1 테스트용 : git 테스트합니다. -->
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<div class="container">
 <h2>회원가입</h2>
 <form action="">
  <div class="form-group">
   <label for="email">Email : </label>
   <input type="email" class="form-control" id="email" 
   placeholder="Enter email" name="email">
   <td><button type="button" class="btn btn-primary" onclick="emailCheck();">중복체크</button></td>
  </div>
  <div class="form-group">
   <label for="passwd">Password : </label>
   <input type="password" class="form-control" id="passwd" 
   placeholder="Enter password" name="passwd">
  </div>
  <div class="form-group">
   <label for="confirmPasswd">Confirm Password : </label>
   <input type="password" class="form-control" id="confirmPasswd" 
   placeholder="Confirm password" name="confirmPasswd">
  </div>
  <div class="form-group">
   <label for="name">Name : </label>
   <input type="text" class="form-control" id="name" 
   placeholder="Enter name" name="name">
  </div>
  <div class="form-group">
   <label for="hp">Phone : </label>
   <input type="text" class="form-control" id="hp" 
   placeholder="Enter phone number" name="hp">
  </div>
  <div class="form-group">
   <label for="zipcode">Zip Code : </label>
   <input type="text" class="form-control" id="zipcode" 
   placeholder="Enter zip code" name="zipcode">
  </div>
  <div class="form-group">
   <label for="address1">Address 1 : </label>
   <input type="text" class="form-control" id="address1" 
   placeholder="Enter address line 1" name="address1">
  </div>
  <div class="form-group">
   <label for="address2">Address 2 : </label>
   <input type="text" class="form-control" id="address2" 
   placeholder="Enter address line 2" name="address2">
  </div>
  <h5 style="color: red;" id="passwordCheckMessage"></h5>
  <div class="modal-body" id="checkMessage">
  <button id="btnSave" type="button" onclick="insert()" class="btn btn-primary">회원가입</button>
 </form>
</div>

<div id="clientList"></div>
</body>
</html>
