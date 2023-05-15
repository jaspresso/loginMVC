<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<div style="text-align: center;">
  <c:if test="${sessionScope.userid == null && sessionScope.email == null}">
    <!-- 로그인 하지 않은 상태 -->
    <a href="${path}/">Home</a> |
    <a href="${path}/user/join.jsp">회원가입</a> |
    <a href="${path}/user_servlet/login.do">일반 로그인</a> |
    <a href="${path}/admin_servlet/login.do">관리자 로그인</a> |
  </c:if>
  <c:if test="${sessionScope.email != null && sessionScope.userid == null}">
    <!-- 일반인 로그인한 상태 -->
    <a href="${path}/">Home</a> |
    <a href="${path}/user_servlet/view.do?email=${sessionScope.email}">내정보</a> |
    <a href="${path}/user_servlet/logout.do">로그아웃</a> |
    <%=session.getAttribute("email") %>님이 접속중입니다.
  </c:if>
  <c:if test="${sessionScope.userid != null && sessionScope.email == null}">
    <!-- 관리자 로그인한 상태 -->
    <a href="${path}/">Home</a> |
    <a href="${path}/user_servlet/list.do">회원리스트</a> |
    <a href="${path}/admin_servlet/list.do">관리자 리스트</a> |
    <a href="${path}/admin/admin_join.jsp">관리자 등록</a> |
    <a href="${path}/admin_servlet/logout.do">관리자 로그아웃</a> |
    <%=session.getAttribute("userid") %>님이 접속중입니다.
  </c:if>
</div>


<hr>
