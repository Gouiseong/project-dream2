<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<button class="button" type="button">현재 날씨는?</button>
	<dl>
		<dt>기온</dt>
		<dd class="temperature"></dd>
		<dt>위치</dt>
		<dd class="place"></dd>
		<dt>설명</dt>
		<dd class="description"></dd>
	</dl>

	<script src="weather.js"></script>
	<script>
	// lat = 위도 lon = 경도 
	const API_KEY = '72801a6178edfb4dcfb9d6d07efa43cb';
	const url = 'https://api.openweathermap.org/data/2.5/weather?lat=36.35089124850391&lon=127.38455807024224&appid='+API_KEY;
	const response = await fetch(url);
	const data = await response.json();
	
	const button = document.querySelector('.button');
	

    button.addEventListener('click', () => {
      console.log(button);
    });
    </script>
</body>
</html>