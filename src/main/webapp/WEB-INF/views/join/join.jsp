<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link rel="stylesheet" href="../resources/css/user/join.css">
    <script src="../resources/js/jquery_3_7_1.js"></script>
    <script src="../resources/js/essential.js"></script>
</head>
<body>
    <div class="signup-container">
        <img src="../resources/img/1698480571234.jfif" alt="아이콘" style="width: 100%; height: 100%; vertical-align: middle; margin-right: 10px; margin-bottom :8px; ">
        <form action="#" method="post" id="signupForm" >
            <label for="userId" style="font-weight: bold;">아이디</label>
            <div class="form-group" style="margin-top :8px; display: flex; align-items: center; gap: 10px;">
                <input type="text" id="userId" name="userId" required style="flex: 2;">
                <button type="button" id="checkIdButton" style="flex: 1; background-color: #333; color: #fff; border: none; padding: 10px; border-radius: 5px; cursor: pointer;">ID 중복 체크</button>
            </div>
            <div class="form-group">
                <label for="pw">비밀번호</label>
                <input type="password" id="pw" name="password" required>
            </div>
            <div class="form-group">
                <label for="pwCheck">비밀번호 확인</label>
                <input type="password" id="pwCheck" name="password_check" required>
            </div>
            <div class="form-group">
                <label for="name">닉네임</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="email">이메일</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="birth">생년월일</label>
                <input type="date" id="birth" name="birth" required>
            </div>
            <button type="submit" id="signupBtn" class="signup-button">회원가입</button>
        </form>
    </div>
</body>
<script>
	document.addEventListener("DOMContentLoaded", function(){
		
		const idInput = document.querySelecotr('#userId');
		const pwInput = document.querySelector("#pw");
		const pwInput = document.querySelector("#pw");
		const pwCheckInput = document.querySelector("#pwCheck");
		const nameInput = document.querySelector("#name");
		const emainInput = document.querySelector("#email");
		const birthInput = document.querySelector("#birth");
		
		let idCheckCount = 0;
		let passwordCheckCount = 0;
		
		const signupBtn = document.querySelecotr('#signupBtn');
		const idCheckBtn =  document.querySelector("#checkIdButton");
		
		//이벤트 리스너
		signupBtn.addEventListener("click",function(event){
			join();
		});
		
		idCheckBtn.addEventListener("click",function(event){
			idCheck();
		});
		
		function join() {
			const minDate = "1907-01-01";
	        const maxDate = "2024-08-01";
	        
			if(isEmpty(idInput.value) == true){
				alert("사용하실 아이디를 입력하세요.");
				idInput.focus();
				return;
			}
			if(idInput.value.indexOf(" ") !== -1){
				alert("아이디에 공백 문자가 있습니다.");
				idInput.focus();
				return;
			}
			if(isEmpty(nameInput.value) == true){
				alert("사용하실 닉네임을 입력하세요.");
				nameInput.focus();
				return;
			}
			if(isEmpty(passwordInput.value) == true){
				alert("비밀번호를 입력하세요.");
				passwordInput.focus();
				return;
			}
			if(isEmpty(passwordCheckInput.value) == true){
				alert("비밀번호를 확인하세요");
				passwordCheckInput.focus();
				return;
			}
			if(isEmpty(birthInput.value) == true){
				alert("생년월일을 입력하세요.");
				birthInput.focus();
				return;
			}
			
			birthInput.setAttribute("min", minDate);
	        birthInput.setAttribute("max", maxDate);
	        
	        if (birthInput.value < minDate || birthInput.value > maxDate) {
	            alert("생년월일은" + minDate + "~" + maxDate + "내로 입력 가능합니다.");

	            return;
	        }
	        
	        if(idCheckCount != 1){
				console.log("idCheckCount : " + idCheckCount);
				alert("아이디 중복을 확인하세요.");
				return;
			}
			
			if(passwordInput.value !== passwordCheckInput.value){
				alert("비밀번호가 일치하는지 확인하세요.");
				return;
			}
			
			if(passwordInput.value.indexOf(" ") !== -1 || passwordCheckInput.value.indexOf(" ") !== -1){
				alert("비밀번호와 비밀번호 확인에 공백 문자가 있습니다.");
				passwordInput.focus();
				return;
			}

			if(passwordValidation(passwordInput.value) === false ){
				alert("특수문자나 대소문자를 포함한 8~20자 이내의 비밀번호를 사용하세요."); 
				return;	
			}
			
			if(passwordInput.value.length < 8 && passwordInput.value.length > 20){
				alert("비밀번호는 8자 이상 20자 이하입니다."); 
				return;	
			}
			
		}
		
        function idCheck() {
    		console.log("idCheck()");
    		
    		const usernamePattern = /^[a-zA-Z0-9]+$/;

            if (!usernamePattern.test(idInput.value)) {
                // 유효하지 않은 경우 경고 메시지 표시
                alert("아이디는 영어와 숫자만 가능합니다.");

                // 폼 제출 중단
                event.preventDefault();
                return;
            }
    		if (idInput.value !== "" && idInput.value.length >= 4 && idInput.value.length <= 16) {
    		    if (/\s/.test(idInput.value)) {
    		        alert("아이디에는 공백을 사용할 수 없습니다.");
    		        idInput.focus();
    		        return;
    		    }
    		} else {
    		    alert("아이디는 4~16자 이내, 특수문자와 한글은 사용불가합니다.");
    		    idInput.focus();
    		    return;
    		}
    		
    		onlyNumberAndEnglish(idInput.value);
    		
    		let type="get";
            let url ="/health/user/idCheck.do";
            let async = "true";
            let dataType = "html";

            if(confirm("아이디를 사용하시겠습니까?") === false)return;

            let params = {
                "userId" : idInput.value 
            }
    		
    		console.log("idInput : " + idInput.value);
    		 
            $.ajax({
                type: "GET", 
                url:"/health/user/idCheck.do",
                asyn:"true",
                dataType:"html",
                data:{
                    "work_div":"doInsert",
                    "title": $("#title").val(),
                    "div": $("#div").val(),
                    "reg_id": $("#reg_id").val(),
                    "contents": $("#contents").val()	
                },
                success:function(response){//통신 성공
                    console.log(" 통신 성공 :"+response);
                },
                error:function(response){//실패시 처리
                        console.log("통신 실패 :"+response);
                }
            });
    	}
		
		function onlyNumberAndEnglish(input) {
	  		return /^[A-Za-z0-9][A-Za-z0-9]*$/.test(input);
		}  
		function passwordValidation(input) {
			return /^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,20}$/.test(input);
		}
		
	});
</script>
</html>


