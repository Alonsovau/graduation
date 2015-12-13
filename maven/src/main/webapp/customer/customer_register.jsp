<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<s:set var="context_path"
       value="#request.get('javax.servlet.forward.context_path')"></s:set>   
<!DOCTYPE HTML>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=2.0"/>
<%--适应屏幕大小--%>
<title>注册_易购网触屏版</title>
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
function registerSubmit(){
	registerForm.submit();
	return true;
}
</script>
</head>
<body>
<s:property value="exception.message"/>
<nav class="nav nav-sub pr">
  <s:a action="customerAction!index.action" namespace="/customer">
    <span  class="goback">返回首页</span>
  </s:a>
  <div class="nav-title wb">
	<span>用户注册</span>
  </div>
  <div class="title-submit-ui-a">
    <s:a action="customerAction!login.action" namespace="/customer">
               登录
    </s:a>
  </div>
</nav>
<div class="login layout f14">
<div class="signup layout f14" id="Sign_Check">
  <div class="regist-box" id="Login_Check">
    <div class="signup-tab-box tabBox ">
    <s:form action="customerAction!save.action" name="/user" method="post" id="registerForm" theme="simple">
      <ul class="input-list mt10">
        <li>
          <s:textfield name="username" cssClass="input-ui-a" placeholder="请输入您的用户名" ></s:textfield>
          <s:fielderror cssClass="fielderror">
          	<s:param>username</s:param>
          </s:fielderror>
		</li>
        <li>
          <s:password name="password" cssClass="input-ui-a" placeholder="请输入6-20位密码"></s:password>
          <s:fielderror cssClass="fielderror">
          	<s:param>password</s:param>
          </s:fielderror>          
          </li>
        <li>
          <s:password name="repassword" cssClass="input-ui-a" placeholder="请再次输入您的密码"></s:password>
          <s:fielderror cssClass="fielderror">
          	<s:param>repassword</s:param>
          </s:fielderror>            
        </li>
        <li>
          <s:textfield name="realname" cssClass="input-ui-a" placeholder="请输入您的真实姓名"></s:textfield>           
        </li>
        <li>
          <s:textfield name="phone" cssClass="input-ui-a" placeholder="请输入您的电话"></s:textfield>
        </li>                            
        <li>
          <s:textfield name="email" cssClass="input-ui-a" placeholder="请输入您的邮箱地址"></s:textfield>
          <s:fielderror cssClass="fielderror">
          	<s:param>email</s:param>
          </s:fielderror>            
        </li>
      </ul>
    </s:form>
    <div class="btn-ui-b mt10">
           <a  href="javascript:void(0);" onclick="return registerSubmit();">注册</a>
    </div>
    <div class="wbox a label-bind zhmm mt10">
        <label><input type="checkbox" class="input-checkbox-a f-les m-tops" id="epp_email_checked"></label>
        <div class="wbox-flex">
          <p>同意易购网触屏版会员章程</p>
          <p>同意易付宝协议，创建易付宝账户</p>
          <p class="err-tips mt5 hide" id="epp_email_checked_error">请确认此协议！</p>
        </div>
    </div>
    </div>
  </div>
</div>
</div>    
<div id="footer">
  <ul class="list-ui-a">
    <li>
      <div class="w user-login">
        <s:a action="customer_login" namespace="/customer">
                      登录
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