<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LMS 관리자 페이지</title>
<link rel="stylesheet" href="${contextPath }/resources/admin/css/adminStyle.css?ver=2"/>
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
					<li><a href="#" id="menu-check">회원관리</a></li>
					<li><a href="subjectlist">과목관리</a></li>
					<li><a href="lecturelist">강의관리</a></li>
					<li><a href="lecturelist">시험관리</a></li>
					<li><a href="lecturelist">공지사항</a></li>
				</ul>
			</div>
			<div class="admin-body">
				<div class="admin-body-title">
					<ul>
						<li class="admin-body-title-non-check"><a href="userlist" class="admin-body-title-non-ckeck-a">회원목록</a></li>
						<li class="admin-body-title-check">가입승인</li>
					</ul>
				</div>
				<div class="admin-body-main-box">
					<div class="admin-body-main-title">
						<span class="admin-body-main-head">회원목록</span>
						<form action="newuserlist" method="post" id="new-list-form">
							<span class="admin-user-search">
								<span class="admin-user-text">아이디 검색</span>
								<input type="text" class="admin-user-input" name="search" id="new-list-search"/>
								<button type="button" class="admin-user-btn" onclick="newListSearch();">검색</button>
							</span>
						</form>
					</div>

					<div class="admin-body-table">
					<ul class="admin-body-table-header">
							<li style="width: 10%;">아이디</li>
							<li style="width: 5%;">|</li>
							<li style="width: 15%;">비밀번호</li>
							<li style="width: 5%;">|</li>
							<li style="width: 10%;">이름</li>
							<li style="width: 5%;">|</li>
							<li style="width: 15%;">학과</li>
							<li style="width: 5%;">|</li>
							<li style="width: 30%;">이메일</li>
						</ul>
					<c:forEach var="dto" items="${list }">
						<ul class="admin-body-table-body admin-body-new-user-table-body" id="${dto.id }" onclick="approvalUser(this);">
							<li style="width: 10%;">${dto.id }</li>
							<li style="width: 5%; font-weight: bold;">|</li>
							<li style="width: 15%;">${dto.pwd }</li>
							<li style="width: 5%; font-weight: bold;">|</li>
							<li style="width: 10%;">${dto.name }</li>
							<li style="width: 5%; font-weight: bold;">|</li>
							<li style="width: 15%;">${dto.departmentStr }</li>
							<li style="width: 5%; font-weight: bold;">|</li>
							<li style="width: 30%;">${dto.email }</li>
						</ul>
					</c:forEach>
					<c:if test="${list.size() == 0 }">
						<ul style="margin-top: 20px;">
							<li style="font-size: 18px; font-weight: bold;">검색된 회원이 없습니다.</li>
						</ul>
					</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
<script src="${contextPath }/resources/jquery-3.6.0.min.js"></script>
<script src="${contextPath }/resources/admin/js/adminScript.js?var=2"></script>
</body>
</html>