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
  <!-- Rest of your content remains -->
</body>
</html>