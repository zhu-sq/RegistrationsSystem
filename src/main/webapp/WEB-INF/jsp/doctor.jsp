<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Depatrment</title>
    <link href="resources/index/css/reset.css" rel="stylesheet" type="text/css"/>
    <link href="resources/doctor/css/doctor.css" rel="stylesheet" type="text/css"/>
    <link href="lib/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>

</head>

<body>
<div class="top">
    <div class="topBar">
        <div class="comWidth">

            <div class="rightArea">
                您好！请 <a href="/login">登录</a> | <a href="/reg">注册</a>
                <div class="loginArea hide" >欢迎你！<p class="Username"></p>&nbsp&nbsp<a href="javascript:void(0);"class="logout">退出登录</a><a href="/informationPage">个人信息</a> </div>
            </div>
        </div>
    </div>
    <div class="logoBar">
        <div class="comWidth">
            <div class="logo fl">
                <a href="/index.jsp"><img src="resources/index/img/timg.jpg" alt="医疗logo"></a>

            </div>
            <div class="logo_text fl">
                <h2>医院挂号网上预约系统</h2>
            </div>


        </div>
    </div>
    <div class="navBox">
        <div class="comWidth">
            <div class="allDepatrment fl" >
                <h3>全部科室<i></i></h3>
            </div>
            <ul class="nav fl" >
                <li ><a href="/departmentPage" ><b>按科室挂号</b></a></li>
                <li class="active"><a href="/doctorPage"><b>按医生挂号</b></a></li>
            </ul>
        </div>
    </div>
</div>
<div class="search_box comWidth ">

    <input type="text" maxlength="50" id="doc_name" class="search_text " placeholder="请输入医生姓名"/>
    <input type="button" id="search" value="搜索" class="search_btn ">

</div>
<div id="bottomBar"></div>
</body>

<script type="text/javascript" src="resources/lib/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="resources/lib/jquery.cookie.js"></script>
<script src="/resources/lib/layer/layer.js"></script>
<script type="text/javascript">
    $(function () {
        var Uname=$.cookie("name");
        if(Uname!=null ){
            $(".loginArea.Username").text("Uname" );
            $(".loginArea").show();
        }
    })
    $(".logout").click(function () {
        layer.confirm('确定退出登录？', {
            btn: ['确定','取消'] //按钮
        }, function(){
            layer.msg('退出成功', {icon: 1});
            $.cookie("name", "", {expires: -1});
            $.cookie("role", "", {expires: -1});
            $.ajax({
                url: "/login/logout",
                data: {},
                type: "get",
                contentType: "application/json",
                dataType: "json",
                success: function (res) {
                    if (res.code != 0) {
                        layer.msg
                        {
                            "退出失败"
                        };
                    } else {
                        layer.msg('退出成功', {icon: 1});
                        $.cookie("name", "", {expires: -1});
                        $.cookie("role", "", {expires: -1});
                    }
                }
            })
        }, function(){
            layer.close();
        });
    });
    $(document).ready(function () {
        $("#search").click(function () {
            var doc_name=$("#doc_name").val();
            if (doc_name==undefined||doc_name==""){
                layer.msg("请输入医生姓名");
                return;
            }
            var url="/docResPage"+"?doc_name="+doc_name;
            window.open(url);

        })
    })
</script>
</html>
