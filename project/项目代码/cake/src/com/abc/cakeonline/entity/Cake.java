package com.abc.cakeonline.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "cake")
public class Cake {
	private int id;
	private String c_name;
	private String introduce;
	private Integer price;
	private Integer discount;
	private String bigpicture;
	private String smallpicture1;
	private String smallpicture2;
	private String smallpicture3;
	private Integer starlevel;
	private Integer size;
	private String label;// ±Í«©
	private String type;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public String getBigpicture() {
		return bigpicture;
	}

	public void setBigpicture(String bigpicture) {
		this.bigpicture = bigpicture;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getSmallpicture1() {
		return smallpicture1;
	}

	public void setSmallpicture1(String smallpicture1) {
		this.smallpicture1 = smallpicture1;
	}

	public String getSmallpicture2() {
		return smallpicture2;
	}

	public void setSmallpicture2(String smallpicture2) {
		this.smallpicture2 = smallpicture2;
	}

	public String getSmallpicture3() {
		return smallpicture3;
	}

	public void setSmallpicture3(String smallpicture3) {
		this.smallpicture3 = smallpicture3;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public Integer getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public int getStarlevel() {
		return starlevel;
	}

	public void setStarlevel(int starlevel) {
		this.starlevel = starlevel;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public Cake() {
		super();
	}

}
