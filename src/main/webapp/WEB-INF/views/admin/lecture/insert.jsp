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
					<li><a href="subjectlist">과목관리</a></li>
					<li><a href="#" id="menu-check">강의관리</a></li>
					<li><a href="#">시험관리</a></li>
					<li><a href="noticelist">공지사항</a></li>
				</ul>
			</div>
			<div class="admin-body">
				<div class="admin-body-title">
					<ul>
						<li class="admin-body-title-non-check"><a href="lecturelist" class="admin-body-title-non-ckeck-a">강의리스트</a></li>
						<li class="admin-body-title-check">강의개설</li>
					</ul>
				</div>
				<div class="admin-body-main-box">
					<div class="admin-body-main-title">
						<span class="admin-body-main-head">강의개설</span>
					</div>
					<div class="admin-sub-body">
						<form action="lectureinsert-1" method="post" id="lecture-insert-form">
							<div class="admin-sub-body-line">
								<div class="admin-sub-body-box">
									<span class="admin-sub-body-box-text">과목명</span>
									<select name="subname" id="lec-insert-name" class="sub-body-select">
										<option value="" selected>선택</option>
										<c:forEach var="dto" items="${list }">
										<option value="${dto.num }">${dto.name } (${dto.score }학점) (${dto.lectureTime }시간)</option>
										</c:forEach>
									</select>
								</div>
								<div class="admin-sub-body-box">
									<span class="admin-sub-body-box-text">수강인원</span>
									<input type="number" name="perso" id="lec-insert-perso" class="sub-sub-body-input" style="width: 100px;"/>
								</div>
							</div>
							<div class="admin-sub-body-line">
								<div class="admin-sub-body-box">
									<span class="admin-sub-body-box-text">강의시간</span>
									<select name="lectureWeek" id="lec-insert-time1" class="sub-body-select" style="width: auto;">
										<option value="" selected>선택</option>
										<option value="1">월요일</option>
										<option value="2">화요일</option>
										<option value="3">수요일</option>
										<option value="4">목요일</option>
										<option value="5">금요일</option>
									</select>
									<select name="lectureDate" id="lec-insert-time2" class="sub-body-select" style="width: auto; margin-left: 20px;">
										<option value="" selected>선택</option>
										<option value="1">AM 09:00</option>
										<option value="2">AM 10:00</option>
										<option value="3">PM 01:00</option>
										<option value="4">PM 02:00</option>
										<option value="5">PM 03:00</option>
										<option value="6">PM 04:00</option>
									</select>
								</div>
								<div class="admin-sub-body-box">
									<span class="admin-lec-body-box-text">시작일</span>
									<input type="date" name="startDate" id="lec-insert-startDate"/>
									<span class="admin-lec-body-box-text" style="margin-left: 15px;">종료일</span>
									<input type="date" name="endDate" id="lec-insert-endDate"/>
								</div>
							</div>
							<div>
								<div style="float: right;">
									<button type="button" class="sub-insert-btn" onclick="lectureInsert();">등록</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<script src="${contextPath }/resources/jquery-3.6.0.min.js"></script>
<script src="${contextPath }/resources/admin/js/adminScript.js?var=3"></script>
</body>
</html>