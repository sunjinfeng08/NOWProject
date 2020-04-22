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
<title>产品维护</title>
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
	<!-- 帮助文档模态框 -->
	<div class="modal fade" id="helpInfoModal" tabindex="-1" role="dialog"
		aria-labelledby="ProdctModalScrollableTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="ProdctModalScrollableTitle">NOWProject
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
								id="baseboardid" class="badge" style="float: right">4</span></span>
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
							<i class="glyphicon glyphicon-th"></i>产品列表
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
						<button type="button" class="btn btn-danger"
							onclick="deleteProductbatch()"
					   		data-toggle="tooltip" data-placement="right" title="批量删除"
							style="float: right; margin-left: 10px;">
							<i class=" glyphicon glyphicon-remove"></i> 删除
						</button>
						<button class="btn btn-primary" style="float: right;"
							id="Product_add_modal_btn" data-toggle="modal"
							data-target="#ProductAddModal">
							<i class="glyphicon glyphicon-plus"></i>新增
						</button>

						<br>
						<hr style="clear: both;">
						<div class="table-responsive">
							<form id="ProductForm">
								<table class="table  table-bordered">
									<thead>
										<tr>
											<th width="30">#</th>
											<th width="30"><input type="checkbox" id="allSelBox"></th>
											<th>Company</th>
											<th>ItemType</th>
											<th>Subcode01</th>
											<th>Subcode02</th>
											<th>Subcode03</th>
											<th>Subcode04</th>
											<th>Subcode05</th>
											<th>Subcode06</th>
											<th>LongDesc</th>
											<th>ShortDesc</th>
											<th>SearchDesc</th>
											<th>操 &nbsp&nbsp&nbsp&nbsp作</th>
										</tr>
									</thead>
									<tbody id="productData">
									</tbody>
									<tfoot>
										<tr>
											<td colspan="16" align="center">
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
	<!--编辑模态框  -->
	<div class="modal fade" id="ProductEditModal" tabindex="-1"
		role="dialog" aria-labelledby="ProductEditModalLongTitle"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="ProductEditModalLongTitle">产品编辑菜单</h5>
				</div>
				<div class="modal-body">
					<form id="ProductEditForm" role="form">

						<div class="form-group">
							<label for="ProductEditlabel">产品编码</label> <input type="text"
								class="form-control" id="editproductcode" placeholder=""
								readonly="readonly">
						</div>
						<div class="form-group">
							<label for="ProductEditlabel">详细描述</label> <input type="text"
								class="form-control" id="editproductlongdesc"
								placeholder="please write longdesc here">
						</div>
						<div class="form-group">
							<label for="ProductEditlabel2">短描述</label> <input type="text"
								class="form-control" id="editproductshortdesc"
								placeholder="please write shortdesc here">
						</div>
						<div class="form-group">
							<label for="ProductEditlabel3">搜索描述</label> <input type="text"
								class="form-control" id="editproductsearchedesc"
								placeholder="please write searchdesc here">
						</div>
						<div class="form-group">
							<label for="ProductEditlabel4"></label> <input type="hidden"
								class="form-control" id="editproductid" placeholder="产品id">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button id="updateProdBtn" type="button" class="btn btn-success">
						<i class="glyphicon glyphicon-pencil"></i> 修改
					</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">
						<span aria-hidden="true">&times;</span>关闭
					</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 产品添加的模态框 -->
	<div class="modal fade" id="ProductAddModal" tabindex="-1"
		role="dialog" aria-labelledby="ProductAddModalLongTitle"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="ProductAddModalLongTitle">产品添加菜单</h5>
				</div>
				<div class="modal-body">
					<form id="productAddForm" role="form">
					<div class="form-group">
					   <div class="form-inline row">
							<label for="productlabel01">ItemType</label> <input type="text"
								class="form-control" id="productitemtype" placeholder="类型">														 
						</div>	
						<div class="form-inline row">
							<label for="productlabel01">subcode01</label> <input type="text"
								class="form-control" id="productsubcode01" placeholder="请输入款号">
							<label for="productlabel02">subcode02</label> <input type="text"
								class="form-control" id="productsubcode02" placeholder="subcode02">							 
						</div>
						<div class="form-inline row">							
							<label for="productlabel">subcode03</label> <input type="text"
								class="form-control" id="productsubcode03" placeholder="subcode03">
							<label for="productlabel">subcode04</label> <input type="text"
							class="form-control" id="productsubcode04" placeholder="subcode04">
						</div>
						<div class="form-inline row">						
							<label for="productlabel">subcode05</label> <input type="text"
								class="form-control" id="productsubcode05" placeholder="subcode05">
							<label for="productlabel">subcode06</label> <input type="text"
								class="form-control" id="productsubcode06" placeholder="subcode06">	 
						</div>
						</div>
						<div class="form-group">
						 <em style="color: red;">*</em>					 				
							<label for="productlabel">longdesciption</label> <input
								type="text" class="form-control" id="productlongdesciption"
								placeholder="详细描述必填2">
								 
							</div>
						<div class="form-group">						  
								 <label for="productlabel">shortdescription</label>
							<input type="text" class="form-control"
								id="productshortdescription" placeholder=""> <label
								for="productlabel">searchdescription</label> <input type="text"
								class="form-control" id="productsearchdescription"
								placeholder="">
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
		});
		pageQuery(1);
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

			$
					.ajax({
						type : "post",
						url : "${APP_PATH}/product/pageQuery",
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
								var productPage = result.data;
								var products = productPage.datas;
								$
										.each(
												products,
												function(i, product) {
													tableContent += '<tr>';
													tableContent += '  <td>'
															+ (i + 1) + '</td>';
													tableContent += '  <td><input type="checkbox" name="productid" value="' + product.productid + '"></td>';
													tableContent += '  <td>'
															+ product.companycode
															+ '</td>';
													tableContent += '  <td>'
															+ product.itemtypecode
															+ '</td>';
													tableContent += '  <td>'
															+ product.subcode01
															+ '</td>';
													tableContent += '  <td>'
															+ product.subcode02
															+ '</td>';
													tableContent += '  <td>'
															+ product.subcode03
															+ '</td>';
													tableContent += '  <td>'
															+ product.subcode04
															+ '</td>';
													tableContent += '  <td>'
															+ product.subcode05
															+ '</td>';
													tableContent += '  <td>'
															+ product.subcode06
															+ '</td>';
													tableContent += '  <td>'
															+ product.longdescription
															+ '</td>';
													tableContent += '  <td>'
															+ product.shortdescription
															+ '</td>';
													tableContent += '  <td>'
															+ product.searchdescription
															+ '</td>';
													tableContent += '  <td>';
													//编辑操作
													tableContent += '  <button type="button"  class="btn btn-primary btn-xs" data-toggle="modal" data-target="#ProductEditModal" data-productid="'
													    +  product.productid +	
													    '" data-productlongdescription= "'
														+ product.longdescription +							
														'" data-productshortdesc= "'
														+ product.shortdescription +
														'" data-productsearchdesc= "'
														+ product.searchdescription +
														'" data-productcode="'
														+ product.subcode01 + product.subcode02 + product.subcode03 +product.subcode04+ product.subcode05 + product.subcode06 +
														'"><i class=" glyphicon glyphicon-pencil"></i></button>';
													//删除操作
													tableContent += '	  <button type="button" onclick="deleteProduct('
															+ product.productid
															+ ', \''
															+ product.subcode01
															+ '\')" class="btn btn-danger btn-xs"  data-toggle="tooltip" data-placement="right" title="单个删除"><i class=" glyphicon glyphicon-remove"></i></button>';
													tableContent += ' </td>';

													tableContent += '</tr>';
												});
								pageContent += '<li><a href="#" onclick="pageQuery('
										+ 1 + ')">首页</a></li>';
								if (pageno > 1) {
									pageContent += '<li><a href="#" onclick="pageQuery('
											+ (pageno - 1)
											+ ')" aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a></li>';
								}

								for (var i = 1; i <= productPage.totalno; i++) {
									if (i == pageno) {
										pageContent += '<li class="active"><a  href="#">'
												+ i + '</a></li>';
									} else {
										pageContent += '<li ><a href="#" onclick="pageQuery('
												+ i + ')">' + i + '</a></li>';
									}
								}

								if (pageno < productPage.totalno) {
									pageContent += '<li><a href="#" onclick="pageQuery('
											+ (pageno + 1)
											+ ')" aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>';
								}
								pageContent += '<li><a href="#" onclick="pageQuery('
										+ productPage.totalno
										+ ')">末页</a></li>';

								$("#productData").html(tableContent);
								$(".pagination").html(pageContent);
							} else {
								layer.msg("产品分页查询失败", {
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
		};
		//全选&反选
		$("#allSelBox").click(function() {
			var flg = this.checked;
			$("#productData :checkbox").each(function() {
				this.checked = flg;
			});
		});

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
		/*编辑模态框获取数据  */
		$('#ProductEditModal')
				.on(
						'show.bs.modal',
						function(event) {
							var button = $(event.relatedTarget);
							var productid = button.data('productid');
							var productcode = button.data('productcode');
							var productlongdesc = button
									.data('productlongdescription');
							var productshortdesc = button
									.data('productshortdesc');
							var productsearchedesc = button
									.data('productsearchdesc');
							var modal = $(this);
							modal.find('.modal-body #editproductid').val(
									productid);
							modal.find('.modal-body #editproductcode').val(
									productcode);
							modal.find('.modal-body #editproductlongdesc').val(
									productlongdesc);
							modal.find('.modal-body #editproductshortdesc')
									.val(productshortdesc);
							modal.find('.modal-body #editproductsearchedesc')
									.val(productsearchedesc);
						});
		//update product --> updateProdBtn
		$("#updateProdBtn")
				.click(
						function() {
							var productlongdesc = $("#editproductlongdesc")
									.val();
							//var productid = $("#editproductid").val();			 
							if (productlongdesc == "") {
								layer.msg("长描述不能为空，请输入", {
									time : 2000,
									icon : 5,
									shift : 6
								}, function() {

								});
								return;
							}
							var loadingIndex = null;
							$
									.ajax({
										type : "POST",
										url : "${APP_PATH}/product/update",
										data : {
											"productid" : $("#editproductid")
													.val(),
											"longdescription" : $(
													"#editproductlongdesc")
													.val(),
											"shortdescription" : $(
													"#editproductshortdesc")
													.val(),
											"searchdescription" : $(
													"#editproductsearchedesc")
													.val()
										},
										beforeSend : function() {
											loadingIndex = layer.msg('处理中', {
												icon : 16
											});
										},
										success : function(result) {
											layer.close(loadingIndex);
											if (result.success) {
												layer
														.msg(
																"用户信息修改成功",
																{
																	time : 1000,
																	icon : 6
																},
																function() {
																	window.location.href = "${APP_PATH}/product/product";
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
		//删除产品
		function deleteProduct(id, subcode01) {
			//alert(id);
			layer.confirm("删除产品信息【" + subcode01 + "】, 是否继续", {
				icon : 3,
				title : '提示'
			}, function(cindex) {
				$.ajax({
					type : "POST",
					url : "${APP_PATH}/product/delete",
					data : {
						productid : id
					},
					success : function(result) {
						if (result.success) {
							pageQuery(1);
						} else {
							layer.msg("产品删除失败", {
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
		};
		//批量删除产品
		function deleteProductbatch() {
			var boxes = $("#productData :checkbox:checked");
			if (boxes.length == 0) {
				layer.msg("请选择需要删除的产品", {
					time : 2000,
					icon : 5,
					shift : 6
				}, function() {

				});
			} else {
				layer.confirm("删除选择的产品信息, 是否继续", {
					icon : 3,
					title : '删除提示'
				}, function(cindex) {
					// 删除选择的用户信息
					$.ajax({
						type : "POST",
						url : "${APP_PATH}/product/deletes",
						data : $("#ProductForm").serialize(),
						success : function(result) {
							if (result.success) {
								pageQuery(1);
							} else {
								layer.msg("产品信息删除失败", {
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
		$("#insertBtn").click(function() {
			//alert($("#productlongdesciption").val());
			var productsubcode01 = $("#productsubcode01").val();			 
			if (productsubcode01 == "") {
				layer.msg(" subcode01 或LongDescription不能为空，请输入", {
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
				url : "${APP_PATH}/product/insert",
				data : {
					"companycode" : "001",
					"itemtypecode":$("#productitemtype").val(),
					"subcode01" : productsubcode01,
					"subcode02" : $("#productsubcode02").val(),
					"subcode03" : $("#productsubcode03").val(),
					"subcode04" : $("#productsubcode04").val(),
					"subcode05" : $("#productsubcode05").val(),
					"subcode06" : $("#productsubcode06").val(),
					"longdescription" : $("#productlongdesciption").val(),
					"shortdescription" : $("#productshortdescription").val(),
					"searchdescription" : $("#productsearchdescription").val()
					
				},
				beforeSend : function() {
					loadingIndex = layer.msg('处理中', {
						icon : 16
					});
				},
				success : function(result) {
					layer.close(loadingIndex);
					if (result.success) {
						layer.msg("产品添加成功", {
							time : 1000,
							icon : 6
						}, function() {
							window.location.href = "${APP_PATH}/product/product";
						});
					} else {
						layer.msg("产品添加失败，请重新操作", {
							time : 2000,
							icon : 5,
							shift : 6
						}, function() {

						});
					}
				}
			});
		});
		//点击关闭按钮之后清空表单
		$("#addClosedBtn").click(function(){
			$("#productAddForm")[0].reset();
		});
		$("#resetBtn").click(function() {
			//alert("编辑框重置");
			$("#productAddForm")[0].reset();
		});
		//export to Excel Format
        function ExportExcel(){
        	//window.location.href = "${APP_PATH}/product/exportExcel";
        }
	</script>
</body>
</html>
