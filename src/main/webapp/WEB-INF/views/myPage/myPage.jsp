<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  	<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  	<script src="../resources/js/jquery_3_7_1.js"></script>
  	<script src="../resources/js/essential.js"></script>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
		google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(drawChart);
		
		function drawChart() {
			var data = google.visualization.arrayToDataTable([
				['Year', 'Sales', 'Expenses'],
				['2004',  1000,      400],
				['2005',  1170,      460],
				['2006',  660,       1120],
				['2007',  1030,      540]
			]);
			
			var options = {
				title: 'Condition',
				curveType: 'function',
				legend: { position: 'bottom' }
			};
			
			var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
			
			chart.draw(data, options);
		}
    </script>
  	<meta charset="UTF-8">
  	<title>건강관리 웹사이트</title>
  	<style>
	    body {
	      background-color: #1a1a1a;
	      color: #ececec;
	      font-family: 'Roboto', sans-serif;
	    }
	    .navbar {
	      background-color: #242424;
	      box-shadow: 0 2px 6px rgba(0,0,0,0.15);
	    }
	    .navbar-brand, .nav-link {
	      color: #ececec !important;
	    }
	    .nav-link:hover {
	      color: #5FB7FF !important;
	    }
	    .btn-primary {
	      background: linear-gradient(45deg, #5FB7FF, #42A5F5);
	      border: none;
	      transition: all 0.3s ease;
	    }
	    .btn-primary:hover {
	      background: linear-gradient(45deg, #42A5F5, #007BFF);
	    }
	    .card {
	      background-color: #2a2a2a;
	      border-radius: 10px;
	      box-shadow: 0 4px 8px rgba(0,0,0,0.2);
	    }
	    .card-title {
	      color: #5FB7FF;
	      font-weight: bold;
	    }
	    .table-dark {
	      background-color: #242424;
	    }
	    .table-dark th, .table-dark td {
	      border-color: #343434;
	    }
	    .footer {
	      background-color: #242424;
	      color: #aaa;
	      padding: 20px;
	      text-align: center;
	    }
	    .footer a {
	      color: #5FB7FF;
	      text-decoration: none;
	    }
	    .footer a:hover {
	      text-decoration: underline;
	    }
	    .section-title {
	      color: #5FB7FF;
	      font-size: 1.8rem;
	      font-weight: 700;
	      text-align: center;
	      margin-bottom: 20px;
	    }
	    .table-responsive::-webkit-scrollbar {
	      width: 6px;
	    }
	    .table-responsive::-webkit-scrollbar-thumb {
	      background-color: #5FB7FF;
	      border-radius: 4px;
	    }
	    #timerDisplay {
	      color: #5FB7FF;
	      font-size: 2.8rem;
	    }
	    #height::placeholder, #weight::placeholder, #minutes::placeholder, #seconds::placeholder, #reps::placeholder {
	      color: #ccc;
	      font-style: italic;
	    }
  	</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div id="curve_chart" style="width: 900px; height: 500px"></div>
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
  <!-- Rest of your content remains -->
</body>
</html>