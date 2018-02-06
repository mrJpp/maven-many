<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="update_goods_form" method="post">
        	<input type="hidden" name="goodsId" value="${goods.goodsId}"/>
			<div>   
        		<label>商品名称:</label>   
        		<input class="easyui-textbox" name="goodsName" value="${goods.goodsName}"  style="width:100px"> 
        	</div> 
        	<div>   
        		<label>商品价格:</label>   
        		<input class="easyui-textbox" name="goodsPrice" value="${goods.goodsPrice}" style="width:100px"> 
        	</div>
        	 <div>   
        		<label>商品库存:</label>   
        		<input class="easyui-textbox" name="goodsCount" value="${goods.goodsCount}" style="width:100px"> 
        	</div>
			<div>   
		        <label>出厂时间:</label>   
		        <input  name="goodsDate" value="${goods.goodsDate}" type= "text" class= "easyui-datebox" required ="required"> </input> 
	        </div>
			<div>   
	        <label>商品类型:</label>   
	        <select name="goodsTypeId" class="easyui-combobox"  style="width:200px;">   
			    <option value="-1">--请选择--</option>   
			    <option value="1"${goods.goodsTypeId==1?"selected":""}>电子数码</option>
			    <option value="2"${goods.goodsTypeId==2?"selected":""}>户外运动</option>
			    <option value="3"${goods.goodsTypeId==3?"selected":""}>智能家居</option>
			    <option value="4"${goods.goodsTypeId==4?"selected":""}>智能家纺</option>
			  <%--  <c:forEach  items="${typeList }"   var="goodsType">
					<option  value="${goodsType.goodsTypeId }">${goodsType.goodsTypeName }</option>
				</c:forEach> --%>
			</select>
   			</div>			
	</form>
</body>
</html>