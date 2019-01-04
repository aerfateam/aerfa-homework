package com.abc.cakeonline.page.control;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.abc.cakeonline.entity.Cake;
import com.abc.cakeonline.entity.Page;
import com.abc.cakeonline.page.service.PageServiceImpl;

@Controller
public class PageControl {
	@Resource
	private PageServiceImpl pageService;

	@RequestMapping("/CakeByPage")
	public String cakeByPage(HttpServletRequest request, HttpServletResponse response) {
		// 1、获取页码
		String pageNum = request.getParameter("pageNum");
		// 2、获取搜索类型
		String type = request.getParameter("type");
		// 2、获取搜索大小
		String size = request.getParameter("search_word");
		int num = 0;
		if (pageNum == null || pageNum.equals("")) {
			num = 1;
		} else {
			num = Integer.parseInt(pageNum);
		}
		// 2、根据页码查询相关数据
		List<Cake> list = pageService.listCakeByPage(num, 3, type, size);
		int count = pageService.countByPage(type, size);
		Page<Cake> p = new Page<Cake>(num, 3);
		p.setList(list);
		p.setTotalCount(count);
		Cookie cookie1 = new Cookie("type", type);
		Cookie cookie2 = new Cookie("size", size);
		response.addCookie(cookie1);
		response.addCookie(cookie2);
		HttpSession session = request.getSession();
		session.setAttribute("page", p);
		// 为了能在jsp页面拿到cookie的值，用重定向
		return "redirect:products.jsp";
	}
}
