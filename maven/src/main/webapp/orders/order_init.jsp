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
</style>

<script type="text/javascript" src="../jquery.min.js"></script>
<script type="text/javascript" src="../jquery.spinner.js"></script>
<script type="text/javascript">
	function submit(){
		orderForm.submit();
		return true;
	}
</script>
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
	<s:form id="orderForm" action="ordersAction!save.action" namespace="/orders">
		<s:fielderror></s:fielderror>
		<s:iterator value="product">
			<div style="float: left;margin-top: 15px;font-size: 18px;font-weight: 600;"><s:property value="name"/></div>
			<div style="float: right;margin-top: 15px;">￥<s:property value="price"/><input id="price" type="hidden" value="<s:property value="price"/>"/></div>
				<input id="stockNumber" type="hidden" value="<s:property value="stockNumber"/>"/>
				<input name="productId" type="hidden" value="<s:property value="productId"/>"/>
		</s:iterator>
		<div style="clear:both;margin-top: 15px;"></div>
		<div style="float: left;">数量</div>
		<div style="float: right;">
			<input type="text" class="spinner" name="quantity"/>
		</div> 
		<div style="clear:both;margin-top: 15px;"></div>
		<div style="float: left;">小计</div>
		<div style="float: right;">￥<span id="sum"></span></div> 
		<div style="clear:both;"></div>
		<div style="float: right;margin-top: 20px;">
			<a href="javascript:void(0);" onclick="return submit();">
				<img src="../images/order_submit.jpg"></img>
			</a>
		</div>
		<div style="clear:both;"></div>		
		<br/><hr style="height:1px;border:none;border-top:1px dashed #9B9090;" />
	</s:form>
</div>

<script type="text/javascript">
$('.spinner').spinner();
var price=$("#price").val();
$("#sum")[0].innerHTML=(Number(price));
$(".decrease").click(function() {
	var num=$("input.spinner").val();
	var price=$("#price").val();
	$("#sum")[0].innerHTML=(Number(num))*Number(price);
});
$(".increase").click(function() {
	var num=$("input.spinner").val();
	var price=$("#price").val();
	var stockNumber=$("#stockNumber").val();
	if(Number(num)+1>stockNumber){
		alert("超出库存！最多可买"+stockNumber+"个");
		return false;
	}
	$("#sum")[0].innerHTML=(Number(num))*Number(price);
});
</script>

<div id="footer">
  <div class="copyright">Copyright© 2012-2016 m.zx.com</div>
</div>
</body>
</html>