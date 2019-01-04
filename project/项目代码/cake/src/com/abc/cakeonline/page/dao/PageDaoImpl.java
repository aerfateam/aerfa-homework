package com.abc.cakeonline.page.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.abc.cakeonline.entity.Cake;
import com.abc.cakeonline.util.BaseDao;

@Repository
public class PageDaoImpl extends BaseDao {

	/*
	 * 分页查询数据(两个参数pageNum、pageSize) limit的使用
	 */
	public List<Cake> findByPage(int pageNum, int pageSize, String type, String size) {
		Session session = this.sessionFactory.getCurrentSession();
		Query q = null;
		if (type != "" && type != null && size != "" && size != null) {
			int s = Integer.parseInt(size);
			q = session.createQuery("from Cake c where c.type=? and c.size=?");
			q.setParameter(0, type);
			q.setParameter(1, s);
		} else if (type != "" && type != null) {
			q = session.createQuery("from Cake c where c.type=?");
			q.setParameter(0, type);
		} else if (size != "" && size != null) {
			int s = Integer.valueOf(size);
			q = session.createQuery("from Cake c where c.size=?");
			q.setParameter(0, s);
		} else {
			q = session.createQuery("from Cake");
		}
		q.setFirstResult((pageNum - 1) * pageSize);
		q.setMaxResults(pageSize);
		return q.list();
	}

	/*
	 * 统计数据库中商品个数
	 * 
	 */
	public int findCountByPage(String type, String size) {
		Session session = this.sessionFactory.getCurrentSession();
		Query q = null;
		if (type != "" && type != null && size != "" && size != null) {
			int s = Integer.parseInt(size);
			q = session.createQuery("select count(c.id) from Cake c where c.type=? and c.size=?");
			q.setParameter(0, type);
			q.setParameter(1, s);
		} else if (type != "" && type != null) {
			q = session.createQuery("select count(c.id) from Cake c where c.type=?");
			q.setParameter(0, type);
		} else if (size != "" && size != null) {
			int s = Integer.valueOf(size);
			q = session.createQuery("select count(c.id) from Cake c where c.size=?");
			q.setParameter(0, s);
		} else {
			q = session.createQuery("select count(c.id) from Cake c");
		}
		int count = Integer.parseInt(q.uniqueResult().toString());

		return count;
	}

}
