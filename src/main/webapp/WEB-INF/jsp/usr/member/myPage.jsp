<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="My Info"></c:set>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<link href='https://fonts.googleapis.com/css?family=Exo+2:400,100' rel='stylesheet' type='text/css'>
<!-- daisy ui 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/daisyui/4.6.1/full.css" />


<c:set var="loggedInMemberName" value="${rq.loginedMember.name}"></c:set>
<c:set var="loggedInMemberId" value="${rq.loginedMember.loginId}"></c:set>




<header class="header">
	<a href="../home/main">
		<button class="logo">로고</button>
	</a>
	<nav class="header_menu">
		<a href="../member/myInfo">
			<button class="username">${loggedInMemberName}님</button>
		</a>

		<a href="../conference/list">
			<button class="hd_info">학회 정보</button>
		</a>
		<a href="../competition/list">
			<button class="hd_contest">공모전</button>
		</a>
		<a href="../hotel/recommendlist">
			<button class="hd_recommend">숙박&교통</button>
		</a>
		<c:if test="${rq.isLogined() }">
			<a onclick="if(confirm('로그아웃 하시겠어요?') == false) return false;" class="hd_logout" href="../member/doLogout">로그아웃</a>
		</c:if>
	</nav>
</header>

<div class="img"></div>
<div class="menu_box1 left">
	<div class="mypage">마이 페이지</div>
</div>
<div class="right">
	<a href="../member/mySchedule">
		<button class="menu_box2 myschedule">내 일정</button>
	</a>
	<a href="../member/myInfo">
		<button class="menu_box2 myinfo">내 정보</button>
	</a>
	<a href="../member/myQuestion">
		<button class="menu_box2 myquestion">내 문의</button>
	</a>
</div>

<div class="info_box info_name">
	<div class="info1">이름</div>
	<div class="info2">${rq.loginedMember.name }</div>
</div>

<div class="info_box info_id">
	<div class="info1">아이디</div>
	<div class="info2">${rq.loginedMember.loginId }</div>
</div>

<div class="info_box info_pw">
	<div class="info1">비밀번호</div>
	<button class="info2 pw_btn">
		<a href="../member/checkPw">변경하기</a>
	</button>
</div>

<div class="info_box info_pn">
	<div class="info1">핸드폰 번호</div>
	<div class="info2">${rq.loginedMember.cellphoneNum }</div>
</div>

<div class="info_box info_email">
	<div class="info1">이메일</div>
	<div class="info2">${rq.loginedMember.email }</div>
</div>

<div class="info_box info_withdraw">
	<div class="info1">탇퇴</div>

<!-- 탈퇴하기 버튼, 한 번만 선언합니다 -->
<button class="info2 withdraw_btn" onclick="return confirmWithdrawal();">탈퇴하기</button>

</div>
<button class="modify_btn">
	<a href="../member/checkPw">수정하기</a>
</button>

<style>
body {
	width: 100%;
	hight: 130%;
	margin: 0;
	padding: 0;
}

/* 상단바 메뉴 */
.header {
	display: flex;
	position: absolute;
	justify-content: space-between;
	align-items: center;
	width: 100%;
	margin: 17px auto 0;
	padding: 0 20px;
	gap: 20px;
}

.logo {
	text-align: center;
}

.header_menu {
	display: flex;
	gap: 20px;
}

.header_menu button:hover {
	border-bottom: 1px solid;
}

.hd_logout {
	margin-top: 3.5px;
	font-size: 12.5px;
}

.hd_logout:hover {
	border-bottom: 1px solid;
}

.username {
	flex-grow: 1;
}

/* 상단 이미지 */
.img {
	position: absolute;
	width: 100%;
	height: 150px;
	left: 0px;
	top: 57px;
	background:
		url('https://velog.velcdn.com/images/vrslxowe/post/ba2f5fd8-3c2c-4a9a-baa4-2d31c48be056/image.jpg')
		no-repeat;
	background-size: cover;
}

/* 메뉴 박스 */
.menu_box1, .menu_box2 {
	border-radius: 18px;
	background: #00256c;
	color: white;
	text-align: center;
	display: inline-block;
	box-shadow: 4px 4px 4px 0px rgba(0, 0, 0, 0.25);
}

.menu_box1 {
	width: 130px;
	height: 80px;
	font-size: 17px;
	line-height: 82px;
}

.menu_box2 {
	width: 110px;
	height: 70px;
	font-size: 16px;
	margin-right: 100px;
	line-height: 72px;
}

.menu_box2:last-child {
	margin-right: 0;
	/* 마지막 요소의 오른쪽 마진 제거 */
}

.left {
	position: absolute;
	left: 112.5px;
	top: 155px;
}

.right {
	display: flex;
	gap: 100px;
	position: absolute;
	right: 112.5px;
	top: 165px;
}

.modify_btn {
	width: 110px;
	height: 70px;
	font-size: 16px;
	line-height: 72px;
	position: fixed;
	left: 50%;
	transform: translateX(-50%);
	bottom: 4%;
	border-radius: 18px;
	background: #00256c;
	color: white;
	text-align: center;
	box-shadow: 4px 4px 4px 0px rgba(0, 0, 0, 0.25);
}

/* 내 정보 박스 */
.info_box {
	top: 270px;
	left: 25%;
	height: 87px;
	width: 1000px;
	position: relative;
	border-bottom-width: 1px;
	border-color: #878787;
}

.info1 {
	width: 160px;
	height: 87px;
	background: #7E9DD9;
	color: white;
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
	text-align: center;
	border-bottom-width: 1px;
	border-color: #878787;
}

.info2 {
	top: -55px;
	left: 19%;
	width: 200px;
	position: relative;
}

.info_name {
	height: 89px;
	border-top-width: 2px;
	border-top-color: #535353;
}

.pw_btn, .withdraw_btn {
	top: -65px;
	width: 95px;
	height: 38px;
	font-size: 14px;
	border-radius: 10px;
	background: #7E9DD9;
	color: white;
	box-shadow: 4px 3px 3px 0px rgba(0, 0, 0, 0.25);
}
</style>


<script>
	function confirmWithdrawal() {
		if (confirm('정말 탈퇴하시겠습니까?')) {
			window.location.href = '../member/doWithdraw'; // 서버의 탈퇴 처리 URL로 이동
		}
	}
</script>



<%@ include file="../common/foot.jspf"%>