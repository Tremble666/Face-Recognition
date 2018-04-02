<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
/* Custom Styles */
    ul.nav-tabs{
        width: 140px;
        margin-top: 20px;
        border-radius: 4px;
        border: 1px solid #ddd;
        box-shadow: 0 1px 4px rgba(0, 0, 0, 0.067);
    }
    ul.nav-tabs li{
        margin: 0;
        border-top: 1px solid #ddd;
    }
    ul.nav-tabs li:first-child{
        border-top: none;
    }
    ul.nav-tabs li a{
        margin: 0;
        padding: 8px 16px;
        border-radius: 0;
    }
    ul.nav-tabs li.active a, ul.nav-tabs li.active a:hover{
        color: #fff;
        background: #0088cc;
        border: 1px solid #0088cc;
    }
    ul.nav-tabs li:first-child a{
        border-radius: 4px 4px 0 0;
    }
    ul.nav-tabs li:last-child a{
        border-radius: 0 0 4px 4px;
    }
    ul.nav-tabs.affix{
        top: 30px; /* Set the top position of pinned element */
    }
</style>
</head>
<body data-spy="scroll" data-target="#myScrollspy">
<jsp:include page="navigation.jsp"/>
<div class="container">
   <div class="jumbotron">
        <h2>learn more about Face Recognition</h2>
    </div>
    <div class="row">
        <div class="col-xs-3" id="myScrollspy">
            <ul class="nav nav-tabs nav-stacked" data-spy="affix" data-offset-top="125">
                <li class="active"><a href="#section-1">first part</a></li>
                <li><a href="#section-2">second part</a></li>
                <li><a href="#section-3">third part</a></li>
				<li><a href="#section-4">fourth part</a></li>
				<li><a href="#section-5">fifth part</a></li>
            </ul>
        </div>
        <div class="col-xs-9">
            <h2 id="section-1">history</h2>
        
			<p>人脸识别系统的研究始于20世纪60年代，80年代后随着计算机技术和光学成像技术的发展得到提高，而真正进入初级的应用阶段则在90年后期，并且以美国、德国和日本的技术实现为主；人脸识别系统成功的关键在于是否拥有尖端的核心算法，并使识别结果具有实用化的识别率和识别速度；“人脸识别系统”集成了人工智能、机器识别、机器学习、模型理论、专家系统、视频图像处理等多种专业技术，同时需结合中间值处理的理论与实现，是生物特征识别的最新应用，其核心技术的实现，展现了弱人工智能向强人工智能的转化</p>
            <hr>
			<h2 id="section-2">use</h2>
          
			<p>生物识别技术已广泛用于政府、军队、银行、社会福利保障、电子商务、安全防务等领域。例如，一位储户走进了银行，他既没带银行卡，也没有回忆密码就径直提款，当他在提款机上提款时，一台摄像机对该用户的眼睛扫描，然后迅速而准确地完成了用户身份鉴定，办理完业务。这是美国德克萨斯州联合银行的一个营业部中发生的一个真实的镜头。而该营业部所使用的正是现代生物识别技术中的“虹膜识别系统”。此外，美国“9.11”事件后，反恐怖活动已成为各国政府的共识，加强机场的安全防务十分重要。美国维萨格公司的脸像识别技术在美国的两家机场大显神通，它能在拥挤的人群中挑出某一张面孔，判断他是不是通缉犯。</p>
            <hr>
            <h2 id="section-3">technology</h2>
          
		   	<p>人脸识别算法分类
				基于人脸特征点的识别算法（Feature-based recognition algorithms）。</br>
				基于整幅人脸图像的识别算法（Appearance-based recognition algorithms）。</br>
				基于模板的识别算法（Template-based recognition algorithms）。</br>
				利用神经网络进行识别的算法（Recognition algorithms using neural network）。</br>
				<hr>
			<h2 id="section-4">algorithm</h2>
				
		   	<p>生物识别技术已广泛用于政府、军队、银行、社会福利保障、电子商务、安全防务等领域。例如，一位储户走进了银行，他既没带银行卡，也没有回忆密码就径直提款，当他在提款机上提款时，一台摄像机对该用户的眼睛扫描，然后迅速而准确地完成了用户身份鉴定，办理完业务。这是美国德克萨斯州联合银行的一个营业部中发生的一个真实的镜头。而该营业部所使用的正是现代生物识别技术中的“虹膜识别系统”。此外，美国“9.11”事件后，反恐怖活动已成为各国政府的共识，加强机场的安全防务十分重要。美国维萨格公司的脸像识别技术在美国的两家机场大显神通，它能在拥挤的人群中挑出某一张面孔，判断他是不是通缉犯。</p>
            <hr>
			 <h2 id="section-5">fiture</h2>
		   	<p>生物识别技术已广泛用于政府、军队、银行、社会福利保障、电子商务、安全防务等领域。例如，一位储户走进了银行，他既没带银行卡，也没有回忆密码就径直提款，当他在提款机上提款时，一台摄像机对该用户的眼睛扫描，然后迅速而准确地完成了用户身份鉴定，办理完业务。这是美国德克萨斯州联合银行的一个营业部中发生的一个真实的镜头。而该营业部所使用的正是现代生物识别技术中的“虹膜识别系统”。此外，美国“9.11”事件后，反恐怖活动已成为各国政府的共识，加强机场的安全防务十分重要。美国维萨格公司的脸像识别技术在美国的两家机场大显神通，它能在拥挤的人群中挑出某一张面孔，判断他是不是通缉犯。</p>
            <hr>
          
        </div>
    </div>
</div>
</body>
</html>