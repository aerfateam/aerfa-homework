package com.abc.cakeonline.cart.control;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.abc.cakeonline.cake.dao.CakeDaoImpl;
import com.abc.cakeonline.cart.service.Cart;
import com.abc.cakeonline.cart.service.CartServiceImpl;
import com.abc.cakeonline.entity.Cake;

@Controller
public class CartControl {
	@Resource
	private CakeDaoImpl cakeDaoImpl;
	@Resource
	private CartServiceImpl cartService;

	@RequestMapping("/addCart")
	public String addCart(HttpServletRequest request, HttpSession session) {
		String id = request.getParameter("id");
		String count = request.getParameter("count");
		if (id != null && !id.equals("") && count != null && !count.equals("")) {
			int id1 = Integer.parseInt(id);
			int count1 = Integer.parseInt(count);
			Cake c = cakeDaoImpl.findbyId(id1);
			// 得到键为“cart”的值的信息
			Object obj = session.getAttribute("cart");
			Cart cart = null;
			if (obj == null) {
				cart = new Cart();
			} else {
				cart = (Cart) obj;
			}
			// 加入购物车
			cart.AddCake(c, count1);
			// 把信息保存到session里，cart.jsp直接从session拿
			session.setAttribute("cart", cart);
		}
		// 回到商品展示页面
		return "redirect:CakeByPage";
	}

	@RequestMapping("/BuyCake")
	public String buyCake(HttpServletRequest request) {
		String id = request.getParameter("c_id");
		String count = request.getParameter("count");
		if (id != null && !id.equals("") && count != null && !count.equals("")) {
			int id1 = Integer.parseInt(id);
			int count1 = Integer.parseInt(count);
			cartService.insertCake(id1, count1);
		}
		return "redirect:checkout.jsp";
	}
}
