<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/head.jspf"%>
<div>
	<img class="background_img"
		src="https://a-static.besthdwallpaper.com/night-sky-moon-scenery-wallpaper-1920x1080-99588_48.jpg" alt="" />
	<!-- 로그인 메인 페이지 틀 -->
	<div class="login-main-frame">
		<!-- 로그인창 틀 위치 -->
		<div class="login-border-frame-location">
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
		</div>
		<!-- 로그인창 틀 -->
		<div class="login-border-frame"></div>
		<div
			style="flex-grow: 0; flex-shrink: 0; width: 500px; height: 650px; position: absolute; left: 1128px; top: 25px; opacity: 0.8; overflow: hidden; border-radius: 20px;">
			<div
				style="width: 1014.8px; height: 2347.83px; position: absolute; left: -258.4px; top: -1279.26px; background: #d9d9d9;"></div>
			<div
				style="width: 500px; height: 650px; position: absolute; left: -1px; top: -1px; background: rgba(72, 32, 97, 0.2);"></div>
		</div>
		<div
			style="display: flex; flex-direction: column; justify-content: flex-start; align-items: center; flex-grow: 0; flex-shrink: 0; height: 238px; width: 278.81px; position: absolute; left: 1235.81px; top: 130px; gap: 12px;">
			<div style="flex-grow: 0; flex-shrink: 0; width: 300px; height: 59px;">
				<div
					style="width: 300px; height: 59px; position: absolute; left: -11.34px; top: -0.75px; border-radius: 5px; background: #d9d9d9; border-width: 1.5px; border-color: #33134d;"></div>
				<p
					style="width: 189.11px; height: 22.01px; position: absolute; left: 13.54px; top: 18px; opacity: 0.3; font-size: 20px; text-align: left; color: #33134d;">
					아이디</p>
			</div>
			<div style="flex-grow: 0; flex-shrink: 0; width: 300px; height: 59px;">
				<div
					style="width: 300px; height: 59px; position: absolute; left: -11.34px; top: 70.25px; border-radius: 5px; background: #d9d9d9; border-width: 1.5px; border-color: #33134d;"></div>
				<p
					style="width: 189.11px; height: 22.01px; position: absolute; left: 13.54px; top: 89px; opacity: 0.3; font-size: 20px; text-align: left; color: #33134d;">
					비밀번호</p>
			</div>
			<p style="flex-grow: 0; flex-shrink: 0; font-size: 20px; text-align: left; color: rgba(0, 3, 85, 0.85);">로그인</p>
			<p style="flex-grow: 0; flex-shrink: 0; font-size: 20px; text-align: left; color: rgba(0, 3, 85, 0.85);">
				아이디/비밀번호 찾기</p>
			<p style="flex-grow: 0; flex-shrink: 0; font-size: 20px; text-align: left; color: rgba(0, 3, 85, 0.85);">회원가입</p>
		</div>
		<div
			style="display: flex; flex-direction: column; justify-content: flex-start; align-items: flex-start; flex-grow: 0; flex-shrink: 0; height: 224px; width: 306.69px; position: absolute; left: 1224.65px; top: 402px; gap: 8px;">
			<div style="flex-grow: 0; flex-shrink: 0; width: 330px; height: 50px;">
				<div
					style="width: 330px; height: 50px; position: absolute; left: -0.25px; top: -0.25px; border-radius: 30px; background: rgba(111, 54, 131, 0.85); border-width: 0.5px; border-color: #33134d;"></div>
				<p style="position: absolute; left: 74px; top: 14px; font-size: 20px; text-align: left; color: #000;">애플 아이디로
					로그인</p>
				<img src="apple-logo.png"
					style="width: 40px; height: 40px; position: absolute; left: 11.5px; top: 5.5px; object-fit: contain;" />
			</div>
			<div style="flex-grow: 0; flex-shrink: 0; width: 330px; height: 50px;">
				<div
					style="width: 330px; height: 50px; position: absolute; left: -0.25px; top: 57.75px; border-radius: 30px; background: rgba(111, 54, 131, 0.85); border-width: 0.5px; border-color: #33134d;"></div>
				<p style="position: absolute; left: 74px; top: 71px; font-size: 20px; text-align: left; color: #000;">구글 아이디로
					로그인</p>
				<img src="google-logo.png"
					style="width: 40px; height: 40px; position: absolute; left: 11.5px; top: 62.5px; object-fit: contain;" />
			</div>
			<div style="flex-grow: 0; flex-shrink: 0; width: 330px; height: 50px;">
				<div
					style="width: 330px; height: 50px; position: absolute; left: -0.25px; top: 115.75px; border-radius: 30px; background: rgba(111, 54, 131, 0.85); border-width: 0.5px; border-color: #33134d;"></div>
				<p style="position: absolute; left: 74px; top: 130px; font-size: 20px; text-align: left; color: #000;">네이버 아이디로
					로그인</p>
				<img src="네이버-로고.png"
					style="width: 35px; height: 35px; position: absolute; left: 12.5px; top: 123.5px; object-fit: contain;" />
			</div>
			<div style="flex-grow: 0; flex-shrink: 0; width: 330px; height: 50px;">
				<div
					style="width: 330px; height: 50px; position: absolute; left: -0.25px; top: 173.75px; border-radius: 30px; background: rgba(111, 54, 131, 0.85); border-width: 0.5px; border-color: #33134d;"></div>
				<p style="position: absolute; left: 74px; top: 187px; font-size: 20px; text-align: left; color: #000;">페이스북 아이디로
					로그인</p>
				<img src="facebook.png"
					style="width: 40px; height: 40px; position: absolute; left: 11.5px; top: 178.5px; object-fit: contain;" />
			</div>
		</div>
	</div>
</div>

<%@ include file="../common/foot.jspf"%>