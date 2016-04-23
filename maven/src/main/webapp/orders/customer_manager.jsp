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

.calendar {
	width: 200px;
	height: 20px;
	line-height: 20px;
	border: 1px #A5D2EC solid;
	padding: 5px;
	background-color: #fff;
	background-image: url("../images/calendar.png");
	background-repeat: no-repeat;
	background-position: right center;
	margin-left: 10px;
	display: block;
}

.name {
	width: 200px;
	height: 20px;
	line-height: 20px;
	border: 1px #A5D2EC solid;
	padding: 5px;
	background-color: #fff;
	background-repeat: no-repeat;
	background-position: right center;
	margin-left: 10px;
	display: block;
}
.xiugai{
	position: absolute;
    right: 5px;
    top: 7px;
    height: 28px;
    line-height: 28px;
    width: 80px;
}
</style>
<script type="text/javascript">
function submit(){
	Form.submit();
	return true;
}
</script>
<script type="text/javascript" src="../jedate/jedate.js"></script>
</head>
<body>
<nav class="nav nav-sub pr">
	<div class="nav-title wb">
		<s:a action="salerAction!list.action" namespace="/saler">
			<span class="home">首页</span>
		</s:a>
		<span> <s:iterator value="session">
			<s:iterator value="value">
				<s:property value="realname" />
				</s:iterator>
			</s:iterator> 
		</span>
	</div>
	<div class="xiugai">
		<s:a action="customerAction!edit.action" namespace="/customer">
		修改密码
		</s:a>
	</div>
</nav>

	<div class="login layout f14"  style="margin: auto;width: 62%">
	<s:if test="pagination!=null&&pagination.list.size()>0">
		<div style="text-align:center;">
			<table class="table">
					<tr>
						<th class="td">订单号</th>
						<th class="td">订单时间</th>
					</tr>
				<s:iterator value="pagination.list">
					<tr>
						<td class="td"><s:property value="orderId"/></td>
						<td class="td"><s:property value="time"/></td>
						<td class="td">
							<s:a action="ordersAction!cusDetail.action">
								<s:param name="orderId" value="orderId"></s:param>
								<div class="mybtn">查看详情</div>	
							</s:a>
						</td>						
					</tr>
				</s:iterator>
			</table>
			
		</div>
		<div id="more_load w" style="margin-left: 10px;">
		    <div class="load-more-lay" style="display: block;" id="loadingMore">
		    <s:url var="first">
		      <s:param name="pageNo" value="1"></s:param>
		      <s:param name="username" value="%{username}"></s:param>
		      <s:param name="start" value="%{start}"></s:param>
		      <s:param name="end" value="%{end}"></s:param>
		    </s:url>
		    <s:url var="previous">
		      <s:param name="pageNo" value="pagination.pageNo-1"></s:param>
		      <s:param name="username" value="%{username}"></s:param>
		      <s:param name="start" value="%{start}"></s:param>
		      <s:param name="end" value="%{end}"></s:param>
		    </s:url>
		    <s:url var="last">
		      <s:param name="pageNo" value="pagination.bottomPageNo"></s:param>
		      <s:param name="username" value="%{username}"></s:param>
		      <s:param name="start" value="%{start}"></s:param>
		      <s:param name="end" value="%{end}"></s:param>
		    </s:url>
		    <s:url var="next">
		      <s:param name="pageNo" value="pagination.pageNo+1"></s:param>
		      <s:param name="username" value="%{username}"></s:param>
		      <s:param name="start" value="%{start}"></s:param>
		      <s:param name="end" value="%{end}"></s:param>
		    </s:url>	
		    </div>
		    <div class="w page">
		      <s:include value="/common/page08.jsp"></s:include>
		    </div>
		</div>			
	</s:if>

</div>
<div id="footer">
  <div class="copyright">Copyright© 2012-2016 m.zx.com</div>
</div>
</body>
</html>