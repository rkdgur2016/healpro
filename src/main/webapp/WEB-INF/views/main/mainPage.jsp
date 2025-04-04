<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.project.health.domain.Bmi"%>
<%@page import="com.project.health.domain.Exercise"%>
<%@page import="com.project.health.domain.ExercisePart"%>
<%@page import="com.project.health.domain.ExerciseCategory"%>
<%@page import="com.project.health.domain.ExerciseFinal"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>건강관리 웹사이트</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="../resources/js/jquery_3_7_1.js"></script>
  <script src="../resources/js/essential.js"></script>
  <style>
	  body {
	    background-color: #121212;
	    color: #ffffff;
	    font-family: 'Roboto', sans-serif;
	  }
	  .navbar {
	    background-color: #1e1e1e;
	    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
	  }
	  .navbar-brand, .nav-link {
	    color: #ffffff !important;
	  }
	  .nav-link:hover {
	    color: #4CAF50 !important;
	  }
	  .btn-primary {
	    background-color: #4CAF50;
	    border-color: #4CAF50;
	  }
	  .btn-primary:hover {
	    background-color: #45a049;
	    border-color: #45a049;
	  }
	  .btn-secondary {
	    background-color: #333333;
	    border-color: #333333;
	  }
	  .btn-secondary:hover {
	    background-color: #2b2b2b;
	    border-color: #2b2b2b;
	  }
	  .card {
	    background-color: #1e1e1e;
	    border: none;
	    border-radius: 10px;
	    box-shadow: 0 4px 6px rgba(0,0,0,0.1);
	    margin-bottom: 20px;
	  }
	  .card-title {
	    color: #4CAF50;
	    font-weight: bold;
	  }
	  .form-control {
	    background-color: #333333;
	    border: 1px solid #444444;
	    color: #ffffff;
	  }
	  .form-control:focus {
	    background-color: #3a3a3a;
	    border-color: #4CAF50;
	    box-shadow: 0 0 0 0.2rem rgba(76, 175, 80, 0.25);
	  }
	  .result {
	    color: #4CAF50;
	    font-weight: bold;
	  }
	  #timerDisplay {
	    color: #4CAF50;
	    font-size: 2.5rem;
	  }
	  #timerStatus {
	    color: #888888;
	  }
	  .footer {
	    background-color: #1e1e1e;
	    color: #888888;
	    text-align: center;
	    padding: 20px;
	    margin-top: 50px;
	  }
	  .section-title {
	    color: #4CAF50;
	    font-size: 2rem;
	    font-weight: bold;
	    text-align: center;
	    margin-bottom: 20px;
	  }
	  .section-description {
	    color: #888888;
	    text-align: center;
	    font-size: 1rem;
	    margin-bottom: 30px;
	  }
	  .table-responsive {
	  max-height: 300px;
	  overflow-y: auto;
	}
	
	.table {
	  font-size: 0.8rem;
	  margin-bottom: 0;
	}
	
	.table-dark {
	  color: #fff;
	  background-color: #1e1e1e;
	}
	
	.table-dark th,
	.table-dark td {
	  border-color: #2c2c2c;
	}
	
	.table-striped > tbody > tr:nth-of-type(odd) {
	  background-color: rgba(255, 255, 255, 0.05);
	}
	
	/* 스크롤바 스타일링 */
	.table-responsive::-webkit-scrollbar {
	  width: 8px;
	}
	
	.table-responsive::-webkit-scrollbar-track {
	  background: #1e1e1e;
	}
	
	.table-responsive::-webkit-scrollbar-thumb {
	  background-color: #4CAF50;
	  border-radius: 4px;
	}
	#height::placeholder, #weight::placeholder, #minutes::placeholder, #seconds::placeholder, #reps::placeholder {
	  color: white;
	  font-style: italic;
	}
	.bmi-scale {
  display: flex;
  justify-content: space-between;
  margin-bottom: 10px;
  position: relative;
  height: 30px;
  background: linear-gradient(to right, #4CAF50, #FFC107, #FF5722, #F44336);
  border-radius: 15px;
}

.bmi-category {
  text-align: center;
  padding: 5px 0;
  position: relative;
}

.bmi-label {
  font-size: 0.8rem;
  font-weight: bold;
  color: #fff;
  text-shadow: 1px 1px 1px rgba(0,0,0,0.5);
}

.bmi-range {
  font-size: 0.7rem;
  color: #fff;
  text-shadow: 1px 1px 1px rgba(0,0,0,0.5);
}

.bmi-indicator {
  width: 0;
  height: 0;
  border-left: 10px solid transparent;
  border-right: 10px solid transparent;
  border-top: 10px solid #fff;
  position: absolute;
  top: -5px;
  left: 50%;
  transform: translateX(-50%);
  transition: left 0.3s ease;
}


	</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
  	<div class="container mt-4">
    <div class="row">
        <!-- 첫 번째 열: BMI 계산기, BMI 지수, BMI 기록 -->
        <div class="col-md-4">
            <!-- BMI 계산기 -->
            <div class="card mb-3">
                <div class="card-body">
                    <h6 class="card-title text-center">BMI 계산기</h6>
                    <div class="row g-1">
                        <div class="col-6">
                            <input type="number" id="height" class="form-control" placeholder="키(cm)">
                        </div>
                        <div class="col-6">
                            <input type="number" id="weight" class="form-control" placeholder="몸무게(kg)">
                        </div>
                    </div>
                    <div class="d-flex justify-content-between mt-2">
                        <input type="button" class="btn btn-primary btn-sm" id="calculateBMI" value="계산">
                        <input type="button" class="btn btn-secondary btn-sm" id="saveBMI" value="기록">
                    </div>
                    <div id="bmiResult" class="result mt-2">BMI : <a id="bmiResultA"></a></div>
                    <div id="BMI_category" class="result mt-2">비만도 : <a id="BMI_categoryA"></a></div>
                </div>
            </div>

            <!-- BMI 지수 -->
            <div class="card mb-3">
                <div class="card-body">
                    <h6 class="card-title text-center">BMI 지수</h6>
                    <div class="bmi-scale">
                        <!-- BMI 지표 표시 -->
                        <div id="bmiIndicator" class="bmi-indicator"></div>
                        <!-- 범위 표시 -->
                        <div class="bmi-category"><span>저체중</span><br><small>&lt; 18.5</small></div>
                        <div class="bmi-category"><span>정상</span><br><small>18.5 - 23.0</small></div>
                        <div class="bmi-category"><span>과체중</span><br><small>23 - 25</small></div>
                        <div class="bmi-category"><span>비만</span><br><small>&ge; 25</small></div>
                    </div>
                </div>
            </div>

            <!-- BMI 기록 -->
            <div class="card">
                <div class="card-body">
                    <h6 class="card-title text-center">BMI 기록</h6>
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
                            <!-- 서버에서 데이터를 받아오는 부분 -->
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

        <!-- 두 번째 열: 운동 이미지와 추천 운동 리스트 -->
        <div class="col-md-4">
                       <!-- 추천 운동 리스트 -->
            <div class="card">
                <div class="card-body">
                    <h6 class="card-title text-center">추천 운동 리스트</h6>
                    <!-- 운동 카테고리 선택 -->
                    <select id="exercise_category" class="form-select mb-2">
                        <option value="" hidden>운동 카테고리를 선택하세요</option>
                        <!-- 서버에서 가져온 카테고리 리스트 -->
                        <c:forEach var="exerciseCategory" items="${exerciseCategory}">
                            <option value="${exerciseCategory.id}">${exerciseCategory.name}</option>
                        </c:forEach>
                    </select>

                    <!-- 운동 부위 선택 -->
                    <select id="exercise_part" class="form-select mb-2" style="display:none;"></select>

                    <!-- 운동 상세 선택 -->
                    <select id="exercise" class="form-select mb-2" style="display:none;"></select>

                    <!-- 선택된 운동 리스트 -->
                    <ul id="exerciseList" class="list-group mt-2"></ul>
                </div>
            </div>
             <!-- 운동 이미지 -->
            <div class="card mb-3">
                <img src="../resources/img/1698480571234.jfif" alt="exercise_img"
                     style="
                         max-width: 100%;
                         height: auto;
                         object-fit: contain;
                         border-radius: 10px;">
            </div>
        </div>

        <!-- 세 번째 열: 운동 타이머 -->
        <div class="col-md-4">
            <!-- 타이머 설정 -->
            <div class="card mb-3">
                <div class="card-body">
                    <!-- 타이머 설정 제목 -->
                    <h5 class="card-title text-center mb-4">운동 타이머</h5>
			            <div class="row g-3">
			                <div class="col-md-6">
			                    <label for="exercise_timer" class="form-label">운동 시간</label>
			                    <div class="input-group">
			                        <input type="number" id="exercise_minutes" class="form-control" placeholder="분">
			                        <input type="number" id="exercise_seconds" class="form-control" placeholder="초">
			                    </div>
			                </div>
			                <div class="col-md-6">
			                    <label for="break_timer" class="form-label">휴식 시간</label>
			                    <div class="input-group">
			                        <input type="number" id="break_minutes" class="form-control" placeholder="분">
			                        <input type="number" id="break_seconds" class="form-control" placeholder="초">
			                    </div>
			                </div>
			                <div class="col-md-6">
			                    <label for="reps" class="form-label">반복 횟수</label>
			                    <input type="number" id="reps" class="form-control" placeholder="반복">
			                </div>
			            </div>
			            <button class="btn btn-primary w-100 mt-4" id="startTimer">
			                <i class="fas fa-play me-2"></i>타이머 시작
			            </button>
			            <button class="btn btn-secondary w-100 mt-4" id="pauseTimer">
			                <i class="fas fa-play me-2"></i>타이머 중지
			            </button>
			            <div class="text-center mt-4">
			                <div id="timerDisplay" class="display-4 fw-bold">00:00</div>
			                <div id="timerStatus" class="display-7 fw-bold">대기 중</div>
			            </div>
                 	</div>
			    </div>
			</div>​
</body>
<jsp:include page="../footer.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
<script>
	document.addEventListener("DOMContentLoaded", function(){
		
		const height = document.querySelector('#height');
		const weight = document.querySelector('#weight');
		
		const calculateBMIBtn = document.querySelector("#calculateBMI");
		const saveBMIBtn = document.querySelector("#saveBMI");
		const selectCategoryBtn = document.querySelector("#exercise_category");
		const selectPartBtn = document.querySelector("#exercise_part");
		const exerciseBtn = document.querySelector("#exercise");
		
		calculateBMIBtn.addEventListener('click', function(event){
			console.log("calculateBMIBtn click");
			calculateBMI();
		});
		
		saveBMIBtn.addEventListener('click', function(event){
			console.log("saveBMIBtn click");
			saveBMI();
		});
		
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
		
		exerciseBtn.addEventListener('change', function(event){
			console.log("exerciseBtn click");
			imgLoading();
		});
		
		document.getElementById("startTimer").addEventListener('click', function(event){
			console.log("startTimerBtn click");
			startTimer();
		});
		
    	// BMI 계산 함수
		function calculateBMI() {
			console.log("키 : " + height.value)
			console.log("몸무게 : " + weight.value)
			
			const heightInMeters = height.value / 100;  // cm -> m
			const bmi = (weight.value / (heightInMeters * heightInMeters)).toFixed(2);
			
			if (height && weight) {
			  document.querySelector('#bmiResultA').innerText = bmi;
			  
			  let category = '';
			  
			  if (bmi < 18.5) {
			    category = '저체중';
			  } else if (bmi >= 18.5 && bmi < 23) {
			    category = '정상 체중';
			  } else if (bmi >= 23 && bmi < 25) {
			    category = '과체중';
			  } else {
			    category = '비만';
			  }
			  document.getElementById('BMI_categoryA').innerText = category;
			}
      
			// BMI 지수 표시기 업데이트
			const indicator = document.getElementById('bmiIndicator');
			const scaleWidth = document.querySelector('.bmi-scale').offsetWidth;
			
			let position;
		
			if (bmi < 18.5) {
			  // 저체중 범위 (0% ~ 25%)
				position = (bmi / 18.5) * (scaleWidth * 0.25);
			} else if (bmi < 23) {
			  // 정상 체중 범위 (25% ~ 50%)
				position = (scaleWidth * 0.25) + ((bmi - 18.5) / (23 - 18.5)) * (scaleWidth * 0.25);
			} else if (bmi < 25) {
			  // 과체중 범위 (50% ~ 75%)
				position = (scaleWidth * 0.5) + ((bmi - 23) / (25 - 23)) * (scaleWidth * 0.25);
			} else {
			  // 비만 범위 (75% ~ 100%)
				position = (scaleWidth * 0.75) + Math.min(((bmi - 25) / 5) * (scaleWidth * 0.25), scaleWidth * 0.25);
			}
			
			indicator.style.left = position + 'px';
			
		}

	    // BMI 기록 함수
		function saveBMI() {
			const bmiResult = document.querySelector('#bmiResultA').innerText;
			const bmiCategory = document.querySelector('#BMI_categoryA').innerText;
			const userNo = "${user != null ? user.userNo : null}";
			
			console.log("bmiResult : " + bmiResult);
			console.log("bmiCategory : " + bmiCategory);
			
			if (bmiResult !== null && bmiCategory !== null) {
				$.ajax({
		             type: "POST", 
		             url:"/health/main/bmiRecord.do",
		             async:"true",
		             dataType:"html",
		             data:{
		                 "userNo" : userNo,
		                 "height" : height.value,
		                 "weight" : weight.value,
		                 "bmi" : bmiResult,
		                 "state" : bmiCategory
		             },             	 
		             success:function(response){//통신 성공
		                 console.log(" 통신 성공 : " + response);
		             	 alert("기록에 성공했습니다.");
			         },
		             error:function(response){//실패시 처리
		                 console.log("통신 실패 :"+response.text);
		                 alert("기록에 실패했습니다.");
		             }
		         });
			} else {
			  alert("먼저 BMI를 계산해 주세요!");
			}	  
		}

	    // 운동 타이머 함수
	    let timerInterval;
		    function startTimer() {
				let minutes = parseInt(document.getElementById('minutes').value) || 0;
				let seconds = parseInt(document.getElementById('seconds').value) || 0;
				let reps = parseInt(document.getElementById('reps').value) || 1;
				
				let totalTime = (minutes * 60) + seconds;  // 타이머 시간 (초 단위)
				let currentRep = 1;
				
				document.getElementById('timerStatus').innerText = `타이머 시작, ${reps}회 반복 중...`;
				
				timerInterval = setInterval(() => {
					if (totalTime <= 0) {
						if (currentRep < reps) {
						  currentRep++;
						  document.getElementById('timerDisplay').innerText = `다시 시작! ${reps - currentRep + 1}회 남음`;
						  totalTime = (minutes * 60) + seconds;  // 타이머 리셋
						} else {
						  document.getElementById('timerDisplay').innerText = "완료!";
						  document.getElementById('timerStatus').innerText = "운동이 끝났습니다.";
						  clearInterval(timerInterval);  // 타이머 멈추기
						}
					} else {
					  let mins = Math.floor(totalTime / 60);
					  let secs = totalTime % 60;
					  document.getElementById('timerDisplay').innerText = `${mins.toString().padStart(2, '0')}:${secs.toString().padStart(2, '0')}`;
					  totalTime--;
					}
			}, 1000);
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
		    
		function imgLoading() {
			
			const exerciseCategoryText = $("#exercise_category option:selected").text();
            const exercisePartText = $("#exercise_part option:selected").text();
            const exerciseText = $("#exercise option:selected").text();
            
            console.log("exerciseCategoryText : " + exerciseCategoryText);
            console.log("exercisePartText : " + exercisePartText);
            console.log("exerciseText : " + exerciseText);
            
            const contextPath = "../resources/img/"
            const fullPath = contextPath + exerciseCategoryText + "/" + exercisePartText + "/" +exerciseText + ".png";
            
            const exerciseImage = document.querySelector("img[alt='exercise_img']");
            
            exerciseImage.src = fullPath;
            console.log(exerciseImage.src)
		}
		
		const exerciseMinute = document.getElementById("exercise_minutes");
		const exerciseSecond = document.getElementById("exercise_seconds");
		const breakMinute = document.getElementById("break_minutes");
		const breakSecond = document.getElementById("break_seconds");
		const reps = document.getElementById("reps");
		const timerDisplay = document.getElementById("timerDisplay");
		const timerStatus = document.getElementById("timerStatus");
		const pauseButton = document.getElementById("pauseTimer");

		let exerciseTime, breakTime, repetitions, currentRep, isExercise, timer, isPaused = false;

		function startTimer() {
		    exerciseTime = (Number(exerciseMinute.value) * 60) + Number(exerciseSecond.value);
		    console.log("exerciseTime : " + exerciseTime);
		    
		    breakTime = (Number(breakMinute.value) * 60) + Number(breakSecond.value);
		    console.log("breakTime : " + breakTime);
		  
		    repetitions = Number(reps.value);
		    console.log("repetitions : " + repetitions);
		    
		    if (exerciseTime <= 0 || breakTime <= 0 || repetitions <= 0) {
		        alert("올바른 시간을 입력하세요.");
		        return;
		    }
		    
		    currentRep = 1;
		    isExercise = true;
		    timerStatus.textContent = "운동 중 (" + currentRep + "/" + repetitions + ")";
		    startCountdown(exerciseTime);
		}

		function startCountdown(time) {
		    clearInterval(timer);
		    timer = setInterval(function() {
		        if (!isPaused) {
		            updateTimerDisplay(time);
		            if (time <= 0) {
		                clearInterval(timer);
		                switchPhase();
		            } else {
		                time--;
		            }
		        }
		    }, 1000);
		}

		function switchPhase() {
		    if (isExercise) {
		        isExercise = false;
		        timerStatus.textContent = "휴식 중 (" + currentRep + "/" + repetitions + ")";
		        startCountdown(breakTime);
		    } else {
		        currentRep++;
		        if (currentRep > repetitions) {
		            timerStatus.textContent = "완료!";
		            return;
		        }
		        isExercise = true;
		        timerStatus.textContent = "운동 중 (" + currentRep + "/" + repetitions + ")";
		        startCountdown(exerciseTime);
		    }
		}

		function updateTimerDisplay(time) {
		    let minutes = Math.floor(time / 60);
		    let seconds = time % 60;
		    timerDisplay.textContent = ("0" + minutes).slice(-2) + " : " + ("0" + seconds).slice(-2);
		}

		pauseButton.addEventListener("click", function() {
		    isPaused = !isPaused;
		    pauseButton.innerHTML = isPaused ? '<i class="fas fa-play me-2"></i>타이머 시작' : '<i class="fas fa-pause me-2"></i>타이머 중지';
		    timerStatus.textContent = isPaused ? "타이머 일시 정지됨" : (isExercise ? "운동 중 (" + currentRep + "/" + repetitions + ")" : "휴식 중 (" + currentRep + "/" + repetitions + ")");
		});

	});
</script>
</html>

