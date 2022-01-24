<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
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
<link rel="stylesheet" href="${contextPath }/resources/admin/css/adminStyle.css?ver=8"/>
</head>
<body>
<%
	List<LectureDTO> list = (List<LectureDTO>) request.getAttribute("list");
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
					<li><a href="noticelist">공지사항</a></li>
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
						<span class="admin-body-main-head">강의리스트</span>
					</div>

					<div class="admin-body-table">
					<ul class="admin-body-table-header">
							<li style="width: 10%;">강의번호</li>
							<li style="width: 5%;">|</li>
							<li style="width: 30%;">과목</li>
							<li style="width: 5%;">|</li>
							<li style="width: 15%;">학과</li>
							<li style="width: 5%;">|</li>
							<li style="width: 12.5%;">개강일자</li>
							<li style="width: 5%;">|</li>
							<li style="width: 12.5%;">종강일자</li>
						</ul>
					<% for(LectureDTO dto : list) {
					%>
						<ul class="admin-body-table-body admin-body-new-user-table-body" onclick="location.href='lectureinfo?num=<%=dto.getNum()%>'">
							<li style="width: 10%;"><%=dto.getNum() %></li>
							<li style="width: 5%;">|</li>
							<li style="width: 30%;"><%=dto.getSubjectname() %></li>
							<li style="width: 5%;">|</li>
							<li style="width: 15%;"><%=dto.getDepartmentStr() %></li>
							<li style="width: 5%;">|</li>
							<li style="width: 12.5%;"><%=sdf.format(dto.getStartdate()) %></li>
							<li style="width: 5%;">|</li>
							<li style="width: 12.5%;"><%=sdf.format(dto.getEndDate()) %></li>
						</ul>
					<%
					}
					%>
					</div>
				</div>
			</div>
		</div>
	</div>
<script src="${contextPath }/resources/jquery-3.6.0.min.js"></script>
<script src="${contextPath }/resources/admin/js/adminScript.js?var=1"></script>
</body>
</html>