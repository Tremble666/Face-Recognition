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
<style type="text/css">
.form-horizontal {
	background: #fff;
	padding-bottom: 60px;
	border-radius: 15px;
	text-align: center;
	background-color: #c0c0c0;
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
	background: url('/Img/back3.jpg') top center no-repeat;
	background-size: cover;
}
</style>
</head>
<jsp:include page="navigation.jsp" />
<div style="position: absolute; top: 13%; left: 12%">
	<div class="demo" style="padding: 20px 0;">
		<div class="container">
			<div class="row">
				<div class="col-md-offset-3 col-md-6">

					<form class="form-horizontal"
						action="/facerecognition/regist?cmd=finalRegist" method="post"
						enctype="multipart/form-data">

						<c:if test="${needToPerfect != null}">
							<input type="hidden" name="needToPerfect" value="true" />
						</c:if>
						<input type="hidden" name="name" value="${user.name}" /> <input
							type="hidden" name="email" value="${user.email}" /> <input
							type="hidden" name="password" value="${user.password}" /> <span
							class="heading">Perfect information</span>
						<div class="form-group">
							<input type="text" class="form-control" id="truename"
								placeholder="realname"
								onblur="check_username(this,document.getElementById('usernamecheck'))"
								name="realName" required value=${user.realName}> <i
								class="fa fa-user"></i>
							<nobr>
								<span
									style="position: absolute; top: 40px; left: 50px; color: red"
									id="usernamecheck"></span>
							</nobr>
						</div>
						<div class="form-group"></div>
						</br>

						<div class="form-group">
							<c:if test="${imgError != null}">
								<input type="number" name="age" required class="form-control"
									id="yeah" placeholder="year"
									onkeypress="return event.keyCode>=48&&event.keyCode<=57"
									ng-pattern="/[^a-zA-Z]/" value=${user.age}>
							</c:if>
							<c:if test="${imgError == null}">
								<input type="number" name="age" required class="form-control"
									id="yeah" placeholder="year"
									onkeypress="return event.keyCode>=48&&event.keyCode<=57"
									ng-pattern="/[^a-zA-Z]/">
							</c:if>
							<i class=" fa fa-search"></i>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" id="job"
								placeholder="job" name="job" required value=${user.job}>
							<i class="fa fa-user"></i>
						</div>
						</br>

						<div class="form-group">
							<button type="submit" class="btn btn-default"
								style="position: absolute; top: 18px; left: 395px; width: 150px">submit</button>

						</div>
						<nobr>
							<span
								style="position: absolute; top: 410px; left: 360px; color: red"
								id="passwordcheck"></span>
						</nobr>

						<div style="position: absolute; left: 50px; top: 215px;">
							<c:if test="${imgError != null}">
								<c:if test="${user.sex == 'man'}">
									<label class="radio-inline"> <input type="radio"
										name="sex" id="optionsRadios3" value="man" checked>
										male
									</label>
									<label class="radio-inline"> <input type="radio"
										name="sex" id="optionsRadios4" value="woman">
										female
									</label>
								</c:if>
								<c:if test="${user.sex == 'woman'}">
									<label class="radio-inline"> <input type="radio"
										name="sex" id="optionsRadios3" value="man">
										male
									</label>
									<label class="radio-inline"> <input type="radio"
										name="sex" id="optionsRadios4" value="woman" checked>
										female
									</label>
								</c:if>
							</c:if>
							<c:if test="${imgError == null}">
								<label class="radio-inline"> <input type="radio"
									name="sex" id="optionsRadios3" value="man" checked>
									male
								</label>
								<label class="radio-inline"> <input type="radio"
									name="sex" id="optionsRadios4" value="woman">
									female
								</label>
							</c:if>
						</div>


						<div style="position: absolute; left: 42px; top: 392px;">
							<nobr>
								<label for="inputfile">Please input at least three
									pictures of your head image.</label><br />
								<div style="position: absolute; left: 10px; top: 40px;">
									<a href="javascript:;" class="file"
										style="width: 150px; text-align: center">选择文件<input
										type="file" id="file" multiple="multiple" name="headImg"
										required></a>
								</div>
							</nobr>
							<nobr>
								<span
									style="position: absolute; top: 80px; left: 10px; color: red"
									id="usernamecheck">${imgError}</span>
							</nobr>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	</body>
</html>