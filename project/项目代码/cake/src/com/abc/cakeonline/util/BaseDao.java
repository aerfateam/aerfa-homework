package com.abc.cakeonline.util;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

@Repository
public class BaseDao {
	@Resource
	public SessionFactory sessionFactory;
}
