<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="ARTICLE WRITE"></c:set>
<%@ include file="../common/head.jspf"%>


<div class="write-background">
	<div class="write-background-left">
		<div class="write-date-container">
			<div class="write-date-box">
				<p class="write-date" id="currentDate"></p>
				<p class="write-day" id="currentDay"></p>
			</div>
			<div class="sleep-box">
				<div class="sleep-time">
					<h2 class="sleep-text">취침 시간</h2>
					<select id="sleepTime">
						<option value="20:00">20:00</option>
						<option value="21:00">21:00</option>
						<option value="22:00">22:00</option>
						<option value="23:00">23:00</option>
						<option value="24:00">00:00</option>
						<option value="01:00">01:00</option>
						<option value="02:00">02:00</option>
						<option value="03:00">03:00</option>
						<option value="04:00">04:00</option>
					</select>
				</div>
				<div class="wake-up-time">
					<h2 class="sleep-text">기상 시간</h2>
					<select id="wakeUpTime">
						<option value="05:00">05:00</option>
						<option value="06:00">06:00</option>
						<option value="07:00">07:00</option>
						<option value="08:00">08:00</option>
						<option value="09:00">09:00</option>
						<option value="10:00">10:00</option>
						<option value="11:00">11:00</option>
						<option value="12:00">12:00</option>
						<option value="13:00">13:00</option>
					</select>
				</div>
			</div>
		</div>
		<div class="title-body-container">
			<form class="write-form" action="../article/doWrite" method="POST"
				onsubmit="ArticleWrite__submit(this); return false;">
				<div class="title-box">
					<input class="title-input" autocomplete="off" type="text"
						placeholder="제목을 입력해주세요." name="title" />
				</div>
				<div class="body-box">
					<textarea class="body-input" autocomplete="off" type="text"
						placeholder="내용을 입력해주세요" name="body"></textarea>
				</div>
				<button class="btn register" type="submit" value="작성">글 등록</button>
			</form>
		</div>
	</div>
	<div class="write-background-right"></div>

	<button class="btn write-back-btn" class="" type="button"
		onclick="history.back();">뒤로가기</button>

</div>


<script>
	//JavaScript를 사용하여 현재 날짜와 요일을 가져오는 함수
	function getCurrentDay() {
		// 요일 정보를 가져오기
		var days = [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일' ];

		// 현재 날짜를 가져오기 위해 Date 객체를 생성
		var currentDate = new Date();

		// 현재 요일을 가져오기
		var currentDay = days[currentDate.getDay()];

		return currentDay;
	}
	// JavaScript를 사용하여 현재 날짜를 가져오는 함수
	function getCurrentDate() {
		// 현재 날짜를 가져오기 위해 Date 객체를 생성
		var currentDate = new Date();

		// 년, 월, 일 정보를 가져오기
		var year = currentDate.getFullYear();
		var month = currentDate.getMonth() + 1; // getMonth()의 반환 값은 0부터 시작하므로 1을 더함
		var day = currentDate.getDate();

		// 날짜를 YYYY-MM-DD 형식으로 조합
		var formattedDate = year + '년 ' + addLeadingZero(month) + '월 '
				+ addLeadingZero(day) + '일 ';

		return formattedDate;
	}

	// 한 자리 숫자의 경우 앞에 0을 추가해주는 함수
	function addLeadingZero(number) {
		return number < 10 ? number : number;
	}

	// HTML 요소에 현재 요일을 설정하는 함수
	function setCurrentDay() {
		// 현재 요일을 가져와서 currentDay 변수에 저장
		var currentDay = getCurrentDay();

		// currentDay 변수에 저장된 요일을 HTML 요소에 설정
		document.getElementById('currentDay').innerText = currentDay;
	}

	// HTML 요소에 현재 날짜를 설정하는 함수
	function setCurrentDate() {
		// 현재 날짜를 가져와서 currentDate 변수에 저장
		var currentDate = getCurrentDate();

		// currentDate 변수에 저장된 날짜를 HTML 요소에 설정
		document.getElementById('currentDate').innerText = currentDate;
	}

	// 페이지가 로드될 때 setCurrentDay와 setCurrentDate 함수를 실행하여 현재 요일과 날짜를 표시
	window.onload = function() {
		setCurrentDay();
		setCurrentDate();
	};
</script>
<script type="text/javascript">
	let ArticleWrite__submitFormDone = false;
	function ArticleWrite__submit(form) {
		if (ArticleWrite__submitFormDone) {
			return;
		}
		form.title.value = form.title.value.trim();
		if (form.title.value == 0) {
			alert('제목을 입력해주세요');
			return;
		}
		const editor = $(form).find('.toast-ui-editor').data(
				'data-toast-editor');
		const markdown = editor.getMarkdown().trim();
		if (markdown.length == 0) {
			alert('내용 써라');
			editor.focus();
			return;
		}
		form.body.value = markdown;
		ArticleWrite__submitFormDone = true;
		form.submit();
	}
</script>

<%@ include file="../common/foot.jspf"%>