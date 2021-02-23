<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교육 > 미술관교육소개</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style>
span{

     display: block;

}

html, body {
	box-sizing: border-box;
	height: 100%;
}

.program_list_tit {
	text-align: center;
	font-size: 2.25em;
	font-weight: 400;
	line-height: 1;
	margin: 30px 0 40px
}

.sub_title {
	margin-top: 0;
	margin-bottom: 0;
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
.extra_tit_area {
	position: relative;
	text-align: center;
	font-size: 0.875em;
	font-weight: 400;
}

.extra_tit_img {
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
.a_btn {
	padding: 10px;
	display: inline-block;
	background-color: gray;
	border: 1px solid gray;
	border-radius: 5px;
	text-decoration: none;
	
}

.program_list_text_in{
	margin: 0;
	padding: 0;
	position: relative;
	display: inline-block;
	width: 100%;
	height: 100%;
	
}

.program_list_text_in ul {list-style-type:none; margin:30px; padding:10px;}
.program_list_text_in ul li {
	position: relative;
	display: flex;
	margin: 30px 10px 40px;
	width: 30%;
}

.data_type1 {
	display: block;
    border-collapse: separate;
    border-spacing: 1px;
    text-align: center;
    line-height: 1.5;
    margin: 20px 10px;
    height: 100px;
    width: 
}

.data_type1 th {
    width: 155px;
    height: 114px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
}

.data_type1 td {
    width: 400px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}

.paging {
    list-style: none;
    display: flex;
    justify-content: center;
}
.paging>li {
    border: 1px solid #606060;
    width: 3em;
    height: 3em;
    text-align: center;
    line-height: 3em;
    margin-right: 0.25em;
}
.paging>li:first-child, .paging>li:nth-child(2), 
.paging>li:nth-last-child(2), .paging>li:last-child 
{
    border: none;
    width: 2.2em;
    font-size: 1.2em;
    line-height: 2.6em;
}
.paging li i {
    color: #808080;
}
.paging li>a {
    text-decoration: none;
    color: #606060;
    font-weight: 400;
}
.now {
    background-color: #1f1f1f;
    color: whitesmoke;
    font-weight: 500;
    text-decoration: underline;
}
.paging li:not(li.now):hover {
    cursor: pointer;
    text-decoration: underline;
}
.paging .disable {
    display: none;
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
	<div class="extra_tit_img">
		<img src="${eduVo.edu_imglocal}">
	</div>
 	<div class="program_list_text_in">
		<ul>
		<c:forEach var="dvo" items="${detaillist}">
			 <c:if test="${dvo.edu_detailstatus eq 'EDUDT01'}">
			<li>
				<h6>${dvo.edu_target}</h6>
				<div class="art_info">
					<table class="data_type1" border="">
 						<tbody>
							<tr>
								<th scope="row">주요내용</th>
								<td><a href="lean?param=${dvo.edu_detidx }">${dvo.edu_impt_contents}</a></td>
							</tr>
							<tr>
								<th scope="row">운영시기</th>
								<td>${dvo.edu_period_start } ~ ${dvo.edu_period_end }</td>
							</tr>
							<tr>
								<th scope="row">장소</th>
								<td>${dvo.edu_detailaddr }</td>
							</tr>
						</tbody>
					</table>
				</div>
			</li>
			</c:if> 
			</c:forEach>
		</ul>
	</div>
	
		<table border="">
			<tfoot>
				<tr>
					<td>
						<ol class="paging">
					<c:choose>
						<c:when test="${pvo.nowBlock eq 1}">
							<li class="disable"><i class="fas fa-angle-double-left"></i></li>
							<li class="disable"><i class="fas fa-angle-left"></i></li>
						</c:when>
						<c:when test="${pvo.nowBlock > 1}">
							<li onclick="goPage('1')"><i class="fas fa-angle-double-left"></i></li>
							<li onclick="goPage('${pvo.nowPage - 1}')"><i class="fas fa-angle-left"></i></li>
						</c:when>
					</c:choose>
					
					<c:forEach var="pageNo" begin="${pvo.beginPage}" end="${pvo.endPage}">
						<c:if test="${pageNo == pvo.nowPage }">
							<li class="now">${pageNo}</li>
						</c:if>
						<c:if test="${pageNo ne pvo.nowPage}">
							<li onclick="goPage('${pageNo}')">${pageNo}</li>
						</c:if>
					</c:forEach>	
						
					<c:choose>
						<c:when test="${pvo.nowBlock eq pvo.totalBlock}">
							<li class="disable"><i class="fas fa-angle-right"></i></li>
							<li class="disable"><i class="fas fa-angle-double-right"></i></li>
						</c:when>
						<c:when test="${pvo.nowBlock < pvo.totalBlock}">
							<li onclick="goPage('${pvo.nowPage + 1}')"><i class="fas fa-angle-right"></i></li>
							<li onclick="goPage('${pvo.totalPage}')"><i class="fas fa-angle-double-right"></i></li>
						</c:when>
					</c:choose>	
						</ol>
					</td>
				</tr>
			</tfoot>
		</table>
	<div class="a-div-btn">
		<a href="learnUtil?paramUtil=learnInsert" class="a_btn"><span>추가</span></a>
		<a href="learnUtil?paramUtil=learnUpdate" class="a_btn"><span>수정</span></a>
		<a href="learnUtil?paramUtil=learnDelete" class="a_btn"><span>삭제</span></a>
	</div>
</body>
<script>
	function goPage(pageNum) {
		location.href = "learnlist?cPage=" + pageNum;
	}
</script>
</html>
