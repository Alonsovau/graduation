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

p {
	color: #666;
	font: 14px; Arial, 'Droid Sans', 'Microsoft YaHei',
		'Hiragino Sans GB', STXihei, 'simsun', 'sans-serif';
	line-height: 23px;
}
.title{
	color: #0086B4;
	font-size: x-large;
}
.section{
	margin-top: 10px;
}
a{
	color: #FF6F00;
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
		<div class="section">
			<span class="title">景点：</span>
			<p>
				<s:a action="salerAction!selectbyId.action?salerId=5">方塔园</s:a>
				位于常熟最热闹的商业街方塔街以北80米处，是在宋代崇教兴福寺废址上新建的仿古园林，风格同苏州园林。古寺虽已毁，但始建于南宋建炎四年（公元1130年）的方塔依然存在。方塔据说为改善常熟的风水而建，全名“崇教兴福寺塔”，历代屡次修葺，是常熟的地标之一，方塔园也因该塔得名。
			</p>
			<p>方塔园内曲桥碧水、亭台楼阁错落有致，园林的景致很好，在园子西部的醉尉池观鱼也是游客喜爱做的事。</p>
		</div>
		<div class="section">
			<span class="title">美食：</span>
			<p>
				<s:a action="salerAction!selectbyId.action?salerId=6">一块七</s:a>
				(乘坐常熟105路/常熟108路 10分钟可到)
			</p>
			<p>
				<s:a action="salerAction!selectbyId.action?salerId=7">日食和风咖喱</s:a>
				(步行261米可到)
			</p>
		</div>
		<div class="section">
			<span class="title">电影：</span>
			<p>
				<s:a action="salerAction!selectbyId.action?salerId=8">常熟京门影城</s:a>
				(约660米 步行9分钟可到)
			</p>
		</div>
		<hr style="height:1px;border:none;border-top:1px dashed #9B9090;margin-top: 11px;" />
</div>

<div id="footer">
  <div class="copyright">Copyright© 2012-2016 m.zx.com</div>
</div>
</body>
</html>