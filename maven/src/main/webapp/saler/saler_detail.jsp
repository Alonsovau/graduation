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
<title></title>
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
				<s:property value="realname"/>
			</s:iterator>
		</s:iterator>
	</span>
  </div>
</nav>

<div class="login layout f14"  style="margin: auto;width: 65%">
	<s:iterator value="saler">
		<div style="font-size: 19px;font-weight: 600;margin-top: 20px;"><s:property value="name"/></div>
		&nbsp;&nbsp;<s:property value="adress"/>
		<hr style="height:1px;border:none;border-top:1px dashed #9B9090;" />
		<ul style="margin-top: 5px;">
			<s:iterator value="products">
				<li style="font-size: 17px;margin-top: 7px;"><s:property value="name"/></li>
				<li>&nbsp;&nbsp;<s:property value="description"/></li>
				<s:iterator value="pictures">
					<img src="<s:property value="path"/>" height="140px" width="120px"/>
				</s:iterator>
				<li style="text-align: right;margin-right: 24px;margin-top: 5px;">
					<s:a action="productAction!orderInit" namespace="/product">
						<s:param name="productId" value="productId" />
						<img src="../images/buy.jpg"></img>
					</s:a>
				</li>		
			</s:iterator>
		</ul>
	</s:iterator>
	<br/><hr style="height:1px;border:none;border-top:1px dashed #9B9090;" />
</div>


<div id="footer">
  <div class="copyright">Copyright© 2012-2016 m.zx.com</div>
</div>
</body>
</html>