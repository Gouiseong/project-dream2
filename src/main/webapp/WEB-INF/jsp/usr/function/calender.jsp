<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="painting"></c:set>
<%@ include file="../common/head.jspf"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div>그림을 그려보세요</div>
	<canvas id="drawing-board" width="800" height="700"></canvas>
	<input type="color" id="color-picker">
	<button class="paint_save">저장하기</button>
	<script>
		const canvas = document.getElementById('drawing-board');
		const ctx = canvas.getContext('2d');
		let painting = false;

		canvas.addEventListener('mousedown', startPosition);
		canvas.addEventListener('mouseup', endPosition);
		canvas.addEventListener('mousemove', draw);

		document.getElementById('color-picker').addEventListener('change',
				changeColor);

		function startPosition(e) {
			painting = true;
			draw(e);
		}

		function endPosition() {
			painting = false;
			ctx.beginPath();
		}

		function draw(e) {
			if (!painting)
				return;

			ctx.lineWidth = 5;
			ctx.lineCap = 'round';
			ctx.strokeStyle = document.getElementById('color-picker').value;

			ctx.lineTo(e.clientX - canvas.offsetLeft, e.clientY
					- canvas.offsetTop);
			ctx.stroke();
			ctx.beginPath();
			ctx.moveTo(e.clientX - canvas.offsetLeft, e.clientY
					- canvas.offsetTop);
		}

		function changeColor() {
			ctx.strokeStyle = this.value;
		}
	</script>

<%@ include file="../common/foot.jspf"%>