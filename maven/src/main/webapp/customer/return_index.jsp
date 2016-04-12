<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'return_index.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<script type="text/javascript">
		var t=3;
		setInterval("index()",1000);
		function index(){
			if(t==0){
				indexForm.action="/maven/saler/salerAction!list.action";
				indexForm.submit();
			}
			document.getElementById("show").innerHTML=""+t+"秒后跳转到首页";
			t--;
		}
	</script>
  </head>
  
  <body>
  	<span id="show"></span>
  	<form id="indexForm"></form>
    <s:a action="salerAction!list" namespace="/saler">没有跳转 点击返回首页</s:a>
  </body>
</html>
