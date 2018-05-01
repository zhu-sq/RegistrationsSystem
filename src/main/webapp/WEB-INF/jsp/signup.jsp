<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<head>
    <title>sign up</title>
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
        <h1 class="margin-bottom-15">注 册</h1>
        <form class="form-horizontal templatemo-container templatemo-login-form-1 margin-bottom-30" role="form" action="#" method="post">

            <div class="form-group">
                <div class="col-xs-12">
                    <div class="control-wrapper">
                        <label for="Uname" class="control-label fa-label"><i class="fa fa-user fa-medium"></i></label>
                        <input type="text" class="form-control" id="Uname" placeholder="输入姓名">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-xs-12">
                    <div class="control-wrapper">
                        <label for="Usex" class="control-label fa-label"><i class="fa fa-user fa-medium"></i></label>
                        <input type="text" class="form-control" id="Usex" placeholder="输入性别">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-xs-12">
                    <div class="control-wrapper">
                        <label for="Ugender" class="control-label fa-label"><i class="fa fa-user fa-medium"></i></label>
                        <input type="text" class="form-control" id="Ugender" placeholder="输入年龄">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-12">
                    <div class="control-wrapper">
                        <label for="Upassword" class="control-label fa-label"><i class="fa fa-lock fa-medium"></i></label>
                        <input type="password" class="form-control" id="Upassword" placeholder="输入密码">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-12">
                    <div class="control-wrapper">
                        <label for="Uid" class="control-label fa-label"><i class="fa fa-lock fa-medium"></i></label>
                        <input type="text" class="form-control" id="Uid" placeholder="输入身份证号">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-12">
                    <div class="control-wrapper">
                        <label for="Uphone" class="control-label fa-label"><i class="fa fa-lock fa-medium"></i></label>
                        <input type="text" class="form-control" id="Uphone" placeholder="输入联系电话">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-12">
                    <div class="control-wrapper">
                        <input  type="button" id="regis" value="注册" class="btn btn-info">
                    </div>
                </div>
            </div>

            <hr>

        </form>
    </div>
</div>
</body>


<script src="/resources/lib/jquery-2.1.4.min.js"></script>
<script src="/resources/lib/layer/layer.js"></script>
<script>
    $.ajax({
        url: "",
        data: {},
        type: "get",
        contentType: "application/json",
        dataType:"json",
        success: function (res){
            if(res.role=="1"){
                window.location.href="doc_signup.jsp";
            }
        }
    })
</script>
<script>
    $(document).ready(function() {
        $('#regis').click(function () {

            var Uname = $('#Uname').val();
            var Usex = $('#Usex').val();
            var Ugender = $('#Ugender').val();
            var Upassword = $('#Upassword').val();
            var Uid = $('#Uid').val();
            var Uphone = $('#Uphone').val();
            console.log("click:",Uname,Usex,Ugender,Upassword,Uid,Uphone);

            if (Uname === undefined || Uname==="") {
                layer.msg("请输入姓名");
                return;
            }
            if (Usex === undefined || Usex==="") {
                layer.msg("请输入性别");
                return;
            }
            if (Ugender === undefined || Ugender==="") {
                layer.msg("请输入年龄");
                return;
            }
            if (Upassword === undefined || Upassword==="") {
                layer.msg("请输入密码");
                return;
            }
            if (Uid === undefined || Uid==="") {
                layer.msg("请输入身份证号码");
                return;
            }
            if (Uphone === undefined || Uphone==="") {
                layer.msg("请输入联系电话");
                return;
            }
            var data ={
                "Uname": Uname,
                "Usex": Usex,
                "Ugender":Ugender,
                "userPwd": Upassword,
                "Uid":Uid,
                "Uphone":Uphone
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
                        layer.msg("注册失败！");
                    }else {
                        //跳转到首页
                        window.location.href="index.jsp";
                        layer.msg("注册成功！");
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