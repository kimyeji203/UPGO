package com.inhatc.spring.comm.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.inhatc.spring.comm.domain.CommentVO;
import com.inhatc.spring.comm.mapper.CommentMapper;

@Service("com.inhatc.spring.comm.service.CommentService")
public class CommentService {
	@Resource(name="com.inhatc.spring.comm.mapper.CommentMapper")
	CommentMapper mCommentMapper;
	
	public List<CommentVO> commentListService(int b_no) throws Exception {
		return mCommentMapper.commentList(b_no);
	}
	
	public int commentInsertService(CommentVO comment) throws Exception {
		return mCommentMapper.commentInsert(comment);
	}
	
	public int commentUpdateService(CommentVO comment) throws Exception {
		return mCommentMapper.commentUpdate(comment);
	}
	
	public int commentDeleteService(int c_no) throws Exception {
		return mCommentMapper.commentDelete(c_no);
	}
}
