<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${APP_PATH}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${APP_PATH}/css/font-awesome.min.css">
<link rel="stylesheet" href="${APP_PATH}/css/main.css">
<style>
.tree li {
	list-style-type: none;
	cursor: pointer;
}

table tbody tr:nth-child(odd) {
	background: #F4F4F4;
}

table tbody td:nth-child(even) {
	color: #C00;
}
</style>
</head>
<body>
<div class="container">
		<h1 style="color: red">${param.errorMsg}</h1>
		<form id="resetForm" action="resetpass" method="post"
			class="form-signin" role="form">
			<h2 class="form-signin-heading">
				<i class="glyphicon glyphicon-user"></i> 用户密码修改
			</h2>
			<div class="form-group has-success has-feedback">
				<input type="text" class="form-control" id="loginacct" name="id"
					placeholder="请输入登录账号" autofocus>
				<span class="glyphicon glyphicon-user form-control-feedback"></span>
			</div>
			<div class="form-group has-success has-feedback">
				<input type="password" class="form-control" id="userpswd" name="userpw"
					placeholder="请输入登录密码" style="margin-top: 10px;"> <span
					class="glyphicon glyphicon-lock form-control-feedback"></span>
			</div>
			
			<a class="btn btn-lg btn-success btn-block" id="doreset_btn"
				onclick="doreset()">确认</a>
		</form>
	</div>
</body>
</html>