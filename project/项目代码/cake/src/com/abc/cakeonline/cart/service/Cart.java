package com.abc.cakeonline.cart.service;

import java.util.HashMap;

import com.abc.cakeonline.entity.Cake;
import com.abc.cakeonline.entity.CartItem;

public class Cart {
	private HashMap<Integer, CartItem> container = new HashMap<Integer, CartItem>();

	/*
	 * 实现添加产品到购物车
	 */
	public void AddCake(Cake c, int count) {
		if (container.containsKey(c.getId())) {
			count = container.get(c.getId()).getCount() + count;
			container.get(c.getId()).setCount(count);
		} else {
			CartItem cartitem = new CartItem();
			cartitem.setCount(count);
			cartitem.setCake(c);
			container.put(c.getId(), cartitem);
		}
	}

	public HashMap<Integer, CartItem> getContainer() {
		return container;
	}

	public void setContainer(HashMap<Integer, CartItem> container) {
		this.container = container;
	}

}
