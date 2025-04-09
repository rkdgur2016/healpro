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
    <script src="../resources/js/jquery_3_7_1.js"></script>
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
        /* 셀렉트 박스 최소 너비 설정 */
		.form-select {
		    min-width: 120px;
		    white-space: nowrap;
		}
		
		/* 모바일 대응 미디어쿼리 */
		@media (max-width: 768px) {
		    .d-flex {
		        flex-wrap: wrap !important;
		    }
		    .form-select {
		        flex-basis: 100% !important;
		    }
		}
		
		/* 추가된 라인 구분을 위한 스타일 */
		.d-flex.mt-2 {
		    border-bottom: 1px dashed #ddd;
		    padding-bottom: 10px;
		}
		
		/* 버튼 위치 조정 */
		#addLineBtn {
		    margin-left: auto;
		    display: block;
		    width: fit-content;
		}
		/* 인덱스 뱃지 스타일 */
		.index-badge {
		    background: #6c757d;
		    color: white;
		    width: 30px;
		    height: 30px;
		    border-radius: 50%;
		    display: flex;
		    align-items: center;
		    justify-content: center;
		    font-weight: bold;
		    flex-shrink: 0;
		}
		
		/* 비활성화 시 회색 처리 */
		select:disabled {
		    background-color: #e9ecef !important;
		    cursor: not-allowed;
		}
		/* 인덱스 뱃지 스타일링 */
		.index-badge {
		    background: #6c757d;
		    color: white;
		    width: 28px;
		    height: 28px;
		    border-radius: 50%;
		    display: flex;
		    align-items: center;
		    justify-content: center;
		    flex-shrink: 0;
		}
		
		/* 라인 구분선 */
		.line:not(:last-child) {
		    border-bottom: 1px solid #dee2e6;
		    padding-bottom: 10px;
		}
		/* ID 충돌 방지 */
		.line-container select { 
		    flex: 1; 
		    min-width: 120px;
		}
		
		/* 인덱스 스타일 유지 */
		.index-badge {
		    background: #6c757d;
		    width: 30px;
		    height: 30px;
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
                        <label class="form-label">루틴명</label>
                        <input type="text" class="form-control" id="routineName" style="background-color: #333; color: white;" required>
                    </div>
                    <div class="card-body">
					    <h6 class="card-title text-center">나의 운동 리스트 만들기</h6>
					    <!-- 버튼 그룹 -->
					    <div class="d-flex justify-content-between mb-3">
					        <button id="confirmBtn" class="btn btn-success">결정</button>
					        <button id="addLineBtn" class="btn btn-primary" type="button">+ 라인 추가</button>
					    </div>
					    <!-- Flex 컨테이너 추가 -->
					     <div id="line-container" class="d-flex gap-2 w-100 align-items-center mb-2">
        					<span class="index-badge">1</span>
					        <select id="exercise_category" class="form-select flex-grow-1">
					            <option value="" hidden>운동 카테고리를 선택하세요</option>
					            <c:forEach var="exerciseCategory" items="${exerciseCategory}">
					                <option value="${exerciseCategory.id}">${exerciseCategory.name}</option>
					            </c:forEach>
					        </select>
						        <select id="exercise_part" class="form-select flex-grow-1 exercise_part" style="display:none"></select>
						        <select id="exercise" class="form-select flex-grow-1 exercise" style="display:none"></select>
						    </div>
						<!-- 추가 라인 위치 -->
					    <div id="dynamicLines"></div>
					    <!-- 선택된 운동 리스트 -->
					    <ul id="exerciseList" class="list-group mt-2"></ul>
					</div>
                    <div class="mb-3">
                        <label class="form-label">요일 선택</label>
                        <div class="d-flex flex-wrap gap-2" id="daySelection">
                            <button type="button" class="btn btn-outline-primary day-btn" data-day="mon">월</button>
                            <button type="button" class="btn btn-outline-primary day-btn" data-day="tue">화</button>
                            <button type="button" class="btn btn-outline-primary day-btn" data-day="wed">수</button>
                            <button type="button" class="btn btn-outline-primary day-btn" data-day="thu">목</button>
                            <button type="button" class="btn btn-outline-primary day-btn" data-day="fri">금</button>
                            <button type="button" class="btn btn-outline-primary day-btn" data-day="sat">토</button>
                            <button type="button" class="btn btn-outline-primary day-btn" data-day="sun">일</button>
                        </div>
                        <input type="hidden" id="selectedDays" name="selectedDays">
                    </div>
					</div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                <button type="button" class="btn btn-primary" id="saveRoutineBtn">저장</button>
            </div>
        </div>
    </div>
</div>

</body>
<jsp:include page="../footer.jsp"></jsp:include>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
document.addEventListener("DOMContentLoaded", function(){
	
    const selectCategoryBtn = document.querySelector("#exercise_category");
	const selectPartBtn = document.querySelector("#exercise_part");
	const exerciseBtn = document.querySelector("#exercise");
	
	selectCategoryBtn.addEventListener('change', function(event){
		console.log("selectCategoryBtn click");
		categoryOption = event.target.value
		console.log("option value : " + categoryOption);
		selectCategory(categoryOption);
	});
	
	selectPartBtn.addEventListener('change', function(event){
		console.log("selectPartBtn click");
		partOption = event.target.value
		console.log("option value : " + partOption);
		selectPart(partOption);
	});
	
	
	function selectPart(partOption) {
		if (categoryOption !== null) {
			$.ajax({
	             type: "POST", 
	             url:"/health/main/selectPart.do",
	             async:"true",
	             dataType:"html",
	             data:{
	                 "id" : partOption
	             },             	 
	             success:function(response){//통신 성공
	                 console.log(" 통신 성공 : " + response);
	             	
	             	// exercise_part <select>에 동적으로 옵션 추가
	                 const exerciseSelect = document.querySelector("#exercise");
	                 exerciseSelect.innerHTML = ""; // 기존 옵션 초기화

	                 // 기본 옵션 추가
	                 const defaultOption = document.createElement("option");
	                 defaultOption.value = "";
	                 defaultOption.textContent = "운동 종류를 선택하세요.";
	                 exerciseSelect.appendChild(defaultOption);

	                 // 응답 데이터에서 exercisePart를 이용하여 옵션 추가
	                 const parsingData = JSON.parse(response)
	                 parsingData.forEach(function (exercise) {
	                     const option = document.createElement("option");
	                     option.value = exercise.id; 
	                     option.textContent = exercise.name; 
	                     exerciseSelect.appendChild(option);
	                 });

	                 // exercise_part <select>를 표시
	                 exerciseSelect.style.display = "block";
	                 
	                 
		         },
	             error:function(response){//실패시 처리
	                 console.log("통신 실패 :"+response.text);
	                 alert("통신에 실패했습니다.");
	             }
	         });
			
			 
		} else {
		  alert("운동 부위를 선택해주세요.");
		}
	}

	function selectCategory(categoryOption) {
		
		if (categoryOption !== null) {
			$.ajax({
	             type: "POST", 
	             url:"/health/main/selectCategory.do",
	             async:"true",
	             dataType:"html",
	             data:{
	                 "id" : categoryOption
	             },             	 
	             success:function(response){//통신 성공
	                 console.log(" 통신 성공 : " + response);
	             	
	             	// exercise_part <select>에 동적으로 옵션 추가
	                 const exercisePartSelect = document.querySelector("#exercise_part");
	                 exercisePartSelect.innerHTML = ""; // 기존 옵션 초기화

	                 // 기본 옵션 추가
	                 const defaultOption = document.createElement("option");
	                 defaultOption.value = "";
	                 defaultOption.textContent = "운동 부위를 선택하세요.";
	                 exercisePartSelect.appendChild(defaultOption);

	                 // 응답 데이터에서 exercisePart를 이용하여 옵션 추가
	                 const parsingData = JSON.parse(response)
	                 parsingData.forEach(function (exercisePart) {
	                     const option = document.createElement("option");
	                     option.value = exercisePart.id; // ExercisePart의 id 사용
	                     option.textContent = exercisePart.name; // ExercisePart의 name 사용
	                     exercisePartSelect.appendChild(option);
	                 });

	                 // exercise_part <select>를 표시
	                 exercisePartSelect.style.display = "block";
	                 
		         },
	             error:function(response){//실패시 처리
	                 console.log("통신 실패 :"+response.text);
	                 alert("통신에 실패했습니다.");
	             }
	         });
			
			 
		} else {
		  alert("카테고리를 선택해주세요.");
		}
		
	}
	
	
	const addRoutineModal = document.getElementById('addRoutineModal');

    // Bootstrap 5 모달 이벤트 리스너
    addRoutineModal.addEventListener('show.bs.modal', function () {

        // 1. 루틴명 초기화
        document.getElementById('routineName').value = '';

        // 2. 동적으로 추가된 라인 제거
        document.getElementById('dynamicLines').innerHTML = '';

        // 3. index-badge 초기화
        const indexBadge = document.querySelector('#line-container .index-badge');
        if (indexBadge) indexBadge.textContent = '1';

        // 4. select 초기화
        const selects = document.querySelectorAll('#line-container select');
        selects.forEach((select, index) => {
            select.value = '';
            // 첫 번째만 표시, 나머지는 숨김
            select.style.display = (index === 0) ? 'block' : 'none';
        });

        // 5. 선택된 요일 초기화
        document.querySelectorAll('.day-btn').forEach(btn => {
            btn.classList.remove('active');
        });
        document.getElementById('selectedDays').value = '';

        // 6. 운동 리스트 초기화
        document.getElementById('exerciseList').innerHTML = '';

        // 7. 라인 수 초기화
        if (typeof lineCount !== 'undefined') {
            lineCount = 1;
        }

    });
	
    // 루틴 추가 라인 증가 함수 addLineBtn
	let lineCount = 1;
	const MAX_LINES = 5;

	const addBtn = document.getElementById("addLineBtn");
	
    addBtn.addEventListener("click", function () {
        if (lineCount >= MAX_LINES) {
            alert("최대 " + MAX_LINES + "개까지 추가 가능");
            return;
        }

        let originalLine = document.getElementById("line-container");
        let newLine = originalLine.cloneNode(true); // 깊은 복사
        lineCount++;

        // 고유 ID 설정
        const newCategory = newLine.querySelector("#exercise_category");
        const newPart = newLine.querySelector("#exercise_part");
        const newExercise = newLine.querySelector("#exercise");

        if (newCategory) {
            newCategory.id = "exercise_category_" + lineCount;
        }
        if (newPart) {
            newPart.id = "exercise_part_" + lineCount;
            newPart.style.display = "none";
        }
        if (newExercise) {
            newExercise.id = "exercise_" + lineCount;
            newExercise.style.display = "none";
        }

        // 인덱스 뱃지 갱신
		const badge = newLine.querySelector(".index-badge");
        if (badge) {
            badge.textContent = lineCount;
        }

        // select 초기화
        const selects = newLine.querySelectorAll("select");
        for (var i = 0; i < selects.length; i++) {
            selects[i].value = '';
            selects[i].style.display = (i === 0) ? 'block' : 'none';
        }

        // 이벤트 재바인딩 (운동 카테고리 선택 시 운동 부위 표시)
        const boundCategory = newLine.querySelector("#exercise_category_" + lineCount);
        if (boundCategory) {
            boundCategory.addEventListener("change", function () {
                let next = this.nextElementSibling;
                if (next) {
                    next.style.display = "block";
                }
            });
        }

        // DOM에 추가
        const container = document.getElementById("dynamicLines");
        if (container) {
            container.appendChild(newLine);
        }
    });

});

</script>

