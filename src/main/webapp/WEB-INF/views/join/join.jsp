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
                <input type="password" id="pw" name="pw" required>
            </div>
            <div class="form-group">
                <label for="pwCheck">비밀번호 확인</label>
                <input type="password" id="pwCheck" name="pwCheck" required>
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
            <input type="button" id="signupBtn" class="signup-button" value="회원가입">
        </form>
    </div>
</body>
<script>
	document.addEventListener("DOMContentLoaded", function(){
		
		const idInput = document.querySelector("#userId");
		const pwInput = document.querySelector("#pw");
		const pwCheckInput = document.querySelector("#pwCheck");
		const nameInput = document.querySelector("#name");
		const emailInput = document.querySelector("#email");
		const birthInput = document.querySelector("#birth");
		
		let idCheckCount = 0;
		
		const signupBtn = document.querySelector('#signupBtn');
		const idCheckBtn =  document.querySelector("#checkIdButton");
		
		//이벤트 리스너
		signupBtn.addEventListener("click",function(event){
			join();
		});
		
		idCheckBtn.addEventListener("click",function(event){
			idCheck();
		});
		
		function join() {
			console.log("join()");
			
			console.log(idInput.value);
			console.log(pwInput.value);
			console.log(nameInput.value);
			console.log(emailInput.value);
			console.log(birthInput.value);
			
			const date = new Date();
			
			const minDate = "1907-01-01";
	        let maxDate = date.getDate();
	        
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
			if(isEmpty(pwInput.value) == true){
				alert("비밀번호를 입력하세요.");
				pwInput.focus();
				return;
			}
			if(isEmpty(pwCheckInput.value) == true){
				alert("비밀번호를 확인하세요");
				pwCheckInput.focus();
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
			
			if(pwInput.value !== pwCheckInput.value){
				alert("비밀번호가 일치하는지 확인하세요.");
				pwCheckInput.focus();
				return;
			}
			
			if(pwInput.value.indexOf(" ") !== -1 || pwCheckInput.value.indexOf(" ") !== -1){
				alert("비밀번호와 비밀번호 확인에 공백 문자가 있습니다.");
				pwInput.focus();
				return;
			}

			if(passwordValidation(pwInput.value) === false ){
				alert("특수문자나 대소문자를 포함한 8~20자 이내의 비밀번호를 사용하세요."); 
				pwInput.focus();
				return;	
			}
			
			if(pwInput.value.length < 8 && pwInput.value.length > 20){
				alert("비밀번호는 8자 이상 20자 이하입니다."); 
				pwInput.focus();
				return;	
			}
			
			$.ajax({
	             type: "POST", 
	             url:"/health/user/join.do",
	             async:"true",
	             dataType:"html",
	             data:{
	                 "userId" : idInput.value,
	                 "userPw" : pwInput.value,
	                 "name"   : nameInput.value,
	                 "email"  : emailInput.value,
	                 "birth"  : birthInput.value
	             },
	             success:function(response){//통신 성공
	                 console.log(" 통신 성공 :"+response);
	             	 alert("회원가입에 성공했습니다.");
	             },
	             error:function(response){//실패시 처리
	                 console.log("통신 실패 :"+response.text);
	             	
	             }
	         });
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
    		
            if(confirm("아이디를 사용하시겠습니까?") === false)return;

            let params = {
                "userId" : idInput.value 
            }
    		
    		console.log("idInput : " + idInput.value);
    		 
            $.ajax({
                type: "GET", 
                url:"/health/user/idCheck.do",
                async:"true",
                dataType:"html",
                data:{
                    "userId" : idInput.value
                },
                success:function(response){//통신 성공
                    console.log(" 통신 성공 :"+response);
                	if(response.trim() == '0'){            		
	                    idCheckCount = 1;
	                    idInput.setAttribute("readonly", true);
                	}else{
                		alert("이미 존재하는 아이디입니다. 다시 시도하세요.");
                		idInput.focus();
                	}
                },
                error:function(response){//실패시 처리
                    console.log("통신 실패 :"+response.text);
                	
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


