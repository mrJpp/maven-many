package com.mr.entity;

import java.io.Serializable;

public class GoodsTypeRedis implements Serializable{
    private static final long serialVersionUID = 360126101829472647L;

	private Integer goodsTypeId;

    private String goodsTypeName;

    @Override
	public String toString() {
		return "GoodsTypeRedis [goodsTypeId=" + goodsTypeId
				+ ", goodsTypeName=" + goodsTypeName + "]";
	}

	public Integer getGoodsTypeId() {
        return goodsTypeId;
    }

    public void setGoodsTypeId(Integer goodsTypeId) {
        this.goodsTypeId = goodsTypeId;
    }

    public String getGoodsTypeName() {
        return goodsTypeName;
    }

    public void setGoodsTypeName(String goodsTypeName) {
        this.goodsTypeName = goodsTypeName == null ? null : goodsTypeName.trim();
    }
}