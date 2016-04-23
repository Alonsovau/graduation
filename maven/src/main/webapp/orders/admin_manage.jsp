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
  	<s:a action="adminAction!index.action" namespace="/admin">
    	<span  class="home">首页</span>
  	</s:a>
	<span>管理员你好</span>
  </div>
</nav>

<div class="login layout f14"  style="margin: auto;width: 62%">
    <s:form action="ordersAction!list.action" method="post" id="Form" theme="simple">
    	<div style="margin-top: 15px;">
      	  <s:fielderror></s:fielderror>
          <span>输入用户名：</span><input class="name" name="username" id="username"/>
          <span>开始日期：</span><input class="calendar" id="inpstart" name="start" readonly/>
	  	  <span>结束日期：</span><input class="calendar" id="inpend" name="end" readonly/>
	  	</div>	
    </s:form>
    
	<div class="btn-ui-b mt10">
		<a href="javascript:void(0);" onclick="return submit();">查找</a>
	</div>
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
							<s:a action="ordersAction!selectById.action">
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
<script>
var start = {
    dateCell: '#inpstart',
    format: 'YYYY-MM-DD hh:mm:ss',
    minDate: '1970-01-01 00:00:00', //设定最小日期为当前日期
	festival:true,
    maxDate: '2099-06-16 23:59:59', //最大日期
    isTime: true,
    choosefun: function(datas){
         end.minDate = datas; //开始日选好后，重置结束日的最小日期
    }
};
var end = {
    dateCell: '#inpend',
    format: 'YYYY-MM-DD hh:mm:ss',
    minDate: jeDate.now(0), //设定最小日期为当前日期
	festival:true,
    maxDate: '2099-06-16 23:59:59', //最大日期
    isTime: true,
    choosefun: function(datas){
         start.maxDate = datas; //将结束日的初始值设定为开始日的最大日期
    }
};
jeDate(start);
jeDate(end);
</script>
<div id="footer">
  <div class="copyright">Copyright© 2012-2016 m.zx.com</div>
</div>
</body>
</html>