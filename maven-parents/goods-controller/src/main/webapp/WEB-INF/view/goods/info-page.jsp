<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${goods.goodsName}</title>
</head>
<body>
商品内容：<br>
<input type="hidden" id="goodsId" value="${goods.goodsId}"/>
商品名称：${goods.goodsName }<br>
商品价格：${goods.goodsPrice }<br>
商品库存：${goods.goodsCount }<br>
<input type="hidden" value="${goods.goodsCount }" id="goodsCount"/>
出厂日期：${goods.goodsDateStr }<br>
商品类型：${goods.goodsTypeId }<br>
购买数量：<a href="javaScript:changeCount(1)">+</a>
		<input id="buyCount" type="text" value="1" style="width:30px"/>
		<a href="javaScript:changeCount(2)">-</a><br>
		<a href="javaScript:insertShopCar()">加入购物车</a>
</body>
<script type="text/javascript">
//加入购物车
function insertShopCar(){
	//需要将商品id,购买数量传递给controller层
	var buyCount=document.getElementById("buyCount").value;
	var goodsId=document.getElementById("goodsId").value;
	//请求controller层，并打开一个新的页面来展示提示信息
	window.open("${pageContext.request.contextPath}/goods/insertShopCar.do?goodsId="+goodsId+"&&buyCount="+buyCount);
}
//购买数量
function changeCount(flag){
	var countElement=document.getElementById("buyCount");
	var goodsCount=document.getElementById("goodsCount").value;
	if(flag=="1"){
		//判断，数量不能大于库存量
		if(countElement.value*1 > (goodsCount-1)){
			alert("已超过库存数量");
		}else{
			//购买数量增加1
			countElement.value = ++countElement.value;
		}
	}else{
		if(countElement.value*1 == 1){
			alert("至少买一件商品！");
		}else{
		//购买数量减少1
		countElement.value = countElement.value-1;
		}
	}
}
</script>
</html>