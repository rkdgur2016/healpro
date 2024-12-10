<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.project.health.domain.Bmi"%>
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
  	<!-- 메인 페이지 -->
  	<div class="container mt-4"> <!-- 여기에 mt-4 클래스를 추가하여 여백을 설정 -->
    	<div class="row">
	      	<!-- BMI 측정기 -->
      		<div class="col-md-6">
		        <div class="card">
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
	        <!-- BMI 지수 표시 -->
			<div class="card mt-3">
				<div class="card-body">
				<h6 class="card-title text-center">BMI 지수</h6>
					<div class="bmi-scale">
					<div id="bmiIndicator" class="bmi-indicator"></div>
						<div class="bmi-category" style="flex-grow: 1;">
							<div class="bmi-label">저체중</div>
							<div class="bmi-range">&lt; 18.5</div>
						</div>
					<div class="bmi-category" style="flex-grow: 1;">
						<div class="bmi-label">정상</div>
						<div class="bmi-range">18.5 - 23.0</div>
					</div>
					<div class="bmi-category" style="flex-grow: 1;">
						<div class="bmi-label">과체중</div>
						<div class="bmi-range">23 - 25</div>
					</div>
					<div class="bmi-category" style="flex-grow: 1;">
						<div class="bmi-label">비만</div>
						<div class="bmi-range">&ge; 25</div>
					</div>
				  </div>
				</div>
			</div>
	        <!-- BMI 기록 -->
	        <div class="card mt-3">
				<div class="card-body">
			  	<h6 class="card-title text-center">BMI 기록</h6>
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
								<c:forEach var="bmi" items="${bmiList}">
								    <tr>
								        <th>${bmi.date}</th>
								        <th>${bmi.height}</th>
								        <th>${bmi.weight}</th>
								        <th>${bmi.bmi}</th>
								        <th>${bmi.state}</th>
								    </tr>
								</c:forEach>
							</thead>
						</table>
					</div>
				</div>
			</div>
      	</div>
		<!-- 운동 타이머 -->
		<div class="col-md-6">
		  <div class="card">
		    <div class="card-body">
		      <h6 class="card-title text-center">운동 타이머</h6>
		      <div class="row g-1">
		        <div class="col-4">
		          <input type="number" id="minutes" class="form-control" placeholder="분">
		        </div>
		        <div class="col-4">
		          <input type="number" id="seconds" class="form-control" placeholder="초">
		        </div>
		        <div class="col-4">
		          <input type="number" id="reps" class="form-control" placeholder="반복">
		        </div>
		      </div>
		      <button class="btn btn-primary btn-sm w-100 mt-2" onclick="startTimer()">시작</button>
		      <div class="text-center mt-2">
		        <div id="timerDisplay" class="fw-bold">00:00</div>
		        <small id="timerStatus">대기 중</small>
		      </div>
		    </div>
		  </div>
		</div>
		<!-- 운동 추천 섹션 -->
		<div class="card col-md-6">
			<div class="card-body">
				<h6 class="card-title text-center">운동 추천 리스트</h6>
				<div class="form-group">
				  <label for="goalSelect">운동 목표 선택</label>
				  <select id="goalSelect" class="form-select" onchange="updateExerciseList()">
				    <option value="">목표를 선택하세요</option>
				    <option value="체중감량">체중 감량</option>
				    <option value="근육증가">근육 증가</option>
				    <option value="체력향상">체력 향상</option>
				  </select>
				</div>
		  		<ul id="exerciseList" class="list-group mt-2"></ul>
			</div>
		</div>
	</div><!-- row 끝 -->
</div> <!-- .container 끝 -->
</body>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
<script>
	document.addEventListener("DOMContentLoaded", function(){
		
		const height = document.querySelector('#height');
		const weight = document.querySelector('#weight');
		
		const calculateBMIBtn = document.querySelector("#calculateBMI");
		const saveBMIBtn = document.querySelector("#saveBMI");
		
		calculateBMIBtn.addEventListener('click', function(event){
			console.log("calculateBMIBtn click");
			calculateBMI();
		});
		
		saveBMIBtn.addEventListener('click', function(event){
			console.log("saveBMIBtn click");
			saveBMI();
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
			
			console.log("bmiResult : " + bmiResult);
			console.log("bmiCategory : " + bmiCategory);
			
			if (bmiResult !== null && bmiCategory !== null) {
				$.ajax({
		             type: "POST", 
		             url:"/health/main/bmiRecord.do",
		             async:"true",
		             dataType:"html",
		             data:{
		                 "userNo" : ${user.userNo},
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
	});
</script>
<!-- Footer -->
<jsp:include page="../footer.jsp"></jsp:include>
</html>

