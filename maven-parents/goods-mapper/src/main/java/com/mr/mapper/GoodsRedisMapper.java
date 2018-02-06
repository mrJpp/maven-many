package com.mr.mapper;

import java.util.List;

import com.mr.entity.GoodsRedis;
import com.mr.util.Page;

public interface GoodsRedisMapper {
	//删除
    int deleteByPrimaryKey(Integer goodsId);

    //新增
    int insert(GoodsRedis record);

    int insertSelective(GoodsRedis record);

    //根据id查询,跳转到新增
    GoodsRedis selectByPrimaryKey(Integer goodsId);

    int updateByPrimaryKeySelective(GoodsRedis record);

    //修改
    int updateByPrimaryKey(GoodsRedis record);

    //查询总条数
	Integer queryGoodsCounts();

	//分页查询
	List<GoodsRedis> queryGoodsList(Page pageUtil);
}