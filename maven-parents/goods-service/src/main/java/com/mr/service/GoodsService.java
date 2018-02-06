package com.mr.service;

import com.mr.entity.GoodsRedis;
import com.mr.util.Page;

public interface GoodsService {

	//新增方法
	void insertGoods(GoodsRedis goods);

	//分页查询
	void queryGoodsList(Page pageUtil);

	//删除
	void deleteGoods(GoodsRedis goods);

	//根据ID查询,跳转到新增
	GoodsRedis queryGoodsById(GoodsRedis goods);

	//修改方法
	void updateGoods(GoodsRedis goods);
}
