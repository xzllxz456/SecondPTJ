<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<link rel="stylesheet" href="../common/css/style.css" />
<link rel="shortcut icon" href="../common/image/favicon.ico" />
<link rel="icon" href="../common/image/favicon.ico" />
<style>
* {
	user-select: none; /* 사용자가 드래그 못하게 */
}

#tophr {
	margin-top: 50px;
}

#hhh1 {
	display: flex;
	justify-content: center;
	margin-top: 20px;
}

#hh1 {
	margin-top: 1em;
	font-size: 2.5em;
	font-weight: 500;
	color: #222;
	border-top: 1px solid #606060;
	padding: 0.35em 0;
}

.texth {
	display: flex;
	justify-content: center;
	margin-top: 10px;
	margin-bottom: 20px;
}

h3, h4 {
	display: inline-block;
}

.menubar {
	list-style: none;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	padding: 0 0.5em;
}

.menubar li {
	margin-top: 20px;
	justify-content: center;
	padding-top: 17px;
	width: 100%;
	height: 37px;
	text-align: center;
	background-color: #999;
	text-decoration: none;
}

li a, #first_li {
	text-decoration: none;
	color: white;
}

#first_li {
	background-color: #E94040;
}

#second_li:hover {
	cursor: pointer;
}
.memtable-wrap {
	width: 80%;
	margin-left: auto; margin-right: auto;
}
table {
	border-collapse: collapse;
	width: 100%;
	margin: auto;
	text-align: center;
	margin: 0.5em;
	border-top: 2px solid #222;
	border-bottom: 2px solid #222;
}

th {
	width: 30%;
	background-color: #EBEBEB;
	padding: 15px 30px 15px 0;
	text-align: right;
	font-size: 0.87em;
}

td {
	width: 100%;
	background-color: WHITE;
	padding: 15px 0px 15px 50px;
	text-align: left;
	font-size: 0.87em;
}

.must::before {
	content: "*";
	color: #E94040;
}

.redstar {
	color: #E94040;
}

.forred {
	display: inline-block;
	color: #E94040;
	font-size: 13px;
	padding-left: 5px;
}

input[type=text], input[type=password] {
	width: 290px;
	height: 51px;
	color: #aaa;
	padding: 12px 20px;
	margin: 8px 0;
	font-size: 17px;
	border: 2px solid #ddd;
	border-radius: 4px;
	box-sizing: border-box;
}

#phone, #cellphone {
	width: 165px;
	height: 51px;
}

select {
	width: 117px;
	height: 50px;
	padding-top: 3px;
	font-size: 17px;
	color: #999;
	border: 2px solid #ddd;
	font-size: 16px;
}

.updateBtn {
	width: 290px;
	height: 51px;
	border: none;
	background-color: red;
	padding: .8em .5em;
	color: white;
	border-radius: 5px;
	font-size: 15px;
	font-weight: bold;
	margin: 4px 2px;
	cursor: pointer;
	display: inline-block;
}

.quitbtn {
	width: 150px;
	height: 30px;
	border: none;
	background-color: #EBEBEB;
	font-size: 12px;
	font-weight: bold;
	cursor: pointer;
	float: right;
	display: block;
}

#updateBtn {
	display: block;
	margin: 50px auto 50px;
}
</style>

