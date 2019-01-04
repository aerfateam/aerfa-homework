package com.abc.cakeonline.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "type")
public class CakeType {
	private long id;
	private String t_name;

	private CakeType parentType;
	private Set<CakeType> childTypes = new HashSet<CakeType>();

	@ManyToOne
	@JoinColumn(name = "p_id")
	public CakeType getParentType() {
		return parentType;
	}

	public void setParentType(CakeType parentType) {
		this.parentType = parentType;
	}

	@OneToMany(mappedBy = "parentType", 
			targetEntity = CakeType.class, 
			cascade = { CascadeType.REMOVE })
	public Set<CakeType> getChildTypes() {
		return childTypes;
	}

	public void setChildTypes(Set<CakeType> childTypes) {
		this.childTypes = childTypes;
	}

	@Id
	@GeneratedValue(generator = "my")
	@GenericGenerator(name = "my", strategy = "assigned")
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getT_name() {
		return t_name;
	}

	public void setT_name(String t_name) {
		this.t_name = t_name;
	}

	@Override
	public String toString() {
		return "CakeType [id=" + id + ", name=" + t_name + ", p_id=" + parentType.id+"]";
	}

}
