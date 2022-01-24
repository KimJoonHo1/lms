<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.care.lms.dto.NoticeDTO"%>
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
	List<NoticeDTO> list= (List<NoticeDTO>) request.getAttribute("list");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	int count = Integer.parseInt(request.getAttribute("count").toString());
	int pageNum = Integer.parseInt(request.getAttribute("pageNum").toString()); 
	
	int pageCount = count / 10 + (count%10 == 0 ? 0 : 1);
	
	int startPage = ((pageNum-1)/10)*10+1;
	int endPage = startPage + 10 - 1;
	
	if(endPage > pageCount) {
		endPage = pageCount;
	}
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
						<form action="noticelist" method="post" id="list-form">
							<span class="admin-user-search">
								<span class="admin-user-text">게시글 검색</span>
								<input type="text" class="admin-user-input" name="search" id="list-search" value="${search }"/>
								<button type="button" class="admin-user-btn" onclick="listSearch();">검색</button>
							</span>
						</form>
					</div>

					<div class="admin-body-table">
					<ul class="admin-body-table-header">
						<li style="width: 10%; text-align: center;">글번호</li>
						<li style="width: 5%;">|</li>
						<li style="width: 30%;">글제목</li>
						<li style="width: 5%;">|</li>
						<li style="width: 10%;">작성자</li>
						<li style="width: 5%;">|</li>
						<li style="width: 20%;">작성시간</li>
						<li style="width: 5%;">|</li>
						<li style="width: 10%;">조회수</li>
					</ul>
					<%
						if(list.isEmpty()) {
					%>
						<ul class="admin-body-table-body">
							<li style="width: 100%">작성된 글이 없습니다.</li>
						</ul>
					<%
						}
						for(NoticeDTO dto : list) {
					%>
						<ul class="admin-body-table-body">
							<li style="width: 10%; text-align: center;"><%=dto.getNum() %></li>
							<li style="width: 5%;">|</li>
							<li class="notice-list-title" style="width: 30%;"><a href="noticeinfo?num=<%=dto.getNum()%>"><%=dto.getTitle() %></a></li>
							<li style="width: 5%;">|</li>
							<li style="width: 10%;">관리자</li>
							<li style="width: 5%;">|</li>
							<li style="width: 20%;"><%=sdf.format(dto.getTime()) %></li>
							<li style="width: 5%;">|</li>
							<li style="width: 10%;"><%=dto.getHit() %></li>
						</ul>
					<%
						}
					%>
						<ul class="admin-body-table-body" style="font-weight: bold;">
							<li style="width: 100%; text-align: center;">
							<%
								if(startPage > 10) {
							%>
								<a href="noticelist?currentPage=<%=startPage - 10 %>">[이전]</a>
							<%
								}
								for(int i=startPage; i<=endPage; i++) {
									if(i == pageNum) {
							%>
								<a href="#" style="color: green;">[<%=i %>]</a>
							<%
									} else {
							%>
								<a href="noticelist?currentPage=<%=i %>">[<%=i %>]</a>
							<%
									}
								}
								
								if(endPage < pageCount) {
							%>
								<a href="noticelist?currentPage=<%=startPage + 10 %>">[다음]</a>
							<%
								}
							%>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
<script src="${contextPath }/resources/jquery-3.6.0.min.js"></script>
<script src="${contextPath }/resources/admin/js/adminScript.js?var=2"></script>
</body>
</html>