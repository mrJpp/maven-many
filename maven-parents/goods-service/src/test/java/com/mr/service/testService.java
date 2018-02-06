package com.mr.service;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mr.entity.GoodsTypeRedis;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring-common.xml","classpath:spring-base.xml"})
public class testService {
	
	@Autowired
	private GoodsTypeService goodsTypeService;
	
	@Test
	public void TestGoodsTypeService(){
		List<GoodsTypeRedis> list = goodsTypeService.queryGoodsTypeList();
		System.out.println(list);
	}

}
