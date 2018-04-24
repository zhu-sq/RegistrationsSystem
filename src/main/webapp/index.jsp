<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="title" content="ScoopThemes">
	<meta name="ROBOTS" content="">
	<meta name="description" content="">
	<meta name="abstract" content="">

	<title>Home</title>

	<!-- Bootstrap -->
	<link href="resources/lib/bootstrap/bootstrap.css" rel="stylesheet">
	<link href="resources/index/css/font-awesome.css" rel="stylesheet">
	<link href="resources/lib/bootstrap/bootstrap-theme.css" rel="stylesheet">
	<link href="resources/lib/bootstrap/bootstrap-social.css" rel="stylesheet">
	<link href="resources/lib/bootstrap/font-awesome.min.css" rel="stylesheet">

	<link rel="stylesheet" href="resources/index/css/animations.css">
	<link rel="stylesheet" href="resources/index/css/templatemo_style.css">

	<!-- siimple style -->
	<link href="resources/index/css/style.css" rel="stylesheet">

	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
	<![endif]-->
</head>

<body>

<div class="cloud floating">
	<img src="resources/index/img/cloud.png" alt="Scoop Themes">
</div>

<div class="cloud pos1 fliped floating">
	<img src="resources/index/img/cloud.png" alt="Scoop Themes">
</div>

<div class="cloud pos2 floating">
	<img src="resources/index/img/cloud.png" alt="Scoop Themes">
</div>

<div class="cloud pos3 fliped floating">
	<img src="resources/index/img/cloud.png" alt="Scoop Themes">
</div>


<div id="wrapper">
	<div class="container">
		<div class="row">
			<div class="col-sm-12 col-md-12 col-lg-12">
				<img src="resources/index/img/logo.png" alt="Scoop Themes Logo">
				<br/>
				<br/>
				<h2 class="subtitle">We're working hard to launch our website and we'll be ready very soon</h2>
				<br/>

				<form class="form-inline validate signup" action="" method="get" role="form">
					<%--<div class="form-group">--%>
					<%--<input type="email" class="form-control" name="EMAIL" id="exampleInputEmail1" placeholder="Enter your email address">--%>
					<%--</div>--%>
					<input type="button" name="login" value="登录" class="btn btn-theme">
				</form>
				<br/>
			</div>
			<div class="col-sm-12 align-center">
				<ul class="social-network social-circle">
					<li><a href="#" class="icoFacebook" title="Facebook"><i class="fa fa-facebook"></i></a>
					</li>
					<li><a href="#" class="icoTwitter" title="Twitter"><i class="fa fa-twitter"></i></a>
					</li>
					<li><a href="#" class="icoGit" title="Github"><i class="fa fa-github"></i></a>
					</li>
					<li><a href="#" class="icoLinkedin" title="Linkedin"><i class="fa fa-linkedin"></i></a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>

<script src="resources/lib/jquery-2.1.4.min.js"></script>
<script src="resources/lib/jquery.form-n-validate.js"></script>
<script src="resources/lib/layer/layer.js"></script>
<script>
    $(document).ready(function(){
        $("[name=login]").click(function(){
            console.log("jsldjfsfj");
            //window.location.replace(window.location.host+"/login"+"");
            //window.location.href = window.location.host+"/login";
            window.location.href = "/login?backurl=" + window.location.href;
        });
    });
</script>

</body>
</html>