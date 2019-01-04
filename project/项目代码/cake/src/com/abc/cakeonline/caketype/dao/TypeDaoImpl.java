package com.abc.cakeonline.caketype.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.abc.cakeonline.entity.CakeType;
import com.abc.cakeonline.util.BaseDao;

@Repository
public class TypeDaoImpl extends BaseDao {

	public List<CakeType> findAll() {
		Session session = this.sessionFactory.getCurrentSession();
		Query q = session.createQuery("from CakeType ct where ct.parentType is null");
		return q.list();
	}
}
