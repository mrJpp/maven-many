package com.mr.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.mr.entity.User;
import com.mr.util.RedisUtil;

public class LoginInterceptor implements HandlerInterceptor{

	//会在请求之前进入该方法
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("放过所有请求方法");
		return true;
	}

	//在prehandle为true时,才会进入.执行时间为:controller层方法结束后
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		//获取redis中的用户信息
		User user = (User) RedisUtil.getObject(request.getSession().getId());
		//如果为空,返回登录页面
		if(user==null){
			modelAndView.setViewName("../../login/login");
		}
		//如果不为空,执行操作(按照原有渲染执行)
		System.out.println("执行postHandle方法");
	}
	

	//在整个请求结束之后,也就是dispatchServlet渲染了对应的视图之后执行,这个方法主要用于进行资源清理工作的
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
           System.out.println("方法执行之后执行");		
	}

}
