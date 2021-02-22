<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 메인</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
<link rel="stylesheet" href="../common/css/style.css" />
<link rel="shortcut icon" href="../common/image/favicon.ico" />
<link rel="icon" href="../common/image/favicon.ico" />
<style>
#hhh1 {
	display: flex;
	justify-content: center;
}

#hh1 {
	margin-top: 2em;
	font-size: 2.5em;
	font-weight: 500;
	color: #222222;
	border-top: 1px solid #606060;
	padding: 0.35em 0;
	margin-bottom: 30px;
}
form {
	display: flex;
	flex-direction: column;
	align-items: center;
}

#put, #put2 {
	position: relative;
	margin-bottom: 30px;
}

input[type=password],[type=text] {
	width: 290px;
	height: 51px;
	color: #aaa;
	padding: 12px 20px;
	margin: 8px 0;
	font-size: 17px;
	border: 2px solid #ddd;
	border-radius: 4px;
	box-sizing: border-box;
	margin-bottom: 10px;
}

.mypagebtn {
	background-color: red;
	display: flex;
	flex-direction: column;
	align-items: center;
	width: 290px;
	border: none;
	text-decoration: none;
	height: 51px;
	padding: .8em .5em;
	color: white;
	border-radius: 5px;
	font-size: 15px;
	font-weight: bold;
	margin: auto;
	margin-bottom: 80px;
	cursor: pointer;
}

#showPwd {
	box-sizing: border-box;
	display: inline-block;
	width: 30px;
	color: gray;
	text-align: center;
	user-select: none;
	position: absolute;
	top: 25px;
	right: 10px;
}
</style>
</head>

<body>
	<%-- <jsp:include page="../common/include/header.jspf" /> --%>
	<form method="post">
		<div id="hhh1">
			<div id="hh1">비밀번호 확인</div>
		</div>
		<div id="put">
			<h5>
				개인정보 보호를 위해 비밀번호 확인을 부탁드립니다.<br>
			</h5>
		</div>
		<div id="put2">
			<input type="password" name="password" id="password" placeholder="비밀번호를 입력하세요.">
			<i class="fas fa-eye" id="showPwd"></i>
		</div>
		<div class="btn">
			<input type="hidden" name="type" value="mypage">
			<input type="button" class="mypagebtn" id="mypagebtn" value="마이페이지 이동"
				onclick="mypage(this.form)">
		</div>

	</form>
	<%-- <jsp:include page="../common/include/footer.jspf" /> --%>
<script>
	let showPwdIcon = document.querySelector("#showPwd");
	let passwordInputTag = document.querySelector("#password");
	let isVisiblePassword = false;
	
	showPwdIcon.addEventListener("click", function () {	
		isVisiblePassword = !isVisiblePassword; 
		
		showPwdIcon.classList.toggle("fa-eye");	
		showPwdIcon.classList.toggle("fa-eye-slash");
		if (isVisiblePassword) {
			passwordInputTag.setAttribute("type", "text");
		} else {
			passwordInputTag.setAttribute("type", "password");
		}			
	});
	
	
	let msg = "${param.msg}";
	if(msg) {
		alert(msg);
	}
	
	function mypage(frm) {
		frm.action="join";
		frm.submit();
	}
</script>
</body>
</html>