<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<link rel="stylesheet" href="../common/css/style.css" />
<link rel="shortcut icon" href="../common/image/favicon.ico" />
<link rel="icon" href="../common/image/favicon.ico" />
<style>
#hat::before {
	content: '';
	width: 3px;
	height: 3px;
	background-color: red;
	top: 8px;

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
form {
	display: flex;
	flex-direction: column;
	align-items: center;
}

#put {
	position: relative;
	margin-bottom: 30px;
}
input[type=text], input[type=password] {
	width: 290px;
	height: 51px;
	color: #aaa;
	padding: 8px 0;
	margin: 5px;
	font-size: 17px;
	border: 2px solid #ddd;
	border-radius: 4px;
	box-sizing: border-box;
}
.info {
    background-color: #f5f5f5;
    padding: 30px 15px;
    position: relative;
}
.info p {
	text-align: center;
    padding: 0 25px 20px 25px;
    text-weight: bold;
}
.dot::before {
	content: '';
	position: absolute;
	width: 3px;
	height: 3px;
	background-color: #6f7072;
	left: 48px;

}
</style>
<script>
	function finalquit(frm) {
		frm.action = "join?type=finalQuit";
		frm.submit();
	}
	function back(frm) {
		alert("탈퇴가 취소되었습니다.")
		frm.preventDefault();
		return;
	}

	function clearText(field) {
		if (filed.defaultValue == field.value) {
			field.value = "";
		}
	}
</script>
</head>
<body>
	<%-- <jsp:include page="../common/include/header.jspf" /> --%>
	<form method="post">
	<div id="hat"><p></p></div>
		<div id="hhh1">
			<div id="hh1">회원 탈퇴</div>
		</div>
		<section class="info">
			<p>
				콜백 미술관 회원 탈퇴 시 아래 내용을 먼저 확인해 주세요.<br>
			</p>
			<ul>
				<li class="dot">회원 탈퇴는 신청하시는 즉시 처리됩니다.</li>
				<li class="dot">로그인이 필요한 서비스 이용은 더 이상 이용하실 수 없게 됩니다. (예 : 마이페이지, 이벤트 참여, 게시판 글쓰기 등)</li>
				<li class="dot">단, 민원신청, 묻고답하기 게시판에 작성하신 글은 삭제되지 않습니다.</li>
			</ul>
		</section>
		<div><p>본인 확인을 위하여 아래 정보를 입력해 주세요.</p></div>
		<div>
		<label for="email" class="blind"></label>
		<input type="text" name="email" id="email"
		value="${sessionScope.login.mem_email}" readonly>
		</div>
		<div>
		<label for="name" class="blind"></label>
		<input type="text" name="name" id="name"
		value="${sessionScope.login.mem_name}" readonly>
		</div>
		<div>
		<label for="password" class="blind"></label>
		<input type="password" name="password" id="password"
		onFocus="clearText(this)"
		placeholder="비밀번호를 입력하세요.">
		</div>
		<div class="btn1space">
			<button class="quitBtn" id="quitBtn" type="submit"
					onclick="finalquit(this.form)">탈퇴 신청</button>
		</div>
		<div class="btn2space">
			<button class="backBtn" id="backBtn" type="submit"
					onclick="back(this.form)">취소</button>
		</div>
	</form>
	<%-- <jsp:include page="../common/include/footer.jspf" /> --%>
</body>
</html>