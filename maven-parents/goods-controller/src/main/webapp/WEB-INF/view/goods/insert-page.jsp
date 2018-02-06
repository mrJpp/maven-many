<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<form id="goods_insert_form">
			<div>   
        		<label>商品名称:</label>   
        		<input class="easyui-textbox" name="goodsName"  style="width:100px"> 
        	</div> 
        	<div>   
        		<label>商品价格:</label>   
        		<input class="easyui-textbox" name="goodsPrice"  style="width:100px"> 
        	</div>
        	 <div>   
        		<label>商品库存:</label>   
        		<input class="easyui-textbox" name="goodsCount"  style="width:100px"> 
        	</div>
			<div>   
		        <label>出厂时间:</label>   
		        <input  name="goodsDate"  type= "text" class= "easyui-datebox" required ="required"> </input> 
	        </div>
			<div>   
	        <label>商品类型:</label>   
	        <select name="goodsTypeId" class="easyui-combobox"  style="width:200px;">   
			    <option value="-1">--请选择--</option>   
			   <c:forEach  items="${typeList }"   var="goodsType">
					<option  value="${goodsType.goodsTypeId }">${goodsType.goodsTypeName }</option>
				</c:forEach>
			</select>
   			 </div>			
	</form>
</body>

</html>