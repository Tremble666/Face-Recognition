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
<title>欢迎来到人脸识别器个人信息完善页面</title>
<style type="text/css">
	#div1{
	color: white;
	position:fixed; *position:absolute;  top:50%; left:50%; margin:-130px 0 0 -450px;
	}
</style>
</head>
<body style="background-image: url('/Img/back2.jpg');">
	<jsp:include page="navigation.jsp" />
		<div id="div1">
		<form class="form-horizontal" role="form"
			action="/facerecognition/regist?cmd=finalRegist" method="post">
			<input type="hidden" name="name" value="${user.name}" /> <input
				type="hidden" name="email" value="${user.email}" /> <input
				type="hidden" name="password" value="${user.password}" />
			<div class="form-group">
				<label for="firstname" class="col-sm-2 control-label">真实姓名</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="name"
						placeholder="请输入您的真实姓名" required="required" name="realName"
						style="width: 800px">
				</div>
			</div>
			<div class="form-group">
				<label for="firstname" class="col-sm-2 control-label">年龄</label>
				<div class="col-sm-10">
					<input type="number" class="form-control" id="name"
						placeholder="请您的年龄" required="required" name="age"
						style="width: 800px">
				</div>
			</div>
			<div class="form-group">
				<label for="firstname" class="col-sm-2 control-label">性别</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="name"
						placeholder="请您的性别" required="required" name="sex"
						style="width: 800px">
				</div>
			</div>
			<div class="form-group">
				<label for="firstname" class="col-sm-2 control-label">职业</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="name"
						placeholder="请输入您的职业" required="required" name="job"
						style="width: 800px">
				</div>
			</div>
			<div class="form-group">
				<label for="firstname" class="col-sm-2 control-label"></label> <input
					type="file" id="input" name="filePath" multiple="multiple" />
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-success" value="提交" />
				</div>
			</div>

		</form>
	</div>
</body>
</html>