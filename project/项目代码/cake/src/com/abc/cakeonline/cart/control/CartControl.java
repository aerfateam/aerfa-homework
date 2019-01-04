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
			// �õ���Ϊ��cart����ֵ����Ϣ
			Object obj = session.getAttribute("cart");
			Cart cart = null;
			if (obj == null) {
				cart = new Cart();
			} else {
				cart = (Cart) obj;
			}
			// ���빺�ﳵ
			cart.AddCake(c, count1);
			// ����Ϣ���浽session�cart.jspֱ�Ӵ�session��
			session.setAttribute("cart", cart);
		}
		// �ص���Ʒչʾҳ��
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
