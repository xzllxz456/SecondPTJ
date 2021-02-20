<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
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
			<p class="txt_sch_result">
				총 <b class="result">2</b>건이 검색되었습니다.
			</p>
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
								<li>
								<span class="list_info">
										<span>제목</span>
								</span>
									<p class="subject">learnpick</p>
									<p class="subject_desc"></p>
									<p style="line-height: 1.8;">
										<span style="font-size: 12pt;">
											내용
										</span>
									</p>
									<p style="line-height: 1.8;">
										<span style="font-size: 12pt;">전시기간: 2020-05.06.
											-2021.04.25. </span><br> <br>
									</p>
									<p></p>
									<div class="files_area">
										<span class="download"> <a href="javascript:;"
											onclick="downloadFiles('/upload/board/201309040000011/2020/05/2020051802192963013653.pdf','MMCA 소장품 하이라이트 2020+_어린이 전시감상 활동지.pdf','202005180007209','202005180006281','Y'); return false;"
											class="ftclr_red1">MMCA 소장품 하이라이트 2020+_어린이 전시감상 활동지.pdf</a>
										</span>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</section>
			</div>
		</section>
	</form>
</body>
</html>