package com.inhatc.spring.comm.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.inhatc.spring.comm.domain.BoardVO;
import com.inhatc.spring.comm.mapper.BoardMapper;
import com.inhatc.spring.vo.CopVO;

@Service("com.inhatc.spring.comm.service.BoardService")
public class BoardService {
	
   @Resource(name="com.inhatc.spring.comm.mapper.BoardMapper")
   BoardMapper mBoardMapper;
   
   public List<BoardVO> boardListService() throws Exception {
	   return mBoardMapper.boardList();
   }
   
   public int boardCountService() throws Exception {
	   return mBoardMapper.boardCount();
   }
   
   public int boardInsertService(BoardVO board) throws Exception {
      return mBoardMapper.boardInsert(board);
   }
   
   public BoardVO boardDetailService(int b_no) throws Exception {
	   return mBoardMapper.boardDetail(b_no);
   }
   
   public int boardHitService(int b_no) throws Exception {
	   return mBoardMapper.boardHit(b_no);
   }
   
   public int boardUpdateService(BoardVO board) throws Exception {
	   return mBoardMapper.boardUpdate(board);
   }
   
   public int boardDeleteService(int b_no) throws Exception {
	   return mBoardMapper.boardDelete(b_no);
   }
   
   public List<CopVO> copSelectAllService() throws Exception {
	   return mBoardMapper.copSelectAll();
   }
}