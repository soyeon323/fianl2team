<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/common/setup.jsp" %>

    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${root}/resources/css/pwd/pwd-find.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   
</style>
</head>
<body>

		<div id="wrap">
            
            <div id="email-area">

                <div>
                    <label for="email">이메일</label>
                    <div class="input-group">
                   <input type="text" class="form-control" name="userEmail1" id="userEmail1" placeholder="이메일" >
                   <select class="form-control" name="userEmail2" id="userEmail2" >
                   <option>@naver.com</option>
                   <option>@daum.net</option>
                   <option>@gmail.com</option>
                   <option>@hanmail.com</option>
                    <option>@yahoo.co.kr</option>
                   </select>
                </div> 
    
               <div class="input-group-addon">
                   <button type="button" class="btn btn-primary" id="mail-Check-Btn">본인인증</button>
               </div>
                   <div class="mail-check-box">
               <input class="form-control mail-check-input" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
               </div>
                   <span id="mail-check-warn"></span>
               </div>

            </div>

            





            <form action="${root}/pwd/pwdSetting" method="POST">   
                    <span>비밀번호 설정</span><span id="lengthMsg" style="color: red; font-size: 0.8em;">(5글자 이상)</span><span id="specialCharMsg" style="color: red;  font-size: 0.8em;"> (특수문자가 하나 이상)</span>
                <input type="password" class="form-control" disabled placeholder="비밀번호" id="pwdSet1">
                
                <br>
                <span>비밀번호 재확인</span>
                <input type="password" name="pwd" class="form-control" placeholder="비밀번호" disabled id="pwdSet2">
                
                <input class="btn btn-primary" style="color: whitesmoke; height: 30px; font-size: 0.5em;" type="button"  id="pwdCheck" value="비밀번호 일치 확인"> 
                <br><br>
                <input class="btn btn-primary" style="color: whitesmoke; height: 30px; font-size: 0.5em" type="submit" value="비밀번호 설정 하기"> 
            </form>







		</div>
</body>
</html>

<script>

$('#mail-Check-Btn').click(function() {
		const email = $('#userEmail1').val() + $('#userEmail2').val(); // 이메일 주소값 얻어오기
		const email1 = $('#userEmail1').val() + $('#userEmail1').val(); // 이메일 주소값 얻어오기
		console.log('완성된 이메일 : ' + email); // 이메일 오는지 확인  ghdh21@naver.com
		const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
		
        if(email1 ==""){
            alert('이메일을 입력해 주세요');
            return;
        }

		$.ajax({
			url : '${root}/mail/email?email='+email, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
			type : 'get',
			success : function (data) {
				console.log("data : " +  data);
				checkInput.attr('disabled',false);
				code =data;
				alert('인증번호가 전송되었습니다.')
			}			
		}); 
	});

    // 인증번호 비교 
	// blur -> focus가 벗어나는 경우 발생
	$('.mail-check-input').blur(function () {
		const inputCode = $(this).val();
		const $resultMsg = $('#mail-check-warn');
		
		if(inputCode === code){
			$resultMsg.html('인증번호가 일치합니다.');
			$resultMsg.css('color','green');
			$('#mail-Check-Btn').attr('disabled',true);
			$('#userEamil1').attr('readonly',true);
			$('#userEamil2').attr('readonly',true);
			$('#userEmail2').attr('onFocus', 'this.initialSelect = this.selectedIndex');
	         $('#userEmail2').attr('onChange', 'this.selectedIndex = this.initialSelect');
		}else{
			$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
			$resultMsg.css('color','red');
		}
	});





      // 비밀번호 keyup
    const pwdSet1Input = document.getElementById('pwdSet1');
    pwdSet1Input.addEventListener('keyup', validatePassword);

    // 비밀번호 설정
    function setPassword() {
    const pwdSet1 = document.getElementById('pwdSet1').value;
    const pwdSet2 = document.getElementById('pwdSet2').value;

    // 비밀번호 조건 검사
    const lengthMsg = document.getElementById('lengthMsg');
    const specialCharMsg = document.getElementById('specialCharMsg');

    const lengthValid = pwdSet1.length >= 5;
    const specialCharValid = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]+/.test(pwdSet1);

    if (lengthValid && specialCharValid) {
        if (pwdSet1 === pwdSet2) {
            // 모든 조건을 만족하고 일치할 경우 비밀번호 설정
            alert('비밀번호 설정이 완료되었습니다.');
            // 여기서 실제로 서버로 비밀번호를 보내거나 다른 처리를 수행해야 합니다.
        } else {
            alert('비밀번호가 일치하지 않습니다.');
        }
    } else {
        alert('비밀번호 조건을 다시 확인해주세요.');
    }
}




// 비밀번호 일치 확인 버튼 클릭 이벤트
const pwdCheck = document.querySelector('#pwdCheck');
pwdCheck.addEventListener('click', () => {
    const pwdSet1 = document.getElementById('pwdSet1').value;
    const pwdSet2 = document.getElementById('pwdSet2').value;

    // 비밀번호 조건 검사
    const lengthValid = pwdSet1.length >= 5;
    const specialCharValid = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]+/.test(pwdSet1);

    if (pwdSet1 === pwdSet2) {
        alert('비밀번호 일치.');
    }else if(lengthValid && specialCharValid){
        alert('비밀번호 설정 완료')
    }   
    else {
        alert('비밀번호 조건을 다시 확인해주세요.');
    }
});



// 비밀번호 설정하기 버튼 클릭 이벤트
const submitBtn = document.querySelector('input[type="submit"]');
submitBtn.addEventListener('click', (event) => {
    const pwdSet1 = document.getElementById('pwdSet1').value;
    const pwdSet2 = document.getElementById('pwdSet2').value;

    // 비밀번호 조건 검사
    const lengthValid = pwdSet1.length >= 5;
    const specialCharValid = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]+/.test(pwdSet1);

    if (!lengthValid || !specialCharValid || pwdSet1 !== pwdSet2) {
        alert('비밀번호 조건을 다시 확인해주세요.');
        event.preventDefault(); // 폼 제출 막기
    }
});




    //유효성 검사 
    function validatePassword() {
        const pwdSet1 = pwdSet1Input.value;
        
        const lengthMsg = document.getElementById('lengthMsg');
        const specialCharMsg = document.getElementById('specialCharMsg');

        lengthMsg.style.display = pwdSet1.length < 5 ? 'block' : 'block';
        lengthMsg.style.color = pwdSet1.length < 5 ? 'red' : 'blue';

        const specialChars = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]+/;
        specialCharMsg.style.display = specialChars.test(pwdSet1) ? 'block' : 'block';
        specialCharMsg.style.color = specialChars.test(pwdSet1) ? 'blue' : 'red';
    }



</script>
