<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/1
  Time: 21:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Depatrment</title>
    <link href="resources/index/css/reset.css" rel="stylesheet" type="text/css"/>
    <link href="resources/department/css/department.css" rel="stylesheet" type="text/css"/>
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
        })
        $(".logout").click(function () {
            layer.confirm('确定退出登录？', {
                btn: ['确定','取消'] //按钮
            }, function(){
                layer.msg('退出成功', {icon: 1});
                $.cookie("name", "", {expires: -1});
                $.cookie("role", "", {expires: -1});
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
<div class="transition ">科室列表</div>
<div class="dep_show comWidth">
    <dt>儿科</dt>
    <dd>
        <a href="#">儿科</a><a href="#">小儿呼吸科</a><a href="#">小儿外科</a><a href="#">小儿内科</a><a href="#">小儿骨科</a>
    </dd>
    <dt>妇产科</dt>
    <dd>
        <a href="#">妇科</a><a href="#">产科</a><a href="#">妇科内分泌</a><a href="#">妇泌尿科</a><a href="#">遗传咨询科</a>
    </dd>
    <dt>外科</dt>
    <dd>
        <a href="#">神经外科</a><a href="#">心血管外科</a><a href="#">胸外科</a><a href="#">整形科</a><a href="#">泌尿外科</a>
    </dd>
    <dt>内科</dt>
    <dd>
        <a href="#">心血管内科</a><a href="#">神经内科</a><a href="#">内分泌科</a><a href="#">消化内科</a><a href="#">普通内科</a>
    </dd>
    <dt>五官科</dt>
    <dd>
        <a href="#">耳鼻喉</a><a href="#">头颈外科</a><a href="#">口腔科</a><a href="#">正畸科</a><a href="#">牙周科</a>
    </dd>
    <dt>骨外科</dt>
    <dd>
        <a href="#">骨科</a><a href="#">脊柱外科</a><a href="#">手外科</a><a href="#">创伤骨科</a><a href="#">矫形骨科</a>
    </dd>
    <dt>肿瘤科</dt>
    <dd>
        <a href="#">肿瘤内科</a><a href="#">肿瘤外科</a><a href="#">肿瘤妇科</a><a href="#">放疗科</a><a href="#">肿瘤康复科</a>
    </dd>
</div>
<div id="bottomBar"></div>
</body>
</html>
