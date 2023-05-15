<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<%@ include file="../include/header.jsp" %>
</head>
<body>
<div class="container">
 <h2>관리자 로그인</h2>
 <form action="">
  <div class="form-group">
   <label for="email">Email : </label>
   <input type="email" class="form-control" id="email" 
   placeholder="Enter email" name="email">
  </div>
  <div class="form-group">
   <label for="pwd">Password : </label>
   <input type="password" class="form-control" id="pwd" 
   placeholder="Enter password" name="pwd">
  </div>
  <button type="submit" class="btn btn-primary">관리자 로그인</button>
 </form>

</div>
</body>
</html>