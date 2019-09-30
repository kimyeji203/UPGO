package com.inhatc.spring.prod.service;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inhatc.spring.prod.mapper.ProdMapper;
import com.inhatc.spring.vo.ProdVO;

@Service
public class ProdService {
	@Autowired
	ProdMapper pm;
	
	public String selectProdName() throws Exception {
		return pm.selectProdName();
	}
	
	public List<ProdVO> selectAllData() throws Exception {
		return pm.selectAllData();
	}
	
	public List<ProdVO> selectOneData(String no) throws Exception {
		return pm.selectOneData(no);
	}

	public void insertData(ProdVO vo) throws Exception{
		pm.insertData(vo);
	}
	
	public void deleteData(String no) throws Exception {
		pm.deleteData(no);
	}

	public void updateData(ProdVO vo) throws Exception {
		pm.updateData(vo);
	}
}