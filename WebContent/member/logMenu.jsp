<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login main view</title>
<!-- normalize.css -->
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<link rel="stylesheet" href="../common/css/style.css" />
<link rel="shortcut icon" href="../common/image/favicon.ico" />
<link rel="icon" href="../common/image/favicon.ico" /> -->
<script>
	function login(frm) {
		frm.action = "join?type=login";
		frm.submit();
	}
	function join(frm) {
		frm.action = "join?type=join";
		frm.submit();
	}

</script>
</head>
<style>
#container {
	display: flex;
	flex-direction: column;
	align-items: center;
}

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

h5 {
	margin-bottom: 50px;
	text-align: center;
}

.logbtn, .joinbtn {
	width: 290px;
	height: 51px;
	border: none;
	background-color: red;
	padding: .8em .5em;
	color: white;
	padding: 5px;
	border-radius: 5px;
	display: inline-block;
	font-size: 15px;
	font-weight: bold;
	margin: 4px 2px;
	cursor: pointer;
}

.logbtn {
	margin-top: 30px;
}

.joinbtn {
	background-color: gray;
	margin-bottom: 60px;
}

.input_wrap {
	position: relative;
}

.inputform {
	display: flex;
	flex-direction: column;
	align-items: center;
	margin: 20px 0;
}

input[type=text], input[type=password] {
	width: 480px;
	height: 40px;
	color: #aaa;
	padding: 40px 20px;
	margin: 8px 0;
	font-size: 15px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

#showPwd {
	box-sizing: border-box;
	display: inline-block;
	/*padding-left: 10px;*/
	width: 30px;
	color: gray;
	text-align: center;
	user-select: none;
	position: absolute;
	top: 40px;
	right: 20px;
}
/* #idSaveCheck {
	margin: 20px 0 50px 0;
} */
</style>
<body>
	<%-- <jsp:include page="../common/include/header.jspf" /> --%>
	<%-- <%@ include file="../common/include/header.jspf" %> --%>
	<hr>
	<div id="container">
		<div class="bodyform">
			<div id="hhh1">
				<div id="hh1">로그인</div>
			</div>
			<h5>
				CallBack미술관 홈페이지를 방문해주셔서 감사합니다.<br> 로그인하시면 홈페이지를 보다 편리하게 이용하실 수
				있습니다.
			</h5>
			<form method="post">
				<div class="inputform">
					<div class="input_wrap">
						<label for="memberID" class="blind"></label> <input type="text"
							name="memberID" id="memberID" placeholder="아이디를 입력해주세요.">
					</div>
					<div class="input_wrap">
						<label for="password" class="blind"></label> <input
							type="password" name="password" id="password"
							placeholder="비밀번호를 입력하세요."> <i class="fas fa-eye"
							id="showPwd"></i>
					</div>
					<button class="logbtn" name="logbtn" onclick="login(this.form)">로그인</button>
					<div>
						<input type="hidden" name="type" value="join">
						<button class="joinbtn" name="joinbtn" onclick="join(this.form)">회원가입</button>
					</div>
					<!-- 				<div>
				<label for="idSaveCheck">
					<input type="checkbox" name="idSaveCheck" id="idSaveCheck">
					<span>아이디 저장</span>
				</label>
				</div> -->

				</div>
			</form>
		</div>
	</div>

	<%-- <jsp:include page="../common/include/footer.jspf" /> --%>
	<script>
		let showPwdIcon = document.querySelector("#showPwd");
		let passwordInputTag = document.querySelector("#password");
		let isVisiblePassword = false;

		showPwdIcon.addEventListener("click", function() {
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
		if (msg) {
			alert(msg);
		}
	</script>
</body>
</html>
