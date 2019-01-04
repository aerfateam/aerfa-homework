package com.abc.cakeonline.caketype.control;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.abc.cakeonline.caketype.service.TypeServiceImpl;
import com.abc.cakeonline.entity.CakeType;

@Controller
public class TypeControl {

	@Resource
	private TypeServiceImpl typeServiceImpl;
	
	@RequestMapping("/caketype")
	public String index(HttpServletRequest request) {
		List<CakeType> list=this.typeServiceImpl.list();
		request.getServletContext().setAttribute("caketypes", list);
		return "forward:FirstEightCake";
	}
}
