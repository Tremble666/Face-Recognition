<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Face Recognition</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/demo.css">
<head>
<script src="~/Scripts/jquery-1.10.2.js"></script>

<script src="~/Content/bootstrap/js/bootstrap.min.js"></script>
<link href="~/Content/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

<script src="~/Content/bootstrapValidator/js/bootstrapValidator.min.js"></script>
<link href="~/Content/bootstrapValidator/css/bootstrapValidator.min.css"
	rel="stylesheet" />
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet"
	href="/Bootstrap/cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/Bootstrap/cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
<script src="/Bootstrap/cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>
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

</head>

<script>
	$(function() {
		$("[data-toggle='popover']").popover();
	});
</script>
<body>
	<jsp:include page="navigation.jsp" />

	<!-- å·¨å¹welcome -->
	<div style="background-color: white; margin-top: -50px;"
		class="jumbotron" align="center">
		<h2 style="font-size: 40px;">
			<img style="margin-top: -10px" width="30px" height="30px"
				src="/Img/欢迎.png">&nbsp;&nbsp; <b>About us</b>
			<p>This project created by six inventor who study in Yunnan
				University software college.</p>
			<p>Our email:1677807734@qq.com</p>
			</br>
		</h2>
		<hr>
	</div>
	</div>

	<!-- å·¨å¹Introduction-->
	<div style="background-color: white; margin-top: -50px;"
		class="jumbotron" align="center">
		<h2 style="font-size: 40px;">
			<img style="margin-top: -10px" width="30px" height="30px"
				src="/Img/开发者列表.png">&nbsp;&nbsp; <b>Devoloper
				Introduction</b>
		</h2>
		</br> </br>
		<div class="container" style="padding: 20px 50px 100px;">
			<button type="button" class="btn btn-primary" title="陈 晋"
				data-container="body" data-toggle="popover" data-placement="left"
				data-content="Building the web backend framework Base on the Tomcat server and the MySQL database">陈 晋</button>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" class="btn btn-primary" title="午康俊"
				data-container="body" data-toggle="popover" data-placement="right"
				data-content="ealization of face recognition Base on Opencv">午康俊</button>
			<br/> <br/> <br/> <br/><br/><br/>
			<button type="button" class="btn btn-success" title="张 豪"
				data-container="body" data-toggle="popover" data-placement="left"
				data-content="Realization of face recognition Base on Opencv">张 豪</button>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" class="btn btn-success" title="黄 佳"
				data-container="body" data-toggle="popover" data-placement="right"
				data-content="Building the web backend framework Base on the Tomcat server and the MySQL database">黄 佳</button>
			<br/> <br/> <br/> <br/><br/><br/>
			<button type="button" class="btn btn-warning" title="熊 镐"
				data-container="body" data-toggle="popover" data-placement="left"
				data-content="Web front frame building by bootstrap">熊 镐</button>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" class="btn btn-warning" title="邓 超"
				data-container="body" data-toggle="popover" data-placement="right"
				data-content="Web front frame building by bootstrap">邓 超</button>
		</div>
	</div>
</body>
</html>
