package com.inhatc.spring.ord.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inhatc.spring.vo.OrdVO;

@Service
public class OrdService {

	@Autowired
	private SqlSession session;
	
	private static String namespace = "com.inhatc.spring.mapper.OrdMapper";
	private static String cop_namespace = "com.inhatc.spring.mapper.CopMapper";
	
	
	//기타
	public List<Map<String, Object>> showProd() throws Exception{
		return session.selectList(namespace + ".showProd");
	}
	
	//주문 등록
	public List<Map<String, Object>> copList() throws Exception{
		return session.selectList(cop_namespace + ".copAll");
	}
	public void ordRegist(OrdVO vo) throws Exception{
		session.insert(namespace + ".ordRegist",vo);
	}
	
	//주문 조회
	public List<OrdVO> ordAll() throws Exception{
		return session.selectList(namespace + ".ordAll");
	}
	public String ordCopName(int cop_no) throws Exception{
		return session.selectOne(namespace + ".ordCopName", cop_no);
	}
	public String ordProdName(int prod_no) throws Exception{
		return session.selectOne(namespace + ".ordProdName", prod_no);
	}
	
	//주문상세보기
	public Map<String, Object> ordOne(int ord_no) throws Exception{
		return session.selectOne(namespace + ".ordOne", ord_no);
	}
	
	//주문 삭제
	public void ordDelete(int ord_no) throws Exception{
		session.delete(namespace + ".ordDelete",ord_no);
	}
	
	//주문 수정
	public void ordUpdate(OrdVO vo) throws Exception{
		session.update(namespace + ".ordUpdate", vo);
	}

	
	
}
