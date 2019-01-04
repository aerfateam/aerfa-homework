package com.abc.cakeonline.caketype.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.abc.cakeonline.caketype.dao.TypeDaoImpl;
import com.abc.cakeonline.entity.CakeType;

@Service
@Transactional(readOnly=true)
public class TypeServiceImpl {
	
	@Resource
	private TypeDaoImpl typeDaoImpl;
	
	public List<CakeType> list(){
		return this.typeDaoImpl.findAll();
	}

}
