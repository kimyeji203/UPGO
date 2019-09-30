package com.inhatc.spring.comm.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.inhatc.spring.comm.domain.BoardVO;
import com.inhatc.spring.vo.CopVO;

@Repository("com.inhatc.spring.comm.mapper.BoardMapper")
public interface BoardMapper {
   public List<BoardVO> boardList() throws Exception;
   public int boardCount() throws Exception;
   public int boardInsert(BoardVO board) throws Exception;
   public BoardVO boardDetail(int b_no) throws Exception;
   public int boardHit(int b_no) throws Exception;
   public int boardUpdate(BoardVO board) throws Exception;
   public int boardDelete(int b_no) throws Exception;
   public List<CopVO> copSelectAll() throws Exception;
}