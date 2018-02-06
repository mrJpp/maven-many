package com.mr.mapper;

import java.util.List;

import com.mr.entity.GoodsTypeRedis;

public interface GoodsTypeRedisMapper {
    int deleteByPrimaryKey(Integer goodsTypeId);

    int insert(GoodsTypeRedis record);

    int insertSelective(GoodsTypeRedis record);

    GoodsTypeRedis selectByPrimaryKey(Integer goodsTypeId);

    int updateByPrimaryKeySelective(GoodsTypeRedis record);

    int updateByPrimaryKey(GoodsTypeRedis record);
    
    //查询所有商品类型
    List<GoodsTypeRedis> queryGoodsTypeList();
}