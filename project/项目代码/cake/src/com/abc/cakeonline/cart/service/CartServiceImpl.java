package com.abc.cakeonline.cart.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.abc.cakeonline.cart.dao.CartDaoImpl;

@Service
@Transactional(readOnly = false)
public class CartServiceImpl {

	@Resource
	private CartDaoImpl cartDaoImpl;

	public void insertCake(int c_id, int count) {
		cartDaoImpl.insertCake(c_id, count);
	}

}
