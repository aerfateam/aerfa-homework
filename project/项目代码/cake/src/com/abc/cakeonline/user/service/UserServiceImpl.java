package com.abc.cakeonline.user.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.abc.cakeonline.entity.Users;
import com.abc.cakeonline.user.dao.UserDaoImpl;

@Service
@Transactional(readOnly=false)
public class UserServiceImpl {
	
	@Resource
	private UserDaoImpl userDaoImpl;
	
	/**
	 * 返回所有的用户数据
	 * @return
	 */
	public List<Users> listUsers() {
		return userDaoImpl.findAll();
	}
	
	/**
	 * 通过邮箱查找，返回一条用户数据
	 * @param email
	 * @return
	 */
	public Users getUserByEmail(String email) {
		return userDaoImpl.findByEmail(email);
	}
	
	/**
	 * 通过昵称查找，返回一条用户数据
	 * @param email
	 * @return
	 */
	public Users getUserByNickName(String nickname) {
		return userDaoImpl.findByNickName(nickname);
	}
	
	/**
	 * 插入一条数据
	 * @param email
	 * @param name
	 * @param pwd
	 * @return
	 */
	public boolean insertUser(String email,String name,String pwd) {
		if (userDaoImpl.insertUser(email, name, pwd)) {
			return true;
		}
		return false;
	}
}
