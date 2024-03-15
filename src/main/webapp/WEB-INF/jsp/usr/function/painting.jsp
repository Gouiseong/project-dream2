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
	<div>
		색 설정
		<input type="color" id="color-picker">
        <button id="drawButton">그리기</button>
        <button id="eraseButton">지우기</button>
        
    </div>
    <canvas id="canvas" width="800" height="500"></canvas>
    <button class="paint_save">저장하기</button>

    <script>
    var canvas = document.getElementById('canvas');
    const ctx = canvas.getContext('2d');
    const colorPicker = document.getElementById('color-picker');
    const drawButton = document.getElementById('drawButton');
    const eraseButton = document.getElementById('eraseButton');
    const saveButton = document.querySelector('.paint_save');

    var isDrawing = false;
    var isErasing = false;
    var prevX = 0;
    var prevY = 0;
    var color = '#000';
    
  

    drawButton.addEventListener('click', function() {
        isDrawing = true;
        isErasing = false;
    });

    eraseButton.addEventListener('click', function() {
        isErasing = true;
        isDrawing = false;
    });

    saveButton.addEventListener('click', function() {
        const dataURL = canvas.toDataURL('image/png');
        const a = document.createElement('a');
        a.href = dataURL;
        a.download = 'my_drawing.png';
        document.body.appendChild(a);
        a.click();
        document.body.removeChild(a);
    });

    function startPosition(e) {
        if ((isDrawing || isErasing) && e.button === 0) {
            drawing = true;
            draw(e);
        }
    }

    function endPosition() {
        if (isDrawing || isErasing) {
            drawing = false;
            ctx.beginPath();
        }
    }

    function draw(e) {
        if (!isDrawing && !isErasing) return;

        ctx.lineWidth = 5;
        ctx.lineCap = 'round';
        ctx.strokeStyle = isErasing ? 'white' : colorPicker.value;

        ctx.lineTo(e.clientX - canvas.offsetLeft, e.clientY - canvas.offsetTop);
        ctx.stroke();

        if (isDrawing) {
            ctx.beginPath();
            ctx.moveTo(e.clientX - canvas.offsetLeft, e.clientY - canvas.offsetTop);
        }
    }
    </script>

	<%@ include file="../common/foot.jspf"%>