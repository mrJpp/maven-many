<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 引入jquery -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-easyui-1.4.5/jquery.easyui.min.js"></script>
<!-- 引入皮肤包 -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/jquery-easyui-1.4.5/themes/default/easyui.css">
<!-- 引入图标 -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/jquery-easyui-1.4.5/themes/icon.css">
<!--引入 uploadify-->
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/uploadify/jquery.uploadify.min.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/uploadify/uploadify.css" />
</head>
<body>
    <h1 align="right">欢迎${login_user.userName}访问页面</h1>
    <a  target="_blank" href="${pageContext.request.contextPath}/goods/ShowShopCar.do">查看我的购物车</a>
 <br>
<a id="btn" href="javaScript:toInsertPage()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">新增</a>  
<a id="btn" href="javaScript:deleteGoods()" class="easyui-linkbutton" data-options="iconCls:'icon-no'">删除</a>  
<a id="btn" href="javaScript:toUpdatePage()" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改</a>
	<table id="goods_dataGrid_table"></table> 
	<!--新增的dialog -->
   <div id="insert_goods_div"></div>
    <!--修改的dialog -->
   <div id="update_goods_div"></div>  
</body>
<script type="text/javascript">
//跳转到修改页面
function toUpdatePage(){
	var obj = $('#goods_dataGrid_table').datagrid('getSelected');
	var id=obj.goodsId;
	$('#update_goods_div').dialog({    
	    title: '修改商品信息',    
	    width: 400,    
	    height: 400,    
	    closed: false,    
	    cache: false,    
	    href: '<%=request.getContextPath()%>/goods/toUpdatePage.do?goodsId='+id,    
	    modal: true ,
	    buttons:[{
	    	iconCls:'icon-save',
			text:'保存',
			handler:function(){
				updateGoods();
				//关闭dialog窗口
				$('#update_goods_div').dialog('close');
				//刷新datagrid信息
				$('#goods_dataGrid_table').datagrid('reload');
			}
	    },{
			iconCls:'icon-no',
			text:'关闭',
			handler:function(){
				//关闭dialog窗口
				$('#update_goods_div').dialog('close');
				//刷新datagrid信息
				$('#goods_dataGrid_table').datagrid('reload');
				}
		}]
	});
	}
		//修改方法
		function updateGoods(){
			$.ajax({
				url:"<%=request.getContextPath()%>/goods/updateGoods.do",
				type:"post",
  				data:$("#update_goods_form").serialize(),//表单序列化提交 */
				dataType:"text",//规定返回值格式
				async:false, 
				success:function (data){//成功回调函数
					 $.messager.alert('提示','修改成功！'); 
					 $('#goods_dataGrid_table').datagrid('reload');
				},
				error :function(){//错误回调函数
					alert("系统异常！")
				}
			});
		}

//删除
function deleteGoods(){
	 $.messager.confirm('确认','您确认想要删除记录吗？',function(r){    
		    if (r){    
			    //执行删除操作
		    	var obj = $('#goods_dataGrid_table').datagrid('getSelected');
		    	 $.ajax({
		             url: "<%=request.getContextPath()%>/goods/deleteGoods.do",
		             type:"post",
		             data:{
						"goodsId":obj.goodsId
			             },//表单序列化提交
		             dataType:"text",//规定返回值格式
		           	async:false,//同步上传
		             success:function (data){//成功回调函数
		            	// $.messager.alert('提示','新增成功！');  
		            	//删除成功后显示信息
					    	$.messager.show({
					    		title:'提示',
					    		msg:'删除成功',
					    		showType:'show',
					    	});
					    	//刷新页面
                  		$('#goods_dataGrid_table').datagrid('reload');
		             },
		             error :function(){//错误回调函数
		                 alert("系统错误,请联系管理员");
		             }
		     });
		    } else{
		    	$.messager.alert('警告','错误啦'); 
			    }   
		});  

}


//跳转到新增页面
function toInsertPage(){
      $('#insert_goods_div').dialog({    
		    title: '新增商品',    
		    width: 400,    
		    height: 300,    
		    closed: false,    
		    cache: false,    
		    href: '<%=request.getContextPath()%>/goods/toInsertPage.do',    
		    modal: true ,
		    buttons:[{
		    	iconCls:'icon-save',
				text:'保存',
				handler:function(){
					insertGoods();
					//关闭dialog窗口
					$('#insert_goods_div').dialog('close');
					//刷新datagrid信息
					$('#goods_dataGrid_table').datagrid('reload');
				}
		    },{
				iconCls:'icon-no',
				text:'关闭',
				handler:function(){
					//关闭dialog窗口
					$('#insert_goods_div').dialog('close');
					//刷新datagrid信息
					$('#goods_dataGrid_table').datagrid('reload');
					}
			}] 
		});
		}
		//新增方法
		function insertGoods(){
				  $.ajax({
			              url: "<%=request.getContextPath()%>/goods/insertGoods.do",
			              type:"post",
			              data:$("#goods_insert_form").serialize(),//表单序列化提交
			              dataType:"text",//规定返回值格式
			              async:false,//同步上传
			              success:function (data){//成功回调函数
			                  alert("新增成功");
			              },
			              error :function(){//错误回调函数
			                  alert("系统错误,请联系管理员");
			              }
		 	     });
			}

$('#goods_dataGrid_table').datagrid({    
    url:'<%=request.getContextPath()%>/goods/queryGoodsList.do',    
    columns:[[    
        {field:'goodsId',title:'商品编号',width:100},    
        {field:'goodsName',title:'商品名称',width:100,
        	formatter: function(value,row,index){
        		console.info(row.goodsId);
        		/* target='_blank 开启空白标签页 */
        		return "<a target='_blank' href='${pageContext.request.contextPath}/goods/toGoodsInfo.do?goodsId="+row.goodsId+"'>"+value+"</a>"
        	}
        
        },    
        {field:'goodsPrice',title:'商品价格',width:100,align:'right'},
        {field:'goodsCount',title:'商品库存',width:100,align:'right'},    
        {field:'goodsDateStr',title:'出厂日期',width:100,align:'right'},    
        {field:'goodsTypeId',title:'商品类型',width:100,align:'right',
        	formatter: function(value,row,index){
        		if (value==1){
        		return "电子数码";
        		} else if(value==2){
        		return "户外运动";
        		}else if(value==3){
        		return "智能家居";
        		}else if(value==4){
        		return "家纺用品";	
               }    
            }	
        }
    ]],
   //singleSelect为true选中一行
	singleSelect:true,
	//定义分页工具栏
	pagePosition:'bottom',
	//设置默认的每页条数
	pageSize:'5',
	//初始化分页的选择条数列表
	pageList:[5,10,15,20,25],
	pagination:true
}); 
</script>
</html>