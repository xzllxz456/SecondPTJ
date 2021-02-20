package com.bc.model.dao;

import java.util.List;

import com.bc.model.vo.EducationVO;


public interface EduDAOInterface {
	public List<EducationVO> exam() throws Exception;

	public EducationVO detailMenu(String edu_idx) throws Exception;
}
