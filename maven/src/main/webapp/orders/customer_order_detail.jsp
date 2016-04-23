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
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta content="telephone=no" name="format-detection">
<title></title>
<link rel="stylesheet" type="text/css" href="${context_path}/css/module.css" />
<link rel="stylesheet" type="text/css" href="${context_path}/css/member.css" />
<link rel="stylesheet" href="../css/jquery.spinner.css" type="text/css"></link>	
<style type="text/css">
.nav {
	height: 46px;
	background: -webkit-gradient(linear, 0% 0, 0% 100%, from(#F9F3E6),
		to(#F1E8D6) );
	border-top: 1px solid #FBF8F0;
	border-bottom: 1px solid #E9E5D7;
	margin: 10px 10px 0;
}

.nav .home {
	position: absolute;
	left: 15px;
	width: 30px;
	height: 46px;
	background-size: 25px 20px;
	text-indent: -100px;
	overflow: hidden;
	background-image: url(../images/icon-home.png);
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

.left {
	float: left;
    margin: .1rem 0;
    line-height: 1.5;
}

.right {
	float: right;
    margin: .1rem 0;
    line-height: 1.5;
}

.clear {
	clear: both;
	margin-top: 15px;
}
.red{
	color: red;
}
.blue{
	color: blue;
}
</style>

</head>
<body>
<nav class="nav nav-sub pr">
  <div class="nav-title wb">
    <s:a action="salerAction!list.action" namespace="/saler">
    	<span  class="home">首页</span>
  	</s:a>
 	<span> 
 		<s:iterator value="session">
			<s:iterator value="value">
				<s:property value="realname" />
			</s:iterator>
		</s:iterator> 
	</span>
  </div>
</nav>

<div class="login layout f14"  style="margin: auto;width: 65%">
	<s:iterator value="orders">
			<div class="left" style="margin-top: 20px;">订单号：</div>
			<div class="right" style="margin-top: 20px;"><s:property value="orderId"/></div>
			<div class="clear"></div>
			
			<s:iterator value="products">
				<div class="left">购买产品：</div>
				<div class="right"><s:property value="name"/></div>
				<div class="clear"></div>		
			</s:iterator>
					
			<div class="left">购买数量：</div>
			<div class="right"><s:property value="quantity"/></div>
			<div class="clear"></div>
			
			<div class="left">总价：</div>
			<div class="right">￥<s:property value="amount"/></div>
			<div class="clear"></div>
			
			<div class="left">订单时间：</div>
			<div class="right"><s:property value="time"/></div>
			<div class="clear"></div>
			
			<div class="left">状态：</div>
			<div class="right">
				<s:if test="state==0">订单未完成</s:if>
				<s:if test="state==1">订单已完成</s:if>
				<s:if test="state==2">订单已取消</s:if>
			</div>
			<div class="clear"></div>
			
			<div class="left">操作：</div>
			<div class="right">
				<s:if test="state==0">
					<s:a action="ordersAction!confirm.action" cssClass="red">
						确认收货<s:param name="orderId" value="orderId"/>
					</s:a>
					<s:a action="ordersAction!cancle.action" cssClass="blue">
						取消订单<s:param name="orderId" value="orderId" />	
					</s:a>
				</s:if>
			</div>
			<div class="clear"></div>			
			
		<s:iterator value="customer">
			<div class="left">顾客姓名：</div>
			<div class="right"><s:property value="realname"/></div>
			<div class="clear"></div>
			
			<div class="left">顾客电话：</div>
			<div class="right"><s:property value="phone"/></div>
			<div class="clear" style="margin-bottom: 30px;"></div>					
		</s:iterator>
		<hr style="height:1px;border:none;border-top:1px dashed #9B9090;" />
	</s:iterator>
</div>

<div id="footer">
  <div class="copyright">Copyright© 2012-2016 m.zx.com</div>
</div>
</body>
</html>