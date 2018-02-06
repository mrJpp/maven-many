package com.mr.service;

import javax.servlet.http.HttpSession;

public interface ShopCarService {


	void insertShopCar(Integer goodsId, Integer buyCount, HttpSession session);
}
