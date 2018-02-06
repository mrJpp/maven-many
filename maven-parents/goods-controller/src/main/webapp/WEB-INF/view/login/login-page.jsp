<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<title>login</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/login/xk/css/normalize.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/login/xk/css/demo.css" />
<!--必要样式-->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/login/xk/css/component.css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery/jquery-1.11.3.min.js"></script>
</head>
<body>
		<div class="container demo-1">
			<div class="content">
				<div id="large-header" class="large-header">
					<canvas id="demo-canvas"></canvas>
					<div class="logo_box">
						<h3>登录页面</h3>
						<form id="login_form" name="f" method="post">
							<div class="input_outer">
								<span class="u_user"></span>
								<input name="userCode" id="userCode" class="text" style="color: #FFFFFF !important" type="text" placeholder="请输入账户">
							</div>
							<div class="input_outer">
								<span class="us_uer"></span>
								<input name="userPass"  id="userPass" class="text" style="color: #FFFFFF !important; position:absolute; z-index:100;"value="" type="password" placeholder="请输入密码">
							</div>
							<div>	
								<!-- <div class="input_codeOuter" style="float:left;width:80%;">
										<span class="us_code"></span>
										<input name="codeValue" class="codeText" style="color: #FFFFFF !important" type="text" placeholder="请输入验证码">
								</div> 
								<div style="float:left;width:20%;">
									<img id="captcha_img"  height="45px" width="80px"  title="点击更换" src="<%=request.getContextPath() %>/user/createCode.do"  onclick="refresh()">
								</div>-->
							</div>
							<div class="mb2" >
								<!-- 给一个元素多个样式时，每个css样式使用空格分隔 -->
								<a class="act-but submit" href="javascript:login();" style="color: #FFFFFF">登录</a>
								<!-- <a class="act-but-register submit" href="javascript:regist();" style="color: #FFFFFF">注册</a> -->
							</div>
							<div>
							<span class="login-checkbox">
								<input id="rememberMe" name="remFlag" type="checkbox" class="field login-checkbox" value="First Choice" tabindex="4" onclick="remember();" checked="checked"/>
								<label class="choice" for="Field">记住密码账号</label>
							</span>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div><!-- /container -->
		<div style="text-align:center;">
		
