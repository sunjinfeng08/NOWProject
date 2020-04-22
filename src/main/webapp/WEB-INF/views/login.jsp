<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="keys" content="">
<meta name="author" content="">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/login.css">
<style>
</style>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<div>
					<a class="navbar-brand" href="header" style="font-size: 32px;">Project-Demo</a>
				</div>
			</div>
		</div>
	</nav>

	<div class="container">
		<h1 style="color: red">${param.errorMsg}</h1>
		<form id="loginForm" action="doLogin" method="post"
			class="form-signin" role="form">
			<h2 class="form-signin-heading">
				<i class="glyphicon glyphicon-user"></i> 用户登录
			</h2>
			<div class="form-group has-success has-feedback">
				<input type="text" class="form-control" id="loginacct" name="id"
					placeholder="请输入登录账号" autofocus onchange="autoFullPassWorld();">
				<span class="glyphicon glyphicon-user form-control-feedback"></span>
			</div>
			<div class="form-group has-success has-feedback">
				<input type="password" class="form-control" id="userpswd" name="userpw"
					placeholder="请输入登录密码" style="margin-top: 10px;"> <span
					class="glyphicon glyphicon-lock form-control-feedback"></span>
			</div>
			<div class="form-group has-success has-feedback">
				<select class="form-control">
					<option value="member">会员</option>
					<option value="user">管理</option>
				</select>
			</div>

			<div class="checkbox">
				<label> <input type="checkbox" value="remember-me" 	id="rememberMe"> 记住我
				</label> 
				<label> <a href="resetPassword.html">忘记密码</a></label> 
				<label style="float: right"> <a href="registe" target="_blank">新用户注册</a></label>
			</div>
			<a class="btn btn-lg btn-success btn-block" id="doLogin_btn"
				onclick="dologin()"> 登录</a>
		</form>
	</div>
	<script src="jquery/jquery-2.1.1.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="layer/layer.js"></script>
	<script>	

		function dologin() {
			//获取记住我按钮是否勾选
			var rememberMe = $("#rememberMe").is(":checked");
			// 非空校验 ：获取用户名文本框的内容
			var loginacct = $("#loginacct").val();
			// 表单元素的value取值不会为null, 取值是空字符串
			if (loginacct == "") {
				//alert("用户登录账号不能为空，请输入");
				layer.msg("用户登录账号不能为空，请输入", {
					time : 2000,
					icon : 5,
					shift : 6
				}, function() {
				});
				return;
			}

			var userpswd = $("#userpswd").val();
			if (userpswd == "") {
				//alert("用户登录密码不能为空，请输入");
				layer.msg("用户登录密码不能为空，请输入", {
					time : 2000,
					icon : 5,
					shift : 6
				}, function() {
				});
				return;
			}

			// 提交表单
			//alert("提交表单");
			//$("#loginForm").submit();
			// 使用AJAX提交数据
			var loadingIndex = null;
			$.ajax({
				type : "POST",
				url : "doAJAXLogin",
				data : {
					"id" : loginacct,
					"userpw" : userpswd,
					"rememberMe" : rememberMe
				},
				beforeSend : function() {
					loadingIndex = layer.msg('处理中', {
						icon : 16
					});
				},
				success : function(result) {
					layer.close(loadingIndex);
					if (result.success) {
						window.location.href = "main";
					} else {
						layer.msg("用户登录账号或密码不正确，请重新输入", {
							time : 2000,
							icon : 5,
							shift : 6
						}, function() {

						});
					}
				}
			});
		}
		//显示校验结果的提示信息
		function show_validate_msg(ele, status, msg) {
			//清除当前元素的校验状态
			$(ele).parent().removeClass("has-success has-error");
			$(ele).next("span").text("");
			if ("success" == status) {
				$(ele).parent().addClass("has-success");
				$(ele).next("span").text(msg);
			} else if ("error" == status) {
				$(ele).parent().addClass("has-error");
				$(ele).next("span").text(msg);
			}
		}
		function autoFullPassWorld() {
			   var loginacct = $("#loginacct").val();
			  //  alert (loginacct);
			    var str = getCookie1(loginacct);			   
			    str = str.substring(1,str.length);		        
			    str2 = str.substring(1, str.length - 1);
				var username = str.split(",")[0];
				var password = str2.split(",")[1];
				//自动填充用户名和密码
				
				if(username == loginacct){
				$("#loginacct").val(username);
				$("#userpswd").val(password); 
				}
		if (loginacct == ""){
			$("#loginacct").val("");
  			 $("#userpswd").val("");
		}
			
   			 
		}		 
			  
		//获取cookie
		function getCookie1(name) {
			var dcookie = document.cookie;
			var cname = name + "=";
			var clen = dcookie.length;
			var cbegin = 0;
			while (cbegin < clen) {
				var vbegin = cbegin + cname.length;
				if (dcookie.substring(cbegin, vbegin) == cname) {
					var vend = dcookie.indexOf(";", vbegin);
					if (vend == -1)
						vend = clen;
					return unescape(dcookie.substring(vbegin, vend));
				}
				cbegin = dcookie.indexOf(" ", cbegin) + 1;
				if (cbegin == 0)
					break;
			}
			return null;
		}
	</script>
</body>
</html>