<script>

	function quit(frm) {
		let login = "${login}";
		console.log(login);
		if(login) {
			frm.action="join?type=quit";
			frm.submit();
		} else {
			alert("로그인 후 이용해주세요.");
			history.back();
		}
	}

	// 필수 입력항목 값 넣었는지 체크하는 메서드 (**required 기능으로 대체 가능하다)
	function checkValue() {
		let form = document.querySelector("form");
		let labels = ["아이디는", "비밀번호는", "비밀번호는", "이름은", "휴대전화 번호는", "이메일은"];
		let items = document.querySelectorAll(".must + td > input");
		
		for (let i=0; i<items.length; i++) {
			let item = items[i];
			
			if (item.value == null || item.value.trim().length == 0) {
				console.log("i : " + i);
				console.log(labels[i]);
				console.log(labels);
				alert(labels[i] + " 필수 입력 항목입니다");
				item.value = "";
				item.focus();
				event.preventDefault(); // 버튼의 기본 동작(여기선 submit) 막음.
				return;		
			}	 
		}
		// 값이 제대로 들어와있으면 버튼이 type="submit"이니까 따로 form.submit(); 안해도 됨
	}

	// input박스에 default로 들어있는값 클릭하면 빈칸으로 만들기
	// * 아이디, 이름은 readonly로 값 변경 못하게 처리 / 성별은 일단 없애버렸음
	function clearText(thefield) {
		if (thefield.defaultValue == thefield.value) {
			thefield.value = "";			
		}
	}

</script>

