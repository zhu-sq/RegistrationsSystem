<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/2
  Time: 19:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Depatrment</title>
    <link href="resources/index/css/reset.css" rel="stylesheet" type="text/css"/>
    <link href="resources/doctor/css/doc_res.css" rel="stylesheet" type="text/css"/>

</head>

<body>
<div class="top">
    <div class="topBar">
        <div class="comWidth">

            <div class="rightArea">
                您好！请 <a href="/login">登录</a> | <a href="#">注册</a>
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
<div class="transition comWidth"> <h3>搜索结果<h3> </div>
<div class="no_res comWidth"><h3>查无此人，请检查医生名字</h3></div>
<div class="resul comWidth hide ">
    <a href="#"> <h3 id="DRname"></h3></a>
    <div>性别：<p id="DRsex"></p></div>
    <div>年龄：<p id="DRgender"></p></div>
    <div>联系电话：<p id="DRphone"></p></div>
    <div>职称：<p id="DRtitle"></p></div>
    <div>所属科室：<p id="Dno"></p></div>
    <div>个人简介：<p id="DRdetail"></p></div>
</div>
<div class="resul comWidth hide">
    <a href="#"> <h3 id="DRname"></h3></a>
    <div>性别：<p id="DRsex"></p></div>
    <div>年龄：<p id="DRgender"></p></div>
    <div>联系电话：<p id="DRphone"></p></div>
    <div>职称：<p id="DRtitle"></p></div>
    <div>所属科室：<p id="Dno"></p></div>
    <div>个人简介：<p id="DRdetail"></p></div>
</div>
<div class="resul comWidth hide">
    <a href="#"> <h3 id="DRname"></h3></a>
    <div>性别：<p id="DRsex"></p></div>
    <div>年龄：<p id="DRgender"></p></div>
    <div>联系电话：<p id="DRphone"></p></div>
    <div>职称：<p id="DRtitle"></p></div>
    <div>所属科室：<p id="Dno"></p></div>
    <div>个人简介：<p id="DRdetail"></p></div>
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
            $(".Username").text(Uname );
            $(".loginArea").show();
            $(".rightArea").hide();
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
                        $.cookie("uno", "", {expires: -1});
                        $(".rightArea").show();
                        $(".loginArea").hide();
                    }
                }
            })
        }, function(){
            layer.close();
        });
    });
    $(document).wait(function () {
        var dname=window.location.href.split("=")[1];
        $.ajax({
            url: "",
            data: {"name":dname},
            type: "get",
            contentType: "application/json",
            dataType:"json",
            success: function (res){
                if(res.length!=0){
                    $(".no_res").hide();
                    for(var i=0;i<res.length;i++){
                        $(".resul").eq(i).show();
                        var a = document.createElement("a");
                        var node = document.createTextNode(res[j].name);
                        a.appendChild(node);
                        a.setAttribute("href","docs(res.uno)");
                        $("#DRname").appendChild(d);
                        $("#DRsex").text(res[i].sex);
                        $("#DRphone").text(res[i].phone);
                        $("#DRtitle").text(res[i].title);
                        $("#Dno").text(res[i].Dno);
                        $("#DRdetail").text(res[i].intro);
                    }

                }
            }
        })
    })
    function docs(uno) {
        var url="/docShcePage?uno="+uno;
        window.open(url);
    }
</script>
</html>
