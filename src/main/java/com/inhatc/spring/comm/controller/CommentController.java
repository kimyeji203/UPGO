package com.inhatc.spring.comm.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.inhatc.spring.comm.domain.CommentVO;
import com.inhatc.spring.comm.service.CommentService;

@Controller
@RequestMapping("/comment")
public class CommentController {
	
	@Resource(name="com.inhatc.spring.comm.service.CommentService")
	CommentService mCommentService;

	//댓글 리스트
	@RequestMapping("/list")
	@ResponseBody
	private List<CommentVO> mCommentList(@RequestParam int b_no) throws Exception {
		return mCommentService.commentListService(b_no);
	}
	
	//댓글 작성
	@RequestMapping("/insert")
	@ResponseBody
	private int mCommentInsert(@RequestParam int b_no, @RequestParam String c_content, HttpServletRequest request) throws Exception {
		
		CommentVO comment = new CommentVO();
		comment.setB_no(b_no);
		comment.setC_content(c_content);
		comment.setC_writer("익명");
		return mCommentService.commentInsertService(comment);
	}
	
	@RequestMapping("/update")
	@ResponseBody
	private int mCommentUpdateProc(@RequestParam int c_no, @RequestParam String c_content) throws Exception {
		CommentVO comment = new CommentVO();
		
		comment.setC_no(c_no);
		comment.setC_content(c_content);
		
		return mCommentService.commentUpdateService(comment);
	}
	
	@RequestMapping("/delete/{c_no}")
	@ResponseBody
	private int mCommentDelete(@PathVariable int c_no) throws Exception {
		return mCommentService.commentDeleteService(c_no);
	}
}
