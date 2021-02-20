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

public class ProCommandImpl implements EduCommandServlet{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		subTitle(request, response);
		listUtil(request, response);
		return "eduadmin/view/proeducation.jsp";
	}
	
	private void subTitle(HttpServletRequest request, HttpServletResponse response) {
		EducationVO dEduVo;
		// 분야 상세 리스트 가져오기
		try {
			dEduVo = new EduDAOImpl().detailMenu(request.getParameter("param"));
			request.setAttribute("eduVo", dEduVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	private void listUtil(HttpServletRequest request, HttpServletResponse response) {
		// 분야별 교육
		try {
			EducationVO dEduVo = (EducationVO) request.getAttribute("eduVo");
			List<DetailEducationVO> list = new EduDetImpl().exam(dEduVo.getEdu_idx());
			request.setAttribute("detlist", list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
