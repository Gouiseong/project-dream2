
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="calendar"></c:set>
<%@ include file="../common/head.jspf"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
</head>
<body>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
	<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500" rel="stylesheet">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


	<div class="mobile-header z-depth-1">

		<div class="row">
			<div class="col-2">
				<a href="#" data-activates="sidebar" class="button-collapse" style="">
					<i class="material-icons">menu</i>
				</a>
			</div>
			<div class="col">
				<h4>Events</h4>
			</div>
		</div>

	</div>


	<div class="main-wrapper">

		<div class="sidebar-wrapper">

			<div class="sidebar-title">
				<h4>일정</h4>
				<h5 id="eventDayName">Date</h5>
			</div>
			<div class="sidebar-events" id="sidebarEvents">
				<div class="empty-message">일정이 없어요</div>
			</div>
		</div>

		<div class="content-wrapper">
			<div class="container">

				<div class="calendar-wrapper z-depth-2">

					<div class="header-background">
						<div class="calendar-header">

							<a class="prev-button" id="prev">
								<i class="material-icons">keyboard_arrow_left</i>
							</a>
							<a class="next-button" id="next">
								<i class="material-icons">keyboard_arrow_right</i>
							</a>

							<div class="row header-title">

								<div class="header-text">
									<h3 id="month-name">현재 달</h3>
									<h5 id="todayDayName">오늘날짜오는곳</h5>
								</div>

							</div>
						</div>
					</div>

					<div class="calendar-content">
						<div id="calendar-table" class="calendar-cells">

							<div id="table-header">
								<div class="row">
									<div class="col">월</div>
									<div class="col">화</div>
									<div class="col">수</div>
									<div class="col">목</div>
									<div class="col">금</div>
									<div class="col">토</div>
									<div class="col">일</div>
								</div>
							</div>

							<div id="table-body" class=""></div>

						</div>
					</div>

					<div class="calendar-footer">
						<div class="emptyForm" id="emptyForm">
							<a class="addEvent" id="changeFormButton">일정 추가</a>
						</div>
						<div class="addForm" id="addForm">
							<h4>새 일정</h4>

							<div class="row">
								<div class="input-field col s6">
									<input id="eventTitleInput" type="text" class="validate">
									<label for="eventTitleInput">제목</label>
								</div>
								<div class="input-field col s6">
									<input id="eventDescInput" type="text" class="validate">
									<label for="eventDescInput">내용</label>
								</div>
							</div>

							<div class="addEventButtons">
								<a class="waves-effect waves-light btn blue lighten-2" id="addEventButton">추가</a>
								<a class="waves-effect waves-light btn grey lighten-2" id="cancelAdd">취소</a>
							</div>

						</div>
					</div>

				</div>

			</div>
		</div>

	</div>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
		integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"
		integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
	<script>
		$(".button-collapse").sideNav();
	</script>
	<script>var calendar = document.getElementById("calendar-table");
	var gridTable = document.getElementById("table-body");
	var currentDate = new Date();
	var selectedDate = currentDate;
	var selectedDayBlock = null;
	var globalEventObj = {};

	
	function createCalendar(date, side) {
	   var currentDate = date;
	   var startDate = new Date(currentDate.getFullYear(), currentDate.getMonth(), 1);

	   var monthTitle = document.getElementById("month-name");
	   var monthName = currentDate.toLocaleString("ko-KR", {
	      month: "long"
	   });
	   var yearNum = currentDate.toLocaleString("ko-KR", {
	      year: "numeric"
	   });
	   monthTitle.innerHTML = `${monthName} ${yearNum}`;

	   if (side == "left") {
	      gridTable.className = "animated fadeOutRight";
	   } else {
	      gridTable.className = "animated fadeOutLeft";
	   }

	   setTimeout(() => {
	      gridTable.innerHTML = "";

	      var newTr = document.createElement("div");
	      newTr.className = "row";
	      var currentTr = gridTable.appendChild(newTr);

	      for (let i = 1; i < (startDate.getDay() || 7); i++) {
	         let emptyDivCol = document.createElement("div");
	         emptyDivCol.className = "col empty-day";
	         currentTr.appendChild(emptyDivCol);
	      }

	      var lastDay = new Date(currentDate.getFullYear(), currentDate.getMonth() + 1, 0);
	      lastDay = lastDay.getDate();

	      for (let i = 1; i <= lastDay; i++) {
	         if (currentTr.children.length >= 7) {
	            currentTr = gridTable.appendChild(addNewRow());
	         }
	         let currentDay = document.createElement("div");
	         currentDay.className = "col";
	         if (selectedDayBlock == null && i == currentDate.getDate() || selectedDate.toDateString() == new Date(currentDate.getFullYear(), currentDate.getMonth(), i).toDateString()) {
	            selectedDate = new Date(currentDate.getFullYear(), currentDate.getMonth(), i);

	            document.getElementById("eventDayName").innerHTML = selectedDate.toLocaleString("ko-KR", {
	               month: "long",
	               day: "numeric",
	               year: "numeric"
	            });

	            selectedDayBlock = currentDay;
	            setTimeout(() => {
	               currentDay.classList.add("blue");
	               currentDay.classList.add("lighten-3");
	            }, 900);
	         }
	         currentDay.innerHTML = i;

	         //show marks
	         if (globalEventObj[new Date(currentDate.getFullYear(), currentDate.getMonth(), i).toDateString()]) {
	            let eventMark = document.createElement("div");
	            eventMark.className = "day-mark";
	            currentDay.appendChild(eventMark);
	         }

	         currentTr.appendChild(currentDay);
	      }

	      for (let i = currentTr.getElementsByTagName("div").length; i < 7; i++) {
	         let emptyDivCol = document.createElement("div");
	         emptyDivCol.className = "col empty-day";
	         currentTr.appendChild(emptyDivCol);
	      }

	      if (side == "left") {
	         gridTable.className = "animated fadeInLeft";
	      } else {
	         gridTable.className = "animated fadeInRight";
	      }

	      function addNewRow() {
	         let node = document.createElement("div");
	         node.className = "row";
	         return node;
	      }

	   }, !side ? 0 : 270);
	}

	createCalendar(currentDate);

	var todayDayName = document.getElementById("todayDayName");
	todayDayName.innerHTML = currentDate.toLocaleString("ko-KR", {
	   weekday: "long",
	   day: "numeric",
	   month: "short"
	});

	var prevButton = document.getElementById("prev");
	var nextButton = document.getElementById("next");

	prevButton.onclick = function changeMonthPrev() {
	   currentDate = new Date(currentDate.getFullYear(), currentDate.getMonth() - 1);
	   createCalendar(currentDate, "left");
	   todayDayName.innerHTML = currentDate.toLocaleString("ko-KR", {
		      weekday: "long",
		      day: "numeric",
		      month: "short"
		   });
	}
	nextButton.onclick = function changeMonthNext() {
	   currentDate = new Date(currentDate.getFullYear(), currentDate.getMonth() + 1);
	   createCalendar(currentDate, "right");
	   todayDayName.innerHTML = currentDate.toLocaleString("ko-KR", {
		      weekday: "long",
		      day: "numeric",
		      month: "short"
		   });
	}

	function addEvent(title, desc) {
	   if (!globalEventObj[selectedDate.toDateString()]) {
	      globalEventObj[selectedDate.toDateString()] = {};
	   }
	   globalEventObj[selectedDate.toDateString()][title] = desc;
	}

	function showEvents() {
		// 측면 표시줄 컨테이너 선택
	   let sidebarEvents = document.getElementById("sidebarEvents");
	// 선택된 날짜와 관련된 이벤트를 globalEventObj에서 검색
	   let objWithDate = globalEventObj[selectedDate.toDateString()];
	// 측면 내용 지우기
	   sidebarEvents.innerHTML = "";

	// 선택된 날짜에 이벤트가 있는지 확인
	   if (objWithDate) {
	      let eventsCount = 0;
	   // 선택된 날짜의 각 이벤트에 대해 반복
	      for (key in globalEventObj[selectedDate.toDateString()]) {
	    	// 각 이벤트에 대한 컨테이너 생성
	         let eventContainer = document.createElement("div");
	         eventContainer.className = "eventCard";
	      // 이벤트 헤더를 위한 요소 생성
	         let eventHeader = document.createElement("div");
	         eventHeader.className = "eventCard-header";
	      // 이벤트 설명을 위한 요소 생성
	         let eventDescription = document.createElement("div");
	         eventDescription.className = "eventCard-description";
	      // 이벤트 헤더에 이벤트 제목 추가
	         eventHeader.appendChild(document.createTextNode(key));
	         eventContainer.appendChild(eventHeader);
	      // 이벤트 설명에 이벤트 세부 정보 추가
	         eventDescription.appendChild(document.createTextNode(objWithDate[key]));
	         eventContainer.appendChild(eventDescription);
	      // 이벤트에 대한 표시 생성
	         let markWrapper = document.createElement("div");
	         markWrapper.className = "eventCard-mark-wrapper";
	         let mark = document.createElement("div");
	         mark.classList = "eventCard-mark";
	         markWrapper.appendChild(mark);
	         eventContainer.appendChild(markWrapper);
	      // 측면에 이벤트 컨테이너 추가
	         sidebarEvents.appendChild(eventContainer);
	      // 이벤트 수 증가
	         eventsCount++;
	      }
	   // 선택된 날짜에 대한 이벤트 수를 나타내는 메시지 업데이트
	      let emptyFormMessage = document.getElementById("emptyFormTitle");
	      emptyFormMessage.innerHTML = `${eventsCount} events now`;
	   } else {
		// 선택된 날짜에 이벤트가 없는 경우 메시지 표시
	      let emptyMessage = document.createElement("div");
	      emptyMessage.className = "empty-message";
	      emptyMessage.innerHTML = "일정이 없습니다.";
	      sidebarEvents.appendChild(emptyMessage);
	   // 선택된 날짜에 이벤트가 없음을 나타내는 메시지 업데이트
	      let emptyFormMessage = document.getElementById("emptyFormTitle");
	      emptyFormMessage.innerHTML = "지금은 일정이 없습니다.";
	   }
	}

	gridTable.onclick = function (e) {
		// 클릭된 요소가 "col" 클래스를 가지고 있지 않거나 "empty-day" 클래스를 가지고 있다면
	   if (!e.target.classList.contains("col") || e.target.classList.contains("empty-day")) {
	      return;
	   }
	// 선택된 날짜 블록이 이미 존재한다면 실행
	   if (selectedDayBlock) {
		// 선택된 날짜 블록이 파란색이고 "lighten-3" 클래스를 가지고 있다면 실행
	      if (selectedDayBlock.classList.contains("blue") && selectedDayBlock.classList.contains("lighten-3")) {
	    	// 선택된 날짜 블록에서 파란색과 "lighten-3" 클래스를 제거
	         selectedDayBlock.classList.remove("blue");
	         selectedDayBlock.classList.remove("lighten-3");
	      }
	   }
	   selectedDayBlock = e.target;
	   selectedDayBlock.classList.add("blue");
	   selectedDayBlock.classList.add("lighten-3");

	   selectedDate = new Date(currentDate.getFullYear(), currentDate.getMonth(), parseInt(e.target.innerHTML));

	   showEvents();

	   document.getElementById("eventDayName").innerHTML = selectedDate.toLocaleString("ko-KR", {
	      month: "long",
	      day: "numeric",
	      year: "numeric"
	   });

	}

	var changeFormButton = document.getElementById("changeFormButton");
	var addForm = document.getElementById("addForm");
	changeFormButton.onclick = function (e) {
	   addForm.style.top = 0;
	}

	var cancelAdd = document.getElementById("cancelAdd");
	cancelAdd.onclick = function (e) {
	   addForm.style.top = "100%";
	   let inputs = addForm.getElementsByTagName("input");
	   for (let i = 0; i < inputs.length; i++) {
	      inputs[i].value = "";
	   }
	   let labels = addForm.getElementsByTagName("label");
	   for (let i = 0; i < labels.length; i++) {
	      labels[i].className = "";
	   }
	}

	var addEventButton = document.getElementById("addEventButton");
	addEventButton.onclick = function (e) {
	   let title = document.getElementById("eventTitleInput").value.trim();
	   let desc = document.getElementById("eventDescInput").value.trim();

	   if (!title || !desc) {
	      document.getElementById("eventTitleInput").value = "";
	      document.getElementById("eventDescInput").value = "";
	      let labels = addForm.getElementsByTagName("label");
	      for (let i = 0; i < labels.length; i++) {
	         labels[i].className = "";
	      }
	      return;
	   }

	   addEvent(title, desc);
	   showEvents();

	   if (!selectedDayBlock.querySelector(".day-mark")) {
	      selectedDayBlock.appendChild(document.createElement("div")).className = "day-mark";
	   }

	   let inputs = addForm.getElementsByTagName("input");
	   for (let i = 0; i < inputs.length; i++) {
	      inputs[i].value = "";
	   }
	   let labels = addForm.getElementsByTagName("label");
	   for (let i = 0; i < labels.length; i++) {
	      labels[i].className = "";
	   }

	}</script>
	<%@ include file="../common/foot.jspf"%>