package com.bc.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.EduDAOImpl;
import com.bc.model.dao.EduDetImpl;
import com.bc.model.vo.DetailEducationVO;
import com.bc.model.vo.EducationVO;

public class LearnListImpl implements EduCommandServlet{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 교육진행중 리스트 불러오기
		
		
		List<DetailEducationVO> list = new EduDetImpl().detailEdu();
		request.setAttribute("leanlist", list);
		return "eduadmin/learnList.jsp";
	}
}
