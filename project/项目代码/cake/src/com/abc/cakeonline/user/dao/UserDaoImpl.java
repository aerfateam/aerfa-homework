package com.abc.cakeonline.user.dao;

import java.sql.Timestamp;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.abc.cakeonline.entity.Users;
import com.abc.cakeonline.util.BaseDao;

@Repository
public class UserDaoImpl extends BaseDao {

	/**
	 * �������е��û�
	 * 
	 * @return
	 */
	public List<Users> findAll() {
		Session session = this.sessionFactory.getCurrentSession();
		Query q = session.createQuery("from Users");
		return q.list();

	}

	/**
	 * ͨ��������ҵ�ǰ�û�
	 * 
	 * @param email
	 * @return
	 */
	public Users findByEmail(String email) {
		Session session = this.sessionFactory.getCurrentSession();
		Query q = session.createQuery("from Users u where u.email=?");
		q.setParameter(0, email);
		Users users = (Users) q.uniqueResult();

		return users;

	}

	/**
	 * ͨ���ǳƲ��ҵ�ǰ�û�
	 * 
	 * @param email
	 * @return
	 */
	public Users findByNickName(String nickname) {
		Session session = this.sessionFactory.getCurrentSession();
		Query q = session.createQuery("from Users u where u.nickname=?");
		q.setParameter(0, nickname);
		Users users = (Users) q.uniqueResult();
		return users;
	}

	/**
	 * ����һ���û�����
	 * 
	 * @param email
	 * @param name
	 * @param pwd
	 * @return
	 */
	public boolean insertUser(String email, String name, String pwd) {
		// ��ȡϵͳ��ǰʱ��
		Session session = this.sessionFactory.getCurrentSession();
		Timestamp time = new Timestamp(System.currentTimeMillis());
		Users u = new Users();
		u.setEmail(email);
		u.setNickname(name);
		u.setPassword(pwd);
		u.setTime(time);
		session.save(u);
		return true;
	}
}
