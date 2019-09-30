package com.inhatc.spring.prod.mapper;


import java.util.List;

import com.inhatc.spring.vo.ProdVO;

public interface ProdMapper {
	public String selectProdName() throws Exception;
	public List<ProdVO> selectAllData() throws Exception;
	public List<ProdVO> selectOneData(String no) throws Exception;
	public void insertData(ProdVO vo) throws Exception;
	public void deleteData(String no) throws Exception;
	public void updateData(ProdVO vo) throws Exception;
}