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
            </div>
            <div class="loginArea hide" >欢迎你！<p class="Username"></p>&nbsp&nbsp<a id="logout" href="#">退出登录</a>&nbsp&nbsp<a href="/informationPage">个人信息</a> </div>

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

<div class="resul comWidth">
    <a href="#"> <h3 id="DRname"></h3></a>
    <div>性别：<p id="DRsex"></p></div>
    <div>年龄：<p id="DRgender"></p></div>
    <div>联系电话：<p id="DRphone"></p></div>
    <div>职称：<p id="DRtitle"></p></div>
    <div>所属科室：<p id="Dno"></p></div>
    <div>个人简介：<p id="DRdetail"></p></div>
</div>
<div class="resul comWidth">
    <a href="#"> <h3 id="DRname"></h3></a>
    <div>性别：<p id="DRsex"></p></div>
    <div>年龄：<p id="DRgender"></p></div>
    <div>联系电话：<p id="DRphone"></p></div>
    <div>职称：<p id="DRtitle"></p></div>
    <div>所属科室：<p id="Dno"></p></div>
    <div>个人简介：<p id="DRdetail"></p></div>
</div>
<div class="resul comWidth">
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
<script language="JavaScript" src="../resources/logout.js" charset="gbk"></script>
<script type="text/javascript">

    $(function () {
        var uno=window.location.href.split("=")[1];
        $.ajax({
            url: "/shift/getByDnoUno?dno="+dno,
            type: "GET",
            success: function (data) {
                if(data.code!=0){
                    layer.msg(data.msg);
                }
                if(data.code==0){
                    var day=0;
                    $('.mor').find('.am').each(function () {
                        var amTime = new Date(getTime('8:00:00',day++));
                        for(i=0;i<data.shifts.length;i++){
                            var item = data.shifts[i];
                            var itemTime = new Date(item.startDate);
                            if(itemTime.getTime()>amTime.getTime()) break;
                            if(itemTime.getTime()==amTime.getTime()){
                                var html = '<li><a href="/docSchePage?uno=' + item.uno
                                    +'">' +item.name
                                    +'</li>';
                                $(this).append(html);
                            }
                        }
                    })
                    day=0;
                    $('.aft').find('.pm').each(function () {
                        var amTime = new Date(getTime('14:00:00',day++));
                        for(i=0;i<data.shifts.length;i++){
                            var item = data.shifts[i];
                            var itemTime = new Date(item.startDate);
                            if(itemTime.getTime()>amTime.getTime()) break;
                            if(itemTime.getTime()==amTime.getTime()){
                                var html = '<li><a href="/docSchePage?uno=' + item.uno
                                    +'">' +item.name
                                    +'</li>';
                                $(this).append(html);
                            }
                        }
                    })
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
