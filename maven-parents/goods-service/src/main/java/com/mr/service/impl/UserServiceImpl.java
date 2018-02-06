package com.mr.service.impl;



import javax.servlet.http.HttpSession;

import org.apache.commons.codec.language.RefinedSoundex;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mr.entity.User;
import com.mr.mapper.UserMapper;
import com.mr.service.UserService;
import com.mr.util.Json;
import com.mr.util.RedisUtil;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserMapper userMapper;
	
	public Json login(User user,HttpSession session){
		Json json = new Json();
		//调用数据库,根据本账号密码进行查询
		User returnUser = userMapper.selectByCodePass(user);
		if(returnUser==null){
			//说明账号密码错误
			json.setMsg("账号密码错误");
			json.setSuccess(false);
		}else{
			json.setMsg("登录成功");
			//登录成功后,将用户信息放在redis中,并指定生命周期
			//session.setAttribute("login_user", returnUser);
			//将sessionId作为键,用户对象作为值存储在缓存中
			RedisUtil.setObject(session.getId(), returnUser);
			RedisUtil.setObjectLife("login_user", 10);
			json.setSuccess(true);
		}
		return json;
	}
}
