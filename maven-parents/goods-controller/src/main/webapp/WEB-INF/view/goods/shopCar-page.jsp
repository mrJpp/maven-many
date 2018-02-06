<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的购物车</title>
</head>
<body>
我的购物车
${carlist}
<table border="50"  align="center">
		<tr>
			<td>商品名称</td>
			<td>商品价格</td>
			<td>购买数量</td>
			<td>购买总价</td>
		</tr>
		<c:forEach  items="${carlist}"  var="shopCar">
			<tr>
				<td>${shopCar.goodsRedis.goodsName }</td>
				<td>${shopCar.goodsRedis.goodsPrice }</td>
				<td>${shopCar.count}</td>
				<td>${shopCar.goodsRedis.goodsPrice*shopCar.count }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</body>
</html>