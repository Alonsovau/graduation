<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<s:set var="context_path"
       value="#request.get('javax.servlet.forward.context_path')"></s:set>   
<!DOCTYPE HTML>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=2.0"/>
<%--适应屏幕大小--%>
<title>修改类别</title>
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
function updateSubmit(){
	updateForm.submit();
	return true;
}
</script>
</head>
<body>
<s:property value="exception.message"/>
<nav class="nav nav-sub pr">
  <div class="nav-title wb">
	<span>修改类别</span>
  </div>
</nav>
<div class="login layout f14">
<div class="signup layout f14" id="Sign_Check">
  <div class="regist-box" id="Login_Check">
    <div class="signup-tab-box tabBox ">
    <s:form action="categoryAction!update.action" method="post" id="updateForm" theme="simple">
      <ul class="input-list mt10">
        <li>
          <input type="hidden" value="<s:property value="category.cateId"/>" name="cateId">
          <s:textfield name="name" cssClass="input-ui-a" value="%{category.name}" ></s:textfield>
          <s:fielderror></s:fielderror>
      </ul>
    </s:form>
    <div class="btn-ui-b mt10">
           <a  href="javascript:void(0);" onclick="return updateSubmit();">修改</a>
    </div>
    </div>
  </div>
</div>
</div>    
<div id="footer">
  <div class="copyright">Copyright© 2012-2018 m.ebuy.com</div>
</div>
</body>
</html>