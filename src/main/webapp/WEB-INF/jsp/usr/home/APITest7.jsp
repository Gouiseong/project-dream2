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
	<h2>종로 날씨</h2>
	<script>
		const API_KEY = '72801a6178edfb4dcfb9d6d07efa43cb';
		const url = 'http://api.openweathermap.org/data/2.5/forecast?id=524901&appid='
				+ API_KEY;
		$.getJSON(url, function(data) {
			console.log(data);
			console.log(data.city)
			
		});
	</script>
</body>
</html>

<%@ include file="../common/foot.jspf"%>