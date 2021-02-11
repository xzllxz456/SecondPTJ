<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교육 > 미술관교육소개</title>
<!-- normalize.css -->
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" />
<style>
html, body {
	box-sizing: border-box;
	height: 100%;
}

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
	/* position: relative; */
	width: 100%;
	height: 300px;
	background-color: gray;
}
</style>
</head>
<body>
	<h3 class="sub_title">
		<span>미술관 교육소개</span>
	</h3>
	<div class="title_area">
		<h3 class="sub_title">
			<span>${eduVo.edu_name } 교육</span>
		</h3>
	</div>
	<div class="extra_tit_area">
		<!-- educontants 내용 -->
		${eduVo.edu_contents }
	</div>
<%-- 	<div class="program_list_text_in">
		<ul>
			<li>
				<h6>예비 전문인 연수프로그램</h6>
				<div class="art_info">
					<table class="data_type1">
						<caption>주요내용,운영시기,장소</caption>
						<colgroup>
							<col class="program_list_col_1">
							<col class="program_list_col_2">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">주요내용</th>
								<td>대학 및 대학원생, 전공자 등 예비 전문인 대상 미술관련 진로 탐색을 위한 교육프로그램</td>
							</tr>
							<tr>
								<th scope="row">운영시기</th>
								<td>3월 ~ 12월</td>
							</tr>
							<tr>
								<th scope="row">장소</th>
								<td>과천/서울</td>
							</tr>
						</tbody>
					</table>
				</div>
			</li>
			<li>
		</ul>
	</div> --%>
</body>
</html>