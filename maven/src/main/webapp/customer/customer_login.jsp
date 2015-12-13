<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<s:set var="context_path"
       value="#request.get('javax.servlet.forward.context_path')"></s:set>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta content="telephone=no" name="format-detection">
<title>登录_易购网触屏版</title>
<link rel="stylesheet" type="text/css" href="${context_path}/css/module.css">
<link rel="stylesheet" type="text/css" href="${context_path}/css/member.css">
<style type="text/css">
.nav {
	height: 46px;
	background: -webkit-gradient(linear,0% 0,0% 100%,from(#F9F3E6),to(#F1E8D6));
	border-top: 1px solid #FBF8F0;
	border-bottom: 1px solid #E9E5D7;
	margin: 10px 10px 0;
}
.nav .goback {
	position: absolute;
	left: 15px;
	width: 30px;
	height: 46px;
	background-size: 25px 20px;
	text-indent: -100px;
	overflow: hidden;
	background-image: url(../images/arrow_header.png);
	background-repeat: no-repeat;
	background-position: center;
}

.nav .nav-title {
	line-height: 46px;
	width: 30%;
	font-size: 16px;
	margin: 0 auto;
	text-align: center;
	color: #766d62;
	height: 46px;
	overflow: hidden;
}
</style>
<script type="text/javascript">
function logonSubmit(){
if(checkForm()){
	formlogon.submit();		
	  return true;
	  }else{
	  return false;
	  }
}	
function checkForm(){
 if(formlogon.elements["username"].value == ""){
	alert("用户名不能空！");
	return false;
  }
  if(formlogon.elements["password"].value == ""){
	alert("密码不能空！");
	return false;
  }
  return true;
}
</script>
</head>
<body>
<nav class="nav nav-sub pr">
  <s:a action="index" namespace="/">
    <span  class="goback">返回首页</span>
  </s:a>
  <div class="nav-title wb">
	<span>用户登录</span>
  </div>
  <div class="title-submit-ui-a">
    <s:a action="customerAction!register.action" namespace="/customer">
               注册
    </s:a>
  </div>
</nav>

<div class="login layout f14">
  <s:form action="customerAction!logon.action" namespace="/customer" method="post" id="formlogon" theme="simple">
    <s:fielderror></s:fielderror>
    <ul class="input-list mt10" id="Login_Check">
      <li>
        <s:textfield name="username" cssClass="input-ui-a" size="18"  placeholder="用户名："></s:textfield>
        <p class="err-tips mt5 hide" id="logonIdErrMsg">请输入用户名！</p>
      </li>
      <li>
        <s:password name="password" cssClass="input-ui-a" size="18" placeholder="密码："></s:password>    
        <p class="err-tips mt5 hide" id="passwordErrMsg">请输入密码！</p>
      </li>
    </ul>    
  </s:form>
  <div class="btn-ui-b mt10">
       <a href="javascript:void(0);" onclick="return logonSubmit();">登录</a>      
  </div> 
</div>

<div id="footer">
  <ul class="list-ui-a">
    <li>
      <div class="w user-login">
        <s:a action="customerAction!register.action" namespace="/customer"  name="wap_home_bottom02002" id="footerRegister">
           注册
        </s:a> 
        <s:a action="cart_list" namespace="/product"  name="wap_home_bottom03002">
            购物车
        </s:a> 
        <s:a action="order_findByCustomer" namespace="/product" name="wap_home_bottom03003">            
           我的订单
        </s:a>
      </div>
    </li>
  </ul>
  <div class="copyright">Copyright© 2012-2018 m.ebuy.com</div>
</div>
</body>
</html>