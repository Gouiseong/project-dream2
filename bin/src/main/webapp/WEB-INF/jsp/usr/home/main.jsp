<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/head.jspf"%>
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