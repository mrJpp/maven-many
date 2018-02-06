package com.mr.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import redis.clients.jedis.Jedis;

import com.mr.entity.GoodsTypeRedis;
import com.mr.mapper.GoodsTypeRedisMapper;
import com.mr.service.GoodsTypeService;
import com.mr.util.SerializeUtils;

@Service
public class GoodsTypeServiceImpl implements GoodsTypeService {

	@Autowired
	private GoodsTypeRedisMapper goodsTypeMapper;

	@Override
	public List<GoodsTypeRedis> queryGoodsTypeList() {
		//连接redis服务器
		Jedis jedis = new Jedis("localhost");
		System.out.println("redis服务器开启状态:"+jedis.ping());
		
		//判断缓存中是否存在该集合---有：从缓存中获取--没有：进行数据库查询，并放入缓存中
		if(jedis.get("typeList") == null){
			//没有：进行数据库查询，并放入缓存中
			//调用查询所有的方法，并返回集合
			List<GoodsTypeRedis> typeList = goodsTypeMapper.queryGoodsTypeList();
			jedis.set("typeList".getBytes(),SerializeUtils.serialize(typeList));
		}
		//如果缓存中存在，直接返回缓存中的结果
		return (List<GoodsTypeRedis>) SerializeUtils.deSerialize(jedis.get("typeList".getBytes()));
	}
	
	
	
}
