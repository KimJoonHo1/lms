<%@page import="java.text.SimpleDateFormat"%>
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
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
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
						<span class="admin-body-main-head">강의상세</span>
					</div>
					<div class="admin-sub-body">
						<ul class="admin-sub-info-line">
							<input type="hidden" id="delete-num" value="${dto.num }"/>
							<li class="admin-sub-info-line-text">강의번호 ${dto.num }</li>
							<li class="admin-sub-info-line-border">|</li>
							<li class="admin-sub-info-line-text">${dto.subjectname }</li>
							<li class="admin-sub-info-line-border">|</li>
							<li class="admin-sub-info-line-text">${dto.departmentStr }</li>
						</ul>
						<ul class="admin-sub-info-line">
							<li class="admin-sub-info-line-text">개강일 <%=sdf.format(dto.getStartdate()) %></li>
							<li class="admin-sub-info-line-border">|</li>
							<li class="admin-sub-info-line-text">종강일 <%=sdf.format(dto.getEndDate()) %></li>
							<li class="admin-sub-info-line-border">|</li>
							<li class="admin-sub-info-line-text">매주 <%=dto.getLectureweek() %> <%=dto.getLectureDate() %></li>
							<li class="admin-sub-info-line-border">|</li>
							<li class="admin-sub-info-line-text">수강인원 <%=dto.getLectureperso() %>/<%=dto.getLecturemaxperso() %></li>
						</ul>
						<div class="admin-sub-info-btn-box">
							<button type="button" class="admin-sub-info-btn" onclick="location.href='lecturelist'">돌아가기</button>
							<button type="button" class="admin-sub-info-btn" style="width: 60px;" onclick="location.href='lectureupdate?num=${dto.num}'">수정</button>
							<% if(dto.getLectureperso() == 0) {
							%>
							<form action="lecturedelete" method="post" id="lecture-delete">
								<input type="hidden" name="num" value="<%=dto.getNum() %>"/>
								<button type="button" class="admin-sub-info-btn" style="width: 60px;" onclick="lectureDelete();">폐강</button>		
							</form>
							<%
							}
							%>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script src="${contextPath }/resources/jquery-3.6.0.min.js"></script>
<script src="${contextPath }/resources/admin/js/adminScript.js?var=3"></script>
</body>
</html>