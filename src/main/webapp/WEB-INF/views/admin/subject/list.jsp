<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LMS 관리자 페이지</title>
<link rel="stylesheet" href="${contextPath }/resources/admin/css/adminStyle.css?ver=8"/>
</head>
<body>
	<div class="wrap">
		<div class="logo-box">
			<span class="logo">LMS</span>
		</div>
		<div style="float: right;">
			<a href="${contextPath }/logout" class="logout">로그아웃</a>
		</div>
		<div class="container">
			<div class="menu-box">
				<ul class="menu">
					<li><a href="userlist">회원관리</a></li>
					<li><a href="#" id="menu-check">과목관리</a></li>
					<li><a href="lecturelist">강의관리</a></li>
					<li><a href="#">시험관리</a></li>
					<li><a href="noticelist">공지사항</a></li>
				</ul>
			</div>
			<div class="admin-body">
				<div class="admin-body-title">
					<ul>
						<li class="admin-body-title-check">전체과목</li>
						<li class="admin-body-title-non-check"><a href="subjectinsert" class="admin-body-title-non-ckeck-a">과목추가</a></li>
					</ul>
				</div>
				<div class="admin-body-main-box">
					<div class="admin-body-main-title">
						<span class="admin-body-main-head">과목추가</span>
					</div>

					<div class="admin-body-table">
					<ul class="admin-body-table-header">
							<li style="width: 10%;">과목번호</li>
							<li style="width: 5%;">|</li>
							<li style="width: 30%;">과목명</li>
							<li style="width: 5%;">|</li>
							<li style="width: 15%;">학과</li>
							<li style="width: 5%;">|</li>
							<li style="width: 10%;">학점</li>
							<li style="width: 5%;">|</li>
							<li style="width: 15%;">강의시간</li>
						</ul>
					<c:forEach var="dto" items="${list }">
						<ul class="admin-body-table-body admin-body-new-user-table-body" onclick="location.href='subjectinfo?num=${dto.num}'">
							<li style="width: 10%;">${dto.num }</li>
							<li style="width: 5%;">|</li>
							<li style="width: 30%;">${dto.name }</li>
							<li style="width: 5%;">|</li>
							<li style="width: 15%;">${dto.departmentStr }</li>
							<li style="width: 5%;">|</li>
							<li style="width: 10%;">${dto.score }</li>
							<li style="width: 5%;">|</li>
							<li style="width: 15%;">${dto.lectureTime }</li>
						</ul>
					</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
<script src="${contextPath }/resources/jquery-3.6.0.min.js"></script>
<script src="${contextPath }/resources/admin/js/adminScript.js?var=1"></script>
</body>
</html>