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
						<li class="admin-body-title-non-check"><a href="subjectlist" class="admin-body-title-non-ckeck-a">전체과목</a></li>
						<li class="admin-body-title-check">과목추가</li>
					</ul>
				</div>
				<div class="admin-body-main-box">
					<div class="admin-body-main-title">
						<span class="admin-body-main-head">과목추가</span>
					</div>
					<div class="admin-sub-body">
						<form action="subjectinsert-1" method="post" id="subject-insert-form">
							<div class="admin-sub-body-line">
								<div class="admin-sub-body-box">
									<span class="admin-sub-body-box-text">과목명</span>
									<input type="text" name="subname" id="sub-insert-name" class="sub-sub-body-input">
								</div>
								<div class="admin-sub-body-box">
									<span class="admin-sub-body-box-text">학과</span>
									<select name="department" id="sub-insert-department" class="sub-body-select">
										<option value="" selected>선택</option>
										<option value="Engineering">공학과</option>
										<option value="Literature">문헌정보학과</option>
										<option value="Japanese">일어문학과</option>
									</select>
								</div>
							</div>
							<div class="admin-sub-body-line">
								<div class="admin-sub-body-box">
									<span class="admin-sub-body-box-text">학점</span>
									<select name="score" id="sub-insert-score" class="sub-body-select">
										<option value="" selected>선택</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
									</select>
								</div>
								<div class="admin-sub-body-box">
									<span class="admin-sub-body-box-text">강의시간</span>
									<select name="time" id="sub-insert-time" class="sub-body-select">
										<option value="" selected>선택</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
									</select>
								</div>
							</div>
							<div class="admin-sub-body-line">
								<div style="width: 100%;">
									<div style="font-size: 22px; font-weight: bold;">과목설명</div>
									<textarea name="comment" id="sub-insert-comment" class="admin-sub-insert-content"></textarea>
								</div>
							</div>
							<div>
								<div style="float: right;">
									<button type="button" class="sub-insert-btn" onclick="subjectInsert();">등록</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<script src="${contextPath }/resources/jquery-3.6.0.min.js"></script>
<script src="${contextPath }/resources/admin/js/adminScript.js?var=2"></script>
</body>
</html>