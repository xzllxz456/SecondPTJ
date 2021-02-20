package com.bc.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.AdminDAOUtil;
import com.bc.model.vo.EducationVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


public class AdminEducationInsertFileUpload implements EduCommandServlet{
	
	final static int SIZE = 100 * 1024 * 1024;
	final static String PATH = "eduadmin/image/";
	// insert page commander
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ajax로 처리함 안씀
//		//upload
//		String  directory = request.getSession().getServletContext().getRealPath(PATH);
//		// 파일 처리 세팅
//		MultipartRequest mr = new MultipartRequest(request, directory, (SIZE),
//				"UTF-8", new DefaultFileRenamePolicy());
//		// edu 객체에 담기
//		EducationVO eduVo = new EducationVO();
//		eduVo.setEdu_name(mr.getParameter("eduname"));
//		eduVo.setEdu_title(mr.getParameter("edutitle"));
//		eduVo.setEdu_contents(mr.getParameter("educontents"));
//		eduVo.setEdu_status(mr.getParameter("ED01"));
//		// 파일 있는지 없는지 체크
//		if(mr.getFile("edufile") != null) {
//			eduVo.setEdu_imgname(mr.getOriginalFileName("edufile"));
//			eduVo.setEdu_imglocal(PATH + eduVo.getEdu_imgname());
//			System.out.println(mr.getFilesystemName("edufile"));
//			System.out.println(eduVo+"dddddddddddddddddd");
//			int res = new AdminDAOUtil().insert(eduVo);
//		} else {
//			eduVo.setEdu_imgname(mr.getOriginalFileName(""));
//			eduVo.setEdu_imglocal("");
//		}
		return "education";
	}
	
}
