<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.care.lms.dto.LectureDTO"%>
<%@page import="java.util.List"%>
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
<body style="width: 1920px; overflow-x: hidden;">
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
					<li><a href="lecturelist">강의관리</a></li>
					<li><a href="#" id="menu-check">시험관리</a></li>
					<li><a href="noticelist">공지사항</a></li>
				</ul>
			</div>
			<div class="admin-body">
				<div class="admin-body-title">
					<ul>
						<li class="admin-body-title-non-check"><a href="subjectlist" class="admin-body-title-non-ckeck-a">시험리스트</a></li>
						<li class="admin-body-title-check">시험출제</li>
						<li class="admin-body-title-non-check"><a href="subjectlist" class="admin-body-title-non-ckeck-a">시험채점</a></li>
					</ul>
				</div>
				<div class="admin-body-main-box">
					<div class="admin-body-main-title">
						<span class="admin-body-main-head">시험출제</span>
					</div>
					<div class="admin-sub-body">
						<form action="testinsert-1" method="post" id="subject-insert-form">
							<div class="admin-sub-body-line">
								<div class="admin-sub-body-box">
									<span class="admin-sub-body-box-text">강의선택</span>
									<select name="lecture" id="sub-insert-department" class="sub-body-select" style="width: auto;">
										<option value="" selected>선택</option>
										<%
										for(LectureDTO dto : list) {
										%>
										<option value="<%=dto.getNum() %>"><%=dto.getSubjectname() %> (<%=sdf.format(dto.getStartdate()) %>~<%=sdf.format(dto.getEndDate()) %>)</option>
										<%
										}
										%>
									</select>
								</div>
								
							</div>
							<div class="admin-sub-body-line">
								<div class="admin-sub-body-box">
									<span class="admin-sub-body-box-text">시험시작일</span>
									<input type="date" name="startDate" id="startDate" style="font-size: 15px;"/>
								</div>
								<div class="admin-sub-body-box">
									<span class="admin-sub-body-box-text">시험종료일</span>
									<input type="date" name="endDate" id="endDate" style="font-size: 15px;"/>
								</div>
							</div>
							<div style="padding: 15px 0;">
								<div style="width: 100%;">
									<span style="font-size: 22px; font-weight: bold;" class="admin-test-insert-head">시험문제</span>
								</div>
							</div>
							<div class="admin-sub-body-line" id="test-container1">
								<div style="width: 100%;">
									<div class="admin-test-num">1
									<span style="font-size: 18px; margin-left: 80px;">점수</span>
									<input type="number" class="test-score" id="test-score1" name="testScore1"/>
									</div>
									<div class="admin-test-img-box">
										<input type="file" id="img_file1" name="img_file1" style="display: none;" onchange="readURL(this);"/>
										<input type="hidden" name="fimeName1" id="fimeName1" value="0"/>
										<img src="/lmsimg/trip.png" id="test-image1" class="admin-test-img" onclick="document.all.img_file1.click()"/>
										<button type="button" id="img-delete-btn1" class="admin-test-image-delete-btn" style="display: none;" onclick="testImageDelete(this);">이미지 삭제</button>
									</div>
									<textarea name="comment1" id="sub-insert-comment1" class="admin-sub-insert-content"></textarea>
									<div class="test-insert-btn-box">
										<button type="button" id="test-insert-btn1" onclick="testInsert(this)">추가</button>
										<button type="button" id="test-delete-btn1" style="display: none;" onclick="testDelete(this);">삭제</button>
									</div>
								</div>
							</div>
							<div class="admin-sub-body-line" id="test-container2" style="display: none;">
								<div style="width: 100%;">
									<div class="admin-test-num">2
									<span style="font-size: 18px; margin-left: 80px;">점수</span>
									<input type="number" class="test-score" id="test-score2" name="testScore2"/>
									</div>
									<div class="admin-test-img-box">
										<input type="file" id="img_file2" name="img_file2" style="display: none;" onchange="readURL(this);"/>
										<input type="hidden" name="fimeName2" id="fimeName2" value="0"/>
										<img src="/lmsimg/trip.png" id="test-image2" class="admin-test-img" onclick="document.all.img_file2.click()"/>
										<button type="button" id="img-delete-btn2" class="admin-test-image-delete-btn" style="display: none;" onclick="testImageDelete(this);">이미지 삭제</button>
									</div>
									<textarea name="comment2" id="sub-insert-comment2" class="admin-sub-insert-content"></textarea>
									<div class="test-insert-btn-box">
										<button type="button" id="test-insert-btn2" onclick="testInsert(this)">추가</button>
										<button type="button" id="test-delete-btn2" style="display: none;" onclick="testDelete(this);">삭제</button>
									</div>
								</div>
							</div>
							<div class="admin-sub-body-line" id="test-container3" style="display: none;">
								<div style="width: 100%;">
									<div class="admin-test-num">3
									<span style="font-size: 18px; margin-left: 80px;">점수</span>
									<input type="number" class="test-score" id="test-score3" name="testScore3"/>
									</div>
									<div class="admin-test-img-box">
										<input type="file" id="img_file3" name="img_file3" style="display: none;" onchange="readURL(this);"/>
										<input type="hidden" name="fimeName3" id="fimeName3" value="0"/>
										<img src="/lmsimg/trip.png" id="test-image3" class="admin-test-img" onclick="document.all.img_file3.click()"/>
										<button type="button" id="img-delete-btn3" class="admin-test-image-delete-btn" style="display: none;" onclick="testImageDelete(this);">이미지 삭제</button>
									</div>
									<textarea name="comment3" id="sub-insert-comment3" class="admin-sub-insert-content"></textarea>
									<div class="test-insert-btn-box">
										<button type="button" id="test-insert-btn3" onclick="testInsert(this)">추가</button>
										<button type="button" id="test-delete-btn3" style="display: none;" onclick="testDelete(this);">삭제</button>
									</div>
								</div>
							</div>
							<div class="admin-sub-body-line" id="test-container4" style="display: none;">
								<div style="width: 100%;">
									<div class="admin-test-num">4
									<span style="font-size: 18px; margin-left: 80px;">점수</span>
									<input type="number" class="test-score" id="test-score4" name="testScore4"/>
									</div>
									<div class="admin-test-img-box">
										<input type="file" id="img_file4" name="img_file4" style="display: none;" onchange="readURL(this);"/>
										<input type="hidden" name="fimeName4" id="fimeName4" value="0"/>
										<img src="/lmsimg/trip.png" id="test-image4" class="admin-test-img" onclick="document.all.img_file4.click()"/>
										<button type="button" id="img-delete-btn4" class="admin-test-image-delete-btn" style="display: none;" onclick="testImageDelete(this);">이미지 삭제</button>
									</div>
									<textarea name="comment4" id="sub-insert-comment4" class="admin-sub-insert-content"></textarea>
									<div class="test-insert-btn-box">
										<button type="button" id="test-insert-btn4" onclick="testInsert(this)">추가</button>
										<button type="button" id="test-delete-btn4" style="display: none;" onclick="testDelete(this);">삭제</button>
									</div>
								</div>
							</div>
							<div class="admin-sub-body-line" id="test-container5" style="display: none;">
								<div style="width: 100%;">
									<div class="admin-test-num">5
									<span style="font-size: 18px; margin-left: 80px;">점수</span>
									<input type="number" class="test-score" id="test-score5" name="testScore5"/>
									</div>
									<div class="admin-test-img-box">
										<input type="file" id="img_file5" name="img_file5" style="display: none;" onchange="readURL(this);"/>
										<input type="hidden" name="fimeName5" id="fimeName5" value="0"/>
										<img src="/lmsimg/trip.png" id="test-image5" class="admin-test-img" onclick="document.all.img_file5.click()"/>
										<button type="button" id="img-delete-btn5" class="admin-test-image-delete-btn" style="display: none;" onclick="testImageDelete(this);">이미지 삭제</button>
									</div>
									<textarea name="comment5" id="sub-insert-comment5" class="admin-sub-insert-content"></textarea>
									<div class="test-insert-btn-box">
										<button type="button" id="test-insert-btn5" onclick="testInsert(this)">추가</button>
										<button type="button" id="test-delete-btn5" style="display: none;" onclick="testDelete(this);">삭제</button>
									</div>
								</div>
							</div>
							<div class="admin-sub-body-line" id="test-container6" style="display: none;">
								<div style="width: 100%;">
									<div class="admin-test-num">6
									<span style="font-size: 18px; margin-left: 80px;">점수</span>
									<input type="number" class="test-score" id="test-score6" name="testScore6"/>
									</div>
									<div class="admin-test-img-box">
										<input type="file" id="img_file6" name="img_file6" style="display: none;" onchange="readURL(this);"/>
										<input type="hidden" name="fimeName6" id="fimeName6" value="0"/>
										<img src="/lmsimg/trip.png" id="test-image6" class="admin-test-img" onclick="document.all.img_file6.click()"/>
										<button type="button" id="img-delete-btn6" class="admin-test-image-delete-btn" style="display: none;" onclick="testImageDelete(this);">이미지 삭제</button>
									</div>
									<textarea name="comment6" id="sub-insert-comment6" class="admin-sub-insert-content"></textarea>
									<div class="test-insert-btn-box">
										<button type="button" id="test-insert-btn6" onclick="testInsert(this)">추가</button>
										<button type="button" id="test-delete-btn6" style="display: none;" onclick="testDelete(this);">삭제</button>
									</div>
								</div>
							</div>
							<div class="admin-sub-body-line" id="test-container7" style="display: none;">
								<div style="width: 100%;">
									<div class="admin-test-num">7
									<span style="font-size: 18px; margin-left: 80px;">점수</span>
									<input type="number" class="test-score" id="test-score7" name="testScore7"/>
									</div>
									<div class="admin-test-img-box">
										<input type="file" id="img_file7" name="img_file7" style="display: none;" onchange="readURL(this);"/>
										<input type="hidden" name="fimeName7" id="fimeName7" value="0"/>
										<img src="/lmsimg/trip.png" id="test-image7" class="admin-test-img" onclick="document.all.img_file7.click()"/>
										<button type="button" id="img-delete-btn7" class="admin-test-image-delete-btn" style="display: none;" onclick="testImageDelete(this);">이미지 삭제</button>
									</div>
									<textarea name="comment7" id="sub-insert-comment7" class="admin-sub-insert-content"></textarea>
									<div class="test-insert-btn-box">
										<button type="button" id="test-insert-btn7" onclick="testInsert(this)">추가</button>
										<button type="button" id="test-delete-btn7" style="display: none;" onclick="testDelete(this);">삭제</button>
									</div>
								</div>
							</div>
							<div class="admin-sub-body-line" id="test-container8" style="display: none;">
								<div style="width: 100%;">
									<div class="admin-test-num">8
									<span style="font-size: 18px; margin-left: 80px;">점수</span>
									<input type="number" class="test-score" id="test-score8" name="testScore8"/>
									</div>
									<div class="admin-test-img-box">
										<input type="file" id="img_file8" name="img_file8" style="display: none;" onchange="readURL(this);"/>
										<input type="hidden" name="fimeName8" id="fimeName8" value="0"/>
										<img src="/lmsimg/trip.png" id="test-image8" class="admin-test-img" onclick="document.all.img_file8.click()"/>
										<button type="button" id="img-delete-btn8" class="admin-test-image-delete-btn" style="display: none;" onclick="testImageDelete(this);">이미지 삭제</button>
									</div>
									<textarea name="comment8" id="sub-insert-comment8" class="admin-sub-insert-content"></textarea>
									<div class="test-insert-btn-box">
										<button type="button" id="test-insert-btn8" onclick="testInsert(this)">추가</button>
										<button type="button" id="test-delete-btn8" style="display: none;" onclick="testDelete(this);">삭제</button>
									</div>
								</div>
							</div>
							<div class="admin-sub-body-line" id="test-container9" style="display: none;">
								<div style="width: 100%;">
									<div class="admin-test-num">9
									<span style="font-size: 18px; margin-left: 80px;">점수</span>
									<input type="number" class="test-score" id="test-score9" name="testScore9"/>
									</div>
									<div class="admin-test-img-box">
										<input type="file" id="img_file9" name="img_file9" style="display: none;" onchange="readURL(this);"/>
										<input type="hidden" name="fimeName9" id="fimeName9" value="0"/>
										<img src="/lmsimg/trip.png" id="test-image9" class="admin-test-img" onclick="document.all.img_file9.click()"/>
										<button type="button" id="img-delete-btn9" class="admin-test-image-delete-btn" style="display: none;" onclick="testImageDelete(this);">이미지 삭제</button>
									</div>
									<textarea name="comment9" id="sub-insert-comment9" class="admin-sub-insert-content"></textarea>
									<div class="test-insert-btn-box">
										<button type="button" id="test-insert-btn9" onclick="testInsert(this)">추가</button>
										<button type="button" id="test-delete-btn9" style="display: none;" onclick="testDelete(this);">삭제</button>
									</div>
								</div>
							</div>
							<div class="admin-sub-body-line" id="test-container10" style="display: none;">
								<div style="width: 100%;">
									<div class="admin-test-num">10
									<span style="font-size: 18px; margin-left: 80px;">점수</span>
									<input type="number" class="test-score" id="test-score10" name="testScore10"/>
									</div>
									<div class="admin-test-img-box">
										<input type="file" id="img_file10" name="img_file10" style="display: none;" onchange="readURL(this);"/>
										<input type="hidden" name="fimeName10" id="fimeName10" value="0"/>
										<img src="/lmsimg/trip.png" id="test-image10" class="admin-test-img" onclick="document.all.img_file10.click()"/>
										<button type="button" id="img-delete-btn10" class="admin-test-image-delete-btn" style="display: none;" onclick="testImageDelete(this);">이미지 삭제</button>
									</div>
									<textarea name="comment10" id="sub-insert-comment10" class="admin-sub-insert-content"></textarea>
									<div class="test-insert-btn-box">
										<button type="button" id="test-delete-btn10" style="display: none;" onclick="testDelete(this);">삭제</button>
									</div>
								</div>
							</div>
							<div>
								<div style="float: right;">
									<button type="button" class="sub-insert-btn" onclick="testRegister();">등록</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<script src="${contextPath }/resources/jquery-3.6.0.min.js"></script>
<script src="${contextPath }/resources/admin/js/adminScript.js?var=16"></script>
</body>
</html>