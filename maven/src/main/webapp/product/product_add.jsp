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
	if(operate=='update')
		addForm.action="salerAction!update.action";
	if(operate=='add')
		addForm.action="productAction!add.action";
	addForm.submit();
	return true;
}
function createFileButton(){
    var div=document.getElementById("uploadDiv");
    var fileButton=document.createElement("input");
    fileButton.type="file";
    fileButton.name="files";
    var removeButton=document.createElement("input");
    var br=document.createElement("br");
    removeButton.type="button";
    removeButton.value="删除";
    removeButton.onclick=function(){
        div.removeChild(fileButton);
        div.removeChild(removeButton);
        div.removeChild(br);
    }
    div.appendChild(fileButton);
    div.appendChild(removeButton);
    div.appendChild(br);
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
	<s:form action="salerAction!add.action" name="/user" method="post" id="addForm" theme="simple" enctype="multipart/form-data">
      <ul class="input-list mt10">
      	<li>
      	  <input type="hidden" value="<s:property value="product.productId"/>" name="productId">
      	  <s:fielderror></s:fielderror>
      	</li>
        <li>
          <s:textfield name="name" cssClass="input-ui-a" placeholder="请输入产品名" value="%{product.name}"></s:textfield>
		</li>
		<li>
		  <s:textfield name="price" cssClass="input-ui-a" placeholder="请输入产品价格" value="%{product.price}"></s:textfield>
		</li>
        <li>
          <s:textfield name="stockNumber" cssClass="input-ui-a" placeholder="请输入产品库存" value="%{product.stockNumber}"></s:textfield>
        </li>
        <li>
          <s:textfield name="description" cssClass="input-ui-a" placeholder="请输入产品描述" value="%{product.description}"></s:textfield>
        </li>        
        <li>
          <select name="categoryId">
          	<s:iterator var="category" value="categoryList">
          		<s:iterator value="category">
          			<s:if test="product.category.cateId==cateId">
		          		<option value="<s:property value="cateId"/>" selected="selected"><s:property value="name"/></option>
          			</s:if>
          			<s:if test="product.category.cateId!=cateId">
		          		<option value="<s:property value="cateId"/>"><s:property value="name"/></option>
          			</s:if>          			
          		</s:iterator>
          	</s:iterator>
          </select>
        </li>
        <li>
          <select name="salerId">
          	<s:iterator var="saler" value="salerList">
          		<s:iterator>
          			<s:if test="product.saler.salerId==salerId">
          				<option value="<s:property value="salerId"/>" selected="selected"><s:property value="name"/></option>	
          			</s:if>
          			<s:if test="product.saler.salerId!=salerId">
          				<option value="<s:property value="salerId"/>"><s:property value="name"/></option>	
          			</s:if>          			
          		</s:iterator>
          	</s:iterator>
          </select>
        </li>
        <li>
          <%--<s:textfield name="stockNumber" cssClass="input-ui-a" placeholder="请输入产品库存" value="%{saler.account}"></s:textfield>
        --%></li>
      </ul>
      <div id="uploadDiv">
        <input type="file" name="files"/><input type="button" onclick="createFileButton()" value="新增"/><br>
	  </div>      
    </s:form>
    <s:if test="productId==null">
    <div class="btn-ui-b mt10">
    	<a href="javascript:void(0);" onclick="return submit('add');">添加</a>
    </div>
    </s:if>
    <s:if test="productId!=null">
    <div class="btn-ui-b mt10">
    	<a href="javascript:void(0);" onclick="return submit('update');">修改</a>
    </div>
    </s:if>   
</div>
<s:property value="product.category.cateId"/>
<div id="footer">
  <div class="copyright">Copyright© 2012-2018 m.ebuy.com</div>
</div>
</body>
</html>