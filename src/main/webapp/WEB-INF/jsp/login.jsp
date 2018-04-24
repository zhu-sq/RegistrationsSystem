<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<head>
    <title>Login One</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/resources/login/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="/resources/lib/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="/resources/lib/bootstrap/bootstrap-theme.min.css" rel="stylesheet" type="text/css">
    <link href="/resources/login/css/templatemo_style.css" rel="stylesheet" type="text/css">

    <%--<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">--%>
    <%--<link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css">--%>
    <%--<link href="css/templatemo_style.css" rel="stylesheet" type="text/css">--%>

</head>
<body class="templatemo-bg-gray">
<div class="container">
    <div class="col-md-12">
        <h1 class="margin-bottom-15">登 录</h1>
        <form class="form-horizontal templatemo-container templatemo-login-form-1 margin-bottom-30" role="form" action="#" method="post">
            <div class="form-group">
                <div class="col-xs-12">
                    <div class="control-wrapper">
                        <label for="account" class="control-label fa-label"><i class="fa fa-user fa-medium"></i></label>
                        <input type="text" class="form-control" id="account" placeholder="输入账号">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-12">
                    <div class="control-wrapper">
                        <label for="userPwd" class="control-label fa-label"><i class="fa fa-lock fa-medium"></i></label>
                        <input type="password" class="form-control" id="userPwd" placeholder="输入密码">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-12">
                    <div class="checkbox control-wrapper">
                        <label>
                            <input type="checkbox"> 记住登录状态
                        </label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-12">
                    <div class="control-wrapper">
                        <input  type="button" id="login" value="登录" class="btn btn-info">
                        <a href="forgot-password.html" class="text-right pull-right">忘记密码?</a>
                    </div>
                </div>
            </div>
            <hr>
            <div class="form-group">
                <div class="col-md-12">
                    <label>其他登录方式: </label>
                    <div class="inline-block">
                        <a href="#"><i class="fa fa-facebook-square login-with"></i></a>
                        <a href="#"><i class="fa fa-twitter-square login-with"></i></a>
                        <a href="#"><i class="fa fa-google-plus-square login-with"></i></a>
                        <a href="#"><i class="fa fa-tumblr-square login-with"></i></a>
                        <a href="#"><i class="fa fa-github-square login-with"></i></a>
                    </div>
                </div>
            </div>
        </form>
        <div class="text-center">
            <a href="" class="templatemo-create-new">创建新账号<i class="fa fa-arrow-circle-o-right"></i></a>
        </div>
    </div>
</div>
</body>


<script src="/resources/lib/jquery-2.1.4.min.js"></script>
<script src="/resources/lib/layer/layer.js"></script>
<script>
    $(document).ready(function() {
        $('#login').click(function () {
            var account = $('#account').val();
            var userPwd = $('#userPwd').val();
            console.log("click:",account,userPwd);
            if (account === undefined || account==="") {
                layer.msg("请输入用户名");
                return;
            }

            if (userPwd === undefined || userPwd==="") {
                layer.msg("请输入密码");
                return;
            }

            var data ={
                "account": account,
                "userPwd": userPwd
            }


            //显示一个加载动画
            var index = layer.open({
                type:3,
                shade: 0,//0.1透明度的白色背景
                time:0
            });

            $.ajax({
                url: "/login/loginOpt",
                data: JSON.stringify(data),
                type: "POST",
                contentType: "application/json",
                dataType:"json",
                success: function (data) {
                    //关闭加载动画
                    layer.close(index);
                    if(data.code!==0){
                        layer.msg("账号密码不正确");
                    }else{
                        //跳转到首页
                        layer.msg("登录成功");
                    }
                },
                error:function () {
                    //关闭加载动画
                    layer.close(index);
                    layer.msg("请检查网络");
                }
            });
        });
    })
</script>


</html>