package com.mr.service;



import javax.servlet.http.HttpSession;

import com.mr.entity.User;
import com.mr.util.Json;

public interface UserService {

	Json login(User user,HttpSession session);

	
}
