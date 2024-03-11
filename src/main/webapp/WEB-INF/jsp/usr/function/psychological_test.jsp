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
		<div class="question" style="display: block;">
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
					<input type="radio" name="q6" value="a">
					가족 구성원
				</label>
				<label>
					<input type="radio" name="q6" value="b">
					친구
				</label>
				<label>
					<input type="radio" name="q6" value="c">
					유명인사/역사적 인물
				</label>
				<label>
					<input type="radio" name="q6" value="d">
					낯선 사람
				</label>
			</div>
		</div>
		<div class="question">
			<div class="options">
				<p>7. 꿈에서 가장 흔히 하는 활동은 무엇인가요?</p>
				<label>
					<input type="radio" name="q7" value="a">
					운동/스포츠
				</label>
				<label>
					<input type="radio" name="q7" value="b">
					공부/학습
				</label>
				<label>
					<input type="radio" name="q7" value="c">
					여행/모험
				</label>
				<label>
					<input type="radio" name="q7" value="d">
					대화/소통
				</label>
			</div>
		</div>
		<div class="question">
			<div class="options">
				<p>8. 꿈에서 자주 경험하는 감각은 무엇인가요?</p>
				<label>
					<input type="radio" name="q8" value="a">
					시각적인 것들 (풍경, 사물 등)
				</label>
				<label>
					<input type="radio" name="q8" value="b">
					청각적인 것들 (소리, 음악 등)
				</label>
				<label>
					<input type="radio" name="q8" value="c">
					촉각적인 것들 (만지는 것, 온도 등)
				</label>
				<label>
					<input type="radio" name="q8" value="d">
					미각적인 것들 (음식, 맛 등)
				</label>
			</div>
		</div>
		<div class="question">
			<div class="options">
				<p>9. 꿈에서의 날씨는 어떤 편인가요?</p>
				<label>
					<input type="radio" name="q9" value="a">
					맑음/햇살 가득한 날씨
				</label>
				<label>
					<input type="radio" name="q9" value="b">
					흐림/비 오는 날씨
				</label>
				<label>
					<input type="radio" name="q9" value="c">
					폭풍우/천둥 번개가 치는 날씨
				</label>
				<label>
					<input type="radio" name="q9" value="d">
					안개/흐린 날씨
				</label>
			</div>
		</div>
		<div class="question">
			<div class="options">
				<p>10. 꿈에서 자주 나오는 숫자는 무엇인가요?</p>
				<label>
					<input type="input" name="q10" value="a" placeholder="숫자 입력">

				</label>
				<label>
					<input type="radio" name="q10" value="b">
					없음
				</label>
			</div>
		</div>
		<button id="nextButton" style="display: block;">다음 문제로</button>
		<button id="finishButton" style="display: none;">종료</button>

	</section>
	<div id="result" style="display: none;"></div>

	<script>
		// 문제 인덱스를 나타내는 변수
		var currentQuestionIndex = 0;

		// 문제 요소들을 모두 가져와서 배열로 저장
		var questions = document.querySelectorAll('.question');

		// 마지막 문제 종료 버튼
		var finishButton = document.getElementById('finishButton');

		// 결과 출력을 위한 div
		var resultDiv = document.getElementById('result');

		// 사용자의 선택을 저장할 배열
		var userChoices = [];

		// 선택지에 따른 해석 결과
		var interpretation = [
				// 1번 문제의 선택지에 따른 해석 결과
				[ "집에서 자주 나오는 꿈은 안정과 안전을 상징합니다.",
						"학교나 직장에서 자주 나오는 꿈은 업무 또는 학업에 대한 스트레스를 나타낼 수 있습니다.",
						"자연 속에서 나오는 꿈은 평화와 조화를 갈망하는 마음을 나타낼 수 있습니다.",
						"낯선 곳에서 나오는 꿈은 불안과 두려움을 상징할 수 있습니다." ],
				// 2번 문제의 선택지에 따른 해석 결과
				[ "주인공으로서의 역할은 자기 자신에 대한 인식을 나타낼 수 있습니다.",
						"스승 또는 리더로서의 역할은 자신이 주도적이고 지배적인 성향을 나타낼 수 있습니다.",
						"탐험가 또는 모험가로서의 역할은 새로운 경험을 추구하는 욕구를 나타낼 수 있습니다.",
						"관찰자 또는 배경으로서의 역할은 외부 상황에 대한 감정적 관여가 적은 성향을 나타낼 수 있습니다." ],
		// 다른 문제들에 대한 해석 결과 추가
		];

		// 다음 문제로 넘어가는 함수
		function showNextQuestion() {
			// 현재 보여지고 있는 문제의 선택지 확인
			var radios = questions[currentQuestionIndex]
					.querySelectorAll('input[type="radio"]');
			var isChecked = false;
			for (var i = 0; i < radios.length; i++) {
				if (radios[i].checked) {
					isChecked = true;
					userChoices.push(radios[i].value);
					break;
				}
			}
			if (!isChecked) {
				alert("선택지를 선택해주세요.");
				return;
			}

			// 현재 보여지고 있는 문제를 숨김
			questions[currentQuestionIndex].style.display = 'none';

			// 다음 문제 인덱스로 이동
			currentQuestionIndex++;

			// 마지막 문제면 종료 버튼 보이기
			if (currentQuestionIndex === questions.length) {
				finishButton.style.display = 'block';
				document.getElementById('nextButton').style.display = 'none';
			}

			// 다음 문제를 보여줌
			if (currentQuestionIndex < questions.length) {
				questions[currentQuestionIndex].style.display = 'block';
			}
		}

		// 결과 분석 함수
		function analyzeResults() {
			var result = "";
			for (var i = 0; i < userChoices.length; i++) {
				result += "질문 " + (i + 1) + "의 선택: " + userChoices[i] + "<br>";
			}
			// 선택한 번호에 따른 해석 결과 추가
			for (var i = 0; i < userChoices.length; i++) {
				result += "질문 " + (i + 1) + "의 해석: "
						+ interpretation[i][userChoices[i]] + "<br>";
			}
			// 결과를 화면에 출력
			resultDiv.innerHTML = "<h2>분석 결과</h2>" + result;
			resultDiv.style.display = 'block';
		}

		// 다음 버튼에 클릭 이벤트 리스너 추가
		document.getElementById('nextButton').addEventListener('click',
				showNextQuestion);

		// 종료 버튼에 클릭 이벤트 리스너 추가
		document.getElementById('finishButton').addEventListener('click',
				analyzeResults);
	</script>

	<%@ include file="../common/foot.jspf"%>