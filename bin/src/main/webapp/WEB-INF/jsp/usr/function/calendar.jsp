
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="calendar"></c:set>
<%@ include file="../common/head.jspf"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
</head>
<body>
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
	<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500"
		rel="stylesheet">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
		rel="stylesheet">
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


	<div class="mobile-header z-depth-1">

		<div class="row">
			<div class="col-2">
				<a href="#" data-activates="sidebar" class="button-collapse"
					style=""> <i class="material-icons">menu</i>
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
				<div class="empty-message">일정이 없습니다</div>
			</div>
		</div>

		<div class="content-wrapper">
			<div class="container">

				<div class="calendar-wrapper z-depth-2">

					<div class="header-background">
						<div class="calendar-header">

							<a class="prev-button" id="prev"> <i class="material-icons">keyboard_arrow_left</i>
							</a> <a class="next-button" id="next"> <i class="material-icons">keyboard_arrow_right</i>
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
						<form class="addForm" id="addForm"
							action="../function/addSchedule">
							<h4>새 일정</h4>

							<div class="row">
								<div class="input-field col s6">
									<input id="eventTitleInput" type="text" class="validate"
										name="title"> <label for="eventTitleInput">제목</label>
								</div>
								<div class="input-field col s6">
									<input id="eventDescInput" type="text" class="validate"
										name="body"> <label for="eventDescInput">내용</label>
								</div>
							</div>

							<div class="addEventButtons">

								<button class="waves-effect waves-light btn blue lighten-2"
									id="addEventButton" type="submit">추가</button>
								<a class="waves-effect waves-light btn grey lighten-2"
									id="cancelAdd">취소</a>
							</div>

						</form>
					</div>

				</div>

			</div>
		</div>

	</div>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
		integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"
		integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
	<script>
		$(".button-collapse").sideNav();
	</script>
	<script>var calendar = document.getElementById("calendar-table");
	// 테이블 바디
	var gridTable = document.getElementById("table-body");
	var currentDate = new Date();
	var selectedDate = currentDate;
	var selectedDayBlock = null;
	var globalEventObj = {};
	var monthName = currentDate.toLocaleString("ko-KR", { month: "long" }); // 월의 이름을 가져옵니다.
	var yearNum = currentDate.getFullYear(); // 현재 연도를 가져옵니다.
	
	// 헤더에 월과 연도를 나타냅니다.
	document.getElementById("month-name").innerHTML = yearNum+ " " +monthName  ; 
	
	function createCalendar(date, side) {
	    // 전달된 날짜를 현재 날짜로 설정합니다.
	    var currentDate = date;
	    // 해당 월의 첫 번째 날을 가져옵니다.
	    var startDate = new Date(currentDate.getFullYear(), currentDate.getMonth(), 1);

	    // 현재 연도와 월을 가져옵니다.
	    const currentYear = startDate.getFullYear();
	    const currentMonth = startDate.getMonth();
	    // 달력의 제목 요소를 가져옵니다.
	    var monthTitle = document.getElementById("month-name");
	    // 현재 월의 이름을 가져와서 monthName 변수에 저장합니다.
	    var monthName = currentDate.toLocaleString("ko-KR", {
	        month: "long"
	    });
	    // 현재 연도를 가져와서 yearNum 변수에 저장합니다.
	    var yearNum = currentDate.toLocaleString("ko-KR", {
	        year: "numeric"
	    });

	    // 달력의 제목을 설정합니다.
	    monthTitle.innerHTML = yearNum + " " + monthName;

	    // 화면 전환 효과를 적용합니다.
	    if (side == "left") {
	        // 왼쪽 방향으로 전환할 때
	        gridTable.className = "animated fadeOutRight";
	    } else {
	        // 오른쪽 방향으로 전환할 때
	        gridTable.className = "animated fadeOutLeft";
	    }

	    // 일정을 표시할 테이블을 초기화합니다.
	    setTimeout(() => {
	        gridTable.innerHTML = "";

	        var newTr = document.createElement("div");
	        newTr.className = "row";
	        var currentTr = gridTable.appendChild(newTr);

	        // 이전 달의 빈 날짜를 채웁니다.
	        for (let i = 1; i < (startDate.getDay() || 7); i++) {
	            let emptyDivCol = document.createElement("div");
	            emptyDivCol.className = "col empty-day";
	            currentTr.appendChild(emptyDivCol);
	        }

	        // 해당 월의 날짜를 표시합니다.
	        var lastDay = new Date(currentDate.getFullYear(), currentDate.getMonth() + 1, 0);
	        lastDay = lastDay.getDate();

	        for (let i = 1; i <= lastDay; i++) {
	            if (currentTr.children.length >= 7) {
	                currentTr = gridTable.appendChild(addNewRow());
	            }
	            let currentDay = document.createElement("div");
	            currentDay.className = "col";
	            // 선택된 날짜를 표시합니다.
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

	            // 이벤트 마크를 표시합니다.
	            if (globalEventObj[new Date(currentDate.getFullYear(), currentDate.getMonth(), i).toDateString()]) {
	                let eventMark = document.createElement("div");
	                eventMark.className = "day-mark";
	                currentDay.appendChild(eventMark);
	            }

	            currentTr.appendChild(currentDay);
	        }

	        // 다음 달의 빈 날짜를 채웁니다.
	        for (let i = currentTr.getElementsByTagName("div").length; i < 7; i++) {
	            let emptyDivCol = document.createElement("div");
	            emptyDivCol.className = "col empty-day";
	            currentTr.appendChild(emptyDivCol);
	        }

	        // 화면 전환 효과를 적용합니다.
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
	todayDayName.innerHTML = "오늘은 " + currentDate.toLocaleString("ko-KR", {
	    weekday: "long",
	    day: "numeric",
	    month: "short"
	}) + "입니다.";
	// 이전 달로 가는 버튼 
	var prevButton = document.getElementById("prev");
	// 다음 달로 가는 버튼 
	var nextButton = document.getElementById("next");
	// 이전 달로 가는 버튼 클릭 시 함수 실행
	prevButton.onclick = function changeMonthPrev() {
	   currentDate = new Date(currentDate.getFullYear(), currentDate.getMonth() - 1);
	   createCalendar(currentDate, "left");
	   

	    // 이전과 동일한 방식으로 현재 달의 마지막 날짜를 구하고,
	    // 선택된 날짜가 다음 달로 변경되었을 경우, 선택된 날짜를 다음 달의 첫째 날로 변경
	    var lastDayOfCurrentMonth = new Date(currentDate.getFullYear(), currentDate.getMonth() + 1, 0).getDate();
	    if (selectedDate.getDate() > lastDayOfCurrentMonth) {
	        selectedDate.setDate(1);
	    }

	    // 선택된 날짜를 현재 날짜로 설정하여 해당 날짜가 파란색으로 선택되도록 함
	    selectedDate.setFullYear(currentDate.getFullYear());
	    selectedDate.setMonth(currentDate.getMonth());

	   
	}
	// 다음 달로 가는 버튼 클릭 시 함수 실행
	nextButton.onclick = function changeMonthNext() {
	   currentDate = new Date(currentDate.getFullYear(), currentDate.getMonth() + 1);
	   createCalendar(currentDate, "right");
	   
	   // 이전 달로 이동 후, 이전 달의 마지막 날짜로 설정
	    var lastDayOfPrevMonth = new Date(currentDate.getFullYear(), currentDate.getMonth() + 1, 0).getDate();

	    // 만약 이전 달의 마지막 날짜가 선택된 날짜보다 크다면 선택된 날짜를 이전 달의 마지막 날짜로 변경
	    if (selectedDate.getDate() > lastDayOfPrevMonth) {
	        selectedDate.setDate(lastDayOfPrevMonth);
	    }

	    // 선택된 날짜를 현재 날짜로 설정하여 해당 날짜가 파란색으로 선택되도록 함
	    selectedDate.setFullYear(currentDate.getFullYear());
	    selectedDate.setMonth(currentDate.getMonth());
	 
	}

	function addEvent(title, desc) {
	   if (!globalEventObj[selectedDate.toDateString()]) {
	      globalEventObj[selectedDate.toDateString()] = {};
	   }
	   globalEventObj[selectedDate.toDateString()][title] = desc;
	   
	   if (!selectedDayBlock.querySelector(".day-mark")) {
		    selectedDayBlock.appendChild(document.createElement("div")).className = "day-mark";
		}
	}

	/* // 이벤트 클릭 시 실행되는 함수
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
	    // 클릭된 이벤트의 제목과 내용을 가져옵니다.
	    var title = e.target.innerText;
	    var desc = globalEventObj[selectedDate.toDateString()][title];
	    // 네모난 창으로 이벤트의 제목과 내용을 보여줍니다.
	    showEventDetails(title, desc);
	}; */
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
	// 클릭된 요소를 선택된 날짜 블록으로 설정
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
	    var isLoggedIn = ${rq.isLogined() }; // 여기에 로그인 여부를 확인하는 코드를 추가해주세요
	
	addEventButton.onclick = function (e) {
		  // 로그인 상태를 확인하는 코드

	    // 만약 로그인되지 않았다면
	    if (!isLoggedIn) {
	        // 사용자에게 로그인해야 한다는 경고 메시지 표시
	        alert("로그인이 필요합니다.");
	        // 필요한 경우 로그인 페이지로 리다이렉션
	         window.location.href = "/member/login";
	    }
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

	}
	</script>
	<%@ include file="../common/foot.jspf"%>