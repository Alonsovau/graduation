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
<title>首页</title>
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
<script type="text/javascript">
function submit(){
	addForm.submit();
	return true;
}
</script>
</head>
<body>
<nav class="nav nav-sub pr">
  <div class="nav-title wb">
  	<s:a action="salerAction!recommand.action" namespace="/saler">
    	<span style="position: absolute;left: 15px;color:#7412C4;">推荐</span>
  	</s:a>
	<span>
		<s:iterator value="session">
			<s:iterator value="value">
				<s:property value="realname"/>
			</s:iterator>
		</s:iterator>
	</span>
  </div>
  <div class="title-submit-ui-a">
    <s:a action="ordersAction!cusIndex.action" namespace="/orders">
		订单
    </s:a>
   </div>
</nav>

<div class="login layout f14"  style="margin: auto;width: 65%">
	<div style="float: left;">
    <s:form action="salerAction!list.action" method="post" id="addForm" theme="simple">
      <ul class="input-list mt10">
        <li>
          <s:textfield name="name" cssClass="input-ui-b" placeholder="请输入商户名称" ></s:textfield>
          <s:fielderror></s:fielderror>
        </li>
      </ul>
    </s:form>
    </div>
	<div style="float: left;height: 33px;margin-top: 12px;margin-left: 5px;">
		<a href="javascript:void(0);" onclick="return submit();"><img src="../images/seacher.png"></img></a>
	</div>
	<s:if test="pagination!=null&&pagination.list.size()>0">
		<div >
			<table class="table">
				<s:iterator value="pagination.list">
					<tr>
						<td class="td" style="font-size: 19px;font-weight:600;">
							<s:a action="salerAction!selectbyId.action">
								<s:param name="salerId" value="salerId"></s:param>
								&nbsp;&nbsp;<s:property value="name"/>
							</s:a>
						</td>
					</tr>
					<s:iterator value="products"  status="sts">
						<s:if test="#sts.index<2">
						<tr>
						<td style="font-size: 16px;">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="name" /><br/>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;价格：<s:property value="price"/>
							已售：<s:property value="sales"/>
						</td>
						<td>
							<s:iterator status="st" value="pictures">
								<s:if test="#st.first">
									<img alt="" src="<s:property value="path"/>" height="80px" width="80px">
									
								</s:if>
							</s:iterator>
						</td>
						</tr>
						</s:if>
					</s:iterator>
				</s:iterator>
			</table>
		</div>
		<div id="more_load w" style="text-align: center;">
		    <div class="load-more-lay" style="display: block;" id="loadingMore">
		    <s:url var="first">
		      <s:param name="pageNo" value="1"></s:param>
		      <s:param name="name" value="name"></s:param>
		    </s:url>
		    <s:url var="previous">
		      <s:param name="pageNo" value="pagination.pageNo-1"></s:param>
		      <s:param name="name" value="name"></s:param>
		    </s:url>
		    <s:url var="last">
		      <s:param name="pageNo" value="pagination.bottomPageNo"></s:param>
		      <s:param name="name" value="name"></s:param>
		    </s:url>
		    <s:url var="next">
		      <s:param name="pageNo" value="pagination.pageNo+1"></s:param>
		      <s:param name="name" value="name"></s:param>
		    </s:url>	
		    </div>
		    <div>
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