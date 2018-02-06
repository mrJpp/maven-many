package com.mr.service;

import java.util.List;

import com.mr.entity.GoodsTypeRedis;

public interface GoodsTypeService {

	   //查询所有商品类型
    List<GoodsTypeRedis> queryGoodsTypeList();
}
