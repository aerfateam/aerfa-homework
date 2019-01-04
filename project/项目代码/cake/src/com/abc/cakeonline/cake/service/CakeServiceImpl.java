package com.abc.cakeonline.cake.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.abc.cakeonline.cake.dao.CakeDaoImpl;
import com.abc.cakeonline.entity.Cake;

@Service
@Transactional(readOnly = true)
public class CakeServiceImpl {
	@Resource
	private CakeDaoImpl cakeDaoImpl;

	/**
	 * 返回销量前8的蛋糕
	 * 
	 * @return
	 */
	public List<Cake> findFirstEightCake() {
		return cakeDaoImpl.findCakeByEight();
	}

	/**
	 * 通过id，返回蛋糕的详情
	 * 
	 * @param id
	 * @return
	 */
	public Cake findById(int id) {
		return cakeDaoImpl.findbyId(id);
	}

	/**
	 * 返回所有的蛋糕
	 * 
	 * @return
	 */
	public List<Cake> listAllCake() {
		return cakeDaoImpl.findAll();
	}

}