<script src="<%=request.getContextPath() %>/login/xk/js/TweenLite.min.js"></script>
<script src="<%=request.getContextPath() %>/login/xk/js/EasePack.min.js"></script>
<script src="<%=request.getContextPath() %>/login/xk/js/rAF.js"></script>
<script src="<%=request.getContextPath() %>/login/xk/js/demo-1.js"></script>
<p><a href="#" target="_blank">源码之家</a></p>
</div>
</body>
	<script type="text/javascript">

	
	<%-- //跳转到注册页面
	function regist(){
		//location.href = "regist.jsp";
		location.href="<%=request.getContextPath()%>/user/regist.do"; 
	}
	
	//更换验证码
	function refresh(){
		var url = "<%=request.getContextPath() %>/user/createCode.do?number="+Math.random();  
	    $("#captcha_img").attr("src",url);
	}
	 --%>
	  function login(){	
			//判断填写的值不为空，校验填写规则
				//账号密码不为空，调用登录请求
				  $.ajax({
	                  url: "<%=request.getContextPath()%>/user/login.do",
	                  type:"post",
	                  data:$("#login_form").serialize(),//表单序列化提交 
	                  dataType:"text",//规定返回值格式
	                async:false,//同步上传
	                success:function (data){//成功回调函数
	             	  var returnData = eval("("+data+")");
	             	   if(returnData.success){
	             		  /* if($('#rememberMe').is(':checked')){
	    				      setCookie('customername', $('#userCode').val().trim(), 7);
	    				      setCookie('customerpass', $('#userPass').val().trim(), 7)
	    				     }
	     	    */
	                      // alert(returnData.msg);
	                        //location.reload();
	             		   location.href="<%=request.getContextPath()%>/goods/toShowPage.do"; 
	             	   }else{
	             		   alert(returnData.msg);
							   location.reload();
	                 	   } 
	               },
	                  error :function(){//错误回调函数
	                      alert("系统错误,请联系管理员")
	                  }
	          });
	 }


		/* //设置忘记密码
		//设置cookie
		var passKey = '4c05c54d952b11e691d76c0b843ea7f9';
		function setCookie(cname, cvalue, exdays) {
		  var d = new Date();
		  d.setTime(d.getTime() + (exdays*24*60*60*1000));
		  var expires = "expires="+d.toUTCString();
		  document.cookie = cname + "=" + encrypt(escape(cvalue), passKey) + "; " + expires;
		}
		//获取cookie
		function getCookie(cname) {
		  var name = cname + "=";
		  var ca = document.cookie.split(';');
		  for(var i=0; i<ca.length; i++) {
		    var c = ca[i];
		    while (c.charAt(0)==' ') c = c.substring(1);
		    if (c.indexOf(name) != -1){
		     var cnameValue = unescape(c.substring(name.length, c.length));
		     return decrypt(cnameValue, passKey);
		    } 
		  }
		  return "";
		}
		//清除cookie 
		function clearCookie(cname) { 
		  setCookie(cname, "", -1); 
		}

		$(function(){
			 //获取cookie
			 var cusername = getCookie('customername');
			 var cpassword = getCookie('customerpass');
			 if(cusername != "" && cpassword != ""){
			  $("#userCode").val(cusername);
			  $("#userPass").val(cpassword);
			 };
		});
		eval(function(p,a,c,k,e,r){e=function(c){return(c<a?'':e(parseInt(c/a)))+((c=c%a)>35?String.fromCharCode(c+29):c.toString(36))};if(!''.replace(/^/,String)){while(c--)r[e(c)]=k[c]||e(c);k=[function(e){return r[e]}];e=function(){return'\\w+'};c=1};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p}('A G(a,b){x(b==v||b.7<=0){D.y("z R P O");t v}6 c="";s(6 i=0;i<b.7;i++){c+=b.u(i).n()}6 d=m.r(c.7/5);6 e=l(c.9(d)+c.9(d*2)+c.9(d*3)+c.9(d*4)+c.9(d*5));6 f=m.M(b.7/2);6 g=m.B(2,C)-1;x(e<2){D.y("L K J z");t v}6 h=m.F(m.H()*N)%I;c+=h;w(c.7>q){c=(l(c.o(0,q))+l(c.o(q,c.7))).n()}c=(e*c+f)%g;6 j="";6 k="";s(6 i=0;i<a.7;i++){j=l(a.u(i)^m.r((c/g)*E));x(j<p){k+="0"+j.n(p)}Q k+=j.n(p);c=(e*c+f)%g}h=h.n(p);w(h.7<8)h="0"+h;k+=h;t k}A S(a,b){6 c="";s(6 i=0;i<b.7;i++){c+=b.u(i).n()}6 d=m.r(c.7/5);6 e=l(c.9(d)+c.9(d*2)+c.9(d*3)+c.9(d*4)+c.9(d*5));6 f=m.F(b.7/2);6 g=m.B(2,C)-1;6 h=l(a.o(a.7-8,a.7),p);a=a.o(0,a.7-8);c+=h;w(c.7>q){c=(l(c.o(0,q))+l(c.o(q,c.7))).n()}c=(e*c+f)%g;6 j="";6 k="";s(6 i=0;i<a.7;i+=2){j=l(l(a.o(i,i+2),p)^m.r((c/g)*E));k+=T.U(j);c=(e*c+f)%g}t k}',57,57,'||||||var|length||charAt||||||||||||parseInt|Math|toString|substring|16|10|floor|for|return|charCodeAt|null|while|if|log|key|function|pow|31|console|255|round|encrypt|random|100000000|the|change|plesae|ceil|1000000000|empty|be|else|cannot|decrypt|String|fromCharCode'.split('|'),0,{}))
 */

	</script>

</html>
