package com.inhatc.spring.cop.mapper;

import java.util.List;
import java.util.Map;

import com.inhatc.spring.vo.CopVO;

public interface CopMapper {
	//업체 등록
	public void copRegist(CopVO vo) throws Exception;
	//업체 조회
	public List<Map<String, Object>> copAll() throws Exception;
	//업체 상세
	public Map<String, Object> copOne(int cop_no) throws Exception;
	//업체 삭제
	public void copDelete(int cop_no) throws Exception;
	//업체 수정
	public void copUpdate(CopVO vo) throws Exception;
}
