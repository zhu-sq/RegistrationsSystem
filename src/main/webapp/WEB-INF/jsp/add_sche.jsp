<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/11
  Time: 23:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Depatrment</title>
    <link href="resources/index/css/reset.css" rel="stylesheet" type="text/css"/>
    <link href="resources/information/inf.css" rel="stylesheet" type="text/css"/>

</head>

<body>
<div class="top">
    <div class="topBar">
        <div class="comWidth">

            <div class="rightArea">
                您好！请 <a href="/login">登录</a> | <a href="#">注册</a>
                <div class="loginArea hide" >欢迎你！<p class="Username"></p>&nbsp&nbsp<a href="javascript:void(0);"class="logout">退出登录</a><a href="#">个人信息</a> </div>
            </div>
        </div>
    </div>
    <div class="logoBar">
        <div class="comWidth">
            <div class="logo fl">
                <a href="#"><img src="resources/index/img/timg.jpg" alt="医疗logo"></a>
            </div>
            <div class="logo_text fl">
                <h2>医院挂号网上预约系统</h2>
            </div>
        </div>
    </div>
    <div class="navBox">
        <div class="comWidth">
            <div class="allDepatrment fl" >
                <h3>全部科室</h3>
            </div>
            <ul class="nav fl" >
                <li ><a href="#" ><b>按科室挂号</b></a></li>
                <li><a href="#"><b>按医生挂号</b></a></li>
            </ul>
        </div>
    </div>
</div>
<div class="adds">
    <div>开始时间：<input type="text" id="sd " maxlength="20" placeholder="格式：2016-03-25 08:00:00"></div>
    <div>结束时间：<input type="text" id="ed " maxlength="20" placeholder="格式：2016-03-25 08:00:00"></div>
    <div>科室编号：<input type="text" id="dn " maxlength="20" placeholder="请输入科室编号"></div>
    <div>医生编号：<input type="text" id="un " maxlength="20" placeholder="请输入医生编号"></div>
    <div>最大预约数：<input type="text" id="mn " maxlength="20" placeholder="请输入最大预约数"></div>
    <div>已预约数：<input type="text" id="nu " maxlength="20" placeholder="请输入已预约数"></div>
    <div><button type="button" id="ad">添加</button> </div>
</div>
<div id="bottomBar"></div>
</body>
<script type="text/javascript" src="resources/lib/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="resources/lib/jquery.cookie.js"></script>
<script src="/resources/lib/layer/layer.js"></script>
<script type="text/javascript">
    $(function () {
        var Uname = $.cookie("name");
        if (Uname != null) {
            $(".loginArea.Username").text(Uname);
            $(".loginArea").show();
        }
    }
    $(".logout").click(function () {
        layer.confirm('确定退出登录？', {
            btn: ['确定','取消'] //按钮
        }, function(){

            $.ajax({
                url: "~/login/logout",
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
    $(function () {
        $("#ad").click(function () {
            var sd=$("#sd").val();
            var ed=$("#ed").val();
            var dn=$("#dn").val();
            var un=$("#un").val();
            var mn=$("#mn").val();
            var nu=$("#nu").val();
            if (sd === undefined || sd==="") {
                layer.msg("请输入开始时间");
                return;
            }
            if (ed === undefined || ed==="") {
                layer.msg("请输入结束时间");
                return;
            }
            if (dn === undefined || dn==="") {
                layer.msg("请输入科室编号");
                return;
            }
            if (un === undefined || un==="") {
                layer.msg("请输入医生编号");
                return;
            }
            if (mn === undefined || mn==="") {
                layer.msg("请输入最大预约数");
                return;
            }
            if (nu === undefined || nu==="") {
                layer.msg("请输入已有预约数");
                return;
            }
            var data={
                "startDate" :sd,
                "endDate": ed,
                "dno": dn,
                "uno": un,
                "maxNum": mn,
                "num": nu
            }
            $.ajax({
                url: "~/pri/shift/updateShift",
                data: JSON.stringify(data),
                type: "POST",
                contentType: "application/json",
                dataType:"json",
                success: function (res) {
                    if(res.code==0){
                        layer.msg("添加成功！");
                    }
                }
            });
        });
    })
</script>
</html>
