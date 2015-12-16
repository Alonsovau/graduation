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
<title>管理员</title>
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
</head>
<body>
<nav class="nav nav-sub pr">
  <div class="nav-title wb">
	<span>管理员你好</span>
  </div>
</nav>

<div class="login layout f14"  style="width: 62%;text-align: center;margin: auto;">
	<div class="btn-ui-b mt10">
		<s:a action="categoryAction!index" namespace="/category">类别管理</s:a>
	</div>
	<div class="btn-ui-b mt10">
		<s:a action="salerAction!index" namespace="/saler">商家管理</s:a>
	</div>
	<div class="btn-ui-b mt10">
		<s:a action="productAction!index" namespace="/product">商品管理</s:a>
	</div>
	<div class="btn-ui-b mt10">
		<a href="javascript:void(0);" onclick="">未定</a>
	</div>	
</div>

<div id="footer">
  <div class="copyright">Copyright© 2012-2018 m.ebuy.com</div>
</div>
</body>
</html>