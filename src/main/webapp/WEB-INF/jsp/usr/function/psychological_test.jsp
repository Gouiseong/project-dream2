<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="psychological_test"></c:set>
<%@ include file="../common/head.jspf"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Psychological_test</title>
</head>
<body>
	<section class="psychological-test-container">
		<div class="psychological-test-title">
			<h1>꿈 심리테스트</h1>
		</div>
		<div class="question">
			<div class="options">
				<p>1. 꿈에서 자주 나오는 장소는?</p>
				<label>
					<input type="radio" name="q1" value="a">
					집
				</label>
				<label>
					<input type="radio" name="q1" value="b">
					학교/직장
				</label>
				<label>
					<input type="radio" name="q1" value="c">
					자연 속(숲, 해변 등)
				</label>
				<label>
					<input type="radio" name="q1" value="d">
					낯선 곳
				</label>
			</div>
		</div>
		<c:if test=""></c:if>
		<div class="question">
			<div class="options">
				<p>2. 꿈에서 당신의 역할은?</p>
				<label>
					<input type="radio" name="q2" value="a">
					주인공
				</label>
				<label>
					<input type="radio" name="q2" value="b">
					스승/리더
				</label>
				<label>
					<input type="radio" name="q2" value="c">
					탐험가/모험가
				</label>
				<label>
					<input type="radio" name="q2" value="d">
					관찰자/배경
				</label>
			</div>
		</div>
		<div class="question">
			<div class="options">
				<p>3. 꿈에서 흔히 본 사물은?</p>
				<label>
					<input type="radio" name="q3" value="a">
					물
				</label>
				<label>
					<input type="radio" name="q3" value="b">
					동물
				</label>
				<label>
					<input type="radio" name="q3" value="c">
					높은 곳(산,빌딩 등)
				</label>
				<label>
					<input type="radio" name="q3" value="d">
					사람
				</label>
			</div>
		</div>
		<div class="question">
			<div class="options">
				<p>4. 꿈에서의 감정은?</p>
				<label>
					<input type="radio" name="q4" value="a">
					행복하고 안정적
				</label>
				<label>
					<input type="radio" name="q4" value="b">
					긴장되고 불안함
				</label>
				<label>
					<input type="radio" name="q4" value="c">
					호기심과 흥분
				</label>
				<label>
					<input type="radio" name="q4" value="d">
					혼란과 고립감
				</label>
			</div>
		</div>
		<div class="question">
			<div class="options">
				<p>5. 꿈에서 자주 본 색깔은?</p>
				<label>
					<input type="radio" name="q5" value="a">
					푸른색
				</label>
				<label>
					<input type="radio" name="q5" value="b">
					붉은색
				</label>
				<label>
					<input type="radio" name="q5" value="c">
					녹색
				</label>
				<label>
					<input type="radio" name="q5" value="d">
					검은색
				</label>
			</div>
		</div>
		<div class="question">
			<div class="options">
				<p>6. 꿈에서 자주 만나는 인물은 누구인가요?</p>
				<label>
					<input type="radio" name="q1" value="a">
					가족 구성원
				</label>
				<label>
					<input type="radio" name="q1" value="b">
					친구
				</label>
				<label>
					<input type="radio" name="q1" value="c">
					유명인사/역사적 인물
				</label>
				<label>
					<input type="radio" name="q1" value="d">
					낯선 사람
				</label>
			</div>
		</div>
		<div class="question">
			<div class="options">
				<p>7. 꿈에서 가장 흔히 하는 활동은 무엇인가요?</p>
				<label>
					<input type="radio" name="q1" value="a">
					운동/스포츠
				</label>
				<label>
					<input type="radio" name="q1" value="b">
					공부/학습
				</label>
				<label>
					<input type="radio" name="q1" value="c">
					여행/모험
				</label>
				<label>
					<input type="radio" name="q1" value="d">
					대화/소통
				</label>
			</div>
		</div>
		<div class="question">
			<div class="options">
				<p>8. 꿈에서 자주 경험하는 감각은 무엇인가요?</p>
				<label>
					<input type="radio" name="q1" value="a">
					시각적인 것들 (풍경, 사물 등)
				</label>
				<label>
					<input type="radio" name="q1" value="b">
					청각적인 것들 (소리, 음악 등)
				</label>
				<label>
					<input type="radio" name="q1" value="c">
					촉각적인 것들 (만지는 것, 온도 등)
				</label>
				<label>
					<input type="radio" name="q1" value="d">
					미각적인 것들 (음식, 맛 등)
				</label>
			</div>
		</div>
		<div class="question">
			<div class="options">
				<p>9. 꿈에서의 날씨는 어떤 편인가요?</p>
				<label>
					<input type="radio" name="q1" value="a">
					맑음/햇살 가득한 날씨
				</label>
				<label>
					<input type="radio" name="q1" value="b">
					흐림/비 오는 날씨
				</label>
				<label>
					<input type="radio" name="q1" value="c">
					폭풍우/천둥 번개가 치는 날씨
				</label>
				<label>
					<input type="radio" name="q1" value="d">
					안개/흐린 날씨
				</label>
			</div>
		</div>
		<div class="question">
			<div class="options">
				<p>10. 꿈에서 자주 나오는 숫자는 무엇인가요?</p>
				<label>
					<input type="input" name="q1" value="a" placeholder="숫자 입력">

				</label>
				<label>
					<input type="radio" name="q1" value="b">
					없음
				</label>

			</div>
		</div>
		<button id="nextButton">다음 문제로</button>
	</section>
	<script>
		// 문제 인덱스를 나타내는 변수
		var currentQuestionIndex = 0;

		// 문제 요소들을 모두 가져와서 배열로 저장
		var questions = document.querySelectorAll('.question');

		// 다음 문제로 넘어가는 함수
		function showNextQuestion() {
			// 현재 보여지고 있는 문제를 숨김
			questions[currentQuestionIndex].style.display = 'none';

			// 다음 문제 인덱스로 이동
			currentQuestionIndex++;

			// 만약 마지막 문제면 다음 버튼 숨김
			if (currentQuestionIndex === questions.length - 1) {
				document.getElementById('nextButton').style.display = 'none';
			}

			// 다음 문제를 보여줌
			questions[currentQuestionIndex].style.display = 'block';
		}

		// 초기에 첫 번째 문제만 보여주기 위해 호출
		questions[currentQuestionIndex].style.display = 'block';

		// 다음 버튼에 클릭 이벤트 리스너 추가
		document.getElementById('nextButton').addEventListener('click',
				showNextQuestion);
	</script>

	<%@ include file="../common/foot.jspf"%>