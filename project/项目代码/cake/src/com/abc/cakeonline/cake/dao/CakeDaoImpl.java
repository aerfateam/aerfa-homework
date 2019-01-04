package com.abc.cakeonline.cake.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.abc.cakeonline.entity.Cake;
import com.abc.cakeonline.entity.OrderDetail;
import com.abc.cakeonline.util.BaseDao;

@Repository
public class CakeDaoImpl extends BaseDao {

	/**
	 * 查找销量前8的蛋糕
	 * 
	 * @return
	 */
	public List<Cake> findCakeByEight() {
		Session session = this.sessionFactory.getCurrentSession();
		Query q = session.createQuery("from OrderDetail od group by od.cake.id ORDER BY SUM(od.count) DESC");
		q.setFirstResult(0);
		q.setMaxResults(8);
		List<OrderDetail> list = q.list();
		List<Cake> cakes = new ArrayList<Cake>();
		for (int i = 0; i < list.size(); i++) {
			OrderDetail od = list.get(i);
			Query q1 = session.createQuery("from Cake c where c.id=?");
			q1.setParameter(0, od.getCake().getId());
			Cake c = (Cake) q1.uniqueResult();
			cakes.add(c);
		}
		return cakes;
	}

	/**
	 * 通过id查找蛋糕的所有属性
	 * 
	 * @param id
	 * @return
	 */
	public Cake findbyId(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Query q = session.createQuery("from Cake c where c.id=?");
		q.setParameter(0, id);
		Cake cake = (Cake) q.uniqueResult();
		return cake;
	}

	/**
	 * 查找所有的蛋糕
	 * 
	 * @return
	 */
	public List<Cake> findAll() {
		Session session = this.sessionFactory.getCurrentSession();
		Query q = session.createQuery("from Cake");
		return q.list();

	}
}
