<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<link rel="stylesheet"
	href="${contextPath }/resources/member/css/memberStyle.css?ver=7">
<head>
<meta charset="UTF-8">
<title>membership</title>
</head>
<body>
	<div class="join-wrap">
		<div class="join-box" id="join-box">
			<div class="join-header">약관동의</div>
			
			<div class="join-body mt-25">
				<div class="join-body-title">
					<span class="fs-18">LMS 서비스 이용에 관한 약관 동의</span><input type="checkbox"
						id="option1" class="join-body-check"/>
				</div>
				<div class="option-box">
					<jsp:include page="option1.jsp" />
				</div>
			</div>

			<div class="join-body mt-25">
				<div class="join-body-title">
					<span class="fs-18">개인정보 활용에 관한 약관 동의</span><input type="checkbox" id="option2" class="join-body-check"/>
				</div>
				<div class="option-box">
					<jsp:include page="option2.jsp" />
				</div>
			</div>
			
			<div class="join-footer">
				<button type="button" onclick="location.href='login'">이전</button>
				<button type="button" onclick="next();">다음</button>
			</div>
		</div>
		
		<div class="join-box" id="join-member" style="display: none">
			<form action="membership" method="post" id="form">
				<div class="join-header">회원가입</div>
				
				<div class="member-body">
					<div>
						<div class="member-input-box">
							<div class="member-input-flex">
								<div class="member-input-comment">아이디</div>
								<div class="member-input"><input type="text" name="id" id="id" onchange="memberIdChange();"/></div>
								<input type="hidden" value="" id="idcheck"/>
								<input type="hidden" value="" id="idCk"/>
							</div>
							<div class="member-input-check">
								<button type="button" onclick="idCheck();">아이디 중복 확인</button>
							</div>
						</div>
						<div class="member-comment" id="id-comment">아이디를 입력해주세요.</div>
						<div class="member-input-box">
							<div class="member-input-comment">비밀번호</div>
							<div class="member-input"><input type="password" name="pwd" id="pwd"/></div>
						</div>
						<div class="member-comment" id="pwd-comment">비밀번호를 입력해주세요.</div>
						<div class="member-input-box">
							<div class="member-input-comment">비밀번호 확인</div>
							<div class="member-input"><input type="password" id="repwd"/></div>
						</div>
						<div class="member-comment" id="repwd-comment">비밀번호를 입력해주세요.</div>
						<div class="member-input-box">
							<div class="member-input-comment">이름</div>
							<div class="member-input"><input type="text" name="name" id="name"/></div>
						</div>
						<div class="member-comment" id="name-comment">이름을 입력해주세요.</div>
						<div class="member-input-box">
							<div class="member-input-comment">학과</div>
							<div class="member-input">
								<select name="department" id="department">
									<option value="" selected>선택</option>
									<option value="Engineering">공학과</option>
									<option value="Literature">문헌정보학과</option>
									<option value="Japanese">일어문학과</option>
								</select>
							</div>
						</div>
						<div class="member-comment" id="department-comment">학과를 선택해해주세요.</div>
						<div class="member-input-box">
							<div class="member-input-flex">
								<div class="member-input-comment">이메일</div>
								<div class="member-input"><input type="text" onchange="emailChange();" name="email" id="email"/></div>
								<input type="hidden" id="emailcheck" value=""/>
								<input type="hidden" id="emailCk" value=""/>
							</div>
							<div class="member-input-check">
								<button type="button" onclick="emailCheck();">이메일 중복 확인</button>
							</div>
						</div>
						<div class="member-comment" id="email-comment">이메일을 입력해주세요.</div>
					</div>
				</div>
				<div class="join-footer">
					<button type="button" onclick="memberBack();">이전</button>
					<button type="button" onclick="register();">회원가입</button>
				</div>
			</form>
		</div>
	</div>
<script src="${contextPath }/resources/jquery-3.6.0.min.js"></script>
<script src="${contextPath }/resources/member/js/memberScript.js?ver=10"></script>
</body>
</html>