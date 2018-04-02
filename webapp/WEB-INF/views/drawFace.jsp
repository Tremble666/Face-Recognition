<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<title>Face Recognition</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/sub-style.css">


<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">



<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	function img() {
		var url = document.getElementById("img").value;
		return url;

	}
</script>
<style>
.center {
	height: 320px;
	width: 1340px;
	margin-left: auto;
	margin-right: auto;
}

.float {
	float: left;
}

.input-and-output {
	width: 502px;
	height: 554px;
	background-color: #f0f0f0;
	text-align: center;
	border-radius: 15px;
	margin-left: 120px;
	float: left;
}

.button-position {
	margin-top: 384px;
	margin-left: 250px;
}

.button-submit-position {
	margin-top: -20px;
}

.btn.btn-info {
	height: 32px;
	text-align: center;
}

body {
	background: url(/Img/bg89.jpg) top center no-repeat;
	background-size: cover;
	overflow-x: hidden;
}

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
}
</style>
</head>
<!-- 
<form action="" method="get">
	æå¡å¨çæ¥å£,åbootsrapå¯¼èªæ¡
	<nav class="navbar navbar-inverse"></nav>
</form> -->
<body class="body1">
	<jsp:include page="navigation.jsp" />
	<div align="center">
		<form action="/facerecognition/drawFace?cmd=handleSub" method="post"
			enctype="multipart/form-data">
			<div class="jumbotron input-and-output"
				style="position: absolute; left: 7%; top: 20%;">
				<p>Upload photos</p>
				<hr />
				<br/>
				<br/>
				
				<c:if test="${imgUrl != null}">
					<img src="${imgUrl}" id="image1"
						style=" width: 300px; height: 300px;">
				</c:if>
				<nobr>
					<span
						style="position: absolute; top: 530px; left: 50px; color: red"
						id="usernamecheck">${imgError}</span>
				</nobr>
				<ul class="list-inline" style="position: absolute; top: 110px; left: 50px; color: red">
					<li><a href="javascript:;" class="file button-position">选择文件<input
							type="file" name="filenames" id="file" ></a></li>
					<li><button type="submit"
							class="btn btn-info button-submit-position">submit</button></li>
				</ul>

			</div>
			<div class="jumbotron input-and-output"
				style="position: absolute; left: 47%; top: 20%;">
				<p>Output infomation</p>
				<hr />
				<br/>
				<br/>
				
				<c:if test="${resultUrl != null}">
					<img src="${resultUrl}" id="image1"
						style=" width: 300px; height: 300px;">
						<br/>
						<br/>
						<br/>
				</c:if>
				
				<ul class="list-inline">
				</ul>
			</div>
		</form>
	</div>
</body>
</html>