<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 放在WEB-INF下的jsp页面，安全性高(必须使用请求才能访问到) 
		登录和注册页面不会暴露有效信息，任何人通过任何方式都可以访问到，没有必要放在WEB-INF下
		切换页面  上一页 alt+←      下一页   alt+→   -->
	<%-- <h1><font color="red">${msg }</font></h1>	 --%>
	  <font size="5" color="red">${msg}</font> 
	<form action="<%=request.getContextPath()%>/user/login.do"  method="post">
		账号:<input type="text"  name="userCode"/><br>
		密码:<input type="password"  name="userPass"/><br>
		<input type="submit"  value="登录"/>
	</form>
</body>
</html>