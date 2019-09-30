package com.inhatc.spring.cop.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.inhatc.spring.comm.service.BoardService;
import com.inhatc.spring.cop.service.CopService;
import com.inhatc.spring.vo.CopVO;

@Controller
public class CopController {
	@Autowired
	CopService service; 
	
	@Autowired
	BoardService mBoardService;
	
	//업체 등록
	@RequestMapping("/cop_regist.do")
	public ModelAndView cop_regist() throws Exception{
		ModelAndView mv = new ModelAndView("coperation/cop_regist");
		
		return mv;
	}
	@RequestMapping("/copRegist.do")
	public void copRegist(CopVO vo, HttpServletResponse response) throws Exception{
		service.copRegist(vo);
		
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('등록되었습니다.');location.href='/cop_list.do'</script>");
        out.flush();
	}
	
	//업체 조회
	@RequestMapping("/cop_list.do")
	public ModelAndView cop_list() throws Exception{
		ModelAndView mv = new ModelAndView("coperation/cop_list");
		mv.addObject("copList", service.copAll());
		return mv;
	}
	
	//업체 상세보기
	@RequestMapping("/cop_detaile.do")
	public ModelAndView cop_detaile(int cop_no) throws Exception{
		ModelAndView mv = new ModelAndView("coperation/cop_detaile");
		mv.addObject("list", service.copReview(cop_no));
		mv.addObject("myCop", service.copOne(cop_no));
		return mv;
	}
	
	
	//업체 삭제
	@RequestMapping("/copDelete.do")
	public void copDelete(CopVO vo, HttpServletResponse response) throws Exception{
		int cop_no = vo.getCop_no();
		service.copDelete(cop_no);
		
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('삭제되었습니다.');location.href='/cop_list.do'</script>");
        out.flush();
	}
	
	//업체 수정
	@RequestMapping("/copUpdate.do")
	public void copUpdate(CopVO vo, HttpServletResponse response) throws Exception{
		service.copUpdate(vo);
		
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('수정되었습니다.');location.href='/cop_list.do'</script>");
        out.flush();
	}
}
