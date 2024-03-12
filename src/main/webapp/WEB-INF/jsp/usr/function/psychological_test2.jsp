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
	<div id="questionContainer"></div>

	<button id="nextButton">다음 문제로</button>
	<button id="finishButton" style="display: none;">종료</button>
	<div id="result" style="display: none;"></div>
	<script>
		// 문제와 선택지, 그에 해당하는 문자열을 배열로 관리
		var questionsAndChoices = [ {
			question : '꿈에서 자주 나오는 장소는?',
			choices : [ {
				value : '0',
				text : '집',
				interpretation : '집에서 자주 나오는 꿈은 안정과 안전을 상징합니다.'
			}, {
				value : '1',
				text : '학교/직장',
				interpretation : '...'
			}, {
				value : '2',
				text : '자연 속(숲, 해변 등)',
				interpretation : '...'
			}, {
				value : '3',
				text : '낯선 곳',
				interpretation : '...'
			} ]
		}, {
			question : '꿈에서 자주 나오는 사람은?',
			choices : [ {
				value : '0',
				text : '집',
				interpretation : '집에서 자주 나오는 꿈은 안정과 안전을 상징합니다.'
			}, {
				value : '1',
				text : '학교/직장',
				interpretation : '...'
			}, {
				value : '2',
				text : '자연 속(숲, 해변 등)',
				interpretation : '...'
			}, {
				value : '3',
				text : '낯선 곳',
				interpretation : '...'
			} ]
		}, {
			question : '꿈에서 자주 나오는 장소는?',
			choices : [ {
				value : '0',
				text : '집',
				interpretation : '집에서 자주 나오는 꿈은 안정과 안전을 상징합니다.'
			}, {
				value : '1',
				text : '학교/직장',
				interpretation : '...'
			}, {
				value : '2',
				text : '자연 속(숲, 해변 등)',
				interpretation : '...'
			}, {
				value : '3',
				text : '낯선 곳',
				interpretation : '...'
			} ]
		}
		// 다른 문제들도 이어서 나열
		];

		var currentQuestionIndex = 0;
		var questionContainer = document.getElementById('questionContainer');
		var nextButton = document.getElementById('nextButton');
		var finishButton = document.getElementById('finishButton');
		var resultDiv = document.getElementById('result');

		function showQuestion(questionIndex) {
			var question = questionsAndChoices[questionIndex];
			if (question) {
				questionContainer.innerHTML = ''; // 이전 문제 초기화

				var questionElement = document.createElement('h2');
				questionElement.textContent = question.question;
				questionContainer.appendChild(questionElement);

				var choices = question.choices;
				choices
						.forEach(function(choice) {
							var choiceElement = document.createElement('input');
							choiceElement.type = 'radio';
							choiceElement.name = 'question' + questionIndex;
							choiceElement.value = choice.value;

							var labelElement = document.createElement('label');
							labelElement.appendChild(choiceElement);
							labelElement.appendChild(document
									.createTextNode(choice.text));
							questionContainer.appendChild(labelElement);

							questionContainer.appendChild(document
									.createElement('br'));
						});
			}
		}

		function showNextQuestion() {
			currentQuestionIndex++;
			if (currentQuestionIndex < questionsAndChoices.length) {
				showQuestion(currentQuestionIndex);
				if (currentQuestionIndex === questionsAndChoices.length - 1) {
					nextButton.style.display = 'none';
					finishButton.style.display = 'block';
				}
			}
		}

		function analyzeResults() {
			var result = "";
			for (var i = 0; i < questionsAndChoices.length; i++) {
				var choiceIndex = userChoices[i].charCodeAt(0)
						- 'a'.charCodeAt(0);
				result += (i + 1)
						+ "번 질문: "
						+ questionsAndChoices[i].choices[choiceIndex].interpretation
						+ "<br>";
			}
			resultDiv.innerHTML = "<h2>분석 결과</h2>" + result;
			resultDiv.style.display = 'block';
		}

		nextButton.addEventListener('click', showNextQuestion);
		finishButton.addEventListener('click', analyzeResults);

		// 초기화면 설정
		showQuestion(currentQuestionIndex);
	</script>

	<%@ include file="../common/foot.jspf"%>