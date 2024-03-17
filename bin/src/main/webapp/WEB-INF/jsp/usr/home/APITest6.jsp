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
		const API_KEY = 'ZgjRhTc3BeH1LoIIoEyv09%2BR33S0zgewRwrkShmFTR1WUUJheNxlSVnmECtQg2vSZGHsIfElEms2r6ngi%2FKi0w%3D%3D';
		const url = 'https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst?serviceKey='
				+ API_KEY
				+ '&pageNo=1&numOfRows=1000&dataType=JSON&base_date=20240312&base_time=0600&nx=55&ny=127';
		$.getJSON(url, function(data) {
			console.log(data);
			console.log(data.response.body.items.item[0].obsrValue);
			console.log(data.response.body.items.ny);
		});
	</script>
</body>
</html>

<%@ include file="../common/foot.jspf"%>