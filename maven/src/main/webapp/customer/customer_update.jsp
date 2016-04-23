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
function logonSubmit(){
if(checkForm()){
	formlogon.submit();		
	  return true;
	  }else{
	  return false;
	  }
}	
function checkForm(){
 if(formlogon.elements["password"].value == ""){
	alert("原密码不能空！");
	return false;
  }
  if(formlogon.elements["repassword"].value == ""){
	alert("新密码不能空！");
	return false;
  }
  return true;
}
</script>
</head>
<body>
<nav class="nav nav-sub pr">
  <div class="nav-title wb">
	<span>密码修改</span>
  </div>
</nav>

<div class="login layout f14">
  <s:form action="customerAction!update.action" namespace="/customer" method="post" id="formlogon" theme="simple">
    <s:fielderror></s:fielderror>
    <ul class="input-list mt10" id="Login_Check">
      <li>
        <s:password name="password" cssClass="input-ui-a" size="18"  placeholder="原密码："></s:password>
        <p class="err-tips mt5 hide" id="logonIdErrMsg">请输入原密码！</p>
      </li>
      <li>
        <s:password name="repassword" cssClass="input-ui-a" size="18" placeholder="新密码："></s:password>    
        <p class="err-tips mt5 hide" id="passwordErrMsg">请输入新密码！</p>
      </li>
    </ul>    
  </s:form>
  <div class="btn-ui-b mt10">
       <a href="javascript:void(0);" onclick="return logonSubmit();">修改</a>      
  </div> 
</div>

<div id="footer">
  <div class="copyright">Copyright© 2012-2016 m.zx.com</div>
</div>
</body>
</html>