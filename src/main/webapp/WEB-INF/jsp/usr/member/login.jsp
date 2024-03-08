<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="LOGIN"></c:set>
<%@ include file="../common/head.jspf"%>

<div>
	<img class="background_img"
		src="https://a-static.besthdwallpaper.com/night-sky-moon-scenery-wallpaper-1920x1080-99588_48.jpg" alt="" />
	<!-- 로그인 메인 페이지 틀 -->
	<div class="login-main-frame">
		<!-- 메인 로고 이미지 -->
		<img class="main-logo-img" src="https://cdn-icons-png.flaticon.com/512/768/768442.png" />
		<!-- 밑줄 위치 -->
		<svg class="main-logo-writing-underline1">
        <!-- dream diary에 쓰는 밑줄 좌표 -->
        <path d="M2.00146 2L370.002 2.96793" stroke="white" stroke-width="3" stroke-linecap="round"></path>
      </svg>
		<p class="main-logo-writing1">Dream diary</p>
		<!-- 밑줄 위치 -->
		<svg class="main-logo-writing-underline2">
        <path d="M2.0022 2L600.002 4" stroke="white" stroke-width="3" stroke-linecap="round"></path>
      </svg>
		<p class="main-logo-writing2">꿈을 기록하고 공유하세요!</p>
		<!-- 로그인창 틀 위치 -->
		<div class="login-border-frame-location"></div>
		<!-- 로그인창 틀 -->
		<div class="login-border-frame"></div>
		<!-- 로그인 창 배경 -->
		<div class="login-background">
	
			<div class="login_form_frame">
				<form class="login_form" autocomplete="off" action="../member/doLogin" method="post">
					<input type="hidden" name="afterLoginUri" value="${param.afterLoginUri }" />
					<input type="text" id="id" placeholder="아이디" name="loginId" />
					<input type="password" id="pw" placeholder="비밀번호" name="loginPw" />
					<button class="login_btn" type="submit">로그인</button>
					<p class="message">
						<a href="#">비밀번호 찾기</a>
					</p>
					<p class="message">
						<a href="#">회원가입</a>
					</p>
					<div class="easy_login">
						<a href="">
							<div class="easy_login_item">애플 아이디로 로그인</div>
						</a>
						<a href="">
							<div class="easy_login_item">구글 아이디로 로그인</div>
						</a>
						<a href="">
							<div class="easy_login_item">네이버 아이디로 로그인</div>
						</a>
						<a href="">
							<div class="easy_login_item">페이스북 아이디로 로그인</div>
						</a>
					</div>
				</form>
				<form class="register-form" action="../member/doJoin" method="post">
					<input type="hidden" name="afterLoginUri" value="${param.afterLoginUri }" />
					<input type="text" placeholder="이름" name="name" />
					<input type="text" placeholder="아이디" name="loginId" />
					<button class="check_btn" onclick="checkDuplicate()">아이디 중복 확인</button>
					<input type="text" placeholder="이메일" name="email" />
					<input type="password" placeholder="비밀번호" name="loginPw" />
					<input type="password" placeholder="비밀번호 확인" name="loginPwCheck" />
					<input type="text" placeholder="전화번호" name="cellphoneNum" />
					<button class="join_btn">회원가입</button>
					<p class="message">
						<a href="#">로그인</a>
					</p>
				</form>
			</div>
		
		</div>
	</div>
</div>
<script>
	$('.message a').click(function() {
		$('form').animate({
			height : "toggle",
			opacity : "toggle"
		}, "slow");
	});
</script>


<%@ include file="../common/foot.jspf"%>