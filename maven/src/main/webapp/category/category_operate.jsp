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
<script type="text/javascript">
function submit(operate){
	if(operate=='select')
		addForm.action="categoryAction!select.action";
	if(operate=='add')
		addForm.action="categoryAction!add.action";
	addForm.submit();
	return true;
}
</script>
</head>
<body>
<nav class="nav nav-sub pr">
  <div class="nav-title wb">
	<span>管理员你好</span>
  </div>
</nav>

<div class="login layout f14"  style="margin: auto;width: 62%">
    <s:form action="categoryAction!add.action" method="post" id="addForm" theme="simple">
      <ul class="input-list mt10">
        <li>
          <s:textfield name="name" cssClass="input-ui-b" placeholder="请输入类别名称" ></s:textfield>
          <s:fielderror></s:fielderror>
      </ul>
    </s:form>
    <div class="btn-ui-b mt10">
        <a href="javascript:void(0);" onclick="return submit('add');">添加类别</a>
	</div>
	<div class="btn-ui-b mt10">
		<a href="javascript:void(0);" onclick="return submit('select');">查找</a>
	</div>
	<s:if test="pagination!=null&&pagination.list.size()>0">
		<div style="text-align:center;">
			<table class="table">
					<tr>
						<th class="td">ID</th>
						<th class="td">类别名称</th>
						<th class="td"></th>
						<th class="td"></th>
					</tr>
				<s:iterator value="pagination.list">
					<tr>
						<td class="td"><s:property value="cateId"/></td>
						<td class="td"><s:property value="name"/></td>
						<td class="td">
							<s:a action="categoryAction!delete.action">
								<s:param name="cateId" value="cateId"></s:param>
								<div class="mybtn">删除</div>	
							</s:a>
						</td>
						<td class="td">
							<s:a action="categoryAction!edit.action">
								<s:param name="cateId" value="cateId"></s:param>
								<div class="mybtn">修改</div>	
							</s:a>
						</td>						
					</tr>
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
		    <div class="w page">
		      <s:include value="/common/page08.jsp"></s:include>
		    </div>
		</div>			
	</s:if>

</div>

<div id="footer">
  <div class="copyright">Copyright© 2012-2018 m.ebuy.com</div>
</div>
</body>
</html>