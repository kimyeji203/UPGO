package com.inhatc.spring.prod.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.inhatc.spring.prod.service.ProdService;
import com.inhatc.spring.vo.ProdVO;

@Controller
public class ProdController {
	@Autowired
	ProdService ps;
	
	@RequestMapping("/hello")
	public String plz_say_hello() {
		return "Hello World!!";
	}
	
	@RequestMapping("/prod_list")
	public ModelAndView prod_list() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("ProdData", ps.selectAllData());
		mv.setViewName("prod_list");
		return mv;
	}
	
	@RequestMapping("/prod_regist")
	public String prod_regist() throws Exception {
		return "prod_regist";
	}
	
	@RequestMapping("/prod_detail")
	public ModelAndView prod_detail(String no) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("ProdData", ps.selectOneData(no));
		mv.setViewName("prod_detail");
		return mv;
	}
	
	@RequestMapping("/prod_regist.do")
	public void prod_regist_do(ProdVO vo, HttpServletResponse response) throws Exception{
		ps.insertData(vo);
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('등록이 완료되었습니다.');location.href='/prod_list'</script>");
        out.flush();
	}
	
	@RequestMapping("/prod_delete.do")
	public void prod_delete_do(String no, HttpServletResponse response) throws Exception{
		ps.deleteData(no);
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('삭제가 완료되었습니다.');location.href='/prod_list'</script>");
        out.flush();
	}
	
	@RequestMapping("/prod_update.do")
	public void prod_update_do(ProdVO vo, HttpServletResponse response) throws Exception{
		ps.updateData(vo);
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('수정이 완료되었습니다.');location.href='/prod_list'</script>");
        out.flush();
	}
	
	@RequestMapping("/prod_update")
	public ModelAndView prod_update(String no) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("ProdData", ps.selectOneData(no));
		mv.setViewName("prod_update");
		return mv;
	}
}