package com.bc.controller.news;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.NoticeDAO;
import com.bc.model.vo.NoticeVO;
import com.google.gson.Gson;

@WebServlet("/admin/recent")
public class RecentNews_testFile extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// { list : [ ... ] , [ ... ] , [ ... ] }
		
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", 1);
		map.put("end", 5);
		
		List<NoticeVO> list = NoticeDAO.getList(map);
		
		String json = new Gson().toJson(list);
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");
		response.setHeader("Access-Control-Allow-Origin", "*");
		
		response.getWriter().write(json);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

