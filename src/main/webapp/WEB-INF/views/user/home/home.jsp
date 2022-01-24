<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		<div class="cont">
			<img src="${contextPath }/resources/banne.png" class="banne-img"/>
			<div class="cont-banne">
				안녕하세요 ${loginUser.name }님!
			</div>
			<div class="menu-box">
				<div><a href="my">내정보</a></div>
				<div><a href="#">강의</a></div>
				<div><a href="#">시험</a></div>
				<div><a href="#">공지사항</a></div>
			</div>
		</div>
	</div>
<script src="${contextPath }/resources/jquery-3.6.0.min.js"></script>
<script src="${contextPath }/resources/user/js/userScript.js"></script>
</body>
</html>