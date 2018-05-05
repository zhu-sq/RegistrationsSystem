<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/2
  Time: 21:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Depatrment</title>
    <link href="resources/index/css/reset.css" rel="stylesheet" type="text/css"/>
    <link href="resources/sche/css/dep_sche.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="resources/lib/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="resources/lib/jquery.cookie.js"></script>
    <script src="/resources/lib/layer/layer.js"></script>
    <script type="text/javascript">
        $(function () {
            var Uname=$.cookie("name");
            if(Uname!=null ){
                $(".loginArea.Username").text(Uname");
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
                    url: "~/logout",
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
    </script>
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
                <h3>全部科室<i></i></h3>
            </div>
            <ul class="nav fl" >
                <li class="active"><a href="#" ><b>按科室挂号</b></a></li>
                <li><a href="#"><b>按医生挂号</b></a></li>
            </ul>
        </div>
    </div>
</div>
<img src="resources/sche/img/dep.jpg" class="imgs">
<div class="dep ">
    <h1 id="dep_name">神经内科</h1>
    <div class="fl">科室简介：医院重点科室<p id="dep_detail fl"></p></div>
</div>
<table class="dep_sche">
    <tbody>
    <tr class="week">
        <th></th>
        <th>星期一</th>
        <th>星期二</th>
        <th>星期三</th>
        <th>星期四</th>
        <th>星期五</th>
        <th>星期六</th>
        <th>星期日</th>
    </tr>
    <tr class="mor">
        <td class="time">上午</td>
        <td class="am"></td>
        <td class="am"></td>
        <td class="am"></td>
        <td class="am"></td>
        <td class="am"></td>
        <td class="am"></td>
        <td class="am"></td>
    </tr>
    <tr class="aft">
        <td class="time">下午</td>
        <td class="pm"></td>
        <td class="pm"></td>
        <td class="pm"></td>
        <td class="pm"></td>
        <td class="pm"></td>
        <td class="pm"></td>
        <td class="pm"></td>
    </tr>
    </tbody>
</table>
<div id="bottomBar"></div>
</body>
</html>
