<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="./layout/top.jsp"%>
<%@include file="./layout/header.jsp"%>
<%@include file="./layout/sidebar.jsp"%>

<link href="/resources/assets/plugins/chartist-js/dist/chartist.min.css" rel="stylesheet">
<link href="/resources/assets/plugins/chartist-js/dist/chartist-init.css" rel="stylesheet">
<link href="/resources/assets/plugins/chartist-plugin-tooltip-master/dist/chartist-plugin-tooltip.css" rel="stylesheet">
<link href="/resources/assets/plugins/morrisjs/morris.css" rel="stylesheet">
<script src="/resources/assets/plugins/morrisjs/morris.min.js"></script>
<script src="/resources/assets/plugins/chartist-js/dist/chartist.min.js"></script>
<!-- <script src="/resources/assets/plugins/chartist-plugin-tooltip-master/dist/chartist-plugin-tooltip.min.js"></script> -->
<script src="/resources/assets/plugins/vectormap/jquery-jvectormap-2.0.2.min.js"></script>
<script src="/resources/assets/plugins/vectormap/jquery-jvectormap-world-mill-en.js"></script>
<script src="/resources/assets/plugins/raphael/raphael-min.js"></script>
<!-- <script src="/resources/js/dashboard2.js"></script> -->
<style>
	.day {
		text-align: left !important;
		padding : 20px 12px;
		border: 1px solid #dee2e6 !important;
	}
	.day_head{
		text-align: center !important;
		border: 1px solid #dee2e6 !important;
	}
	
	.cal_nav {
		display: flex;
		justify-content: center;
		align-items: center;
		font-weight: 700;
		font-size: 48px;
		line-height: 78px;
	}
	
	.cal_nav .year-month {
		width: 300px;
		text-align: center;
		line-height: 1;
	}
	
	.cal_nav .nav {
		display: flex;
		border: 1px solid #333333;
		border-radius: 5px;
	}
	
	.cal_nav .go-prev, .cal_nav .go-next {
		display: block;
		width: 50px;
		height: 78px;
		font-size: 0;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	
	.cal_nav .go-prev::before, .cal_nav .go-next::before {
		content: "";
		display: block;
		width: 20px;
		height: 20px;
		border: 3px solid #000;
		border-width: 3px 3px 0 0;
		transition: border 0.1s;
	}
	
	.cal_nav .go-prev:hover::before, .cal_nav .go-next:hover::before
		{
		border-color: #ed2a61;
	}
	
	.cal_nav .go-prev::before {
		transform: rotate(-135deg);
	}
	
	.cal_nav .go-next::before {
		transform: rotate(45deg);
	}
	
	.cal_wrap {
		padding-top: 40px;
		position: relative;
		margin: 0 auto;
	}
	
	.cal_wrap .days {
		display: flex;
		margin-bottom: 20px;
		padding-bottom: 20px;
		border-bottom: 1px solid #ddd;
	}
	
	.cal_wrap::after {
		top: 368px;
	}
	
	.cal_wrap .day {
		display: flex;
		align-items: center;
		justify-content: center;
		width: calc(100%/ 7);
		text-align: left;
		color: #999;
		font-size: 12px;
		text-align: center;
		border-radius: 5px
	}
	
	.current.today {
		background: rgb(242, 242, 242);
	}
	
	.cal_wrap .dates {
		display: flex;
		flex-flow: wrap;
		height: 290px;
	}
	
	.cal_wrap .day:nth-child(7n -1) {
		color: #3c6ffa;
	}
	
	.cal_wrap .day:nth-child(7n) {
		color: #ed2a61;
	}
	
	.cal_wrap .day.disable {
		color: #ddd;
	}
</style>
<div class="container-fluid">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
					<div class="d-flex flex-wrap">
						<div>
							<h4 class="card-title">연차 캘린더</h4>
							<h6 class="card-subtitle">해당 월에 승인된 연차가 표시됩니다.</h6>
						</div>
						<div class="ml-auto"></div>
					</div>
					<div class="table-responsive m-t-20">
						<div class="cal_nav">
							<a href="javascript:void(0);" class="nav-btn go-prev">prev</a>
							<div class="year-month"></div>
							<a href="javascript:void(0);" class="nav-btn go-next">next</a>
						</div>
						<table class="table nowrap">
							<colgroup>
								<col style="width:14%;">
								<col style="width:14%;">
								<col style="width:14%;">
								<col style="width:14%;">
								<col style="width:14%;">
								<col style="width:14%;">
								<col style="width:14%;">
							</colgroup>
							<thead>
								<tr>
									<th class="day_head">월</th>
									<th class="day_head">화</th>
									<th class="day_head">수</th>
									<th class="day_head">목</th>
									<th class="day_head">금</th>
									<th class="day_head">토</th>
									<th class="day_head">일</th>
								</tr>
							</thead>
							<tbody class="calendar-body"></tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
					<div class="d-flex flex-wrap">
						<div>
							<h4 class="card-title">직원별 연차 건수</h4>
							<h6 class="card-subtitle">직원별 총 연차일수와 잔여일수가 표시됩니다.</h6>
						</div>
						<div class="ml-auto"></div>
					</div>
					<div class="table-responsive m-t-20">
						<table class="table nowrap stylish-table">
							<thead>
								<tr>
									<th>이름</th>
									<th>전체 연차일</th>
									<th>잔여 연차일</th>
									<th>입사일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="i" begin="1" end="5" step="1">
									<tr>
										<td>U.S.A</td>
										<td>11</td>
										<td>10</td>
										<td>2022.06.07</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-6">
			<div class="card">
				<div class="card-body">
					<div class="d-flex flex-wrap">
						<div>
							<h4 class="card-title">연차 신청 내역</h4>
							<h6 class="card-subtitle">연차 승인 대기상태인 신청 내역이 표시됩니다.</h6>
						</div>
						<div class="ml-auto"></div>
					</div>
					<div class="table-responsive m-t-20">
						<table class="table nowrap stylish-table">
							<thead>
								<tr>
									<th>이름</th>
									<th>희망일</th>
									<th>연차구분</th>
									<th>사유</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="i" begin="1" end="5" step="1">
									<tr>
										<td>U.S.A</td>
										<td>2023.03.15</td>
										<td>연차</td>
										<td>병가</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>

		<div class="col-lg-6">
			<div class="card">
				<div class="card-body">
					<div class="d-flex flex-wrap">
						<div>
							<h4 class="card-title">공지사항 목록</h4>
							<h6 class="card-subtitle">높이 맞추기</h6>
						</div>
						<div class="ml-auto"></div>
					</div>
					<div class="table-responsive m-t-20">
						<table class="table nowrap stylish-table">
							<thead>
								<tr>
									<th>제목</th>
									<th>작성일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="i" begin="1" end="5" step="1">
									<tr>
										<td>공지사항 제목</td>
										<td>2023.03.15</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
					<div class="d-flex no-block">
						<h4 class="card-title">Visit From Countries</h4>
						<div class="ml-auto">
							<select class="custom-select">
								<option selected="">January</option>
								<option value="1">February</option>
								<option value="2">March</option>
								<option value="3">April</option>
							</select>
						</div>
					</div>
					<div class="table-responsive m-t-20">
						<table class="table nowrap stylish-table">
							<thead>
								<tr>
									<th>Language</th>
									<th>Vists</th>
									<th>%</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><i class="flag-icon flag-icon-us"></i> <span class="country-name">U.S.A</span></td>
									<td>18,224</td>
									<td>
										<div class="progress">
											<div class="progress-bar bg-danger " role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 50%; height: 6px;">
												<span class="sr-only">50% Complete</span>
											</div>
										</div>
									</td>
									<td>50%</td>
								</tr>
								<tr>
									<td><i class="flag-icon flag-icon-gb"></i> <span class="country-name">U.K</span></td>
									<td>12,347</td>
									<td>
										<div class="progress">
											<div class="progress-bar bg-success " role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 60%; height: 6px;">
												<span class="sr-only">50% Complete</span>
											</div>
										</div>
									</td>
									<td>60%</td>
								</tr>
								<tr>
									<td><i class="flag-icon flag-icon-ca"></i> <span class="country-name">Canada</span></td>
									<td>11,868</td>
									<td>
										<div class="progress">
											<div class="progress-bar bg-info" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 70%; height: 6px;">
												<span class="sr-only">50% Complete</span>
											</div>
										</div>
									</td>
									<td>50%</td>
								</tr>
								<tr>
									<td><i class="flag-icon flag-icon-de"></i> <span class="country-name">Germany</span></td>
									<td>10,346</td>
									<td>
										<div class="progress">
											<div class="progress-bar bg-warning" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 50%; height: 6px;">
												<span class="sr-only">50% Complete</span>
											</div>
										</div>
									</td>
									<td>50%</td>
								</tr>
								<tr>
									<td><i class="flag-icon flag-icon-in"></i> <span class="country-name">India</span></td>
									<td>8,354</td>
									<td>
										<div class="progress">
											<div class="progress-bar bg-inverse" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 80%; height: 6px;">
												<span class="sr-only">50% Complete</span>
											</div>
										</div>
									</td>
									<td>80%</td>
								</tr>
								<tr>
									<td><i class="flag-icon flag-icon-au"></i> <span class="country-name">Australia</span></td>
									<td>7,675</td>
									<td>
										<div class="progress">
											<div class="progress-bar bg-danger " role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 50%; height: 6px;">
												<span class="sr-only">50% Complete</span>
											</div>
										</div>
									</td>
									<td>50%</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			calendarInit();
		});
		/*
		 달력 렌더링 할 때 필요한 정보 목록 

		 현재 월(초기값 : 현재 시간)
		 금월 마지막일 날짜와 요일
		 전월 마지막일 날짜와 요일
		 */

		function calendarInit() {
			// 날짜 정보 가져오기
			var date = new Date(); // 현재 날짜(로컬 기준) 가져오기
			var utc = date.getTime() + (date.getTimezoneOffset() * 60 * 1000); // uct 표준시 도출
			var kstGap = 9 * 60 * 60 * 1000; // 한국 kst 기준시간 더하기
			var today = new Date(utc + kstGap); // 한국 시간으로 date 객체 만들기(오늘)

			var thisMonth = new Date(today.getFullYear(), today.getMonth(), today.getDate());
			// 달력에서 표기하는 날짜 객체

			var currentYear = thisMonth.getFullYear(); // 달력에서 표기하는 연
			var currentMonth = thisMonth.getMonth(); // 달력에서 표기하는 월
			var currentDate = thisMonth.getDate(); // 달력에서 표기하는 일

			// kst 기준 현재시간
			// console.log(thisMonth);

			// 캘린더 렌더링
			renderCalender(thisMonth);

			function renderCalender(thisMonth) {
				var dayNum = 1;

				// 렌더링을 위한 데이터 정리
				currentYear = thisMonth.getFullYear();
				currentMonth = thisMonth.getMonth();
				currentDate = thisMonth.getDate();

				// 이전 달의 마지막 날 날짜와 요일 구하기
				var startDay = new Date(currentYear, currentMonth, 0);
				var prevDate = startDay.getDate();
				var prevDay = startDay.getDay();

				// 이번 달의 마지막날 날짜와 요일 구하기
				var endDay = new Date(currentYear, currentMonth + 1, 0);
				var nextDate = endDay.getDate();
				var nextDay = endDay.getDay();
				
				// 현재 월 표기
				$('.year-month').text(currentYear + '.' + (currentMonth + 1));
				
				// ajax 보낼 데이터
				var schStartDate = currentYear + "-" + ("0"+(parseInt(currentMonth) + 1)).slice(-2) + "-01";
				var schEndDate = currentYear + "-" + ("0"+(parseInt(currentMonth) + 1)).slice(-2) + "-" + ("0" + nextDate).slice(-2);

				$.ajax({
					type : "POST",
					url : "/cms/vacationCalenderInfo.do",
					traditional : true,
					dataType : 'json',
					data : {
						startDate : schStartDate
						, endDate : schEndDate
					},
					success : function(data) {
						console.log(data.vacationList);
						var vacList = data.vacationList;
						// 렌더링 html 요소 생성
						var body = '';

						// 지난달
						for (var i = prevDate - prevDay + 1; i <= prevDate; i++) {
							if(dayNum == 1) body += '<tr style="height: 150px;">';
							body += '<td class="day prev disable"></td>';
							if(dayNum == 7){
								body += '</tr>';
								dayNum = 0;
							}
							dayNum = dayNum + 1;
						}
						
						
						// 이번달
						for (var i = 1; i <= nextDate; i++) {
							if(dayNum == 1) body += '<tr style="height: 150px;">';
							
							if(dayNum == 6){
								body += '<td class="day current" style="color:blue;">' + '<span>' + i + '</span>';
							}else if(dayNum == 7){
								body += '<td class="day current" style="color:red;">' + '<span>' + i + '</span>';
							}else{
								body += '<td class="day current">' + '<span>' + i + '</span>';								
							}
							
							for(var j = 0; j < vacList.length; j++){
								if(vacList[j].VACATION_DATE.slice(-2) == ("0" + i).slice(-2)){
									console.log(vacList[j]);
									body += '<div style="position:relative;">' + vacList[j].MEMBER_NM + ' - ' + vacList[j].VACATION_GB_NM + '</div>';
								}
							}
								
							body += '</td>';
							if(dayNum == 7){
								body += '</tr>';
								dayNum = 0;
							}
							dayNum = dayNum + 1;
						}
						
						
						// 다음달
						for (var i = 1; i <= (7 - nextDay == 7 ? 0 : 7 - nextDay); i++) {
							if(dayNum == 1) body += '<tr style="height: 150px;">';
							body += '<td class="day next disable"></td>'
							if(dayNum == 7){
								body += '</tr>';
								dayNum = 0;
							}
							dayNum = dayNum + 1;
						}

						// 오늘 날짜 표기
//		 				if (today.getMonth() == currentMonth) {
//		 					todayDate = today.getDate();
//		 					var currentMonthDate = document.querySelectorAll('.dates .current');
//		 					currentMonthDate[todayDate - 1].classList.add('today');
//		 				}
						$('.calendar-body').html(body);
						
					},
					error : function(jqXHR, textStatus, errorThrown){
				        alert("문제가 발생하였습니다.\n관리자에게 문의하세요.\n"+ajaxJsonError(jqXHR, textStatus, errorThrown));
				    }
				});
			}
			

			// 이전달로 이동
			$('.go-prev').on('click', function() {
				thisMonth = new Date(currentYear, currentMonth - 1, 1);
				renderCalender(thisMonth);
			});

			// 다음달로 이동
			$('.go-next').on('click', function() {
				thisMonth = new Date(currentYear, currentMonth + 1, 1);
				renderCalender(thisMonth);
			});
		}
	</script>
	<%@include file="./layout/footer.jsp"%>