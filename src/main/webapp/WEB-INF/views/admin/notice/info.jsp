<%@page import="com.care.lms.dto.NoticeDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
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
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	NoticeDTO dto = (NoticeDTO) request.getAttribute("dto");
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
					<li><a href="lecturelist">강의관리</a></li>
					<li><a href="#">시험관리</a></li>
					<li><a href="#" id="menu-check">공지사항</a></li>
				</ul>
			</div>
			<div class="admin-body">
				<div class="admin-body-title">
					<ul>
						<li class="admin-body-title-check">공지리스트</li>
						<li class="admin-body-title-non-check"><a href="noticeinsert" class="admin-body-title-non-ckeck-a">공지작성</a></li>
					</ul>
				</div>
				<div class="admin-body-main-box">
					<div class="admin-body-main-title">
						<span class="admin-body-main-head">공지사항</span>
					</div>
					<div class="admin-sub-body">
						<ul class="admin-sub-info-line">
							<input type="hidden" id="delete-num" value="${dto.num }"/>
							<li class="admin-sub-info-line-text">${dto.num }</li>
							<li class="admin-sub-info-line-border">|</li>
							<li class="admin-sub-info-line-text">${dto.title }</li>
						</ul>
						<ul class="admin-sub-info-line">
							<li class="admin-sub-info-line-text">관리자</li>
							<li class="admin-sub-info-line-border">|</li>
							<li class="admin-sub-info-line-text"><%=sdf.format(dto.getTime()) %></li>
							<li class="admin-sub-info-line-border">|</li>
							<li class="admin-sub-info-line-text">${dto.hit }</li>
						</ul>
						<div class="admin-sub-info-content">
							<div class="admin-notice-info-content-body">
								${dto.content }
							</div>
						</div>
						<div class="admin-sub-info-btn-box">
							<button type="button" class="admin-sub-info-btn" onclick="location.href='noticelist'">돌아가기</button>
							<button type="button" class="admin-sub-info-btn" style="width: 60px;" onclick="location.href='noticeupdate?num=${dto.num}'">수정</button>
							<button type="button" class="admin-sub-info-btn" style="width: 60px;" onclick="noticeDelete();">삭제</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script src="${contextPath }/resources/jquery-3.6.0.min.js"></script>
<script src="${contextPath }/resources/admin/js/adminScript.js?var=2"></script>
</body>
</html>