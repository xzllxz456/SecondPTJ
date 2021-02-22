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


</body>
</html>