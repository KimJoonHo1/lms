<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.care.lms.dto.LectureDTO"%>
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
<%
	LectureDTO dto = (LectureDTO) request.getAttribute("dto");
	Date date = new Date();
	SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy/MM/dd");
%>
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
					<li><a href="#">공지사항</a></li>
				</ul>
			</div>
			<div class="admin-body">
				<div class="admin-body-title">
					<ul>
						<li class="admin-body-title-check">강의리스트</li>
						<li class="admin-body-title-non-check"><a href="lectureinsert" class="admin-body-title-non-ckeck-a">강의개설</a></li>
					</ul>
				</div>
				<div class="admin-body-main-box">
					<div class="admin-body-main-title">
						<span class="admin-body-main-head">강의수정</span>
					</div>
					<div class="admin-sub-body">
						<form action="lectureupdate-1" method="post" id="lecture-insert-form">
						<input type="hidden" name="num" value="${dto.num }"/>
							<div class="admin-sub-body-line">
								<div class="admin-sub-body-box">
									<span class="admin-sub-body-box-text">과목</span>
									<span style="font-size: 17px;">${dto.subjectname }</span>
									<input type="hidden" name="subname" value="${dto.subjectname }"/>
								</div>
								<div class="admin-sub-body-box">
									<span class="admin-sub-body-box-text">학과</span>
									<span style="font-size: 17px;">${dto.departmentStr }</span>
								</div>
							</div>
							<div class="admin-sub-body-line">
								<div class="admin-sub-body-box">
									<span class="admin-sub-body-box-text">수강인원</span>
									<%
										if(dto.getStartdate().getDate() < date.getDate()) {
									%>
									<span><%=dto.getLectureperso() %>/<%=dto.getLecturemaxperso() %></span>
									<input type="hidden" name="perso" id="lec-insert-perso" value="<%=dto.getLecturemaxperso()%>"/>
									<input type="hidden" id="lec-ture-perso-check" value="1"/>
									<%
										} else {
									%>
									<span style="font-size: 17px;"><%=dto.getLectureperso() %>/<input type="number" name="perso" id="lec-insert-perso" value="<%=dto.getLecturemaxperso()%>" class="admin-lecture-update-input"/></span>
									<input type="hidden" id="lec-ture-perso-check" value="2"/>
									<%
										}
									%>
									<input type="hidden" id="originalPerso" value="<%=dto.getLectureperso()%>"/>
								</div>
								<div class="admin-sub-body-box">
									<span class="admin-lec-body-box-text">매주</span>
									<select name="lectureWeek" id="lec-insert-time1" class="sub-body-select" style="width: auto;">
										<option value="">선택</option>
										<c:choose>
											<c:when test="${dto.lectureweek == '월요일' }">
												<option value="1" selected>월요일</option>
												<option value="2">화요일</option>
												<option value="3">수요일</option>
												<option value="4">목요일</option>
												<option value="5">금요일</option>
											</c:when>
											<c:when test="${dto.lectureweek == '화요일' }">
												<option value="1">월요일</option>
												<option value="2" selected>화요일</option>
												<option value="3">수요일</option>
												<option value="4">목요일</option>
												<option value="5">금요일</option>
											</c:when>
											<c:when test="${dto.lectureweek == '수요일' }">
												<option value="1">월요일</option>
												<option value="2">화요일</option>
												<option value="3" selected>수요일</option>
												<option value="4">목요일</option>
												<option value="5">금요일</option>
											</c:when>
											<c:when test="${dto.lectureweek == '목요일' }">
												<option value="1">월요일</option>
												<option value="2">화요일</option>
												<option value="3">수요일</option>
												<option value="4" selected>목요일</option>
												<option value="5">금요일</option>
											</c:when>
											<c:when test="${dto.lectureweek == '금요일' }">
												<option value="1">월요일</option>
												<option value="2">화요일</option>
												<option value="3">수요일</option>
												<option value="4">목요일</option>
												<option value="5" selected>금요일</option>
											</c:when>
										</c:choose>
									</select>
									<select name="lectureDate" id="lec-insert-time2" class="sub-body-select" style="width: auto; margin-left: 20px;">
										<option value="">선택</option>
										<c:choose>
											<c:when test="${dto.lectureDate == 'AM 09:00' }">
												<option value="1" selected>AM 09:00</option>
												<option value="2">AM 10:00</option>
												<option value="3">PM 01:00</option>
												<option value="4">PM 02:00</option>
												<option value="5">PM 03:00</option>
												<option value="6">PM 04:00</option>
											</c:when>
											<c:when test="${dto.lectureDate == 'AM 10:00' }">
												<option value="1">AM 09:00</option>
												<option value="2" selected>AM 10:00</option>
												<option value="3">PM 01:00</option>
												<option value="4">PM 02:00</option>
												<option value="5">PM 03:00</option>
												<option value="6">PM 04:00</option>
											</c:when>
											<c:when test="${dto.lectureDate == 'PM 01:00' }">
												<option value="1">AM 09:00</option>
												<option value="2">AM 10:00</option>
												<option value="3" selected>PM 01:00</option>
												<option value="4">PM 02:00</option>
												<option value="5">PM 03:00</option>
												<option value="6">PM 04:00</option>
											</c:when>
											<c:when test="${dto.lectureDate == 'PM 02:00' }">
												<option value="1">AM 09:00</option>
												<option value="2">AM 10:00</option>
												<option value="3">PM 01:00</option>
												<option value="4" selected>PM 02:00</option>
												<option value="5">PM 03:00</option>
												<option value="6">PM 04:00</option>
											</c:when>
											<c:when test="${dto.lectureDate == 'PM 03:00' }">
												<option value="1">AM 09:00</option>
												<option value="2">AM 10:00</option>
												<option value="3">PM 01:00</option>
												<option value="4">PM 02:00</option>
												<option value="5" selected>PM 03:00</option>
												<option value="6">PM 04:00</option>
											</c:when>
											<c:when test="${dto.lectureDate == 'PM 04:00' }">
												<option value="1">AM 09:00</option>
												<option value="2">AM 10:00</option>
												<option value="3">PM 01:00</option>
												<option value="4">PM 02:00</option>
												<option value="5">PM 03:00</option>
												<option value="6" selected>PM 04:00</option>
											</c:when>
										</c:choose>
									</select>
								</div>
							</div>
							<div class="admin-sub-body-line">
								<div class="admin-sub-body-box">
									<span class="admin-sub-body-box-text">개강일</span>
									<%
										if(dto.getStartdate().getDate() < date.getDate())		 {
									%>
										<span><%=sdf2.format(dto.getStartdate()) %></span>
										<input type="hidden" name="startDate" id="lec-insert-startDate" value="<%=sdf1.format(dto.getStartdate()) %>"/>
										<input type="hidden" id="lec-insert-startDate-check" value="1"/>
									<% 
										} else {
									%>
										<input type="date" name="startDate" id="lec-insert-startDate" value="<%=sdf1.format(dto.getStartdate())%>"/>
										<input type="hidden" id="lec-insert-startDate-check" value="2"/>
									<%
										}
									%>
								</div>
								<div class="admin-sub-body-box">
									<span class="admin-lec-body-box-text">종강일</span>
									<input type="date" name="endDate" id="lec-insert-endDate" value="<%=sdf1.format(dto.getEndDate())%>"/>
								</div>
							</div>
							<div>
								<div style="float: right;">
									<button type="button" class="sub-insert-btn" onclick="lectureUpdate();">변경</button>
									<button type="button" class="sub-insert-btn" onclick="location.href='lecturelist'">돌아가기</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<script src="${contextPath }/resources/jquery-3.6.0.min.js"></script>
<script src="${contextPath }/resources/admin/js/adminScript.js?var=5"></script>
</body>
</html>