</head>
<body>
	<%-- <jsp:include page="../common/include/header.jspf" /> --%>
	<hr>
	<div>
		<ul class="menubar">
			<li id="first_li">개인정보수정</li>
			<li id="second_li" onclick="location.href='#'"><a href="#">예약정보내역</a></li>
		</ul>
	</div>
	<div>
		<div id="hhh1">
			<div id="hh1">개인정보수정</div>
		</div>
	</div>
	<div class="texth">
		<h3>기본정보</h3>
		<h4>
			(<span class="redstar"> *</span>는 필수정보입니다. )
		</h4>
		<!-- <h4 id="redstar">&nbsp;*</h4>
		<h4>는 필수정보입니다. )</h4> -->
	</div>
	<form action="join" method="post" id="updateForm">
		<div class="memtable-wrap">
			<table id="bodytable">
				<tbody>
					<tr id="line">
						<th class="must">아이디</th>
						<td><label for="id" class="blind"></label> <input type="text"
							name="id" id="id" value="${sessionScope.login.mem_id}" readonly>
						</td>
					</tr>
					<tr id="line">
						<th class="must">비밀번호</th>
						<td><label for="pw" class="blind"></label> <input
							type="password" name="pw" id="pw"
							value="${sessionScope.login.mem_pwd}" onFocus="clearText(this)"
							pattern="[A-Za-z0-9]{4,}" title="비밀번호는 4글자이상 입력하세요!"> <a
							class="forred">※ 비밀번호는 4글자 이상 입력해야 합니다.</a></td>
					</tr>
					<tr>
						<th class="must">비밀번호 확인</th>
						<td><label for="pwcheck" class="blind"></label> <input
							type="password" name="pwcheck" id="pwcheck"
							onFocus="clearText(this)" pattern="[A-Za-z0-9]{4,}"
							title="비밀번호는 4글자이상 입력하세요!"> <a class="forred"><span
								id="spanhere">※ 비밀번호 확인을 위해 비밀번호를 한번 더 입력해주세요.</span></a></td>
					</tr>
					<tr id="line">
						<th class="must">이름</th>
						<td><label for="name" class="blind"></label> <input
							type="text" name="name" id="name"
							value="${sessionScope.login.mem_name}" readonly></td>
					</tr>
					<tr id="line">
						<th class="must">성별</th>
						<td>
							<div>
								<input type="radio" name="gender" value="male" id="male"
									${sessionScope.login.mem_sex eq "male" ? "checked" : "" }
									readonly> <label for="male">남성</label> <input
									type="radio" name="gender" value="female" id="female"
									${sessionScope.login.mem_sex eq "female" ? "checked" : "" }
									readonly> <label for="female">여성</label>
							</div>
						</td>
					</tr>
					<tr id="line">
						<th>연락처</th>
						<td><select name="area" id="area">
								<option value="02">02(서울)</option>
								<option value="051">051(부산)</option>
								<option value="053">053(대구)</option>
								<option value="032">032(인천)</option>
								<option value="062">062(광주)</option>
								<option value="042">042(대전)</option>
								<option value="052">052(울산)</option>
								<option value="044">044(세종)</option>
								<option value="031">031(경기)</option>
								<option value="033">033(강원)</option>
								<option value="043">043(충북)</option>
								<option value="041">041(충남)</option>
								<option value="063">063(전북)</option>
								<option value="061">061(전남)</option>
								<option value="054">054(경북)</option>
								<option value="055">055(경남)</option>
								<option value="064">064(제주)</option>
						</select> <label for="phone" class="blind"></label> <input type="text"
							name="phone" id="phone" value="${sessionScope.login.bodyPhone()}"
							pattern="\d{3,4}-\d{4}" title="1234-5678형식으로 입력해주세요"> <a
							class="forred">※ 전화번호는 1234-5678형식으로 입력해주세요.</a></td>
					</tr>
					<tr id="line">
						<th class="must">휴대전화</th>
						<td><select name="cellphone_prefix" id="cp">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
						</select> <label for="cellphone" class="blind"></label> <input type="text"
							name="cellphone" id="cellphone"
							value="${sessionScope.login.bodyCellphone()}"
							pattern="\d{3,4}-\d{4}" title="1234-5678형식으로 입력해주세요"> <a
							class="forred">※ 휴대폰번호는 1234-5678형식으로 입력해주세요.</a></td>
					</tr>
					<tr id="line">
						<th class="must">이메일</th>
						<td><label for="email" class="blind"></label> <input
							type="text" name="email" id="email"
							value="${sessionScope.login.mem_email}"
							pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}"
							title="callback@museum.com형식으로 입력해주세요"></td>
					</tr>
					<tr id="line">
						<th>주소</th>
						<td><label for="address" class="blind"></label> <input
							type="text" name="address" id="address"
							value="${sessionScope.login.mem_addr}" maxlength="30"
							pattern="[ㄱ-힣0-9\s]{5,}" title="주소를 정확히 입력해주세요"></td>
					</tr>
				</tbody>
			</table>
			<div class="quitbtn">
				<input type="hidden" name="type" value="quit">
				<button class="quitbtn" name="quitbtn" type="submit"
					onclick="quit(form)">회원탈퇴</button>
			</div>
			<div class="btn">
				<input type="hidden" name="type" value="updatecomplete"> <input
					type="hidden" name="gender" value="${sessionScope.login.mem_sex}">
				<button class="updateBtn" id="updateBtn" type="submit"
					onclick="checkValue(event)">회원정보수정</button>
			</div>
		</div>
		<%-- <jsp:include page="../common/include/footer.jspf" /> --%>
	</form>
	<script>
		let msg = "${param.msg}";
		if(msg) {
			alert(msg);
		}
		
		// phone 앞부분을 회원가입했을 때 select한게 selected 되어있게 처리하기
		let prefixPhone = "${sessionScope.login.prefixPhone()}";
		let options = document.querySelectorAll("#area > option");		
		// phone의 selected id = area
		for (let option of options) {
			if (option.value === prefixPhone) {
				option.setAttribute("selected", true);
				break;
			}
		}
		// cellphone 앞부분을 회원가입했을 때 select한게 selected 되어있게 처리하기
		let prefixCellphone = "${sessionScope.login.prefixCellphone()}";
		let cellOptions = document.querySelectorAll("#cp > option");	
		// cellphone의 selected id = cp
		for (let option of cellOptions) {
			if(option.value === prefixCellphone) {
				option.setAttribute("selected", true);
				break;
			}
		}
		
		// 알맞는 형식에 안맞는경우 red-border처리해주고 경고메세지 띄우기
		//validation messege는 경고창에 뜨는 메세지. 위에 imput태그안의 title에 입력할 메세지 적는다
		let validTargets = document.querySelectorAll("input[pattern]");
		for (let target of validTargets) {
			target.validationMessage = target.title;
			target.addEventListener("change", function(){
				let valid = this.checkValidity();
				if (valid) {
					this.classList.remove("red-border");
				} else {
					this.classList.add("red-border");
					this.reportValidity();
				}
			});
		}

	</script>
</body>
</html>
<style>
.red-border {
	border-color: red !important;
	outline-color: red !important;
}
</style>