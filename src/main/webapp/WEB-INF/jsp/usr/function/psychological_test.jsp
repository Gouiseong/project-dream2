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
	<div class="psychological-test-background">
		<section class="psychological-test-container">
			<div class="psychological-test-title">
				<h1>꿈 심리테스트</h1>
			</div>
			<div class="question" style="display: block;">
				<div class="options">
					<p>1. 꿈에서 자주 나오는 장소는?</p>
					<label>
						<input type="radio" name="q1" value="0">
						집
					</label>
					<label>
						<input type="radio" name="q1" value="1">
						학교/직장
					</label>
					<label>
						<input type="radio" name="q1" value="2">
						자연 속(숲, 해변 등)
					</label>
					<label>
						<input type="radio" name="q1" value="3">
						낯선 곳
					</label>
				</div>
			</div>
			<c:if test=""></c:if>
			<div class="question">
				<div class="options">
					<p>2. 꿈에서 당신의 역할은?</p>
					<label>
						<input type="radio" name="q2" value="0">
						주인공
					</label>
					<label>
						<input type="radio" name="q2" value="1">
						스승/리더
					</label>
					<label>
						<input type="radio" name="q2" value="2">
						탐험가/모험가
					</label>
					<label>
						<input type="radio" name="q2" value="3">
						관찰자/배경
					</label>
				</div>
			</div>
			<div class="question">
				<div class="options">
					<p>3. 꿈에서 흔히 본 사물은?</p>
					<label>
						<input type="radio" name="q3" value="0">
						물
					</label>
					<label>
						<input type="radio" name="q3" value="1">
						동물
					</label>
					<label>
						<input type="radio" name="q3" value="2">
						높은 곳(산,빌딩 등)
					</label>
					<label>
						<input type="radio" name="q3" value="3">
						사람
					</label>
				</div>
			</div>
			<div class="question">
				<div class="options">
					<p>4. 꿈에서의 감정은?</p>
					<label>
						<input type="radio" name="q4" value="0">
						행복하고 안정적
					</label>
					<label>
						<input type="radio" name="q4" value="1">
						긴장되고 불안함
					</label>
					<label>
						<input type="radio" name="q4" value="2">
						호기심과 흥분
					</label>
					<label>
						<input type="radio" name="q4" value="3">
						혼란과 고립감
					</label>
				</div>
			</div>
			<div class="question">
				<div class="options">
					<p>5. 꿈에서 자주 본 색깔은?</p>
					<label>
						<input type="radio" name="q5" value="0">
						푸른색
					</label>
					<label>
						<input type="radio" name="q5" value="1">
						붉은색
					</label>
					<label>
						<input type="radio" name="q5" value="2">
						녹색
					</label>
					<label>
						<input type="radio" name="q5" value="3">
						검은색
					</label>
				</div>
			</div>
			<div class="question">
				<div class="options">
					<p>6. 꿈에서 자주 만나는 인물은 누구인가요?</p>
					<label>
						<input type="radio" name="q6" value="0">
						가족 구성원
					</label>
					<label>
						<input type="radio" name="q6" value="1">
						친구
					</label>
					<label>
						<input type="radio" name="q6" value="2">
						유명인사/역사적 인물
					</label>
					<label>
						<input type="radio" name="q6" value="3">
						낯선 사람
					</label>
				</div>
			</div>
			<div class="question">
				<div class="options">
					<p>7. 꿈에서 가장 흔히 하는 활동은 무엇인가요?</p>
					<label>
						<input type="radio" name="q7" value="0">
						운동/스포츠
					</label>
					<label>
						<input type="radio" name="q7" value="1">
						공부/학습
					</label>
					<label>
						<input type="radio" name="q7" value="2">
						여행/모험
					</label>
					<label>
						<input type="radio" name="q7" value="3">
						대화/소통
					</label>
				</div>
			</div>
			<div class="question">
				<div class="options">
					<p>8. 꿈에서 자주 경험하는 감각은 무엇인가요?</p>
					<label>
						<input type="radio" name="q8" value="0">
						시각적인 것들 (풍경, 사물 등)
					</label>
					<label>
						<input type="radio" name="q8" value="1">
						청각적인 것들 (소리, 음악 등)
					</label>
					<label>
						<input type="radio" name="q8" value="2">
						촉각적인 것들 (만지는 것, 온도 등)
					</label>
					<label>
						<input type="radio" name="q8" value="3">
						미각적인 것들 (음식, 맛 등)
					</label>
				</div>
			</div>
			<div class="question">
				<div class="options">
					<p>9. 꿈에서의 날씨는 어떤 편인가요?</p>
					<label>
						<input type="radio" name="q9" value="0">
						맑음/햇살 가득한 날씨
					</label>
					<label>
						<input type="radio" name="q9" value="1">
						흐림/비 오는 날씨
					</label>
					<label>
						<input type="radio" name="q9" value="2">
						폭풍우/천둥 번개가 치는 날씨
					</label>
					<label>
						<input type="radio" name="q9" value="3">
						안개/흐린 날씨
					</label>
				</div>
			</div>
			<div class="question">
				<div class="options">
					<p>10. 꿈에서 자주 나오는 숫자는 무엇인가요?</p>
					<label>
						<input type="radio" name="q10" value="0">
						3
					</label>
					<label>
						<input type="radio" name="q10" value="1">
						7
					</label>
					<label>
						<input type="radio" name="q10" value="2">
						12
					</label>
					<label>
						<input type="radio" name="q10" value="3">
						5
					</label>
				</div>
			</div>
			<button id="backButton" style="display: none;">이전 문제</button>
			<button id="nextButton" style="display: inline-block;">다음 문제</button>
			<button id="finishButton" style="display: none;">종료</button>
			<a href="../home/main" id="main-btn-link">
				<div class="main-btn">메인으로...</div>
			</a>


		<div id="result-box" style="display: none;">
			<div id="result" style="display: none;"></div>
		</div>
		</section>
	</div>



	<script>
		// 문제 인덱스를 나타내는 변수
		var currentQuestionIndex = 0;

		// 문제 요소들을 모두 가져와서 배열로 저장
		var questions = document.querySelectorAll('.question');

		// 마지막 문제 종료 버튼
		var finishButton = document.getElementById('finishButton');

		// 결과 출력을 위한 div
		var resultDiv = document.getElementById('result');
		var resultDivBackground= document.getElementById('result-box');
		// 사용자의 선택을 저장할 배열
		var userChoices = [];

		var toMainMenu= document.getElementById('main-btn-link');
		// 선택지에 따른 해석 결과
		var interpretation = [
				// 1번 문제의 선택지에 따른 해석 결과
				[ "집에서 자주 나오는 꿈은 안정과 안전을 상징합니다.",
						"학교나 직장에서 자주 나오는 꿈은 업무 또는 학업에 대한 스트레스를 나타낼 수 있습니다.",
						"자연 속에서 나오는 꿈은 평화와 조화를 갈망하는 마음을 나타낼 수 있습니다.",
						"낯선 곳에서 나오는 꿈은 불안과 두려움을 상징할 수 있습니다." ],
				// 2번 문제의 선택지에 따른 해석 결과
				[ "주인공으로서의 역할은 자기 자신에 대한 인식을 나타낼 수 있습니다.",
						"소리와 음악에 민감하게 반응하며, 감성적이고 예민한 특성을 나타낼 수 있습니다.",
						"실제 경험과 육체적 감각에 주의를 기울이며, 실용적인 특성을 나타낼 수 있습니다.",
						"음식이나 맛에 대한 감각을 중시하며, 쾌락과 풍요로움을 추구하는 특성을 나타낼 수 있습니다." ],
				// 3번 문제 
				[ "감정의 흐름이나 정화, 변화의 상징일 수 있습니다.", 
					"본능이나 감정적인 부분을 나타낼 수 있습니다.",
						"목표 또는 욕망을 상징할 수 있으며, 성취감을 반영할 수도 있습니다.",
						"대인관계나 자아에 대한 탐색을 나타낼 수 있습니다." ],
				[ "내적 안정과 만족을 나타낼 수 있습니다.",
						"스트레스나 불안을 나타내며, 처리해야 할 문제를 반영할 수 있습니다.",
						"새로운 경험에 대한 열망이나 기대를 나타낼 수 있습니다.",
						"자아 탐색이나 주변과의 연결 부재를 나타낼 수 있습니다." ],
				[ "평온, 안정, 혹은 내적 안정성을 나타낼 수 있습니다.",
						"감정적인 변화나 열정, 위험 등을 나타낼 수 있습니다.",
						"자연과의 연관성, 성장, 치유, 혹은 안정성을 나타낼 수 있습니다.",
						"미지의 것, 암흑, 또는 두려움을 나타낼 수 있습니다." ],
				[
						"안전하고 익숙한 환경에 대한 욕망이나 가정적인 안정을 상징할  있습니다.",
						"친밀감과 사회적 연결을 나타낼 수 있으며, 대인관계나 소통에 대한 필요성을 반영할 수 있습니다.",
						"영향력이나 역사적인 의미에 관심을 가지고 있거나, 자아의 역할과 관련된 심리적 요소를 나타낼 수 있습니다.",
						"탐험적인 욕망이나 새로운 인간관계를 형성하고자 하는 욕구를 나타낼 수 있습니다." ],
				[
						"활동적이고 에너지 넘치는 특성을 나타낼 수 있으며, 몸과 정신의 균형을 추구하는 경향을 보일 수 있습니다.",
						"지식 습득이나 성장에 대한 욕구를 반영할 수 있으며, 자기계발에 대한 필요성을 나타낼 수 있습니다.",
						"새로운 경험과 자유로움에 대한 열망을 나타낼 수 있으며, 자유로운 정서와 탐험적인 성향을 반영할 수 있습니다.",
						"사회적 상호작용에 대한 필요성이나 대인관계의 중요성을 나타낼 수 있습니다." ],
				[ "시각적인 감각을 중시하며, 아름다움과 심미성에 대한 욕망을 나타낼 수 있습니다.",
						"소리와 음악에 민감하게 반응하며, 감성적이고 예민한 특성을 나타낼 수 있습니다.",
						"실제 경험과 육체적 감각에 주의를 기울이며, 실용적인 특성을 나타낼 수 있습니다.",
						"음식이나 맛에 대한 감각을 중시하며, 쾌락과 풍요로움을 추구하는 특성을 나타낼 수 있습니다." ],
				[
						"긍정적이고 희망찬 상태를 나타낼 수 있으며, 안정성과 평온을 반영할 수 있습니다.",
						"우울하거나 불안한 감정을 상징할 수 있으며, 변화와 도전에 대한 필요성을 나타낼 수 있습니다.",
						"갈등이나 강한 감정을 나타낼 수 있으며, 불안 또는 스트레스를 경험하는 상황을 반영할 수 있습니다.",
						"미지의 것에 대한 두려움이나 혼란을 나타낼 수 있으며, 진실을 발견하고자 하는 욕구를 나타낼 수 있습니다." ],
				[
						"세련되고 균형 잡힌 특성을 나타낼 수 있으며, 창의성과 조화에 관심이 있는 경향을 나타낼 수 있습니다.",
						"신비롭고 심오한 특성을 나타낼 수 있으며, 지적 탐구와 영적 성장에 관심을 가지고 있는 것으로 보일 수 있습니다.",
						"완벽함과 성취에 대한 욕망을 나타낼 수 있으며, 다양성과 통합에 대한 관심을 나타낼 수 있습니다.",
						"자유롭고 다양한 경험을 추구하는 특성을 나타낼 수 있으며, 변화와 모험에 대한 욕망을 나타낼 수 있습니다." ]

		// 다른 문제들에 대한 해석 결과 추가
		];
		

		// 다음 버튼에 클릭 이벤트 리스너 추가
		document.getElementById('nextButton').addEventListener('click',
				showNextQuestion);

	
		document.getElementById('finishButton').addEventListener('click',
				analyzeResults);
		// 뒤로가기 버튼에 클릭 이벤트 리스너 추가
		document.getElementById('backButton').addEventListener('click', goBack);

		
		// 다음 문제로 넘어가는 함수
		function showNextQuestion() {
			 // 현재 보여지고 있는 문제의 선택지 확인
		    var radios = questions[currentQuestionIndex].querySelectorAll('input[type="radio"]');
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
		        finishButton.style.display = 'inline-block';
		        document.getElementById('nextButton').style.display = 'none';
		    }

		    // 다음 문제를 보여줌
		    if (currentQuestionIndex < questions.length) {
		        questions[currentQuestionIndex].style.display = 'block';
		    }

		    // 2번 문제부터 뒤로가기 버튼 보이기
		    if (currentQuestionIndex > 0) {
		        backButton.style.display = 'inline-block';
		    }
		}

		
		// 결과 분석 함수
		function analyzeResults() {
			var result = "";
			for (var i = 0; i < userChoices.length; i++) {
			    var choiceIndex = parseInt(userChoices[i]);
			    console.log((i + 1) + "번 질문의 선택: " + userChoices[i]); // 사용자의 선택 값 출력
			    console.log((i + 1) + "번 질문의 인덱스: " + choiceIndex); // 변환된 인덱스 값 출력
			    console.log((i + 1) + "번 질문의 해석 길이: " + interpretation[i].length); // 해당 질문의 해석 배열 길이 출력
			    if (isNaN(choiceIndex) || choiceIndex < 0 || choiceIndex >= interpretation[i].length) {
			        console.log((i + 1) + "번 질문의 해석: 선택한 값이 유효하지 않습니다."); // 유효하지 않은 값 메시지 출력
			        result += (i + 1) + "번 질문의 해석: 선택한 값이 유효하지 않습니다.<br>";
			    } else {
			        console.log((i + 1) + "번 질문의 선택한 번호와 해석: " + interpretation[i][choiceIndex]); // 올바른 해석 결과 출력
			        result += (i + 1) + "번 질문의 해석: " + interpretation[i][choiceIndex] + "<br>";
			    }
			}
			
			
			// 결과를 화면에 출력
			resultDiv.innerHTML = "<h2>분석 결과</h2>" + result;
			
			resultDiv.style.display = 'block';
			resultDivBackground.style.display = 'block';
			toMainMenu.style.display = 'block';
		
		}

		// 뒤로가기 함수 정의
		function goBack() {
			if (currentQuestionIndex > 0) {
		        // 현재 보여지고 있는 문제의 선택지 확인
		        var radios = questions[currentQuestionIndex].querySelectorAll('input[type="radio"]');
		        var isChecked = false;
		        for (var i = 0; i < radios.length; i++) {
		            if (radios[i].checked) {
		                isChecked = true;
		                userChoices.pop(); // 마지막 선택값 삭제
		                break;
		            }
		        }

		        // 현재 보여지고 있는 문제를 숨김
		        questions[currentQuestionIndex].style.display = 'none';

		        // 이전 문제 인덱스로 이동
		        currentQuestionIndex--;

		        // 다음 버튼 보이기
		        document.getElementById('nextButton').style.display = 'inline-block';
		        // 마지막 문제가 아니라면 종료 버튼 숨기기
		        if (currentQuestionIndex !== questions.length - 1) {
		            document.getElementById('finishButton').style.display = 'none';
		        }

		        // 이전 문제를 보여줌
		        questions[currentQuestionIndex].style.display = 'block';

		        // 1번 문제에 도달하면 뒤로가기 버튼 숨기기
		        if (currentQuestionIndex === 0) {
		            backButton.style.display = 'none';
		        }
		    }
		}

	  /*   // 문제를 모두 푼 후에 사용자의 선택을 표시하는 함수
	    function showUserChoices() {
	        for (var i = 0; i < questions.length; i++) {
	            var radios = questions[i].querySelectorAll('input[type="radio"]');
	            for (var j = 0; j < radios.length; j++) {
	                // 사용자가 선택한 번호가 있다면 해당 라디오 버튼을 체크 상태로 변경
	                if (userChoices[i] === radios[j].value) {
	                    radios[j].checked = true;
	                }
	            }
	        }
	    }

	    // 각 문제의 선택지에 대한 클릭 이벤트 리스너 추가
	    for (var i = 0; i < questions.length; i++) {
	        var radios = questions[i].querySelectorAll('input[type="radio"]');
	        for (var j = 0; j < radios.length; j++) {
	            radios[j].addEventListener('click', function(event) {
	                // 라디오 버튼을 클릭하면 해당 선택을 사용자의 선택으로 저장
	                var questionIndex = Array.prototype.indexOf.call(questions, event.target.closest('.question'));
	                userChoices[questionIndex] = event.target.value;
	            });
	        }
	    }

	    // 문제를 모두 푼 후에 사용자의 선택 표시 함수 호출
	    showUserChoices(); */
	</script>

	<%@ include file="../common/foot.jspf"%>