package com.abc.cakeonline.cake.control;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.jboss.logging.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.abc.cakeonline.cake.service.CakeServiceImpl;
import com.abc.cakeonline.entity.Cake;

@Controller
public class CakeControl {
	@Resource
	private CakeServiceImpl cakeServiceImpl;

	@RequestMapping("/FirstEightCake")
	public String firstEightCake(HttpServletRequest request) {
		List<Cake> list = cakeServiceImpl.findFirstEightCake();
		request.setAttribute("cake", list);
		return "main";
	}

	@RequestMapping(value = "seeSingle")
	public String seeSingle(@RequestParam("id") String s,HttpServletRequest request) {
		if (s != null && s != "") {
			int id = Integer.parseInt(s);
			Cake cake = cakeServiceImpl.findById(id);
			request.setAttribute("cake", cake);
		}
		return "single.jsp";
	}
}
