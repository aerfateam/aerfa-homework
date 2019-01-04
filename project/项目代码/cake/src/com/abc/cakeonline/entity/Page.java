package com.abc.cakeonline.entity;

import java.util.List;

/**
 * 封装成Page类
 *
 */
public class Page<T> {

	private List<T> list;
	private int currentPageNum;// 当前页
	private int pageSize;// 一页最多有多少条数据
	private int prePageNum;// 上一页
	private int nextPageNum;// 下一页
	private int totalPageNum;// 总页数
	private int totalCount;// 数据的总条数

	public Page() {
	}

	/**
	 * 设置当前页码和页的大小
	 * 
	 * @param pageNum
	 * @param pageSize
	 */
	public Page(int pageNum, int pageSize) {
		this.currentPageNum = pageNum;
		this.pageSize = pageSize;
	}

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}

	public int getCurrentPageNum() {
		return currentPageNum;
	}

	public void setCurrentPageNum(int currentPageNum) {
		this.currentPageNum = currentPageNum;
	}

	public int getTotalPageNum() {
		return totalPageNum;
	}

	public void setTotalPageNum(int totalPageNum) {
		this.totalPageNum = totalPageNum;
	}

	public int getPrePageNum() {
		return prePageNum;
	}

	public void setPrePageNum(int prePageNum) {
		this.prePageNum = prePageNum;
	}

	public int getNextPageNum() {
		return nextPageNum;
	}

	public void setNextPageNum(int nextPageNum) {
		this.nextPageNum = nextPageNum;
	}

	public int getTotalCount() {
		return totalCount;
	}

	/**
	 * 设置数据的总数，页的总数，上一页，下一页
	 * 
	 * @param totalCount
	 */
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		if (totalCount % pageSize == 0)
			totalPageNum = totalCount / pageSize;
		else
			totalPageNum = totalCount / pageSize + 1;

		if (currentPageNum > 1)
			prePageNum = currentPageNum - 1;
		else
			prePageNum = 1;

		if (currentPageNum < totalPageNum)
			nextPageNum = currentPageNum + 1;
		else
			nextPageNum = totalPageNum;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

}
