package com.bc.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.EduDAOImpl;
import com.bc.model.vo.EducationVO;


public class ProCommandImpl implements EduCommandServlet{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		subTitle(request, response);
		return "admin/view/proeducation.jsp";
	}
	
	private void subTitle(HttpServletRequest request, HttpServletResponse response) {
		EducationVO dEduVo;
		try {
			dEduVo = new EduDAOImpl().detailMenu(request.getParameter("param"));
			request.setAttribute("eduVo", dEduVo);
			System.out.println("변수를 받나?" + dEduVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
