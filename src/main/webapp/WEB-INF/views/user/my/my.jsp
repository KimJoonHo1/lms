<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LMS</title>
<link rel="stylesheet" href="${contextPath }/resources/user/css/userStyle.css">
</head>
<body>
	<div class="warp">
		<jsp:include page="../header.jsp"/>
		<div class="my-container">
			<form action="" method="post">
				<div class="my-line-box">
					<div class="wd-150">아이디</div>
					<div><input type="text" class="wd-142" value="${dto.id }"/></div>
					<div class="wd-150 ml-100">이름</div>
					<div><input type="text" class="wd-142" value="${dto.name }"/></div>
				</div>
				<div class="my-line-box">
					<div class="wd-150">비밀번호</div>
					<div><input type="password" class="wd-142"/></div>
					<div class="wd-150 ml-100">학과</div>
					<div><input type="text" class="wd-142" value="${dto.departmentStr }"/></div>
				</div>
				<div class="my-line-box">
					<div class="wd-150">비밀번호 확인</div>
					<div><input type="password" class="wd-142"/></div>
					<div class="wd-150 ml-100">이메일</div>
					<div><input type="text" class="wd-142" value="${dto.email }"/></div>
					<div><button type="button">이메일 중복 확인</button></div>
				</div>
				<div>
					<button type="button">수정</button>
				</div>
			</form>
		</div>
	</div>
<script src="${contextPath }/resources/jquery-3.6.0.min.js"></script>
<script src="${contextPath }/resources/member/js/memberScript.js?ver=10"></script>
<script src="${contextPath }/resources/user/js/userScript.js"></script>
</body>
</html>