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
<link rel="stylesheet" href="${contextPath }/resources/summernote/summernote-lite.css"/>
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
					<li><a href="lecturelist">강의관리</a></li>
					<li><a href="#">시험관리</a></li>
					<li><a href="#" id="menu-check">공지사항</a></li>
				</ul>
			</div>
			<div class="admin-body">
				<div class="admin-body-title">
					<ul>
						<li class="admin-body-title-check">공지리스트</li>
						<li class="admin-body-title-non-check"><a href="noticelist" class="admin-body-title-non-ckeck-a">공지작성</a></li>
					</ul>
				</div>
				<div class="admin-body-main-box">
					<div class="admin-body-main-title">
						<span class="admin-body-main-head">공지수정</span>
					</div>
					<div class="admin-sub-body">
						<form action="noticeupdate-1" method="post" id="subject-insert-form">
						<input type="hidden" name="num" value="${dto.num }"/>
						<div>
							<input type="text" name="title" id="notice-title" value="${dto.title }"/>
						</div>
						<div class="content-box">
							<textarea name="content" id="summernote" class="summernote">${dto.content }</textarea>
						</div>
						<div>
							<div style="float: right;">
								<button type="button" class="sub-insert-btn" onclick="location.href='noticeinfo?num=${dto.num}'">돌아가기</button>
								<button type="button" class="sub-insert-btn" onclick="noticeinsert();">수정</button>
							</div>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<script src="${contextPath }/resources/jquery-3.6.0.min.js"></script>
<script src="${contextPath }/resources/bootstrap.js"></script>
<script src="${contextPath }/resources/admin/js/adminScript.js?var=3"></script>
<script src="${contextPath }/resources/summernote/summernote-lite.js"></script>
<script src="${contextPath }/resources/summernote/lang/summernote-ko-KR.js"></script>
<script>
$(document).ready(function() {

	var toolbar = [
		    // 글꼴 설정
		    ['fontname', ['fontname']],
		    // 글자 크기 설정
		    ['fontsize', ['fontsize']],
		    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		    // 글자색
		    ['color', ['forecolor','color']],
		    // 표만들기
		    ['table', ['table']],
		    // 글머리 기호, 번호매기기, 문단정렬
		    ['para', ['ul', 'ol', 'paragraph']],
		    // 줄간격
		    ['height', ['height']],
		    // 그림첨부, 링크만들기, 동영상첨부
		    ['insert',['picture','link','video']],
		    // 코드보기, 확대해서보기, 도움말
		    ['view', ['codeview']]
		  ];

	var setting = {
            height : 300,
            minHeight : null,
            maxHeight : null,
            focus : true,
            lang : 'ko-KR',
            toolbar : toolbar
         };

        $('#summernote').summernote(setting);
        });
</script>
</body>
</html>