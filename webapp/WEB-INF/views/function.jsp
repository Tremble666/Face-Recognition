<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/demo.css">
<head>
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
<script>
	function img() {
		var url = document.getElementById("img").value;
		return url;
	}
	function showpic() {
		document.getElementById("image1").src = document
				.getElementById("chooseimg").value
		alert(document.getElementById("image1").src);
	}
</script>
<!--模板样式-->
<style type="text/css">
.form-horizontal {
	background: #fff;
	border-radius: 15px;
	text-align: center;
	background-color: #f0f0f0;
}

.form-horizontal .heading {
	display: block;
	font-size: 35px;
	font-weight: 700;
	padding: 35px 0;
	border-bottom: 1px solid #f0f0f0;
	margin-bottom: 30px;
}

.form-horizontal .form-group {
	padding: 0 40px;
	margin: 0 0 25px 0;
	position: relative;
}

.form-horizontal .form-control {
	background: #f0f0f0;
	border: none;
	border-radius: 20px;
	box-shadow: none;
	padding: 0 20px 0 45px;
	height: 40px;
	transition: all 0.3s ease 0s;
}

.form-horizontal .form-control:focus {
	background: #e0e0e0;
	box-shadow: none;
	outline: 0 none;
}

.form-horizontal .form-group i {
	position: absolute;
	top: 12px;
	left: 60px;
	font-size: 17px;
	color: #c8c8c8;
	transition: all 0.5s ease 0s;
}

.form-horizontal .form-control:focus+i {
	color: #00b4ef;
}

.form-horizontal .fa-question-circle {
	display: inline-block;
	position: absolute;
	top: 12px;
	right: 60px;
	font-size: 20px;
	color: #808080;
	transition: all 0.5s ease 0s;
}

.form-horizontal .fa-question-circle:hover {
	color: #000;
}

.form-horizontal .main-checkbox {
	float: left;
	width: 20px;
	height: 20px;
	background: #11a3fc;
	border-radius: 50%;
	position: relative;
	margin: 5px 0 0 5px;
	border: 1px solid #11a3fc;
}

.form-horizontal .main-checkbox label {
	width: 20px;
	height: 20px;
	position: absolute;
	top: 0;
	left: 0;
	cursor: pointer;
}

.form-horizontal .main-checkbox label:after {
	content: "";
	width: 10px;
	height: 5px;
	position: absolute;
	top: 5px;
	left: 4px;
	border: 3px solid #fff;
	border-top: none;
	border-right: none;
	background: transparent;
	opacity: 0;
	-webkit-transform: rotate(-45deg);
	transform: rotate(-45deg);
}

.form-horizontal .main-checkbox input[type=checkbox] {
	visibility: hidden;
}

.form-horizontal .main-checkbox input[type=checkbox]:checked+label:after
	{
	opacity: 1;
}

.form-horizontal .text {
	float: left;
	margin-left: 7px;
	line-height: 20px;
	padding-top: 5px;
	text-transform: capitalize;
}

.form-horizontal .btn {
	float: right;
	font-size: 14px;
	color: #fff;
	background: #00b4ef;
	border-radius: 30px;
	padding: 10px 25px;
	border: none;
	text-transform: capitalize;
	transition: all 0.5s ease 0s;
}

@media only screen and (max-width: 479px) {
	.form-horizontal .form-group {
		padding: 0 25px;
	}
	.form-horizontal .form-group i {
		left: 45px;
	}
	.form-horizontal .btn {
		padding: 10px 20px;
	}
}

.file {
	position: relative;
	display: inline-block;
	background: #D0EEFF;
	border: 1px solid #99D3F5;
	border-radius: 4px;
	padding: 4px 12px;
	overflow: hidden;
	color: #1E88C7;
	text-decoration: none;
	text-indent: 0;
	line-height: 20px;
}

.file input {
	position: absolute;
	font-size: 100px;
	right: 0;
	top: 0;
	opacity: 0;
}

.file:hover {
	background: #AADFFD;
	border-color: #78C3F3;
	color: #004974;
	text-decoration: none;
}

body {
	background: url(/Img/back3.jpg) top center no-repeat;
	background-size: cover;
	overflow-x:hidden;
}
</style>
</head>
<body>
	<!--导航条下面的内容:左右两个框架-->
	<jsp:include page="navigation.jsp" />
	<div style="position: absolute; top: 120px; left: 180px;">
		<div class="demo" style="padding: 20px 0;">
			<div class="container">
				<div class="col-md-offset-3 col-md-6">
					<div
						style="position: absolute; background-color: #f0f0f0; left: -180px; top: 0px; width: 400px; height: 500px; border-radius: 0px;"
						class="jumbotron" align="center">
						<p><big><b>Upload photos</b></b></big></p>
						<br /> 
						
						<c:if test="${imgUrl != null}">
						<img src="${imgUrl}" id="image1"
							style="left: -50px; top: 50px; width: 250px; height: 250px;">
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="position: absolute; top: 120px; left: 680px;">
		<div class="demo" style="padding: 20px 0;">
			<div class="container">

				<div class="col-md-offset-3 col-md-6">
					<div
						style="position: absolute; background-color: #f0f0f0; left: -180px; top: 0px; width: 400px; height: 500px; border-radius: 0px;"
						class="jumbotron" align="center">
						<p><big><b>Output information</b></big></p>
						<br /> 	
						
						<c:if test="${notFound != null}">
							${notFound}
						</c:if>		
						
						<c:if test="${notFace != null}">
							${notFace}
						</c:if>					
						
						<c:if test="${user != null}">
						<img src="${user.filePath}" id="image1"
							style="left: -50px; top: 50px; width: 250px; height: 250px;">
							<div>
							</div><br/>
							RealName:${user.realName}<br/>
							Age:${user.age}<br/>
							Sex:${user.sex}<br/>
							job:${user.job}<br/>
						</c:if>	<br/>
						
						
					</div>
				</div>

			</div>
		</div>
	</div>
	<form action="/facerecognition/about?cmd=handleFunction" method="post"
		enctype="multipart/form-data">
		<!--框架外的使用绝对布局决定位置，被决定的是选择文件按钮和提交按钮-->
		<a href="javascript:;" class="file"
			style="position: absolute; width: 100px; left: 300px; top: 650px;"
			id="chooseimg">选 择 文 件<input type="file" name="filenames"
			required></a>
		
		<nobr>
			<span style="position: absolute; top: 700px; left: 300px; color: red"
				id="usernamecheck">${imgError}</span>
		</nobr>


		<!-- <input type="text" class="form-control" id="name"
		placeholder=" please input img's url "
		style="position: absolute; left: 300px; top: 650px; width: 310px; height: 30px" /> -->
		<img src="/Img/4.png"
			style="position: absolute; left: 700px; width: 100px; height: 500px; top: 140px"></img>
		<input id="img" type="submit" class="file"
			style="position: absolute; width: 100px; height: 30px; left: 430px; top: 650px;"
			value="提   交" />
	</form>
</body>
</html>