package com.bc.api.edudoc;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.EduLearnDocDAO;
import com.bc.model.vo.LearnDocumentsVO;
import com.bc.model.vo.PagingVO;

@WebServlet("/edlearndoc")
public class EduLearnDoc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		int totalRecord = new EduLearnDocDAO().getTotalRecord();
		PagingVO pvo = new PagingVO(1, totalRecord);
		
		String cPage = request.getParameter("cPage");
		if(cPage != null) {
			pvo = new PagingVO(Integer.parseInt(cPage), totalRecord);
		}
		
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", pvo.getBegin());
		map.put("end", pvo.getEnd());
		
		List<LearnDocumentsVO> ldVo = new EduLearnDocDAO().LnDocAllListPg(map);
		request.setAttribute("ldVo", ldVo);
		request.setAttribute("totalRecord", totalRecord);
		request.setAttribute("pvo", pvo);
		request.getRequestDispatcher("eduadmin/learnedudocument.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
