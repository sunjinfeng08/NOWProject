<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>用户维护</title>
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

	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<div>
					<a class="navbar-brand" style="font-size: 32px;" href="#">NOWProject</a>
				</div>
			</div>			 
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li style="padding-top: 8px;">
						<div class="btn-group">
							<button type="button"
								class="btn btn-default btn-success dropdown-toggle"
								data-toggle="dropdown">
								<i class="glyphicon glyphicon-user"></i> ${loginName.name} <span
									class="caret"></span>
							</button>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#"><i class="glyphicon glyphicon-cog"></i>
										个人设置</a></li>
								<li><a href="#"><i class="glyphicon glyphicon-comment"></i>
										消息</a></li>
								<li class="divider"></li>
								<li><a href="logout"><i class="glyphicon glyphicon-off"></i>
										退出系统</a></li>
							</ul>
						</div>
					</li>
					<li style="margin-left: 10px; padding-top: 8px;">
						<button id="helpInfoBtn" type="button"
							class="btn btn-default btn-danger" data-toggle="modal"
							data-target="#helpInfoModal">
							<span class="glyphicon glyphicon-question-sign"></span> 帮助
						</button>
					</li>
				</ul>
				<form class="navbar-form navbar-right">
					<input type="text" class="form-control" placeholder="Search...">
				</form>
			</div>
		</div>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<div class="tree">
					<ul style="padding-left: 0px;" class="list-group">
						<li class="list-group-item tree-closed"><a
							href="${APP_PATH}/main"><i
								class="glyphicon glyphicon-dashboard"></i> NOW 主页面</a></li>
						<li class="list-group-item"><span><i
								class="glyphicon glyphicon glyphicon-tasks"></i> 基础资料管理 <span
								class="badge" style="float: right">3</span></span>
							<ul style="margin-top: 10px;">
								<li style="height: 30px;"><a href="${APP_PATH}/user/index"
									style="color: red;"><i class="glyphicon glyphicon-user"></i>
										用户维护</a></li>
								<li style="height: 30px;"><a href="role.html"><i
										class="glyphicon glyphicon-king"></i> 角色维护</a></li>
								<li style="height: 30px;"><a href="permission.html"><i
										class="glyphicon glyphicon-lock"></i> 许可维护</a></li>
								<li style="height: 30px;"><a
									href="${APP_PATH}/product/product"><i
										class="glyphicon glyphicon-th-list"></i> 产品维护</a></li>
							</ul></li>
						<li class="list-group-item tree-closed"><span><i
								class="glyphicon glyphicon-ok"></i> 业务审核 <span class="badge"
								style="float: right">3</span></span>
							<ul style="margin-top: 10px; display: none;">
								<li style="height: 30px;"><a href="auth_cert.html"><i
										class="glyphicon glyphicon-check"></i> 实名认证审核</a></li>
								<li style="height: 30px;"><a href="auth_adv.html"><i
										class="glyphicon glyphicon-check"></i> 广告审核</a></li>
								<li style="height: 30px;"><a href="auth_project.html"><i
										class="glyphicon glyphicon-check"></i> 项目审核</a></li>
							</ul></li>
						<li class="list-group-item tree-closed"><span><i
								class="glyphicon glyphicon-th-large"></i> 业务管理 <span
								class="badge" style="float: right">7</span></span>
							<ul style="margin-top: 10px; display: none;">
								<li style="height: 30px;"><a href="cert.html"><i
										class="glyphicon glyphicon-picture"></i> 资质维护</a></li>
								<li style="height: 30px;"><a href="type.html"><i
										class="glyphicon glyphicon-equalizer"></i> 分类管理</a></li>
								<li style="height: 30px;"><a href="process.html"><i
										class="glyphicon glyphicon-random"></i> 流程管理</a></li>
								<li style="height: 30px;"><a href="advertisement.html"><i
										class="glyphicon glyphicon-hdd"></i> 广告管理</a></li>
								<li style="height: 30px;"><a href="message.html"><i
										class="glyphicon glyphicon-comment"></i> 消息模板</a></li>
								<li style="height: 30px;"><a href="project_type.html"><i
										class="glyphicon glyphicon-list"></i> 项目分类</a></li>
								<li style="height: 30px;"><a href="tag.html"><i
										class="glyphicon glyphicon-tags"></i> 项目标签</a></li>
							</ul></li>
						<li class="list-group-item tree-closed"><a href="param.html"><i
								class="glyphicon glyphicon-list-alt"></i> 参数管理</a></li>
					</ul>
				</div>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							<i class="glyphicon glyphicon-th"></i>数据列表
						</h3>
					</div>
					<div class="panel-body">
						<form class="form-inline" role="form" style="float: left;">
							<div class="form-group has-feedback">
								<div class="input-group">
									<div class="input-group-addon">查询条件</div>
									<input id="queryText" class="form-control has-success"
										type="text" placeholder="请输入查询条件">
								</div>
							</div>
							<button id="queryBtn" type="button" class="btn btn-warning">
								<i class="glyphicon glyphicon-search"></i> 查询
							</button>
						</form>

						<button id="ExportToExcel" class="btn btn-success"
							data-toggle="tooltip" data-placement="right" title="导出Excel"
							onclick="ExportExcel()" style="float: right; margin-left: 10px;">
							<i class=" glyphicon glyphicon-download-alt"></i>Excel
						</button>
						<button type="button" class="btn btn-danger" data-toggle="tooltip"
							data-placement="right" title="批量删除" onclick="deleteUsers()"
							style="float: right; margin-left: 10px;">
							<i class=" glyphicon glyphicon-remove"></i> 删除
						</button>
						<button class="btn btn-primary" style="float: right;"
							id="emp_add_modal_btn" data-toggle="modal"
							data-target="#UserAddModal">
							<i class="glyphicon glyphicon-plus"></i>新增
						</button>
						<%-- <button type="button" class="btn btn-primary"
							style="float: right;"
							onclick="window.location.href='${APP_PATH}/user/add'">
							<i class="glyphicon glyphicon-plus"></i> 新增
						</button> --%>
						<br>
						<hr style="clear: both;">
						<div class="table-responsive">
							<form id="userForm">
								<table class="table  table-bordered">
									<thead>
										<tr>
											<th width="30">#</th>
											<th width="30"><input type="checkbox" id="allSelBox"></th>
											<th><div class="row">
													<div class="col-md-9 col-md-push-3">账号</div>
												</div>												 
													<input type="text" id="useridfilter" onchange="useridfilterchange" placeholder="账号">												 
												</th>
											<th><div class="row">
													<div class="col-md-9 col-md-push-3">名称</div>
												</div>
												<input type="text" id="usernamefilter">
												</th>
											<th><div class="row">
													<div class="col-md-9 col-md-push-3">邮箱</div>
												</div>
												<input type="text" id="useremailfilter">
												</th>
											<th width="100"><div class="row">
													<div class="col-md-9 col-md-push-3">操作</div>
												</div></th>
										</tr>										 
									</thead>
									<tbody id="userData">
									</tbody>
									<tfoot>
										<tr>
											<td colspan="6" align="center">
												<ul class="pagination">
												</ul>
											</td>
										</tr>
									</tfoot>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 帮助文档模态框 -->
	<div class="modal fade" id="helpInfoModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalScrollableTitle">NOWProject
						简介</h5>
				</div>
				<div class="modal-body">请问有什么能帮到你的地方？</div>
				<div class="modal-footer">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>关闭
					</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 员工添加的模态框 -->
	<div class="modal fade" id="UserAddModal" tabindex="-1" role="dialog"
		aria-labelledby="UserAddModalLongTitle" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="UserAddModalLongTitle">用户添加菜单</h5>
				</div>
				<div class="modal-body">
					<form id="userAddForm" role="form">
						<div class="form-group">
							<label for="exampleInputPassword1">登陆账号</label> <input
								type="text" class="form-control" id="loginacct"
								placeholder="请输入登陆账号">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">用户名称</label> <input
								type="text" class="form-control" id="username"
								placeholder="请输入用户名称">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">邮箱地址</label> <input type="email"
								class="form-control" id="email" placeholder="请输入邮箱地址">
							<p class="help-block label label-warning">请输入合法的邮箱地址, 格式为：
								xxxx@xxxx.com</p>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button id="insertBtn" type="button" class="btn btn-success">
						<i class="glyphicon glyphicon-plus"></i> 保存
					</button>
					<button id="resetBtn" type="button" class="btn btn-danger">
						<i class="glyphicon glyphicon-refresh"></i> 重置
					</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal" id="addClosedBtn">
						<span aria-hidden="true">&times;</span>关闭
					</button>
				</div>
			</div>
		</div>
	</div>
	<!--编辑模态框  -->
	<div class="modal fade" id="UserEditModal" tabindex="-1" role="dialog"
		aria-labelledby="UserEditModalLongTitle" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="UserEditModalLongTitle">用户编辑菜单</h5>
				</div>
				<div class="modal-body">
					<form id="userEditForm" role="form">
						<div class="form-group">
							<label for="exampleInputPassword1">登陆账号</label> <input
								type="text" class="form-control" id="editloginacct"
								placeholder="请输入登陆账号">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">用户名称</label> <input
								type="text" class="form-control" id="editusername"
								placeholder="请输入用户名称">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">邮箱地址</label> <input type="email"
								class="form-control" id="editemail" placeholder="请输入邮箱地址">
							<p class="help-block label label-warning">请输入合法的邮箱地址, 格式为：
								xxxx@xxxx.com</p>
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1"></label> <input type="hidden"
								class="form-control" id="edituserid1" placeholder="请输入id1">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button id="updateBtn" type="button" class="btn btn-success">
						<i class="glyphicon glyphicon-pencil"></i> 修改
					</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">
						<span aria-hidden="true">&times;</span>关闭
					</button>

					<!-- <button id="resetEditBtn" type="button" class="btn btn-danger">
						<i class="glyphicon glyphicon-refresh"></i> 重置
					</button> -->
				</div>
			</div>
		</div>
	</div>

	<script src="${APP_PATH}/jquery/jquery-2.1.1.min.js"></script>
	<script src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
	<script src="${APP_PATH}/script/docs.min.js"></script>
	<script src="${APP_PATH}/layer/layer.js"></script>
	<script type="text/javascript">
		var likeflg = false;
		$(function() {
			$(".list-group-item").click(function() {
				if ($(this).find("ul")) {
					$(this).toggleClass("tree-closed");
					if ($(this).hasClass("tree-closed")) {
						$("ul", this).hide("fast");
					} else {
						$("ul", this).show("fast");
					}
				}
			});
			 document.οnkeydοwn=function(event){
				 var e = event || window.event || arguments.callee.caller.arguments[0];
				 if(e && e.keyCode==13){ 
					 $("#useridfilter").onchange();
					 $("#usernamefilter").onchange();
					 $("#useremailfilter").onchange();
				 }
				 };
		 
		     document.querySelector("#useridfilter").onchange = function(){	         	 					 	
					pageQuery(1);	
		     };
		     document.querySelector("#usernamefilter").onchange = function(){	         	 					 	
					pageQuery(1);	
		     };
		     document.querySelector("#useremailfilter").onchange = function(){	         	 					 	
					pageQuery(1);	
		     };
			/*编辑模态框获取数据  */
			$('#UserEditModal').on('show.bs.modal', function(event) {
				var button = $(event.relatedTarget);
				var userid = button.data('userid');
				var username = button.data('username');
				var useremail = button.data('useremail');
				var userid1 = button.data('userid1');
				var modal = $(this);
				modal.find('.modal-body #editloginacct').val(userid);
				modal.find('.modal-body #editusername').val(username);
				modal.find('.modal-body #editemail').val(useremail);
				modal.find('.modal-body #edituserid1').val(userid1);
			});
			pageQuery(1);
			//模糊查询功能
			$("#queryBtn").click(function() {
				var queryText = $("#queryText").val();
				if (queryText == "") {
					likeflg = false;
				} else {
					likeflg = true;
				}

				pageQuery(1);
			});

			$("#allSelBox").click(function() {
				var flg = this.checked;
				$("#userData :checkbox").each(function() {
					this.checked = flg;
				});
			});
		});
		$("tbody .btn-success").click(function() {
			window.location.href = "assignRole.html";
		});
		$("tbody .btn-primary").click(function() {
			window.location.href = "edit.html";
		});

		// 分页查询
		function pageQuery(pageno) {
			var loadingIndex = null;
			var jsonData = {
				"pageno" : pageno,
				"pagesize" : 10
			};
			if (likeflg == true) {
				jsonData.queryText = $("#queryText").val();				
			}	
			jsonData.useridfilter = $("#useridfilter").val();
			jsonData.usernamefilter = $("#usernamefilter").val();
			jsonData.useremailfilter = $("#useremailfilter").val();
			$
					.ajax({
						type : "POST",
						url : "${APP_PATH}/user/pageQuery",
						data : jsonData,
						beforeSend : function() {
							loadingIndex = layer.msg('处理中', {
								icon : 16
							});
						},
						success : function(result) {
							layer.close(loadingIndex);
							if (result.success) {
								// 局部刷新页面数据
								var tableContent = "";
								var pageContent = "";

								var userPage = result.data;
								var users = userPage.datas;

								$
										.each(
												users,
												function(i, user) {
													tableContent += '<tr>';
													tableContent += '  <td>'
															+ (i + 1) + '</td>';
													tableContent += '  <td><input type="checkbox" name="userid" value="'+user.id1+'"></td>';
													tableContent += '  <td>'
															+ user.id + '</td>';
													tableContent += '  <td>'
															+ user.name
															+ '</td>';
													tableContent += '  <td>'
															+ user.email
															+ '</td>';
													tableContent += '  <td>';
													//权限分配
													tableContent += '      <button type="button" onclick="goAssignPage('
															+ user.id1
															+ ')" class="btn btn-success btn-xs"><i class=" glyphicon glyphicon-check"></i></button>';
													//编辑操作													
													/* 	tableContent += '      <button type="button" onclick="goUpdatePage('
																+ user.id1
																+ ')" class="btn btn-primary btn-xs"><i class=" glyphicon glyphicon-pencil"></i></button>'; */
													tableContent += '      <button type="button"  class="btn btn-primary btn-xs"  data-toggle="modal" data-target="#UserEditModal" data-userid="'
													+ user.id +   
													'" data-username="'
													+ user.name +
													'" data-useremail="'
													+ user.email +
													'" data-userid1="'
													+ user.id1 +
													'"><i class=" glyphicon glyphicon-pencil"></i></button>';
													//删除操作
													tableContent += '	  <button type="button" onclick="deleteUser('
															+ user.id1
															+ ', \''
															+ user.name
															+ '\')" class="btn btn-danger btn-xs"><i class=" glyphicon glyphicon-remove" data-toggle="tooltip" data-placement="right" title="单个删除"></i></button>';
													tableContent += '  </td>';
													tableContent += '</tr>';
												});
								pageContent += '<li><a href="#" onclick="pageQuery('
										+ 1 + ')">首页</a></li>';
								if (pageno > 1) {
									pageContent += '<li><a href="#" onclick="pageQuery('
											+ (pageno - 1)
											+ ')" aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a></li>';
								}

								for (var i = 1; i <= userPage.totalno; i++) {
									if (i == pageno) {
										pageContent += '<li class="active"><a  href="#">'
												+ i + '</a></li>';
									} else {
										pageContent += '<li ><a href="#" onclick="pageQuery('
												+ i + ')">' + i + '</a></li>';
									}
								}

								if (pageno < userPage.totalno) {
									pageContent += '<li><a href="#" onclick="pageQuery('
											+ (pageno + 1)
											+ ')" aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>';
								}
								pageContent += '<li><a href="#" onclick="pageQuery('
										+ userPage.totalno + ')">末页</a></li>';

								$("#userData").html(tableContent);
								$(".pagination").html(pageContent);
							} else {
								layer.msg("用户信息分页查询失败", {
									time : 2000,
									icon : 5,
									shift : 6
								}, function() {

								});
							}
						}
					});
			//清掉全选框
			var allSelBoxFalg = document.getElementById('allSelBox').checked;
			if (allSelBoxFalg == true) {
				document.getElementById('allSelBox').checked = false;
			}
		}
		//export to Excel Format
		function ExportExcel() {
			var titleName = "UserDetailsReport";
			 
			window.location.href = "${APP_PATH}/exportExcelUser?titleName=" + titleName ;
		}
		function goUpdatePage(id) {
			window.location.href = "${APP_PATH}/user/edit?id=" + id;
		}

		function goAssignPage(id) {
			window.location.href = "${APP_PATH}/user/assign?id=" + id;
		}

		function deleteUsers() {
			var boxes = $("#userData :checkbox:checked");
			if (boxes.length == 0) {
				layer.msg("请选择 用户信息", {
					time : 2000,
					icon : 5,
					shift : 6
				}, function() {

				});
			} else {
				layer.confirm("删除选择的用户信息, 是否继续", {
					icon : 3,
					title : '提示'
				}, function(cindex) {
					// 删除选择的用户信息
					$.ajax({
						type : "POST",
						url : "${APP_PATH}/user/deletes",
						data : $("#userForm").serialize(),
						success : function(result) {
							if (result.success) {
								pageQuery(1);
							} else {
								layer.msg("用户信息删除失败", {
									time : 2000,
									icon : 5,
									shift : 6
								}, function() {

								});
							}
						}
					});

					layer.close(cindex);
				}, function(cindex) {
					layer.close(cindex);
				});
			}
		}

		function deleteUser(id1, name) {
			layer.confirm("删除用户信息【" + name + "】, 是否继续", {
				icon : 3,
				title : '提示'
			}, function(cindex) {

				// 删除用户信息
				// alert (id1);
				$.ajax({
					type : "POST",
					url : "${APP_PATH}/user/delete",
					data : {
						id : id1
					},
					success : function(result) {
						if (result.success) {
							pageQuery(1);
						} else {
							layer.msg("用户信息删除失败", {
								time : 2000,
								icon : 5,
								shift : 6
							}, function() {

							});
						}
					}
				});

				layer.close(cindex);
			}, function(cindex) {
				layer.close(cindex);
			});
		}

		//点击新增按钮弹出模态框。
		$("#emp_add_modal_btn").click(function() {
			//alert("start adding")
			//清除表单数据（表单完整重置（表单的数据，表单的样式））
			reset_form("#UserAddModal form");
			//弹出模态框
			$("#UserAddModal").modal({
				backdrop : "static"
			});
		});
		$("#insertBtn").click(function() {
			var loginacct = $("#loginacct").val();
			if (loginacct == "") {
				layer.msg("登录账号不能为空，请输入", {
					time : 2000,
					icon : 5,
					shift : 6
				}, function() {

				});
				return;
			}

			var loadingIndex = null;
			$.ajax({
				type : "POST",
				url : "${APP_PATH}/user/insert",
				data : {
					"id" : loginacct,
					"name" : $("#username").val(),
					"email" : $("#email").val()
				},
				beforeSend : function() {
					loadingIndex = layer.msg('处理中', {
						icon : 16
					});
				},
				success : function(result) {
					layer.close(loadingIndex);
					if (result.success) {
						layer.msg("用户信息保存成功", {
							time : 1000,
							icon : 6
						}, function() {
							window.location.href = "${APP_PATH}/user/index";
						});
					} else {
						layer.msg("用户信息保存失败，请重新操作", {
							time : 2000,
							icon : 5,
							shift : 6
						}, function() {

						});
					}
				}
			});
		});
		/* 重置表单 */
		$("#resetBtn").click(function() {
			// Jquery[0] ==> DOM
			// $(DOM) ==> Jquery
			$("#userAddForm")[0].reset();
		});
		$("#resetEditBtn").click(function() {
			//alert("编辑框重置");
			$("#userEditForm")[0].reset();
		});
		//点击关闭按钮之后清空表单
		$("#addClosedBtn").click(function() {
			$("#userAddForm")[0].reset();
		});
		/* 编辑操作 */
		$("#updateBtn").click(function() {
			var loginacct = $("#editloginacct").val();
			//alert(loginacct);
			if (loginacct == "") {
				layer.msg("登录账号不能为空，请输入", {
					time : 2000,
					icon : 5,
					shift : 6
				}, function() {

				});
				return;
			}
			var loadingIndex = null;
			$.ajax({
				type : "POST",
				url : "${APP_PATH}/user/update",
				data : {
					"id" : loginacct,
					"name" : $("#editusername").val(),
					"email" : $("#editemail").val(),
					"id1" : $("#edituserid1").val()
				},
				beforeSend : function() {
					loadingIndex = layer.msg('处理中', {
						icon : 16
					});
				},
				success : function(result) {
					layer.close(loadingIndex);
					if (result.success) {
						layer.msg("用户信息修改成功", {
							time : 1000,
							icon : 6
						}, function() {
							window.location.href = "${APP_PATH}/user/index";
						});
					} else {
						layer.msg("用户信息修改失败，请重新操作", {
							time : 2000,
							icon : 5,
							shift : 6
						}, function() {

						});
					}
				}
			});
		});
		
	     
	</script>
</body>
</html>
