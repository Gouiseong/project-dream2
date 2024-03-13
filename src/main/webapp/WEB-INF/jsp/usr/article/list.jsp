<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="#{board.code } ARTICLE LIST"></c:set>
<%@ include file="../common/head.jspf"%>

<div class="list-background-img">

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

		<div class="flex-box">
			<div id="timedate">
				<a id="y">0년</a>
				<a id="mon">월</a>
				<a id="d">1일</a>
				<br />
				<a id="h">12</a>
				:
				<a id="m">00</a>
				:
				<a id="s">00</a>
			</div>

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
	</div>
	<div class="container">
		<div class="left">
			<div class="board-list-container">
				<div class="board-list">
					<h2 class="board-list-text">게시판 목록</h2>
					</span>
					<ul class="board-item-background">
						<li class="board-item">
							<a href="../article/list?boardId=1&page=1">자유 게시판</a>
						</li>
						<li class="board-item">
							<a href="../article/list?boardId=2&page=1">꿈 게시판</a>
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
						<span class="write-btn">글쓰기</span>
					</a>

				</c:if>
			</a>
			<table class="article_write">
				<colgroup>
					<col style="width: 10%" />
					<col style="width: 5%" />
					<col style="width: 50%" />
					<col style="width: 15%" />
					<col style="width: 10%" />
				</colgroup>
				<thead>
					<tr>
						<th></th>
						<th>번호</th>
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
							<td>${article.id }</td>
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
	<!-- 	원래 페이징 -->
	<div class="pagination flex justify-center mt-3">
		<div class="btn-group">
			<c:forEach begin="1" end="${pagesCount }" var="i">
				<a class="btn btn-sm ${param.page == i ? 'btn-active' : '' }" href="?page=${i }&boardId=${param.boardId}">${i }</a>
			</c:forEach>
		</div>
	</div>
</div>
<script>
	Number.prototype.pad = function(n) {
		for (var r = this.toString(); r.length < n; r = 0 + r)
			;
		return r;
	};

	function updateClock() {
		var now = new Date();
		var sec = now.getSeconds();
		var min = now.getMinutes();
		var hou = now.getHours();
		var mo = now.getMonth();
		var dy = now.getDate();
		var yr = now.getFullYear();

		var months = [ "January", "February", "March", "April", "May", "June",
				"July", "August", "September", "October", "November",
				"December" ];
		var tags = [ "mon", "d", "y", "h", "m", "s" ];
		var corr = [ months[mo], dy, yr, hou.pad(2), min.pad(2), sec.pad(2) ];

		for (var i = 0; i < tags.length; i++) {
			document.getElementById(tags[i]).firstChild.nodeValue = corr[i];
		}
	}

	function initClock() {
		updateClock();
		window.setInterval(updateClock, 1000); // 초침이 1초마다 업데이트됩니다.
	}
</script>


<%@ include file="../common/foot.jspf"%>