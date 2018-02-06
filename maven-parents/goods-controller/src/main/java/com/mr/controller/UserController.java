package com.mr.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mr.entity.User;
import com.mr.service.UserService;
import com.mr.util.Json;

@Controller
@RequestMapping(value="user")
public class UserController {

	@Autowired
	private UserService userService;
	
	@RequestMapping(value="login")
	public String login(User user,ModelMap map,HttpSession session){
		//System.out.println(user);
		//调用service层,判断账号密码是否正确
		Json json=userService.login(user, session);
		//接受到json之后,判断是否登录成功,(在service层的实现类中进行判断,在controller层进行跳转页面)
		//登录成功的话,跳转到查询页面,
		if(json.getSuccess()){
			//map.put("msg", json.getMsg());
			return "redirect:/goods/toShowPage.do";
		}else{
			//登录不成功,跳转到登录界面
			map.put("msg", json.getMsg());
			return "../../login/login";
		}
	}
	
}
