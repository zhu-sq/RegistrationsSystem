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
                您好！请 <a href="/login">登录</a> | <a href="/reg">注册</a>
                <div class="loginArea hide" >欢迎你！<p class="Username"></p>&nbsp&nbsp<a id="logout" href="#">退出登录</a>&nbsp&nbsp<a href="/informationPage">个人信息</a> </div>
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
                <h3>全部科室</h3>
            </div>
            <ul class="nav fl" >
                <li><a href="/departmentPage" ><b>按科室挂号</b></a></li>
                <li><a href="/doctorPage"><b>按医生挂号</b></a></li>
            </ul>
        </div>
    </div>
</div>
<div class="inf comWidth">
    <div>姓名：<p id="name"></p> </div>
    <div>生日：<p id="bir"></p><input type="text" id="birth" maxlength="20" placeholder="格式：2016-03-25" style="display: none"></div>
    <div>性别：<p id="sex"></p></div>
    <div>身份证号码：<p id="idc"></p></div>
    <div>联系电话：<p id="phone"></p><input type="text" id="phones" maxlength="12" placeholder="请输入新的联系电话" style="display: none"></div>
    <div class="doc_it hide ">
        <div>职称：<p id="tit"></p><input type="text" id="tits" maxlength="20" placeholder="请输入新的职称" style="display: none"></div>
        <div>个人简介：<p id="intro"></p><input type="text" id="intros " maxlength="50" placeholder="请输入新的个人简介" style="display: none"></div>
        <div>预约用户信息：</div>
        <div><input type="text" id="dsno" maxlength="20" placeholder="请输入班次号" ><button type="button" id="snos">提交</button> </div>
        <div>患者编号：<p id="unos"></p> </div>
        <div>患者姓名：<p id="Unames"></p> </div>
        <div>患者电话：<p id="uphone"></p> </div>
    </div>
    <div><button type="button" id="change">修改</button> </div>
    <div><button type="button" id="sure" style="display: none">确定</button><button type="button" id="cancel" style="display: none">取消</button> </div>
    <div class="infor">
        <h3>预约信息</h3>
        <div>班次号：<p id="sno"></p> </div>
        <div>医生姓名：<p id="DRname"></p> </div>
        <div>科室名称：<p id="Dpname"></p> </div>
        <div>开始时间：<p id="sd"></p> </div>
        <div>结束时间：<p id="ed"></p> </div>
    </div>
</div>
<div class="adds comWidth hide"><button type="button" id="add">添加排班表</button> </div>
<div id="bottomBar"></div>
</body>
<script type="text/javascript" src="resources/lib/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="resources/lib/jquery.cookie.js"></script>
<script src="/resources/lib/layer/layer.js"></script>
<script type="text/javascript">
    $(function () {
        var user = JSON.parse($.cookie("user"));
        if(user!=null ){
            $(".Username").text(user.name);
            $(".loginArea").show();
            $(".rightArea").hide();
        }
        var Role=user.role;
        if (Role==1){
                var html='<a href="/reg">注册</a>';
                $(".loginArea").append(html);
                $(".doc_it").show();
                $(".infor").hide();
                $(".adds").show();
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
                        $.cookie("user", "", {expires: -1});
                        $(".rightArea").show();
                        $(".loginArea").hide();
                        window.location.href="/index.jsp";
                    }
                }
            })
        }, function(){
            layer.close();
        });
    });
    $(function () {
        var res=JSON.parse($.cookie("user"));
        $("#name").html(res.name);
        $("#bir").html(res.birthday);
        $("#sex").html(res.sex);
        $("#idc").html(res.idcard);
        $("#phone").html(res.phone);
        $("#tit").html(res.tit);
        $("#intro").html(res.intro);
    });
    $(function () {
        var user=JSON.parse($.cookie("user"));
        var uno = user.uno;
        $.ajax({
            url: "/shift/getShiftByUno",
            data: {"uno":uno},
            type: "GET",
            contentType: "application/json",
            dataType: "json",
            success: function (res) {
                if (res.code == 0) {
                    $("#sno").html(res.sno);
                    $("#DRname").html(res.doctName);
                    $("#Dpname").html(res.deparName);
                    $("#sd").html(res.startDate);
                    $("#ed").html(res.endDate);
                }else if(res.code==10){
                    layer.msg("没有挂号信息");
                }
            }
        });
    });
    $("#snos").click(function () {
        var dsno = $("#dsno").val();
        console.log(dsno);

        $.ajax({
            url: "/pri/reg/getReg?uno"+dsno,
                type: "GET",
                dataType: "json",
            success: function (res) {
  if(res.code!=0){
    layer.mag(res.msg);
    return;
}
                if (res.code == 0) {
                    $("#unos").html(res.users.uno);
                    $("#Unames").html(res.users.name);
                    $("#Uphone").html(res.users.phone);
                }
            }
        });
    });
    $("#change").click(function () {
        $("#bir,#phone,#tit,#intro").hide();
        $(".inf input").show();
        $(".inf button").show();
        $(this).hide();
    })
    $("#cancel").click(function () {
        $(".inf input").hide();
        $("#change").show();
        $(this).hide();
        $("#sure").hide();
    })
    $("#sure").click(function () {

        var birt=$("#birth").val();
        var phones=$("#phones").val();
        var tits=$("#tits").val();
        var intr=$("#intro").val();

        if (phones!="" && phones.length!=11){
            layer.msg("请输入正确的电话号码");
            return;
        }
        var data={
            "birthday" :birt,
            "phone":phones,
            "title":tits,
            "intro":intr
        }

        $.ajax({
            url: "/user/updateUser",
            data: JSON.stringify(data),
            type: "post",
            contentType: "application/json",
            dataType: "json",
            success: function (res) {

                if(res.code!=0){
                    layer.msg(res.msg);
                    return;

                }
                layer.msg("修改成功");
                window.location.href='/informationPage';
            }
        });
    })
    $("#add").click(function () {
        window.location.href="/addSchePage";
    })
</script>
</html>
