package com.bc.command;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.AdminDAOUtil;

public class AdminEducationDeleteUpload implements EduCommandServlet{
// 안쓰는 기능 
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		int res = new AdminDAOUtil().delete(request.getParameterValues("educheck"));
//		PrintWriter out = response.getWriter();
//		if(res > 0) {
//			String json = new Gson().toJson(res);
//			System.out.println(json);
//			out.write("true");
//		} else {
//			out.write("false");
//		}
		return "";
	}
}
