package com.bc.command.learndocu;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.EduDAOImpl;
import com.bc.model.dao.EduDetImpl;
import com.bc.model.dao.EduLearnDocDAO;
import com.bc.model.vo.AdminDocJoinOptionVO;
import com.bc.model.vo.DetailEducationVO;
import com.bc.model.vo.EducationVO;

public class LearnDocInsertCommandImpl implements LearnDocCommandServlet {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			List<DetailEducationVO> list = new EduDetImpl().detailEdu();
			request.setAttribute("detlist", list);
			List<EducationVO> edulist = new EduDAOImpl().exam();
			request.setAttribute("edulist", edulist);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "eduadmin/view/adminlearnedudocumentinsert.jsp";
	}
}
