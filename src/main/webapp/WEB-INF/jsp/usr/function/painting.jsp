<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="painting"></c:set>
<%@ include file="../common/head.jspf"%>
<%@ page import="com.example.demo.vo.Rq" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<button onClick="../usr/memeber/login">로그인</button>
	<div class="painting-btn-container">
		<button id="drawBtn">그리기</button>
		<button id="eraseBtn">지우개</button>
		<span>
			색변경
			<input type="color" id="colorPicker">
		</span>
		<input type="range" id="thicknessSlider" min="1" max="10" value="3">
		<!-- 선 두께 조절 슬라이더 -->
		<button id="clearBtn">모두 지우기</button>
		<input type="file" id="fileInput">
	</div>
	<canvas id="canvas" width="1500" height="800"></canvas>
	<button id="saveBtn">저장하기</button>

	<script>
        window.onload = function() {
        
            var canvas = document.getElementById('canvas');
            var context = canvas.getContext('2d');
            var isDrawing = false;
            var prevX = 0;
            var prevY = 0;
            var color = '#000';
            var lines = []; // 선 배열 추가
           
         

            context.imageSmoothingEnabled = false;
            
            
            document.getElementById('drawBtn').addEventListener('click',
                    function() {
                        color = document.getElementById('colorPicker').value;
                        // 선 두께 설정
                        context.lineWidth = parseInt(document.getElementById('thicknessSlider').value);
                    }
            );

            document.getElementById('eraseBtn').addEventListener('click',
                    function() {
                        color = '#FFF'; // 흰색으로 설정하여 지우개 역할을 함
                    });

         /*    document.getElementById('saveBtn').addEventListener(
                    'click',
                    function() {
                        var image = canvas.toDataURL("image/png").replace(
                                "image/png", "image/octet-stream");
                        window.location.href = image;
                    }); */

             document.getElementById('fileInput').addEventListener('change', function(e) {
                    var file = e.target.files[0];
                    if (!file) return;
                    var reader = new FileReader();
                    reader.onload = function(event) {
                        var img = new Image();
                        img.onload = function() {
                            context.clearRect(0, 0, canvas.width, canvas.height);
                            context.drawImage(img, 0, 0, canvas.width, canvas.height);
                        };
                        img.src = event.target.result;
                    };
                    reader.readAsDataURL(file);
                });

            canvas.addEventListener('mousedown', function(e) {
                isDrawing = true;
                prevX = e.clientX - canvas.offsetLeft;
                prevY = e.clientY - canvas.offsetTop;
            });

            canvas.addEventListener('mousemove', function(e) {
                if (isDrawing) {
                    drawLine(prevX, prevY, e.clientX - canvas.offsetLeft,
                            e.clientY - canvas.offsetTop);
                    prevX = e.clientX - canvas.offsetLeft;
                    prevY = e.clientY - canvas.offsetTop;
                }
            });

            canvas.addEventListener('mouseup', function() {
                isDrawing = false;
            });

            canvas.addEventListener('mouseleave', function() {
                isDrawing = false;
            });
             
            document.getElementById('clearBtn').addEventListener('click', function() {
                    context.clearRect(0, 0, canvas.width, canvas.height);
                    lines = []; // 선 배열 초기화
                });
             
            function drawLine(x1, y1, x2, y2) {
                context.beginPath();
                context.moveTo(x1, y1);
                context.lineTo(x2, y2);
                context.strokeStyle = color;
             
                context.stroke();
                context.closePath();

                // 선을 배열에 추가
                lines.push({ x1: x1, y1: y1, x2: x2, y2: y2 });
            }
            
            // 선 두께 슬라이더 값이 변경될 때마다 선 두께를 업데이트
            document.getElementById('thicknessSlider').addEventListener('input', function() {
                context.lineWidth = parseInt(this.value);
            });
            
       		
       	 // todo		
         // 저장하기 버튼 클릭시 안에서 if문으로 로그인 상태 확인하려는데 
         // 저장하기 버튼을 눌러도 아무것도 안뜸 
         
         // 저장하기 버튼 클릭 시 이벤트 핸들러
        document.getElementById('saveBtn').addEventListener('click', function() {
        	
        	
        	var imageDataURL = canvas.toDataURL('image/png');
            console.log("imageDataURL : ",imageDataURL);
            
            // 이미지 데이터를 Blob으로 변환
            fetch(imageDataURL)
                .then(response => response.blob())
                .then(blob => {
                	 // 로그인 상태 확인 후 동작 수행
                    if ( rq.isLogined) {
                    	var formData = new FormData();
                        formData.append('image', blob, 'image.png');
                        
                        return fetch('/usr/function/painting/saveimage', {
                            method: 'POST',
                            body: formData
                        });
                        
                    } else {
                        // 로그인이 안 되어 있을 때 알림 메시지 표시
                        alert('로그인 후 이용해주세요.');
                    }

                })
                .then(response => {
                    if (response.ok) {
                        alert("그림이 저장되었습니다.");
                        console.log('저장성공.');
                    } else {
                        console.error('저장실패.');
                    }
                })
                .catch(error => {
                    console.error('Error saving image:', error);
                });
        });
       		
       

           /* 컨트롤 + z 키를 눌렀을때 그렸던 선을 한 번 지우고 되돌리는 기능(안됨 보류) 
              document.addEventListener('keyup', function(event) {
                if (event.ctrlKey && event.key === 'z') {
                    undoLastLine();
                }
            });

            function undoLastLine() {
                if (lines.length > 0) {
                    context.clearRect(0, 0, canvas.width, canvas.height);
                    lines.pop();
                    redrawLines();
                }
            }

            function redrawLines() {
                lines.forEach(function(line) {
                    drawLine(line.x1, line.y1, line.x2, line.y2);
                });
            } */
        };
    </script>

	<%@ include file="../common/foot.jspf"%>