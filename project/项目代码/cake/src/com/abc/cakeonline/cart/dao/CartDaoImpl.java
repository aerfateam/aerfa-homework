package com.abc.cakeonline.cart.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import com.abc.cakeonline.entity.Cake;
import com.abc.cakeonline.entity.OrderDetail;
import com.abc.cakeonline.util.BaseDao;

@Repository
public class CartDaoImpl extends BaseDao {

	public void insertCake(int c_id, int count) {
		Session session = this.sessionFactory.getCurrentSession();
		OrderDetail orderDetail = new OrderDetail();
		Cake c = session.get(Cake.class, c_id);
		orderDetail.setCake(c);
		orderDetail.setCount(count);
		session.save(orderDetail);
	}

}
