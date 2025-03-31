<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="../resources/js/jquery_3_7_1.js"></script>
    <script src="../resources/js/essential.js"></script>
    <style>
        body {
            background-color: #121212;
            color: #ffffff;
            font-family: 'Roboto', sans-serif;
        }
        .login-container {
            max-width: 400px;
            margin: 100px auto;
            padding: 20px;
            background-color: #1e1e1e;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        .login-title {
            color: #4CAF50;
            font-size: 2rem;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
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
        .btn-primary {
            background-color: #4CAF50;
            border-color: #4CAF50;
        }
        .btn-primary:hover {
            background-color: #45a049;
            border-color: #45a049;
        }
        .forgot-password {
            color: #888888;
            text-align: right;
            margin-top: 10px;
        }
        .forgot-password a {
            color: #4CAF50;
            text-decoration: none;
        }
        .forgot-password a:hover {
            text-decoration: underline;
        }
        .login-title {
		    font-size: 2.5rem; /* 제목 크기 증가 */
		    font-weight: bold; /* 두꺼운 글씨체 */
		    text-align: center; /* 중앙 정렬 */
		    color: #4CAF50; /* 강조 색상 */
		    margin-bottom: 20px; /* 아래쪽 여백 추가 */
		    text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5); /* 약간의 그림자 효과 추가 */
		}
    </style>
</head>
<jsp:include page="../header.jsp"></jsp:include>
<body>
    <div class="container">
        <div class="login-container">
            <h2 class="login-title">로그인</h2>
            <img src="../resources/img/1698480571234.jfif" alt="아이콘" style="width: 100%; height: auto; margin-bottom: 20px; border-radius: 10px;">
            <form action="#" method="post">
                <div class="mb-3">
                    <label for="username" class="form-label">아이디</label>
                    <input type="text" class="form-control" id="userId" name="userId" required autofocus>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">비밀번호</label>
                    <input type="password" class="form-control" id="pw" name="pw" required>
                </div>
                <div class="mb-3 form-check">
                    <input type="checkbox" class="form-check-input" id="rememberMe" name="rememberMe">
                    <label class="form-check-label" for="rememberMe">로그인 상태 유지</label>
                </div>
                <input type="button" id="loginBtn" class="btn btn-primary w-100" value="로그인">
            </form>
            <div class="forgot-password">
                <a href="/forgot-password">비밀번호를 잊으셨나요?</a>
            </div>
        </div>
    </div>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<jsp:include page="../footer.jsp"></jsp:include>
<script>
	document.addEventListener("DOMContentLoaded", function(){
		
		const userId = document.querySelector('#userId');
		const userPW = document.querySelector('#pw');
		const loginBtn = document.querySelector('#loginBtn');
		
		loginBtn.addEventListener("click",function(event){
			login();
		});
		
		function login(){
			$.ajax({
	             type: "POST", 
	             url:"/health/user/login.do",
	             async:"true",
	             dataType:"html",
	             data:{
	                 "userId" : userId.value,
	                 "userPw" : userPW.value
	             },
	             success:function(response){//통신 성공
	                 console.log(" 통신 성공 :"+response);
	             	 alert("로그인에 성공했습니다.");
	             	window.location.href="/health/main/main.do";
	             },
	             error:function(response){//실패시 처리
	                 console.log("통신 실패 :"+response.text);
	                 alert("아이디 혹은 비밀번호를 확인해주세요.");
	             }
	         });
		}
	});
</script>
</html>