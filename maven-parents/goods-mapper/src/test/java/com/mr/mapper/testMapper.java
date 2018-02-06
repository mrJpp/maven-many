package com.mr.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mr.entity.GoodsTypeRedis;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring-common.xml"})
public class testMapper {

	@Autowired
   private GoodsTypeRedisMapper goodsTypeRedisMapper;	
	
	@Test
	public void TestGoodsTypeRedisMapper(){
		List<GoodsTypeRedis> list = goodsTypeRedisMapper.queryGoodsTypeList();
		System.out.println(list);
	}
}
