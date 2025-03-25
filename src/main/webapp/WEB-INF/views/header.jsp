<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<style>
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
</style>
<head>
	<nav class="navbar navbar-expand-lg navbar-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="/health/main/main.do">건강관리 웹사이트</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
			  aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
			<c:choose>
				<c:when test="${user ne null}">  
				     <ul class="navbar-nav ms-auto">
				     	<li class="nav-item">
				     		<a class="nav-link">${user.name}님! 환영합니다.</a>
				     	</li>
				     	<li class="nav-item">
							<a class="nav-link" href="/health/myPage/myPage.do">마이페이지</a>
						</li>
				     	<li class="nav-item">
							<a class="nav-link" href="/health/user/logout.do">로그아웃</a>
						</li>
				     </ul>
				</c:when>
				<c:otherwise>
				    <ul class="navbar-nav ms-auto">
						<li class="nav-item">
							<a class="nav-link" href="/health/user/loginPage.do">로그인</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="/health/user/joinPage.do">회원가입</a>
						</li>
					</ul>
			    </c:otherwise>
			</c:choose>
			</div>
		</div>
	</nav>
</head>
