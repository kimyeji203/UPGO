package com.inhatc.spring.comm.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.inhatc.spring.comm.domain.CommentVO;

@Repository("com.inhatc.spring.comm.mapper.CommentMapper")
public interface CommentMapper {

	public List<CommentVO> commentList(int b_no) throws Exception;
	public int commentInsert(CommentVO comment) throws Exception;
	public int commentUpdate(CommentVO comment) throws Exception;
	public int commentDelete(int c_no) throws Exception;
}
