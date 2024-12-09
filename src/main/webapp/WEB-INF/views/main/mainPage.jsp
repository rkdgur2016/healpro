<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>건강관리 웹사이트</title>
    <link rel="stylesheet" href="../resources/css/bootstrap/bootstrap.css">
    <!-- Bootstrap CSS -->
    <style>
        body {
            background-color: #333;
            color: white;
        }
        .navbar {
            background-color: #444;
        }
        .hero-section {
            background-color: #555;
            padding: 100px 0;
            text-align: center;
        }
        .hero-section h1 {
            font-size: 3rem;
        }
        .card {
            background-color: #666;
            border: none;
        }
        .card-body {
            color: #ccc;
        }
        .btn-primary {
            background-color: #007bff;
        }
    </style>
</head>
<body>

    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Heal/Pro</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="#">홈</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">로그인</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">회원가입</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero-section">
        <h1>건강을 관리하세요, 나의 삶을 바꾸는 첫걸음</h1>
        <p>지금 바로 나만의 건강 관리 계획을 시작하세요!</p>
        <a href="#" class="btn btn-primary btn-lg">시작하기</a>
    </section>

    <!-- Feature Cards -->
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">맞춤형 건강 관리</h5>
                        <p class="card-text">당신의 건강 데이터를 기반으로 개인 맞춤형 관리 계획을 제공합니다.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">실시간 건강 모니터링</h5>
                        <p class="card-text">일일 건강 지표를 실시간으로 모니터링하고 조언을 제공합니다.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">건강 목표 설정</h5>
                        <p class="card-text">건강 목표를 설정하고 이를 달성하기 위한 계획을 세울 수 있습니다.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="text-center text-white mt-5" style="background-color: #444; padding: 20px;">
        <p>&copy; 2024 건강관리 웹사이트 | 모든 권리 보유</p>
    </footer>
</body>
</html>
