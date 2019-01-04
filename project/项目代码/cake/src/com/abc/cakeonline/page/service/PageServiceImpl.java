package com.abc.cakeonline.page.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.abc.cakeonline.entity.Cake;
import com.abc.cakeonline.page.dao.PageDaoImpl;

@Service
@Transactional(readOnly = true)
public class PageServiceImpl {

	@Resource
	private PageDaoImpl pageDaoImpl;

	/**
	 * 通过页码和页的大小，返回当前页的蛋糕
	 * 
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
	public List<Cake> listCakeByPage(int pageNum, int pageSize, String type, String size) {
		return pageDaoImpl.findByPage(pageNum, pageSize, type, size);
	}

	/**
	 * 统计蛋糕的数量
	 * 
	 * @return
	 */
	public int countByPage(String type, String size) {
		return pageDaoImpl.findCountByPage(type, size);
	}

}
