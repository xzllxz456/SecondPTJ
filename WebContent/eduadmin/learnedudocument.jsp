<%@page import="java.net.URLEncoder"%>
<%@ page import="java.io.File" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교육자료 페이지</title>
<style>
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
	<form name="listForm" method="post" action="/common/fileDown.do"
		target="iFrameDownload">
		<section class="sect2 sect_pdb1">
			<!-- 검색박스 -->
			<div class="sch_area">
				<div class="input_box type_red m_block in_button">
					<div class="input_wrap">
						<label for="searchText" class="blind">검색어 입력</label> <input
							type="text" name="searchText" id="searchText" value=""
							placeholder="검색어를 입력하세요.">
					</div>
					<button type="button" onclick="fn_searchAjaxList();">
						<span class="fas fa-search">">검색</span>
					</button>
				</div>
			</div>
		</section>

		<section class="sect_pd1">
			<div class="sect_array">
				<aside class="left_sect2">
					<div class="sch_result_ctrl">
						<h4 class="accordion on">
							<a href="#" role="button"><span>카테고리</span></a>
						</h4>
						<div class="choice_box open_con on">
							<ul>
								<li>
									<div class="choice_wrap">
										<input type="checkbox" id="check_1" name="check_1"
											class="design" onclick="fn_deselect_all();" checked="checked">
										<label for="check_1">전체</label>
									</div>
								</li>


								<li>
									<div class="choice_wrap">
										<input type="checkBox" name="check" id="check_2" value="01"
											class="design" onclick="fn_searchAjaxListChk();"> <label
											for="check_2">전문인</label>
									</div>
								</li>

								<li>
									<div class="choice_wrap">
										<input type="checkBox" name="check" id="check_3" value="02"
											class="design" onclick="fn_searchAjaxListChk();"> <label
											for="check_3">성인</label>
									</div>
								</li>

								<li>
									<div class="choice_wrap">
										<input type="checkBox" name="check" id="check_4" value="03"
											class="design" onclick="fn_searchAjaxListChk();"> <label
											for="check_4">청소년/교사</label>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</aside>
				<section class="right_sect2">
					<div class="brd_area">
						<div id="listDiv">
							<ul class="list_type1 edu_reference_list">
							<c:forEach var="ldVo" items="${ldVo }">
							<c:if test="${ldVo.doc_status == 'LD01'}">
								<li>
								
								<span class="list_info">
										<span>${ldVo.edu_name}</span>
								</span>
									<p class="subject">${ldVo.edu_impt_contents}</p>
									<p class="subject_desc"></p>
									<p style="line-height: 1.8;">
										<span style="font-size: 12pt;">
											${ldVo.doc_text }
										</span>
									</p>
									<p style="line-height: 1.8;">
										<span style="font-size: 12pt;">전시기간: ${ldVo.edu_period_start }
											${ldVo.edu_period_end } </span><br> <br>
									</p>
									<p></p>
									<div class="files_area">
										<span class="download">
										<a href="downloadAct?filename=${ldVo.doc_filename }">${ldVo.doc_filename }</a>
										
										 <!-- <a href="javascript:;"
											onclick="downloadFiles('/upload/board/201309040000011/2020/05/2020051802192963013653.pdf','MMCA 소장품 하이라이트 2020+_어린이 전시감상 활동지.pdf','202005180007209','202005180006281','Y'); return false;"
											class="ftclr_red1">MMCA 소장품 하이라이트 2020+_어린이 전시감상 활동지.pdf
											</a> -->
										</span>
									</div>
								</li>
								</c:if>
								</c:forEach>
							</ul>
						</div>
					</div>
				</section>
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
							<li onclick="goPage('${pvo.nowPage - 2}')"><i class="fas fa-angle-left"></i></li>
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
							<li onclick="goPage('${pvo.nowPage + 2}')"><i class="fas fa-angle-right"></i></li>
							<li onclick="goPage('${pvo.totalPage}')"><i class="fas fa-angle-double-right"></i></li>
						</c:when>
					</c:choose>	
						</ol>
					</td>
				</tr>
			</tfoot>
				</table>
				<div>
					<a href="adDocInsertApi">추가</a>
					<a href="docutil?docparam=update">수정</a>
					<a href="docutil?docparam=delete">삭제</a>
				</div>
			</div>
		</section>
	</form>
</body>
<script>
	function goPage(pageNum) {
		location.href = "edlearndoc?cPage=" + pageNum;
	}
</script>
</html>