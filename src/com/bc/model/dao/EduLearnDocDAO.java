package com.bc.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bc.model.vo.AdminDocJoinOptionVO;
import com.bc.model.vo.LearnDocumentsVO;
import com.bc.resource.DBService;

public class EduLearnDocDAO {
	public List<AdminDocJoinOptionVO> learnDocIdx() throws Exception {
		SqlSession session = DBService.getFactory().openSession(); 
		List<AdminDocJoinOptionVO> list = session.selectList("eddoc.joineduidx"); 
		session.close();
		return list;
	}
	
	public int docLiInsert(LearnDocumentsVO ldVo) {
		SqlSession session = DBService.getFactory().openSession(true); 
		int res = session.insert("eddoc.docinsert", ldVo); 
		session.close();
		System.out.println(res);
		return res;
	}
}
