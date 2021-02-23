<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>leanEducation</title>
<style>
span{
     display: block;
}

/*----- 페이징 처리 -----*/
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
	<div class="title_area">
		<h3 class="sub_title">
			<span>참여신청</span>
		</h3>
	</div>
	<div>
		<h4>예약중인 교육</h4>
	</div>
	<div class="sect1">
		<div class="brd_area">
			<div class="brd_title">
				<ul class="list_type4 career" id="ingList">
				<c:forEach var="leanvo" items="${leanlist }">
					<c:if test="${leanvo.edu_detailstatus == 'EDUDT01'}">
					<li><a href="lean?param=${leanvo.edu_detidx }" class="place_type">
							<span>${leanvo.edu_detailname }</span> 
							<span>${leanvo.edu_period_start } ~ ${leanvo.edu_period_end }</span> 
							<span class="state_reserving">예약중</span>
						</a>
					</li>
					</c:if>
				</c:forEach>
				</ul>
					<!-- 페이징 -->
			</div>
		</div>
	</div>
	<div>
		<a href="learnUtil?paramUtil=learnInsert" class="a_btn"><span>추가</span></a>
		<a href="learnUtil?paramUtil=learnUpdate" class="a_btn"><span>수정</span></a>
		<a href="learnUtil?paramUtil=learnDelete" class="a_btn"><span>삭제</span></a>
	</div>
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
</body>
<script>
	function goPage(pageNum) {
		location.href = "education?cPage=" + pageNum + "&param=${param.param}";
	}
</script>
</html>