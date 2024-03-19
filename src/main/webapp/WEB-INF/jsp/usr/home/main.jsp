<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<link rel="stylesheet" href="/resource/common.css" />
<script src="/resource/common.js" defer="defer"></script>
<!-- 테일윈드 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" />

<!-- daisy ui 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/daisyui/4.6.1/full.css" />

<!-- 폰트어썸 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">

<!-- 제이쿼리 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

	
<div class="flex-container">
	<div class="spinner"></div>
	<div class="flex-slide home">
		<a href="../article/list">
			<div class="flex-title">Notice Board</div>
			<div class="flex-about">
				<p>게시글</p>
				<br />
				<ul class="flex-about-text">
					<li>- 게시된 글들을 볼 수 있어요</li>
					<li>- 내 꿈을 사람들과 공유해요</li>
				</ul>
			</div>
		</a>
	</div>
	<div class="flex-slide about">
		<a href="../function/painting">
			<div class="flex-title">Drawing</div>
			<div class="flex-about ">
				<p>그림</p>
				<br />
				<ul class="flex-about-text">
					<li>- 꿈에 나왔던 인물을 그려볼 수 있어요</li>
					<li>- 그림을 그리고 저장해서 일지에 넣을 수 있어요</li>
				</ul>
			</div>
		</a>
	</div>
	<div class="flex-slide contact">
		<a href="../function/psychological_test">
			<div class="flex-title ">Psychological Test</div>
			<br />

			<div class="flex-about ">
				<p>심리테스트</p>
				<br />

				<ul class="flex-about-text">
					<li>- 꿈에 나왔던 것들을 상상하며 테스트 해봐요</li>
					
				</ul>
			</div>

		</a>
	</div>
	<div class="flex-slide work">
		<a href="../function/calendar">
			<div class="flex-title ">Calendar</div>
			<div class="flex-about">
				<p>캘린더</p>
				<br />
				<ul class="flex-about-text">
					<li>- 일정을 추가해봐요</li>
				
				</ul>
			</div>
		</a>
	</div>
</div>

<script>
	(function() {
		$('.flex-container').waitForImages(function() {
			$('.spinner').fadeOut();
		}, $.noop, true);

		$(".flex-slide").each(function() {
			$(this).hover(function() {
				$(this).find('.flex-title').css({
					transform : 'rotate(0deg)',
					top : '10%'
				});
				$(this).find('.flex-about').css({
					opacity : '1'
				});
			}, function() {
				$(this).find('.flex-title').css({
					transform : 'rotate(90deg)',
					top : '15%'
				});
				$(this).find('.flex-about').css({
					opacity : '1'
				});
			})
		});
	})();
</script>


<%@ include file="../common/foot.jspf"%>