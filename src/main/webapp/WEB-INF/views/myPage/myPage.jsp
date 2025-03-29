<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.project.health.domain.Bmi"%>
<%@page import="com.project.health.domain.Exercise"%>
<%@page import="com.project.health.domain.ExercisePart"%>
<%@page import="com.project.health.domain.ExerciseCategory"%>
<%@page import="com.project.health.domain.ExerciseFinal"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fitness Tracker - My Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.css" rel="stylesheet">
    <style>
         :root {
            --primary: #4CAF50;
            --dark-bg: #121212;
            --card-bg: #1e1e1e;
            --text-light: #ffffff;
            --text-muted: #888888;
        }
        
        body {
            background-color: var(--dark-bg);
            color: var(--text-light);
            font-family: 'Roboto', sans-serif;
        }
        
        .profile-header {
            background: linear-gradient(135deg, #1e1e1e 0%, #2c3e50 100%);
            border-radius: 15px;
            padding: 2rem;
            margin-bottom: 2rem;
            box-shadow: 0 4px 20px rgba(0,0,0,0.3);
            display: flex;
            align-items: center;
        }
        
        /* 수정된 프로필 이미지 스타일 */
        .profile-img-wrapper {
            width: 220px;
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-right: 2rem;
        }
        
        .profile-img {
            width: 180px;
            height: 220px;
            border-radius: 10px;
            object-fit: cover;
            border: 4px solid var(--primary);
            box-shadow: 0 4px 15px rgba(0,0,0,0.3);
            margin-bottom: 1rem;
        }
        
        .profile-upload-btn {
            background-color: rgba(76, 175, 80, 0.2);
            color: var(--primary);
            border: 1px solid var(--primary);
            padding: 0.5rem 1rem;
            border-radius: 5px;
            cursor: pointer;
            font-size: 0.9rem;
            transition: all 0.3s ease;
            width: 80%;
            text-align: center;
        }
        
        .profile-upload-btn:hover {
            background-color: var(--primary);
            color: white;
        }
        
        .profile-info {
            flex: 1;
        }
        
        .profile-stats {
            display: flex;
            gap: 2rem;
            margin-top: 1.5rem;
        }
        
        .stat-card {
            background-color: var(--card-bg);
            border-radius: 12px;
            padding: 1.5rem;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }
        
        .stat-value {
            font-size: 2rem;
            font-weight: bold;
            color: var(--primary);
            margin-bottom: 0.5rem;
        }
        
        .stat-label {
            color: var(--text-muted);
            font-size: 0.9rem;
        }
        
        .bmi-graph-container {
            background-color: var(--card-bg);
            border-radius: 12px;
            padding: 1.5rem;
            height: 100%;
        }
        
        .custom-routine-container {
            background-color: var(--card-bg);
            border-radius: 12px;
            padding: 1.5rem;
            height: 100%;
        }
        
        .routine-card {
            background-color: rgba(76, 175, 80, 0.1);
            border-left: 4px solid var(--primary);
            border-radius: 8px;
            padding: 1rem;
            margin-bottom: 1rem;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .routine-card:hover {
            background-color: rgba(76, 175, 80, 0.2);
            transform: translateX(5px);
        }
        
        .btn-primary {
            background-color: var(--primary);
            border-color: var(--primary);
        }
        
        .btn-outline-primary {
            color: var(--primary);
            border-color: var(--primary);
        }
        
        .btn-outline-primary:hover {
            background-color: var(--primary);
            color: white;
        }
    </style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
    <div class="container py-5">
        <!-- 수정된 프로필 헤더 섹션 -->
        <div class="profile-header">
            <!-- 프로필 이미지 영역 -->
            <div class="profile-img-wrapper">
            	<c:choose>
            		<c:when test="${user.profile ne null}">
            			<img src="${pageContext.request.contextPath}/resources/img/profile/${user.profile}.jpg" class="profile-img" alt="프로필 사진" id="profileImage">
            		</c:when>
            		<c:otherwise>
            			<img src="${pageContext.request.contextPath}/resources/img/profile/standard_profile.jpg" class="profile-img" alt="프로필 사진" id="profileImage">
            		</c:otherwise>
            	</c:choose>
                <label for="profileUpload" class="profile-upload-btn">프로필 사진 변경</label>
                <input type="file" id="profileUpload" accept="image/*" style="display:none;" onchange="handleProfileUpload(event)">
            </div>
            
            <!-- 프로필 정보 영역 -->
            <div class="profile-info">
            	<h1 class="mb-2" style="color : white;">@${user.userId}</h1>
                <h2 class="mb-2">${user.name}</h2>
                <p class="text mb-4" style="color : gray;">${user.email}</p>
                <div class="profile-stats">
                    <div>
                        <div class="stat-value">1000일</div>
                        <div class="stat-label">운동 일수</div>
                    </div>
                </div>
                <div class="profile-stats">
                	<div>
                        <div class="stat-value">365000시간</div>
                        <div class="stat-label">총 운동 시간</div>
                    </div>
                </div>
            </div>
            
            <!-- 신체 정보 영역 -->
            <div class="body-stats">
               <!-- BMI 표 -->
                   <div class="mt-4">
                       <div class="table-responsive">
                           <table class="table table-dark table-striped table-sm">
                               <thead>
                                   <tr>
                                       <th>날짜</th>
                                       <th>키 (cm)</th>
                                       <th>몸무게 (kg)</th>
                                       <th>BMI</th>
                                       <th>비만도</th>
                                   </tr>
                               </thead>
                               <tbody>
                                   <c:forEach var="bmi" items="${bmiList}">
                                       <tr>
                                           <td>${bmi.date}</td>
                                           <td>${bmi.height}</td>
                                           <td>${bmi.weight}</td>
                                           <td>${bmi.bmi}</td>
                                           <td>${bmi.state}</td>
                                       </tr>
                                   </c:forEach>
                               </tbody>
                           </table>
                       </div>
                   </div>
            </div>
        </div>
        
        <!-- BMI 그래프 + 커스텀 루틴 섹션 -->
        <div class="row mb-5">
            <!-- BMI 그래프 영역 -->
            <div class="col-md-8">
                <div class="bmi-graph-container">
                    <h4 class="mb-4">BMI 추이</h4>
                    
                    <!-- 필터링 UI -->
                    <div class="filter-card mb-4">
                        <div class="row">
                            <div class="col-md-3">
                                <label class="form-label">년도 선택</label>
                                <select id="yearFilter" class="form-select">
                                    <option value="all">전체 년도</option>
                                    <c:forEach var="year" items="${yearList}">
                                        <option value="${year}">${year}년</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-3">
                                <label class="form-label">월 선택</label>
                                <select id="monthFilter" class="form-select" disabled>
                                    <option value="all">전체 월</option>
                                </select>
                            </div>
                            <div class="col-md-3">
                                <label class="form-label">일 선택</label>
                                <select id="dayFilter" class="form-select" disabled>
                                    <option value="all">전체 일</option>
                                </select>
                            </div>
                            <div class="col-md-3 d-flex align-items-end">
                                <button id="filterBtn" class="btn btn-primary w-100">적용</button>
                            </div>
                        </div>
                    </div>
                    
                    <!-- BMI 차트 -->
                    <canvas id="bmiChart" height="300"></canvas>
                    
                </div>
            </div>
            <!-- 커스텀 루틴 영역 -->
            <div class="col-md-4">
                <div class="custom-routine-container">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h4>나의 운동 루틴</h4>
                        <button class="btn btn-sm btn-outline-primary" data-bs-toggle="modal" data-bs-target="#addRoutineModal">
                            + 추가
                        </button>
                    </div>
                    
                    <div id="routineList">
                        <div class="routine-card">
                            <h5>아침 근력운동</h5>
                            <p class="text-muted mb-1">푸쉬업 3세트, 스쿼트 3세트, 플랭크 1분</p>
                            <small class="text-primary">월, 수, 금</small>
                        </div>
                        <div class="routine-card">
                            <h5>저녁 유산소</h5>
                            <p class="text-muted mb-1">러닝 30분, 줄넘기 10분</p>
                            <small class="text-primary">화, 목, 토</small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 루틴 추가 모달 -->
    <div class="modal fade" id="addRoutineModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" style="background-color: var(--card-bg);">
                <div class="modal-header">
                    <h5 class="modal-title">운동 루틴 추가</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="routineForm">
                        <div class="mb-3">
                            <label class="form-label">루틴 이름</label>
                            <input type="text" class="form-control" style="background-color: #333; color: white;">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">운동 내용</label>
                            <textarea class="form-control" rows="3" style="background-color: #333; color: white;"></textarea>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">요일 선택</label>
                            <div class="d-flex flex-wrap">
                                <div class="form-check me-3">
                                    <input class="form-check-input" type="checkbox" id="monday">
                                    <label class="form-check-label" for="monday">월</label>
                                </div>
                                <!-- 다른 요일 체크박스들... -->
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-primary">저장</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
$(document).ready(function() {
    // 서버에서 전달받은 BMI 데이터
    const rawBmiData = [
        <c:forEach var="bmi" items="${bmiList}">
        {
            dateString: '${bmi.date}', // "2024-12-21 13:47:57"
            height: ${bmi.height},
            weight: ${bmi.weight},
            bmi: ${bmi.bmi},
            state: '${bmi.state}'
        },
        </c:forEach>
    ];

    // Date 객체로 변환하고 년, 월, 일 정보 추가
    const bmiData = rawBmiData.map(item => {
        const dateParts = item.dateString.split(' ')[0].split('-');
        const timeParts = item.dateString.split(' ')[1].split(':');
        
        const dateObj = new Date(
            parseInt(dateParts[0]), // 년
            parseInt(dateParts[1]) - 1, // 월 (0-based)
            parseInt(dateParts[2]), // 일
            parseInt(timeParts[0]), // 시
            parseInt(timeParts[1]), // 분
            parseInt(timeParts[2])  // 초
        );
        
        return {
            date: dateObj,
            year: dateObj.getFullYear(),
            month: dateObj.getMonth() + 1, // 1-12로 조정
            day: dateObj.getDate(),
            height: item.height,
            weight: item.weight,
            bmi: item.bmi,
            state: item.state
        };
    });

    // 년도 필터 초기화
    function initYearFilter() {
        const yearSet = new Set();
        bmiData.forEach(item => yearSet.add(item.year));
        
        const sortedYears = Array.from(yearSet).sort((a, b) => b - a); // 최신년도 먼저
        $('#yearFilter').empty().append('<option value="all">전체 년도</option>');
        
        sortedYears.forEach(year => {
            $('#yearFilter').append(`<option value="${year}">${year}년</option>`);
        });
    }

    // 월 필터 업데이트
    function updateMonthFilter() {
        const selectedYear = $('#yearFilter').val();
        $('#monthFilter').prop('disabled', selectedYear === 'all');
        
        if (selectedYear === 'all') {
            $('#monthFilter').empty().append('<option value="all">전체 월</option>');
            return;
        }
        
        const monthSet = new Set();
        bmiData.filter(item => item.year == selectedYear)
               .forEach(item => monthSet.add(item.month));
        
        const sortedMonths = Array.from(monthSet).sort((a, b) => a - b);
        $('#monthFilter').empty().append('<option value="all">전체 월</option>');
        
        sortedMonths.forEach(month => {
            $('#monthFilter').append(`<option value="${month}">${month}월</option>`);
        });
    }

    // 일 필터 업데이트
    function updateDayFilter() {
        const selectedYear = $('#yearFilter').val();
        const selectedMonth = $('#monthFilter').val();
        $('#dayFilter').prop('disabled', selectedMonth === 'all' || selectedYear === 'all');
        
        if (selectedMonth === 'all' || selectedYear === 'all') {
            $('#dayFilter').empty().append('<option value="all">전체 일</option>');
            return;
        }
        
        const daySet = new Set();
        bmiData.filter(item => item.year == selectedYear && item.month == selectedMonth)
               .forEach(item => daySet.add(item.day));
        
        const sortedDays = Array.from(daySet).sort((a, b) => a - b);
        $('#dayFilter').empty().append('<option value="all">전체 일</option>');
        
        sortedDays.forEach(day => {
            $('#dayFilter').append(`<option value="${day}">${day}일</option>`);
        });
    }

    // 차트 업데이트
    function updateChart() {
        const year = $('#yearFilter').val();
        const month = $('#monthFilter').val();
        const day = $('#dayFilter').val();
        
        // 데이터 필터링
        let filteredData = bmiData;
        
        if (year !== 'all') {
            filteredData = filteredData.filter(item => item.year == year);
        }
        if (month !== 'all') {
            filteredData = filteredData.filter(item => item.month == month);
        }
        if (day !== 'all') {
            filteredData = filteredData.filter(item => item.day == day);
        }
        
        // 날짜 형식 결정
        let dateFormat;
        if (day !== 'all') {
            // 일 단위 선택 시: "12월 21일 13:47" 형식
            dateFormat = { month: 'long', day: 'numeric', hour: '2-digit', minute: '2-digit' };
        } else if (month !== 'all') {
            // 월 단위 선택 시: "12월 21일" 형식
            dateFormat = { month: 'long', day: 'numeric' };
        } else if (year !== 'all') {
            // 년 단위 선택 시: "2024년 12월" 형식
            dateFormat = { year: 'numeric', month: 'long' };
        } else {
            // 전체 선택 시: "2024년 12월" 형식
            dateFormat = { year: 'numeric', month: 'long' };
        }
        
        // 차트 데이터 업데이트
        const labels = filteredData.map(item => 
            new Intl.DateTimeFormat('ko-KR', dateFormat).format(item.date)
        );
        const bmiValues = filteredData.map(item => item.bmi);
        
        // 기존 차트가 있으면 업데이트, 없으면 새로 생성
        if (window.bmiChart) {
            window.bmiChart.data.labels = labels;
            window.bmiChart.data.datasets[0].data = bmiValues;
            window.bmiChart.update();
        } else {
            initChart(labels, bmiValues, filteredData);
        }
    }

    // 초기화
    initYearFilter();
    updateMonthFilter();
    updateDayFilter();
    updateChart();
    
    // 이벤트 리스너 등록
    $('#yearFilter').change(function() {
        updateMonthFilter();
        updateDayFilter();
        updateChart();
    });
    
    $('#monthFilter').change(function() {
        updateDayFilter();
        updateChart();
    });
    
    $('#dayFilter, #filterBtn').change(updateChart);
});
</script>

