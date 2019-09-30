package com.inhatc.spring.ord.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.inhatc.spring.ord.service.OrdService;
import com.inhatc.spring.vo.OrdVO;

@Controller
public class OrdController {
	
	@Autowired
	OrdService service;
	
	@RequestMapping("/ord_regist.do")
	public ModelAndView ord_regist() throws Exception{
		ModelAndView mv = new ModelAndView("order/ord_regist");
		mv.addObject("copList", service.copList());
		mv.addObject("showProd", service.showProd());
		return mv;
	}
	
	@RequestMapping("/ordRegist.do")
	public void ordRegist(OrdVO vo, HttpServletResponse response) throws Exception{
		//vo.setCop_no(4);
		
		service.ordRegist(vo);
		
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('주문이 완료되었습니다.');location.href='/ord_list.do'</script>");
        out.flush();
	}
	
	@RequestMapping("/ord_list.do")
	public ModelAndView ord_list() throws Exception{
		ModelAndView mv = new ModelAndView("order/ord_list");
		
		List<OrdVO> ordList = service.ordAll();
		for(int i=0; i<ordList.size();i++) {
			//업체명
			int cop_no = ordList.get(i).getCop_no();
			String cop_name = service.ordCopName(cop_no);
			ordList.get(i).setCop_name(cop_name);
			//날짜 편집
			String ord_date = ordList.get(i).getOrd_date();
			ord_date = ord_date.substring(0, 10);
			ordList.get(i).setOrd_date(ord_date);
			//상품명
			int prod_no = ordList.get(i).getProd_no();
			String prod_name = service.ordProdName(prod_no);
			ordList.get(i).setProd_name(prod_name);
		}
		
		mv.addObject("ordList", ordList);
		
		return mv;
	}
	
	@RequestMapping("/ord_detaile.do")
	public ModelAndView ord_detaile(int ord_no) throws Exception{
		ModelAndView mv = new ModelAndView("order/ord_detaile");
		mv.addObject("myOrd", service.ordOne(ord_no));
		mv.addObject("copList", service.copList());
		mv.addObject("showProd", service.showProd());
		return mv;
	}
	
	@RequestMapping("/ordDelete.do")
	public void ordDelete(int ord_no, HttpServletResponse response) throws Exception{
		service.ordDelete(ord_no);
		
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('삭제되었습니다.');location.href='/ord_list.do'</script>");
        out.flush();
		
	}
	
	@RequestMapping("/ordUpdate.do")
	public void ordUpdate(OrdVO vo, HttpServletResponse response) throws Exception{
		service.ordUpdate(vo);
		
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('수정되었습니다.');location.href='/ord_list.do'</script>");
        out.flush();
	}
	

}
