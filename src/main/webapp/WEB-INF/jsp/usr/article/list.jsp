<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="#{board.code } ARTICLE LIST"></c:set>
<%@ include file="../common/head.jspf"%>
<body onload="initClock()">
	
<style>

.list-background-img {
    background-image: url('your-image.jpg'); /* 배경 이미지 설정 */
    background-size: cover;
    background-position: center;
    padding: 20px;
}

.search_box_form_background {
    background-color: rgba(255, 255, 255, 0.8);
    padding: 10px;
    border-radius: 10px;
    margin-bottom: 20px;
}

.flex-box {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

#timedate a {
    font-size: 1.2em;
    color: #333;
}

.search_box_form {
    display: flex;
    align-items: center;
}

.search_box {
    margin-left: 10px;
    padding: 5px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

.search_btn {
    margin-left: 10px;
    padding: 5px 10px;
    background-color: #5cb85c;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.search_btn:hover {
    background-color: #4cae4c;
}

.container {
    display: flex;
    justify-content: space-between;
}

.left, .right {
    width: 20%;
}

.center {
    width: 60%;
}

.board-list-container {
    background-color: white;
    border-radius: 10px;
    padding: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.board-list-text {
    font-size: 1.5em;
    margin-bottom: 10px;
}

.board-item-background {
    list-style: none;
    padding: 0;
}

.board-item {
    padding: 10px;
    border-bottom: 1px solid #eee;
}

.board-item a {
    text-decoration: none;
    color: #333;
}

.board-item a:hover {
    text-decoration: underline;
}

.write-btn {
    display: inline-block;
    padding: 10px 20px;
    background-color: #5cb85c;
    color: white;
    border-radius: 5px;
    margin-bottom: 20px;
    text-decoration: none;
}

.write-btn:hover {
    background-color: #4cae4c;
}

.article_write {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}

.article_write th, .article_write td {
    border: 1px solid #ddd;
    padding: 10px;
    text-align: center;
}

.article_write th {
    background-color: #f8f8f8;
}

.article_write tbody tr:hover {
    background-color: #f1f1f1;
}

.pagination {
    margin-top: 20px;
}

.btn-group {
    display: flex;
    gap: 5px;
}

.btn {
    display: inline-block;
    padding: 5px 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
    text-decoration: none;
    color: #333;
    background-color: #fff;
}

.btn:hover {
    background-color: #f0f0f0;
}

.btn-active {
    background-color: #5cb85c;
    color: white;
    border-color: #4cae4c;
}

.login-btn-container {
    margin-bottom: 20px;
}

.login-btn-container a {
    display: inline-block;
    padding: 10px 20px;
    background-color: #5bc0de;
    color: white;
    border-radius: 5px;
    text-decoration: none;
}

.login-btn-container a:hover {
    background-color: #31b0d5;
}
</style>
<div class="list-background-img" >
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
</body>
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

		var months = [ "01", "02", "03", "04", "05", "06",
				"07", "08", "09", "10", "11",
				"12" ];
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