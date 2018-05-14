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
                        <label for="name" ><i class="fa fa-user fa-medium"></i></label>
                        姓名<input type="text" class="form-control" id="name" placeholder="输入姓名">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-xs-12">
                    <div class="control-wrapper">
                        <label for="sex" ><i class="fa fa-user fa-medium"></i></label>
                        性别<input type="text" class="form-control" id="sex" placeholder="输入性别">
                    </div>
                </div>
            </div>

            <div class="form-group">
            <div class="col-md-12">
                <div class="control-wrapper">
                    <label for="pwd1" ><i class="fa fa-lock fa-medium"></i></label>
                    密码 <input type="password" class="form-control" id="pwd1" placeholder="输入密码">
                </div>
            </div>
        </div>
            <div class="form-group">
                <div class="col-md-12">
                    <div class="control-wrapper">
                        <label for="pwd2" ><i class="fa fa-lock fa-medium"></i></label>
                        密码<input type="password" class="form-control" id="pwd2" placeholder="再次输入密码">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-12">
                    <div class="control-wrapper">
                        <label for="idcard" ><i class="fa fa-lock fa-medium"></i></label>
                        身份证号码<input type="text" class="form-control" id="idcard" placeholder="输入身份证号">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-12">
                    <div class="control-wrapper">
                        <label for="phone" ><i class="fa fa-lock fa-medium"></i></label>
                        联系电话 <input type="text" class="form-control" id="phone" placeholder="输入联系电话">
                    </div>
                </div>
            </div>
            <div class="form-group ">
                <div class="col-md-12">
                    <div class="control-wrapper">
                        <div class="doc_tit hide">
                        <label for="phone" ><i class="fa fa-lock fa-medium"></i></label>
                        职称 <input type="text" class="form-control" id="title" placeholder="输入职称">
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-12">
                    <div class="control-wrapper">
                        <input  type="button" id="signup" value="注册" class="btn btn-info">
                        <input  type="button" id="dot_signup" value="医生注册" class="btn btn-info " style="display: none">
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
<script src="/resources/lib/jquery.cookie.js"></script>
<script>
    $(function () {
    $.ajax({
        url: "",
        data: {},
        type: "get",
        contentType: "application/json",
        dataType:"json",
        success: function (res){
            if(res.role=="1"){
               $("#signup").hide();
               $("#dot_signup").show();
               $(".doc_tit").show();
            }
        }
    });
    });
</script>
<script>
    $(document).ready(function() {

        $('#signup,#dot_signup').click(function () {

            var name = $('#name').val();
            var sex = $('#sex').val();
            var pwd1 = $('#pwd1').val();
            var pwd2 = $('#pwd2').val();
            var idcard = $('#idcard').val();
            var phone = $('#phone').val();
            var title=$("#title").val();
            console.log("click:",name,sex,pwd1,idcard,phone);

            if (name === undefined || name==="") {
                layer.msg("请输入姓名");
                return;
            }
            if (sex !="男" && sex!="女") {
                layer.msg("请输入正确性别");
                return;
            }

            if (pwd1 === undefined || pwd1==="") {
                layer.msg("请输入密码");
                return;
            }
            if (pwd2 !=pwd1 && pwd2==="") {
                layer.msg("两个密码不一致");
                return;
            }
            if (idcard.length!=15 && idcard.length!=18) {
                layer.msg("请输入正确身份证号码");
                return;
            }
            if (phone === undefined && phone.length!=11) {
                layer.msg("请输入正确联系电话");
                return;
            }
            var data ={
                "name": name,
                "sex": sex,
                "pwd": pwd1,
                "idcard":idcard,
                "phone":phone,
                "title":title
            }


            //显示一个加载动画
            var index = layer.open({
                type:3,
                shade: 0,//0.1透明度的白色背景
                time:0
            });

            $.ajax({
                url: "/reg/RegistOpt",
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
                        layer.msg("注册成功！");
                        $.cookie("name",data.name,{path:"/"});
                        $.cookie("role",data.role,{path:"/"});
                        $.cookie("uno",data.uno,{path:"/"});
                        window.location.href="/index.jsp";


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