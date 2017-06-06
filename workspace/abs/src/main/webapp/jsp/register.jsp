<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/sitting/taglib.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户注册</title>
	<script type="text/javascript" src="${ctx}/static/js/jquery.1.9.1.js"></script>
	 <!-- 弹框 -->
 	<script type="text/javascript" src="${ctx}/static/js/jquery.tips.js"></script>
</head>
<body>
	<form action="" id="Form">
	<div class="wai">
	<div class="">用户注册</div>
	<div class=""><span>邮箱</span><input type="text" id="EMAIL" name="EMAIL"><div class=""><span>*注册后使用此邮箱登录</span></div></div>
	<div class="">用户名<input type="text" id="NAME" name="NAME"></div>
	
	
	<div class="">密码<input type="text" id="PASSWORD" name="PASSWORD"></div>
	<div class="">确认密码<input type="text" id="REPASSWORD" name="REPASSWORD"></div>
	<div class=""><button type="button" onclick="regist();">注册</button></div>
	</div>
	</form>
</body>
<script type="text/javascript">
  //注册
   

  function regist() {
	  
	 if ($("#EMAIL").val()=="") {
		$("#EMAIL").tips({
			side:3,
			msg:'请输入邮箱',
			bg:'#87CEFF',
			time:2
		});
		$("#EMAIL").focus();
		return false;
	} 
	 //邮箱格式验证
	var reg =/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/; 
	var phoneval = $("#EMAIL").val();
	if (!reg.test(phoneval)) {
		$("#EMAIL").tips({
			side:3,
            msg:'邮箱格式有误',
            bg:'#FFC0CB',
            time:2
        });
		$("#EMAIL").focus();
		return false;
		
	}  
		if ($("#NAME").val()=="") {
			$("#NAME").tips({
				side:3,
				msg:'请输入用户名',
				bg:'#87CEFF',
				time:2
			});
			$("#NAME").focus();
			return false;
		}
		if ($("#PASSWORD").val()=="") {
			$("#PASSWORD").tips({
				side:3,
				msg:'请输入密码',
				bg:'#87CEFF',
				time:2
			});
			$("#PASSWORD").focus();
			return false;
		}
		if ($("#REPASSWORD").val()=="") {
			$("#REPASSWORD").tips({
				side:3,
				msg:'请输入确认密码',
				bg:'#87CEFF',
				time:2
			});
			$("#REPASSWORD").focus();
			return false;
		}
		if ($("#REPASSWORD").val()!=''&&$("#REPASSWORD").val()!=$("#PASSWORD").val()) {
			$("#REPASSWORD").tips({
				side:3,
				msg:'两次密码不一样',
				bg:'#87CEFF',
				time:2
			});
			$("#REPASSWORD").focus();
			return false;
		}

		$.ajax({
			type: "POST",
			url: '${ctx}/register/save',
	    	data: $("#Form").serialize(),
			dataType:'json',
			async: false,
			success: function(data){
				if(data.success=="1"){
					hintSubmit(1,"提交成功！");
				 }else{
					 hintSubmit(2,"提交成功！");
					
				 
				 }	
			},
			
			error: function(XMLHttpRequest, textStatus, errorThrown) {
				 alert("操作无效");
		    }
		}); 
}
  //弹框
  function hintSubmit(zht,tex){
      $("body").prepend('<div id="alt_ctn" style="position: fixed;top: 0;left: 0;width: 100%;height: 100%;z-index: 999999;" oncontextmenu="return false" onselectstart="return false">' +
      '<div style="position: fixed;left: 0;top: 0;width: 100%;height: 100%;background: #b1b1b1;filter:alpha(opacity=50);opacity: 0.5;"></div>' +
      '<div style="height: 250px;width: 450px;background: #FFFFFF;position: fixed;left: 50%;top: 50%;border-radius: 3px;box-shadow: 8px 8px 15px #ABABAB;margin: -125px 0 0 -225px">' +
      '<a class="close_an" href="javascript:" style="position: absolute;top: 5px;right: 5px;opacity: 0.8;"><img style="width: 23px;" src="${ctx}/static/img/guanb.png" alt=""/></a>' +
      '<div style="margin-top: 80px;text-align: center;"><img style="width: 60px;vertical-align: middle;margin-right: 20px;" src="${ctx}/static/img/tisk_'+zht+'.png" /><span style="color: #d81e06;font-size: 22px;vertical-align: middle;">'+tex+'</span></div>' +
      '</div>' +
      '</div>');

      $("body").css({"overflow":"hidden", "margin-right":"17px"});
      $(".close_an").click(function(){
          $("#alt_ctn").remove();
          $("body").css({"overflow":"", "margin-right":""});
      });
  } 
   </script> 
</html>