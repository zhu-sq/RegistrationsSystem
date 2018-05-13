<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/6
  Time: 16:17
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
<div class="inf comWidth">
    <div>姓名：<p id="name"></p> </div>
    <div>生日：<p id="bir"></p><input type="text" id="birth " maxlength="20" placeholder="格式：2016-03-25" style="display: none"></div>
    <div>性别：<p id="sex"></p></div>
    <div>身份证号码：<p id="idc"></p></div>
    <div>联系电话：<p id="phone"></p><input type="text" id="phones " maxlength="12" placeholder="请输入新的联系电话" style="display: none"></div>
    <div class="doc_it hide ">
        <div>职称：<p id="tit"></p><input type="text" id="tit " maxlength="20" placeholder="请输入新的职称" style="display: none"></div>
        <div>个人简介：<p id="intro"></p><input type="text" id="intros " maxlength="50" placeholder="请输入新的个人简介" style="display: none"></div>
        <div>预约用户信息：</div>
        <div><input type="text" id="dsno " maxlength="20" placeholder="请输入班次号" ><button type="button" id="snos">提交</button> </div>
        <div>患者编号：<p id="unos"></p> </div>
        <div>患者姓名：<p id="Uname"></p> </div>
        <div>患者电话：<p id="uphone"></p> </div>
    </div>
    <div><button type="button" id="change">修改</button> </div>
    <div class="infor">
        <h3>预约信息</h3>
        <div>班次号：<p id="sno"></p> </div>
        <div>医生姓名：<p id="DRname"></p> </div>
        <div>科室名称：<p id="Dpname"></p> </div>
        <div>开始时间：<p id="sd"></p> </div>
        <div>结束时间：<p id="ed"></p> </div>
    </div>

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
            $(".loginArea.Username").text(Uname );
            $(".loginArea").show();
        }
        var Role=$.cookie("role");
        if (Role==1){
            window.open(); //sssssss
        }else if(Role==2){
            $(".doc_it").show();
            $(".infor").hide();

        }
    })
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

        var uno = $.cookie("uno");
        $.ajax({
            url: "~/login/logout",
            data: {"uno": uno},
            type: "post",
            contentType: "application/json",
            dataType: "json",
            success: function (res) {

                if (res.code == 0) {
                    $("#name").html(res.name);
                    $("#bir").html(res.birthday);
                    $("#sex").html(res.sex);
                    $("#idc").html(res.idcard);
                    $("#phone").html(res.phone);
                    $("#tit").html(res.tit);
                    $("#intro").html(res.intro);
                }
            }
        });
    });
        $(function () {
            var uno = $.cookie("uno");
            $.ajax({
                url: "~/pri/shift/getShiftByUno",
                data: {"uno": uno},
                type: "get",
                contentType: "application/json",
                dataType: "json",
                success: function (res) {

                    if (res.code == 0) {

                        $("#sno").html(res.sno);
                        $("#DRname").html(res.doctName);
                        $("#Dpname").html(res.deparName);
                        $("#sd").html(res.startDate);
                        $("#ed").html(res.endDate);

                    }
                }
            });
        });
            $("#snos").click(function () {

                var dsno = $("#dsno").val();
                $.ajax({
                    url: "~/pri/pri/reg/getReg",
                    data: {"sno": dsno},
                    type: "get",
                    contentType: "application/json",
                    dataType: "json",
                    success: function (res) {

                        if (res.code == 0) {
                            $("#unos").html(res.users.uno);
                            $("#Uname").html(res.users.name);
                            $("#Uphone").html(res.users.phone);
                        }
                    }
                });
            });
            $("#change").click(function () {
                var birt=$("#bir").val();
                var phones=$("#phone").val();
                var tits=$("#tit").val();
                var intr=$("#intro").val();
                var data={
                    "birthday" :birt,
                    "phone":phones,
                    "tits":title,
                    "intr":intro
                }

                $.ajax({
                    url: "~/pri/pri/reg/getReg",
                    data: JSON.stringify(data),
                    type: "get",
                    contentType: "application/json",
                    dataType: "json",
                    success: function (res) {
                        if(res.code==0){
                            layer.msg("修改成功");
                        }
                        }
                    });
                    })
</script>
</html>
