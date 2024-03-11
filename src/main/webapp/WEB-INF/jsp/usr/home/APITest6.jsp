<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="API TEST6"></c:set>

<%@ include file="../common/head.jspf"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>현재날씨정보가져오기</title>

</head>
<body>
	<label>날씨</label>

	<form class="form-horizontal">
		<div class="form-group">
			<select id="step1" class="emptyCheck" title="시/도">
				<option id="city" value="">시/도</option>
			</select>

			<select id="step2">
				<option id="county" value="">시/군/구</option>
			</select>

			<select id="step3">
				<option id="town" value="">읍/면/동</option>
			</select>

			<span>
				날짜 선택:
				<input type="text" id="datepicker" disabled="disabled" class="emptyCheck" title="날짜">
			</span>

			<select id="time" class="emptyCheck" title="시간">
				<option value="" selected>시간</option>
				<option th:each="i : ${#numbers.sequence(0,23)}" th:value="${i}" th:text="${i} + 시"></option>
			</select>

			<button type="button" class="btn btn-primary waves-effect waves-light" th:onclick="getWeather()">
				<span>실행</span>
			</button>

			<div>
				<table id="resultWeather" class="table"></table>
			</div>
		</div>
	</form>


	<script>
		var lat;
		var lon;
		// 		날씨
		async
		function getData2() {
			const API_KEY = 'ZgjRhTc3BeH1LoIIoEyv09%2BR33S0zgewRwrkShmFTR1WUUJheNxlSVnmECtQg2vSZGHsIfElEms2r6ngi%2FKi0w%3D%3D';
			const url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst';
			const response = await
			fetch(url);
			const data = await
			response.json();

			console.log("data", data);

		}

		getData2();
	</script>
</body>
</html>

<%@ include file="../common/foot.jspf"%>