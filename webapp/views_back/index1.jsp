<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
</head>
<script>
	$(function() {
		$("[data-toggle='popover']").popover();
	});
</script>
<body>
	<jsp:include page="navigation.jsp"/>

	<!-- 轮滚效果 -->
	<div style="height: 600px; margin-top: -20px;" id="myCarousel"
		class="carousel slide">
		<!-- 轮播（Carousel）指标 -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>
		<!-- 轮播（Carousel）项目 -->
		<div class="carousel-inner">
			<div class="item active">
				<img style="height: 650px; width: 1700px;" src="/Img/p3.png"
					alt="First slide">
			</div>
			<div class="item">
				<img style="height: 650px; width: 1700px;" src="/Img/p12.jpg"
					alt="Second slide">
			</div>
			<div class="item">
				<img style="height: 650px; width: 1700px;" src="/Img/p10.jpg"
					alt="Third slide">
			</div>
		</div>
		<!-- 轮播（Carousel）导航 -->
		<a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
		<a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
	</div>







	<!-- 巨幕welcome -->
	<div style="background-color: white; margin-top: -10px;"
		class="jumbotron" align="center">
		<h2 style="font-size: 40px;">
			<img style="margin-top: -10px" width="30px" height="30px"
				src="/Img/欢迎.png">&nbsp;&nbsp; <b>Welcome to Face
				Recognition!</b>
		</h2>
		<p>This is a simple hero unit, a simple jumbotron-style component
			for calling extra attention to featured content or information.</p>
		<p>
			<a class="btn btn-primary btn-lg" href="#" role="button">Learn
				more</a>
		</p>
	</div>


	<!-- 巨幕use -->
	<div style="background-color: white; margin-top: -50px;"
		class="jumbotron" align="center">
		<h2 style="font-size: 40px;">
			<img style="margin-top: -10px" width="30px" height="30px"
				src="/Img/帮助.png">&nbsp;&nbsp; <b>How to Use?</b>
		</h2>
		<p>This is a simple hero unit, a simple jumbotron-style component
			for calling extra attention to featured content or information.</p>
		<p>
			<a class="btn btn-primary btn-lg" href="#" role="button">H e l p</a>
		</p>
	</div>


	<!-- 巨幕Introduction-->
	<div style="background-color: white; margin-top: -50px;"
		class="jumbotron" align="center">
		<h2 style="font-size: 40px;">
			<img style="margin-top: -10px" width="30px" height="30px"
				src="/Img/开发者列表.png">&nbsp;&nbsp; <b>Devoloper
				Introduction</b>
		</h2>
		<div class="container" style="padding: 20px 50px 100px;">
			<button type="button" class="btn btn-primary" title="陈 晋"
				data-container="body" data-toggle="popover" data-placement="left"
				data-content="左侧的 Popover 中的一些内容">陈 晋</button>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" class="btn btn-primary" title="午康俊"
				data-container="body" data-toggle="popover" data-placement="right"
				data-content="顶部的 Popover 中的一些内容">午康俊</button>
			<br /> <br /> <br /> <br />
			<button type="button" class="btn btn-success" title="张 豪"
				data-container="body" data-toggle="popover" data-placement="left"
				data-content="底部的 Popover 中的一些内容">张 豪</button>
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
				data-content="右侧的 Popover 中的一些内容">黄 佳</button>
			<br /> <br /> <br /> <br />
			<button type="button" class="btn btn-warning" title="熊 镐"
				data-container="body" data-toggle="popover" data-placement="left"
				data-content="右侧的 Popover 中的一些内容">熊 镐</button>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" class="btn btn-warning" title="邓 超"
				data-container="body" data-toggle="popover" data-placement="right"
				data-content="右侧的 Popover 中的一些内容">邓 超</button>
		</div>
	</div>
</body>
</html>
