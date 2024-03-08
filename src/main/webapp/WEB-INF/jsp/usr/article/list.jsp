<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="#{board.code } ARTICLE LIST"></c:set>
<%@ include file="../common/head.jspf"%>

<div>

	<div class="search_box_form_background">
		<!-- <div class="clock">
			<div class="hours">
				<div class="first">
					<div class="number">0</div>
				</div>
				<div class="second">
					<div class="number">0</div>
				</div>
			</div>
			<div class="tick">:</div>
			<div class="minutes">
				<div class="first">
					<div class="number">0</div>
				</div>
				<div class="second">
					<div class="number">0</div>
				</div>
			</div>
			<div class="tick">:</div>
			<div class="seconds">
				<div class="first">
					<div class="number">0</div>
				</div>
				<div class="second infinite">
					<div class="number">0</div>
				</div>
			</div>
		</div> -->
		<form class="search_box_form" action="">
			<input type="hidden" name="boardId" value="${param.boardId }" />
			<select data-value="${param.searchKeywordTypeCode }"
				class="select select-bordered select-sm w-full max-w-xs select_box" name="searchKeywordTypeCode">
				<option value="title">제목</option>
				<option value="body">내용</option>
				<option value="title,body">제목+내용</option>
			</select>
			<input value="${param.searchKeyword }" name="searchKeyword" type="text" placeholder="검색어를 입력하세요..."
				class="search_box" />
			<button class="search_btn" type="submit">검색</button>
		</form>
	</div>
	<div class="container">
		<div class="left">
			<div class="board-list-container">
				<div class="board-list">
					<h2 class="board-list-text">게시판 목록</h2>
					</span>
					<ul class="board-item-background">
						<li class="board-item">
							<a href="#">자유 게시판</a>
						</li>
						<li class="board-item">
							<a href="#">꿈 게시판</a>
						<!-- 필요한 만큼 게시판 목록을 추가하세요 -->
					</ul>
				</div>
			</div>
		</div>


		<div class="center">
			<!-- 게시글들 -->
			<a href="">

				<c:if test="${rq.isLogined() }">

					<a class="hover:underline" href="../article/write">
						<span class="write">글쓰기</span>
					</a>

				</c:if>
			</a>
			<table class="article_write">
				<colgroup>
					<col style="width: 10%" />
					<col style="width: 50%" />
					<col style="width: 15%" />
					<col style="width: 10%" />
				</colgroup>
				<thead>
					<tr>
						<th></th>
						<th>제목</th>
						<th>작성일</th>
						<th>작성자</th>
						<th>조회수</th>
						<th>추천수</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach var="article" items="${articles }">

						<tr class="hover article_table">
							<td>꿈 게시판</td>
							<td>
								<a href="detail?id=${article.id }">${article.title }
									<c:if test="${article.extra__repliesCnt > 0 }">
										<span style="color: red;">[${article.extra__repliesCnt }]</span>
									</c:if>
								</a>
							</td>
							<td>${article.regDate.substring(0,10) }</td>
							<td>${article.extra__writer }</td>
							<td>${article.hitCount }</td>
							<td>${article.goodReactionPoint }</td>

						</tr>
					</c:forEach>
					<!-- 추가적인 게시글 -->
				</tbody>
			</table>
		</div>
		<div class="right">
			<!-- 로그인 버튼 -->

			<ul class="flex login-btn-container">

				<c:if test="${!rq.isLogined() }">
					<a class="hover:underline" href="../member/login">
						<li id="login-btn">로그인</li>
					</a>
				</c:if>
			</ul>
			<ul class="flex">

				<c:if test="${rq.isLogined() }">
					<a class="hover:underline" href="../member/myPage">
						<li id="login-btn">마이페이지</li>
					</a>

					<li>
						<a onclick="if(confirm('로그아웃 할래?') == false) return false;" class="hover:underline" href="../member/doLogout">로그아웃</a>
					</li>
				</c:if>
			</ul>
		</div>
	</div>
	<!-- 	<div
		style="display: flex; flex-direction: column; justify-content: flex-start; align-items: flex-start; position: absolute; left: 1470px; top: 449px; overflow: hidden; gap: 16px; padding-left: 20px; padding-right: 20px; padding-top: 28px; padding-bottom: 28px; background: #d9d9d9;">
		<div
			style="display: flex; flex-direction: column; justify-content: flex-start; align-items: flex-start; flex-grow: 0; flex-shrink: 0; position: relative; gap: 11px;">
			<p style="flex-grow: 0; flex-shrink: 0; font-size: 20px; text-align: left; color: #000;">실시간 인기글</p>
			<svg width="360" height="160" viewBox="0 0 360 160" fill="none" xmlns="http://www.w3.org/2000/svg"
				style="flex-grow: 0; flex-shrink: 0; width: 360px; height: 160px;" preserveAspectRatio="none">
        <rect width="360" height="160" rx="5" fill="#C55ED6" fill-opacity="0.2"></rect>
        <line y1="-0.5" x2="360.001" y2="-0.5" transform="matrix(0.999998 0.00192771 -0.000392249 1 0 32)"
					stroke="black"></line>
        <line y1="-0.5" x2="360.001" y2="-0.5" transform="matrix(0.999998 0.00192771 -0.000392249 1 0 64.6401)"
					stroke="black"></line>
        <line y1="-0.5" x2="360.001" y2="-0.5" transform="matrix(0.999998 0.00192771 -0.000392249 1 0 97.28)"
					stroke="black"></line>
        <line y1="-0.5" x2="360.001" y2="-0.5" transform="matrix(0.999998 0.00192771 -0.000392249 1 0 129.92)"
					stroke="black"></line>
      </svg>
		</div>
		<div
			style="display: flex; flex-direction: column; justify-content: flex-start; align-items: flex-start; flex-grow: 0; flex-shrink: 0; position: relative; gap: 13px;">
			<p style="flex-grow: 0; flex-shrink: 0; font-size: 20px; text-align: left; color: #000;">내가 작성한 글</p>
			<svg width="360" height="160" viewBox="0 0 360 160" fill="none" xmlns="http://www.w3.org/2000/svg"
				style="flex-grow: 0; flex-shrink: 0; width: 360px; height: 160px;" preserveAspectRatio="none">
        <rect width="360" height="160" rx="5" fill="#C55ED6" fill-opacity="0.2"></rect>
        <line y1="-0.5" x2="360.001" y2="-0.5" transform="matrix(0.999998 0.00192771 -0.000392249 1 0 32)"
					stroke="black"></line>
        <line y1="-0.5" x2="360.001" y2="-0.5" transform="matrix(0.999998 0.00192771 -0.000392249 1 0 64.6401)"
					stroke="black"></line>
        <line y1="-0.5" x2="360.001" y2="-0.5" transform="matrix(0.999998 0.00192771 -0.000392249 1 0 97.28)"
					stroke="black"></line>
        <line y1="-0.5" x2="360.001" y2="-0.5" transform="matrix(0.999998 0.00192771 -0.000392249 1 0 129.92)"
					stroke="black"></line>
      </svg>
		</div>
	</div> -->
	<!-- <div
		style="display: flex; flex-direction: column; justify-content: flex-start; align-items: flex-start; position: absolute; left: 299px; top: 244px; gap: 10px;">
		<div
			style="display: flex; flex-direction: column; justify-content: flex-start; align-items: flex-start; flex-grow: 0; flex-shrink: 0; position: relative;">
			<div style="flex-grow: 0; flex-shrink: 0; width: 1150px; height: 77px; border-radius: 5px; background: #4f265e;"></div>
			<div style="flex-grow: 0; flex-shrink: 0; width: 1150px; height: 250px;">
				<div
					style="width: 1150px; height: 250px; position: absolute; left: -0.5px; top: 76.5px; border-radius: 5px; background: rgba(198, 171, 203, 0.9);"></div>
				<svg width="1150" height="2" viewBox="0 0 1150 2" fill="none" xmlns="http://www.w3.org/2000/svg"
					style="position: absolute; left: -0.5px; top: 126.5px;" preserveAspectRatio="none">
          <line x1="0.000434782" y1="0.5" x2="1150" y2="1.5" stroke="black"></line></svg>
				<svg width="1150" height="2" viewBox="0 0 1150 2" fill="none" xmlns="http://www.w3.org/2000/svg"
					style="position: absolute; left: -0.5px; top: 177.5px;" preserveAspectRatio="none">
          <line x1="0.000434782" y1="0.5" x2="1150" y2="1.5" stroke="black"></line></svg>
				<svg width="1150" height="2" viewBox="0 0 1150 2" fill="none" xmlns="http://www.w3.org/2000/svg"
					style="position: absolute; left: -0.5px; top: 228.5px;" preserveAspectRatio="none">
          <line x1="0.000434782" y1="0.5" x2="1150" y2="1.5" stroke="black"></line></svg>
				<svg width="1150" height="2" viewBox="0 0 1150 2" fill="none" xmlns="http://www.w3.org/2000/svg"
					style="position: absolute; left: -0.5px; top: 279.5px;" preserveAspectRatio="none">
          <line x1="0.000434782" y1="0.5" x2="1150" y2="1.5" stroke="black"></line>
        </svg>
				<p style="position: absolute; left: 9px; top: 88px; font-size: 24px; text-align: left; color: #000;">[잡몽]하늘
					날아다니는 꿈 [5]</p>
				<p style="position: absolute; left: 9px; top: 288px; font-size: 24px; text-align: left; color: #000;">[잡몽]술먹는 꿈
					[2]</p>
				<p style="position: absolute; left: 9px; top: 237px; font-size: 24px; text-align: left; color: #000;">[잡몽]안녕 [1]</p>
				<p style="position: absolute; left: 9px; top: 188px; font-size: 24px; text-align: left; color: #000;">[잡몽]여행</p>
				<p style="position: absolute; left: 9px; top: 139px; font-size: 24px; text-align: left; color: #000;">[가위]가위 [3]</p>
			</div>
			<p style="flex-grow: 0; flex-shrink: 0; font-size: 36px; text-align: left; color: #000;">인기 글</p>
			<img src="인기-글-이미지.png" style="flex-grow: 0; flex-shrink: 0; width: 40px; height: 40px; object-fit: contain;" />
		</div>
		<div
			style="display: flex; justify-content: flex-start; align-items: flex-start; flex-grow: 0; flex-shrink: 0; width: 1148px; height: 327px; gap: 34px;">
			<div
				style="display: flex; flex-direction: column; justify-content: flex-start; align-items: flex-start; flex-grow: 0; flex-shrink: 0; height: 327px; width: 360px; position: relative;">
				<div style="flex-grow: 0; flex-shrink: 0; width: 360px; height: 77px; border-radius: 5px; background: #4f265e;"></div>
				<svg width="360" height="250" viewBox="0 0 360 250" fill="none" xmlns="http://www.w3.org/2000/svg"
					style="flex-grow: 0; flex-shrink: 0; width: 360px; height: 250px;" preserveAspectRatio="none">
          <rect width="360" height="250" rx="5" fill="#C6ABCB" fill-opacity="0.9"></rect>
          <line y1="-0.5" x2="360.001" y2="-0.5" transform="matrix(0.999995 0.00301203 -0.00025104 1 0 50)"
						stroke="black"></line>
          <line y1="-0.5" x2="360.001" y2="-0.5" transform="matrix(0.999995 0.00301203 -0.00025104 1 0 101)"
						stroke="black"></line>
          <line y1="-0.5" x2="360.001" y2="-0.5" transform="matrix(0.999995 0.00301203 -0.00025104 1 0 152)"
						stroke="black"></line>
          <line y1="-0.5" x2="360.001" y2="-0.5" transform="matrix(0.999995 0.00301203 -0.00025104 1 0 203)"
						stroke="black"></line></svg>
				<img src="개꿈-이미지.png" style="flex-grow: 0; flex-shrink: 0; width: 40px; height: 40px; object-fit: contain;" />
				<p style="flex-grow: 0; flex-shrink: 0; font-size: 36px; text-align: left; color: #000;">개꿈</p>
			</div>
			<div
				style="display: flex; flex-direction: column; justify-content: flex-start; align-items: flex-start; flex-grow: 0; flex-shrink: 0; height: 327px; width: 360px; position: relative;">
				<div style="flex-grow: 0; flex-shrink: 0; width: 360px; height: 77px; border-radius: 5px; background: #4f265e;"></div>
				<svg width="360" height="250" viewBox="0 0 360 250" fill="none" xmlns="http://www.w3.org/2000/svg"
					style="flex-grow: 0; flex-shrink: 0; width: 360px; height: 250px;" preserveAspectRatio="none">
          <rect width="360" height="250" rx="5" fill="#C6ABCB" fill-opacity="0.9"></rect>
          <line y1="-0.5" x2="360.001" y2="-0.5" transform="matrix(0.999995 0.00301203 -0.00025104 1 0 50)"
						stroke="black"></line>
          <line y1="-0.5" x2="360.001" y2="-0.5" transform="matrix(0.999995 0.00301203 -0.00025104 1 0 101)"
						stroke="black"></line>
          <line y1="-0.5" x2="360.001" y2="-0.5" transform="matrix(0.999995 0.00301203 -0.00025104 1 0 152)"
						stroke="black"></line>
          <line y1="-0.5" x2="360.001" y2="-0.5" transform="matrix(0.999995 0.00301203 -0.00025104 1 0 203)"
						stroke="black"></line></svg>
				<img src="악몽-이미지.png" style="flex-grow: 0; flex-shrink: 0; width: 40px; height: 40px; object-fit: contain;" />
				<p style="flex-grow: 0; flex-shrink: 0; font-size: 36px; text-align: left; color: #000;">악몽</p>
			</div>
			<div
				style="display: flex; flex-direction: column; justify-content: flex-start; align-items: flex-start; flex-grow: 0; flex-shrink: 0; height: 327px; width: 360px; position: relative;">
				<div style="flex-grow: 0; flex-shrink: 0; width: 360px; height: 77px; border-radius: 5px; background: #4f265e;"></div>
				<svg width="360" height="250" viewBox="0 0 360 250" fill="none" xmlns="http://www.w3.org/2000/svg"
					style="flex-grow: 0; flex-shrink: 0; width: 360px; height: 250px;" preserveAspectRatio="none">
          <rect width="360" height="250" rx="5" fill="#C6ABCB" fill-opacity="0.9"></rect>
          <line y1="-0.5" x2="360.001" y2="-0.5" transform="matrix(0.999995 0.00301203 -0.00025104 1 0 50)"
						stroke="black"></line>
          <line y1="-0.5" x2="360.001" y2="-0.5" transform="matrix(0.999995 0.00301203 -0.00025104 1 0 101)"
						stroke="black"></line>
          <line y1="-0.5" x2="360.001" y2="-0.5" transform="matrix(0.999995 0.00301203 -0.00025104 1 0 152)"
						stroke="black"></line>
          <line y1="-0.5" x2="360.001" y2="-0.5" transform="matrix(0.999995 0.00301203 -0.00025104 1 0 203)"
						stroke="black"></line>
        </svg>
				<p style="flex-grow: 0; flex-shrink: 0; font-size: 36px; text-align: left; color: #000;">예지몽</p>
				<img src="예지몽-이미지.png" style="flex-grow: 0; flex-shrink: 0; width: 40px; height: 40px; object-fit: contain;" />
			</div>
		</div>
	</div>
	<div
		style="display: flex; justify-content: flex-start; align-items: center; position: absolute; left: 1355px; top: 331px; gap: 10px;">
		<img src="thumbs-up.png" style="flex-grow: 0; flex-shrink: 0; width: 30px; height: 30px; object-fit: contain;" />
		<p style="flex-grow: 0; flex-shrink: 0; font-size: 20px; text-align: left; color: #6c4975;">100</p>
	</div>

	<div
		style="display: flex; justify-content: flex-start; align-items: flex-start; position: absolute; left: 1470px; top: 247px; opacity: 0.8;">
		<div style="flex-grow: 0; flex-shrink: 0; width: 400px; height: 171px;">
			<div
				style="width: 400px; height: 171px; position: absolute; left: -0.5px; top: -0.5px; border-radius: 5px; background: #9f8f9e; border-width: 1px; border-color: #33134d;"></div>
			<div
				style="display: flex; flex-direction: column; justify-content: flex-start; align-items: flex-start; height: 103px; position: absolute; left: 118px; top: 28px; gap: 4px;">
				<p style="flex-grow: 0; flex-shrink: 0; font-size: 16px; text-align: left; color: #000;">고의성님의 다이어리</p>
				<p style="flex-grow: 0; flex-shrink: 0; font-size: 12px; text-align: left; color: #000;">rhdmltjd1324@gmail.com
				</p>
				<p style="flex-grow: 0; flex-shrink: 0; font-size: 14px; text-align: left; color: #000;">마이페이지</p>
				<p style="flex-grow: 0; flex-shrink: 0; font-size: 14px; text-align: left; color: #000;">로그아웃</p>
				<p style="flex-grow: 0; flex-shrink: 0; font-size: 14px; text-align: left; color: #000;">등급 : 관리자</p>
			</div>
		</div>
		<div
			style="display: flex; justify-content: flex-start; align-items: flex-start; flex-grow: 0; flex-shrink: 0; position: absolute; left: 23px; top: 31px; gap: 10px;">
			<img style="flex-grow: 0; flex-shrink: 0;" src="프로필-이미지-배경.png" />
		</div>
		<img src="settings.png" style="flex-grow: 0; flex-shrink: 0; width: 31px; height: 31px; object-fit: contain;" />
		<div style="flex-grow: 0; flex-shrink: 0; width: 76px; height: 145px; background: #d9d9d9;"></div>
	</div>
