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
<link rel="stylesheet" type="text/css" href="${context_path}/css/module.css"/>
<link rel="stylesheet" type="text/css" href="${context_path}/css/member.css"/>
<link rel="stylesheet" href="${context_path}/css/jquery.spinner.css" type="text/css"/>
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
<script type="text/javascript" src="../jquery.spinner.js"></script>
<script type="text/javascript" src="http://libs.useso.com/js/jquery/1.7.2/jquery.min.js"></script>
</head>
<body>
<nav class="nav nav-sub pr">
  <div class="nav-title wb">
    <s:a action="adminAction!index.action" namespace="/admin">
    	<span  class="home">首页</span>
  	</s:a>
	<span>
		<s:iterator value="session">
			<s:iterator value="value">
				<s:property value="realname"/>
				<s:property value="cusId"/>
			</s:iterator>
		</s:iterator>
	</span>
  </div>
</nav>

<div class="login layout f14"  style="margin: auto;width: 65%">
	<s:iterator value="product">
		<s:property value="name"/>
	</s:iterator>
	
	<br/><hr style="height:1px;border:none;border-top:1px dashed #9B9090;" />
</div>
<input type="text" class="spinner"/> 
<script type="text/javascript">
$('.spinner').spinner();
</script>

<div id="footer">
  <div class="copyright">Copyright© 2012-2016 m.zx.com</div>
</div>
</body>
</html>