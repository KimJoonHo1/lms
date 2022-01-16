<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link rel="stylesheet"
	href="${contextPath }/resources/member/css/memberStyle.css?ver=2">
</head>
<body>
	<div class="login-wrap">
		<div class="login-comment">
			어서오세요! 학생들의 수업 도우미 LMS입니다!
		</div>
		<!--  <form action="login/1" method="post" id="login-form"> -->
		<div id="login-form">
			<div class="login-input-box">
				<input type="text" id="login-id" name="id" placeholder="아이디" />
				<input type="password" id="login-pwd" name="pwd" placeholder="비밀번호" />
				<span class="login-input-comment" id="login-input-comment">아이디 또는 비밀번호를 확인해 주세요.</span>
			</div>
			<div class="login-btn-box">
				<button type="button" onclick="login();" id="login-btn">로그인</button>
			</div>
		<!-- </form> -->
		</div>
		<a href="#">
			<span class="login-option">아이디/비밀번호 찾기</span>
		</a>
		<a href="join">
			 <span class="login-option ml-15">회원가입</span>
		</a>
		
	</div>
<script src="${contextPath }/resources/jquery-3.6.0.min.js"></script>
<script src="${contextPath }/resources/member/js/memberScript.js?ver=10"></script>
</body>
</html>