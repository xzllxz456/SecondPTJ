<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교육 > 미술관교육소개</title>

<style>
/* html,
body {
	box-sizing: border-box;
	height: 100%;
} */
.intro_text {
	font-size: 1.3em;
	font-weight: bold;;
}

.intro_text_row {
	position: relative;
	padding-left: 50px;
}

.intro_text span:before {
	content: '';
	position: absolute;
	background-color: black;
	display: block;
	width: 2px;
	height: 16px;
	top: 4px;
	left: -10px;
	background-color: #e94040;
}

.program_list_tit {
	text-align: center;
	font-size: 2.25em;
	font-weight: 400;
	line-height: 1;
	margin: 30px 0 40px
}
/*     .intro_text_row :before{
        content: '';
        position: absolute;
        display: block;
        left: 100; top: 100px;
        width: 100px; height: calc(100% - 4px);
        background-color: #e1e1e1;
        border-style: solid;
    } */
.intro_text span {
	position: relative;
}

.sub_title {
	margin-top: 0;
	margin-bottom: 0;
}

.sub_title {
	text-align: center;
	font-size: 2.25em;
	font-weight: 400;
	line-height: 1;
	margin: 30px 0 40px
}

.sub_title span {
	display: inline-block;
	border-top: 1px solid #0a1923;
	padding: 6px 1px 0;
}

.sub_title+p {
	position: relative;
	text-align: center;
	font-size: 0.875em;
	font-weight: 400;
}

.gray1 {
	margin: 0;
	padding: 0;
	position: relative;
	display: inline-block;
	width: 100%;
	height: 100%;
	background-color: gray;
}

.edu_list {
	position: relative;
	display: flex;
	margin: 30px 10px 40px;
	width: 30%;
}

.edu-list-dv ul {list-style-type:none; margin:30px; padding:10px;}

.edu-li-span{
	position: absolute;
    top: -43px;
    left: 14px;
}
</style>
<script>
	function insert_btn(frm) {
		//?utilparam=insert
		frm.action = "adminEduBtn"; //list 요청
		frm.submit();
	}
	function delete_btn(frm) {
		frm.action = "adminEduBtn"; //list 요청
		frm.submit();
	}
	function update_btn(frm) {
		frm.action = "adminEduBtn"; //list 요청
		frm.submit();
	}
</script>
</head>
<body>
	<h3 class="sub_title">
		<span>미술관 교육소개</span>
	</h3>

	<section>
		<div class="intro_text_row">
			<div class="intro_text">
				국립현대미술관은<br /> <span>현대예술의 역동성과 실험성,</span><br /> 그리고 일상에서 예술의 가치를
				발견할 수 있는<br /> 교육프로그램을 운영합니다.<br />
			</div>
			<div class="intro_extra_text">
				유아부터 성인에 이르기까지 다양한 문화적 배경의 참여자가 함께하는 교육프로그램은<br /> 관람객 스스로 의미 있는
				학습을 통해 현대미술을 경험하고, 사회와의 소통을 시도하는 열린 미술관을 지향합니다.
			</div>
		</div>
	</section>
	<p class="program_list_tit">교육프로그램 안내</p>
		<div>
			<a href="adminEduBtn?utilparam=insert">추가</a>
			<a href="adminEduBtn?utilparam=delete">삭제</a>
			<a href="adminEduBtn?utilparam=update">수정</a>
		</div>	
	<div class="gray1">
		<section>
			<div class="edu-list-dv">
				<form action="education" method="get">
					<ul>
					<c:forEach var="eduVo" items="${edulist }">
	 				<c:if test="${eduVo.edu_status eq 'ED01'}">
						<li class="edu_list"><span class="edu-li-span">${eduVo.edu_name}<br />교육</span><br> 
						<a href="education?param=${eduVo.edu_title}">
							<img src="${eduVo.edu_imglocal}" style="width: 500px; height: 300px;">
						</a>
						</li>
					</c:if> 
					</c:forEach>
					</ul>
				</form>
			</div>
		</section>
	</div>
</body>
</html>