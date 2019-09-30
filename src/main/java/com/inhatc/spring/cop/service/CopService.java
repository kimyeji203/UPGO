package com.inhatc.spring.cop.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inhatc.spring.comm.domain.BoardVO;
import com.inhatc.spring.vo.CopVO;

@Service
public class CopService {

	@Autowired
	private SqlSession session;
	
	private static String namespace="com.inhatc.spring.mapper.CopMapper";
	
	//업체 등록
	public void copRegist(CopVO vo) throws Exception{
		session.insert(namespace + ".copRegist", vo);
	}
	//업체 조회
	public List<Map<String, Object>> copAll() throws Exception{
		return session.selectList(namespace + ".copAll");
	}
	//업체 상세 보기
	public Map<String,Object> copOne(int cop_no) throws Exception{
		return session.selectOne(namespace + ".copOne", cop_no);
	}
	
	//업체의 리뷰 보기
	public List<BoardVO> copReview(int cop_no) throws Exception{
		return session.selectList(namespace + ".copReview",cop_no);
	}
	
	//업체 삭제
	public void copDelete(int cop_no) throws Exception{
		session.delete(namespace + ".copDelete", cop_no);
	}
	//업체 수정
	public void copUpdate(CopVO vo) throws Exception{
		session.update(namespace + ".copUpdate", vo);
	}
}
