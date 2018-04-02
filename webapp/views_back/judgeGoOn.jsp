<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</script>
<style type="text/css">
	#div1{
	color: white;
	position:fixed; *position:absolute;  top:50%; left:50%; margin:-130px 0 0 -450px;
	}
</style>
</head>
<body style="background-image: url('/Img/back2.jpg');">
	<jsp:include page="navigation.jsp" />
	
	<div align="center" id = "div1">
		<form action="/facerecognition/regist?cmd=infoRegist" method="post"
			style="font-size: 40px;">
			<input type="hidden" name="name" value="${user.name}" /> <input
				type="hidden" name="email" value="${user.email}" /> <input
				type="hidden" name="password" value="${user.password}" />
			<h2 style="font-size: 40px;">Do you want to consummate your
				information?</h2>
			<br /> <input type="radio" name="judge" value="yes"
				checked="checked" style="font-size: 20px;" />Yes &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio"
				name="judge" value="no" style="font-size:20px;" />No <br /> <input
				type="submit" value="Submit" style="font-size: 30px;color: black;" />
		</form>
	</div>
</body>
</html>