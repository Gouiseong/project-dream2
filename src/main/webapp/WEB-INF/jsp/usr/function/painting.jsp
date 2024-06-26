<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="painting"></c:set>
<%@ include file="../common/head.jspf"%>
<%
boolean isLogined = (boolean) request.getAttribute("isLogined"); //로그인 상태 확인
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>

    .painting-container {
        display: flex;
        align-items: center;
    }

    .painting-btn-container {
        display: flex;
        flex-direction: column;
        gap: 5px;
        padding: 10px;
        border: 2px solid #ccc;
        border-radius: 15px;
        background-color: #fff;
        margin-right: 20px;
    }

    .painting-btn-container button,
    .painting-btn-container input[type="color"],
    .painting-btn-container input[type="range"],
    .painting-btn-container input[type="file"] {
    
        margin: 5px 0;
        border: 1px solid #ddd;
        border-radius: 5px;
        background-color: #fff;
        cursor: pointer;
    }

    .painting-btn-container button:hover,
    .painting-btn-container input[type="color"]:hover,
    .painting-btn-container input[type="range"]:hover,
    .painting-btn-container input[type="file"]:hover {
        background-color: #f0f0f0;
    }

    #canvas {
        border: 2px solid #333;
        border-radius: 10px;
        background-color: #fff;
    }

    #saveBtn {
        padding: 10px 20px;
        border: 1px solid #ddd;
        border-radius: 5px;
        background-color: #28a745;
        color: #fff;
        cursor: pointer;
        margin-top: 20px;
    }

    #saveBtn:hover {
        background-color: #218838;
    }
</style>
</head>
<body>
    <div class="painting-container">
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
        <div>
            <canvas id="canvas" width="1500" height="800"></canvas>
            <button id="saveBtn">저장하기</button>
        </div>
    </div>
    <script>
        window.onload = function() {
            var canvas = document.getElementById('canvas');
            var context = canvas.getContext('2d');
            var isDrawing = false;
            var prevX = 0;
            var prevY = 0;
            var color = '#000';
            var lines = []; // 선 배열 추가
            var isLogined = <%= isLogined %>; // Java 변수를 JavaScript 변수로 출력
            context.imageSmoothingEnabled = false;

            document.getElementById('drawBtn').addEventListener('click', function() {
                color = document.getElementById('colorPicker').value;
                // 선 두께 설정
                context.lineWidth = parseInt(document.getElementById('thicknessSlider').value);
            });

            document.getElementById('eraseBtn').addEventListener('click', function() {
                color = '#FFF'; // 흰색으로 설정하여 지우개 역할을 함
            });

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
                    drawLine(prevX, prevY, e.clientX - canvas.offsetLeft, e.clientY - canvas.offsetTop);
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
                lines.push({
                    x1: x1,
                    y1: y1,
                    x2: x2,
                    y2: y2
                });
            }

            // 선 두께 슬라이더 값이 변경될 때마다 선 두께를 업데이트
            document.getElementById('thicknessSlider').addEventListener('input', function() {
                context.lineWidth = parseInt(this.value);
            });

            // 저장하기 버튼 클릭 시 이벤트 핸들러
            document.getElementById('saveBtn').addEventListener('click', function() {
                if (isLogined) {
                    // 그림판 이미지를 데이터 URL로 변환
                    const imageDataURL = canvas.toDataURL('image/png');

                    // 서버로 이미지 데이터 전송
                    fetch('/usr/function/savepainting', {
                        method: 'POST',
                        body: JSON.stringify(imageDataURL),
                        headers: {
                            'Content-Type': 'application/json'
                        }
                    })
                    .then(response => {
                        if (response.ok) {
                            alert("이미지가 성공적으로 업로드되었습니다.");
                        } else {
                            throw new Error("이미지 업로드 중 오류가 발생했습니다.");
                        }
                    })
                    .catch(error => {
                        alert(error.message);
                    });
                } else {
                    alert("로그인 후 저장 가능");
                    window.location.href = "../member/login";
                }
            });
        };
    </script>

    <%@ include file="../common/foot.jspf"%>
</body>
</html>
