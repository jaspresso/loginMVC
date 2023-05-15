<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<c:set var="path" value="${pageContext.request.contextPath}" />
<% String email = null;
   if(session.getAttribute("email") != null){
	   email = (String)session.getAttribute("email");
   }
%>
<!-- navbar.jsp -->
<div class="container">
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="${path}/index.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${path}/user_servlet/list.do">회원리스트</a></li>

					<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" 
					id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false"> 접속</a> 
						<c:choose>
							<c:when test="${sessionScope.email == null }">
								<!-- 로그인하지 않은 상태 -->
								<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								  <li><a class="dropdown-item" href="${path}/user/login.jsp">로그인</a></li>
									<li><hr class="dropdown-divider"></li>
									<li><a class="dropdown-item" href="${path}/user_servlet/join.do">회원가입</a></li>
								</ul> 
							</c:when>
							<c:otherwise>
								<!-- 로그인한 상태 -->
								${sessionScope.name}님이 로그인중입니다.
								<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
									<li><a class="dropdown-item" href="${path}/user_servlet/logout.do">로그아웃</a></li>
								</ul>
							</c:otherwise>
						</c:choose>
					</li>
				</ul>
				<form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>
</div>


