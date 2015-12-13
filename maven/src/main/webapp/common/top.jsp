<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>    
<!-- 公用头部导航 -->
<nav class="nav nav-sub pr w">  
  <a class="goback" href="javascript:history.back(1)">返回</a>    
  <div class="nav-title wb">商品列表</div>     
  <s:a action="customer_login" namespace="/customer">
    <span class="my-account" ></span>
  </s:a>
  <s:a action="cart_list" namespace="/product">
    <span class="my-cart my-cart-in"></span> 
  </s:a> 
  <s:a action="index" namespace="/">
    <span class="home"></span>  
  </s:a> 
</nav>
