<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/sitting/taglib.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户登录</title>
<script type="text/javascript" src="${ctx}/static/js/jquery.1.9.1.js"></script>
</head>
<body>
<form action="" id="Form">
<div class="">账号<input type="text"id="USERNAME" name="USERNAME"></div>
<div class="">密码<input type="password" id="PASSWORD" name="PASSWORD"></div>
<div class=""><button type="button" onclick="login();">登录</button><a href="${ctx}/jsp/register.jsp"><input type="button"value="注册"></a></div>
</form>
</body>
<script type="text/javascript">
function login() {
	var loginname = $("#USERNAME").val();
	var password = $("#PASSWORD").val();
	$.ajax({
	type:"POST",
	url:'${ctx}/login',
	data:"",
	dataType:'json',
	success:function(){
		window.location.href="/index";
	}
	});
	
}
</script>
</html>