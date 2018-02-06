package com.mr.entity;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class GoodsRedis implements Serializable{
    private static final long serialVersionUID = -8650893194864414641L;

	private Integer goodsId;

	private String goodsName;

    private Integer goodsPrice;

    private Integer goodsCount;

    //@DateTimeFormat(pattern="yyyy-MM-dd")
    private Date goodsDate;

    private Integer goodsTypeId;

    public String getGoodsDateStr() {
    	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        return goodsDate!=null?sdf.format(goodsDate):"";
    }
    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName == null ? null : goodsName.trim();
    }

    public Integer getGoodsPrice() {
        return goodsPrice;
    }

    public void setGoodsPrice(Integer goodsPrice) {
        this.goodsPrice = goodsPrice;
    }

    public Integer getGoodsCount() {
        return goodsCount;
    }

    public void setGoodsCount(Integer goodsCount) {
        this.goodsCount = goodsCount;
    }

    public Date getGoodsDate() {
        return goodsDate;
    }

    public void setGoodsDate(Date goodsDate) {
        this.goodsDate = goodsDate;
    }

    public Integer getGoodsTypeId() {
        return goodsTypeId;
    }

    public void setGoodsTypeId(Integer goodsTypeId) {
        this.goodsTypeId = goodsTypeId;
    }

	@Override
	public String toString() {
		return "GoodsRedis [goodsId=" + goodsId + ", goodsName=" + goodsName
				+ ", goodsPrice=" + goodsPrice + ", goodsCount=" + goodsCount
				+ ", goodsDate=" + goodsDate + ", goodsTypeId=" + goodsTypeId
				+ "]";
	}
}