</div> -->
	<script>
var hoursContainer = document.querySelector('.hours')
var minutesContainer = document.querySelector('.minutes')
var secondsContainer = document.querySelector('.seconds')
var tickElements = Array.from(document.querySelectorAll('.tick'))

var last = new Date(0)
last.setUTCHours(-1)

var tickState = true

function updateTime () {
  var now = new Date
  
  var lastHours = last.getHours().toString()
  var nowHours = now.getHours().toString()
  if (lastHours !== nowHours) {
    updateContainer(hoursContainer, nowHours)
  }
  
  var lastMinutes = last.getMinutes().toString()
  var nowMinutes = now.getMinutes().toString()
  if (lastMinutes !== nowMinutes) {
    updateContainer(minutesContainer, nowMinutes)
  }
  
  var lastSeconds = last.getSeconds().toString()
  var nowSeconds = now.getSeconds().toString()
  if (lastSeconds !== nowSeconds) {
    //tick()
    updateContainer(secondsContainer, nowSeconds)
  }
  
  last = now
}

function tick () {
  tickElements.forEach(t => t.classList.toggle('tick-hidden'))
}

function updateContainer (container, newTime) {
  var time = newTime.split('')
  
  if (time.length === 1) {
    time.unshift('0')
  }
  
  
  var first = container.firstElementChild
  if (first.lastElementChild.textContent !== time[0]) {
    updateNumber(first, time[0])
  }
  
  var last = container.lastElementChild
  if (last.lastElementChild.textContent !== time[1]) {
    updateNumber(last, time[1])
  }
}

function updateNumber (element, number) {
  //element.lastElementChild.textContent = number
  var second = element.lastElementChild.cloneNode(true)
  second.textContent = number
  
  element.appendChild(second)
  element.classList.add('move')

  setTimeout(function () {
    element.classList.remove('move')
  }, 990)
  setTimeout(function () {
    element.removeChild(element.firstElementChild)
  }, 990)
}

setInterval(updateTime, 100)</script>


	<%@ include file="../common/foot.jspf"%>