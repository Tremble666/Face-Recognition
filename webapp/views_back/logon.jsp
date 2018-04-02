<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<meta name="description" content="">
<meta name="author" content="">
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet"
	href="/Bootstrap/cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap.min.css">

<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet"
	href="/Bootstrap/cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="/Bootstrap/cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script
	src="/Bootstrap/cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<meta charset="utf-8"> 
	<title>欢迎来到人脸识别器登录页面</title>
	
</head>
<body>
	<jsp:include page="navigation.jsp"/>

<div align="center">
<form class="form-horizontal" role="form"  action="/facerecognition/logon?cmd=finalLogon" method="post">
	<div class="form-group" align="center">
		<label for="firstname" class="col-sm-2 control-label" align="center">email</label>
		<div class="col-sm-10" align="center" style="width:800px;">
		<input   type="text" class="form-control" id="name"  placeholder="请输入邮箱地址" required="required" >
		</div>
	</div>
	<div class="form-group" align="center">
		<label for="firstname" class="col-sm-2 control-label">密码</label>
		<div class="col-sm-10" align="center" style="width:800px;">
		<input type="text" class="form-control" id="name"  placeholder="请输入密码" required="required" >
		</div>
	</div>
	<div class="form-group" align="center">
		<div class="col-sm-offset-2 col-sm-10" align="center">
				
				<input type="submit" class="btn btn-success"value="提交" />
		</div>
	</div>
	<div class="form-group">
		<a href="#" class="col-sm-2 control-label">忘记密码？</a>	
	</div>
</form>
</div>