package com.inhatc.spring.comm.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.inhatc.spring.comm.domain.BoardVO;
import com.inhatc.spring.comm.service.BoardService;

@Controller
public class BoardController {

	@Resource(name="com.inhatc.spring.comm.service.BoardService")
	BoardService mBoardService;
	
	
	@RequestMapping("/list")
	private String boardList(Model model, HttpServletRequest request) throws Exception {
		
		model.addAttribute("list", mBoardService.boardListService());
		model.addAttribute("count",mBoardService.boardCountService());
		return "list";
	}
	
	@RequestMapping("/insert")
	private ModelAndView boardInsertForm(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		//업체 전체 정보가져오기
		mv.addObject("copList",mBoardService.copSelectAllService());
		System.out.println(mBoardService.copSelectAllService().get(0).getCop_name());
		//상품 전체 정보 가져오기
	    //mv.addObject("showProd", mBoardService.showProdService());
		mv.setViewName("insert");
		return mv;
	}
	
	@RequestMapping("/insertProc")
	private String boardInsertProc(BoardVO board, HttpServletRequest request) throws Exception {
		
		BoardVO tempboard = new BoardVO();
		tempboard = board;
		mBoardService.boardInsertService(tempboard);
		
		return "redirect:list";
	}
	
	@RequestMapping("/detail/{b_no}")
	private String boardDetail(@PathVariable int b_no, Model model, HttpServletRequest request) throws Exception {
		
		
		model.addAttribute("detail", mBoardService.boardDetailService(b_no));
		model.addAttribute("update_hits", mBoardService.boardHitService(b_no));
		
		return "detail";
	}
	
	@RequestMapping("/update/{b_no}")
	private String boardUpdateFrom(@PathVariable int b_no, Model model) throws Exception {
		model.addAttribute("detail",mBoardService.boardDetailService(b_no));
		return "update";
	}
	
	@RequestMapping("/updateProc")
	private String boardUpdateProc(BoardVO board, HttpServletRequest request) throws Exception {
		BoardVO tempboard = new BoardVO();
		
		tempboard = board;
		mBoardService.boardUpdateService(tempboard);
		
		return "redirect:/detail/" + request.getParameter("b_no");
	}
	
	@RequestMapping("/delete/{b_no}")
	private String boardDelete(@PathVariable int b_no) throws Exception {
		mBoardService.boardDeleteService(b_no);
		
		return "redirect:/list";
	}
	
}
