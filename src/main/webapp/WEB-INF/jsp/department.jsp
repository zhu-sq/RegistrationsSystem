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
                <li class="active"><a href="/departmentPage" ><b>按科室挂号</b></a></li>
                <li><a href="/doctorPage"><b>按医生挂号</b></a></li>
            </ul>
        </div>
    </div>
</div>
<div class="transition ">科室列表</div>
<div class="dep_show comWidth">
    <dt>儿科</dt>
    <dd>
        <a href="#"onclick=" javascript:depno(this)" id="dep_01">儿科</a><a href="#"onclick=" javascript:depno(this)" id="dep_02">小儿呼吸科</a><a href="#"onclick=" javascript:depno(this)" id="dep_03">小儿外科</a><a href="#" id="dep_04">小儿内科</a><a href="#"onclick=" javascript:depno(this)" id="dep_05">小儿骨科</a>
    </dd>
    <dt>妇产科</dt>
    <dd>
        <a href="#"onclick=" javascript:depno(this)" id="dep_06">妇科</a><a href="#"onclick=" javascript:depno(this)" id="dep_07">产科</a><a href="#"onclick=" javascript:depno(this)" id="dep_08">妇科内分泌</a><a href="#"onclick=" javascript:depno(this)" id="dep_09">妇泌尿科</a><a href="#"onclick=" javascript:depno(this)" id="dep_10">遗传咨询科</a>
    </dd>
    <dt>外科</dt>
    <dd>
        <a href="#"onclick=" javascript:depno(this)" id="dep_11">神经外科</a><a href="#"onclick=" javascript:depno(this)" id="dep_12">心血管外科</a><a href="#"onclick=" javascript:depno(this)" id="dep_13">胸外科</a><a href="#"onclick=" javascript:depno(this)" id="dep_14">整形科</a><a href="#"onclick=" javascript:depno(this)" id="dep_15">泌尿外科</a>
    </dd>
    <dt>内科</dt>
    <dd>
        <a href="#"onclick=" javascript:depno(this)" id="dep_16">心血管内科</a><a href="#"onclick=" javascript:depno(this)" id="dep_17">神经内科</a><a href="#"onclick=" javascript:depno(this)" id="dep_18">内分泌科</a><a href="#"onclick=" javascript:depno(this)" id="dep_19">消化内科</a><a href="#"onclick=" javascript:depno(this)" id="dep_20">普通内科</a>
    </dd>
    <dt>五官科</dt>
    <dd>
        <a href="#"onclick=" javascript:depno(this)" id="dep_21">耳鼻喉</a><a href="#"onclick=" javascript:depno(this)" id="dep_22">头颈外科</a><a href="#"onclick=" javascript:depno(this)" id="dep_23">口腔科</a><a href="#"onclick=" javascript:depno(this)" id="dep_24">正畸科</a><a href="#"onclick=" javascript:depno(this)" id="dep_25">牙周科</a>
    </dd>
    <dt>骨外科</dt>
    <dd>
        <a href="#"onclick=" javascript:depno(this)" id="dep_26">骨科</a><a href="#"onclick=" javascript:depno(this)" id="dep_27">脊柱外科</a><a href="#"onclick=" javascript:depno(this)" id="dep_28">手外科</a><a href="#"onclick=" javascript:depno(this)" id="dep_29">创伤骨科</a><a href="#"onclick=" javascript:depno(this)" id="dep_30">矫形骨科</a>
    </dd>
    <dt>肿瘤科</dt>
    <dd>
        <a href="#"onclick=" javascript:depno(this)" id="dep_31">肿瘤内科</a><a href="#"onclick=" javascript:depno(this)" id="dep_32">肿瘤外科</a><a href="#"onclick=" javascript:depno(this)" id="dep_33">肿瘤妇科</a><a href="#"onclick=" javascript:depno(this)" id="dep_34">放疗科</a><a href="#"onclick=" javascript:depno(this)" id="dep_35">肿瘤康复科</a>
    </dd>
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
                        $.cookie("name", "", {expires: -1});
                        $.cookie("role", "", {expires: -1});
                    }
                }
            })
        }, function(){
            layer.close();
        });
    });
    function depno(obj) {
        var dnos =obj.id;
        var d = dnos.substr(dnos.length - 2);
        var url="/depSchePage?dno="+d;
        window.open(url);
    }
</script>
</html>
