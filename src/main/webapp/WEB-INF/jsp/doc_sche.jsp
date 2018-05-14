<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/5
  Time: 19:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Depatrment</title>
    <link href="resources/index/css/reset.css" rel="stylesheet" type="text/css"/>
    <link href="resources/sche/css/doc_sche.css" rel="stylesheet" type="text/css"/>

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
               <li><a href="/departmentPage" ><b>按科室挂号</b></a></li> 				<li><a href="/doctorPage"><b>按医生挂号</b></a></li>
            </ul>
        </div>
    </div>
</div>
<img src="resources/sche/img/doct.jpg" class="imgs">
<div class="introduce   ">
    <a href="#"> <h3 id="DRname"></h3></a>
    <div>性别：<p id="DRsex"></p></div>
    <div>出生年份：<p id="DRgender"></p></div>
    <div>联系电话：<p id="DRphone"></p></div>
    <div>职称：<p id="DRtitle"></p></div>
    <div>个人简介：<p id="DRdetail"></p></div>
</div>
<table class="doc_sche">
    <tbody>
    <tr class="week">
        <th ></th>
        <th class="day">1</th>
        <th class="day">2</th>
        <th class="day">3</th>
        <th class="day">4</th>
        <th class="day">5</th>
        <th class="day">6</th>
        <th class="day">7</th>
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
    $(function(){
        var mydate=new Date();
        var mytime=mydate.getTime();
        var dayTime=24*60*60*1000;
        for(var i=0;i<$(".day").length;i++){
            var mydays=new Date(mytime+i*dayTime);
            var mymonth=mydays.getMonth()+1;
            var myday=mydays.getDate();
            $(".day").eq(i).html(mymonth+"月"+myday+"日");
        }
    })
    $(function () {
        var Unos=window.location.href.split("=")[1];
        var uno=parseInt(Unos);
        $.ajax({
            url: "~/shift/getByDnoUno",
            data: JSON.stringify({"uno" :uno}),
            type: "GET",
            contentType: "application/json",
            dataType:"json",
            success: function (data) {
                if(data.code==0){
                    $("#DRname").html(data.user.name);
                    $("#DRsex").html(data.user.sex);
                    $("#DRgender").html(data.user.birthday.split("-")[0]);
                    $("#DRphone").html(data.user.phone);
                    $("#DRtitle").html(data.user.title);
                    $("#DRdetail").html(data.user.intro);
                    var mydate=new Date();
                    var mytime=mydate.getTime();
                    var dayTime=24*60*60*1000;
                    for(var i=0;i<$(".day").length;i++){
                        var mydays=new Date(mytime+i*dayTime);
                        var mymonth=mydays.getMonth()+1;
                        var myday=mydays.getDate();
                        for(varj=0;j<data.shifts.length;j++){
                            var a=data.shifts[j].endDate.split(" ");
                            var b=a[0].split("-");
                            if((b[1]==mymonth)&&(b[2]==myday)){
                                var c=a[1].split(":");
                                if(c[0]<"12"){
                                    var nums=data.shifts[j].maxNum-data.shifts[j].num;
                                    if(nums>0){
                                        $(".am").eq(i).html("剩余"+nums+"个号");
                                    var d = document.createElement("a");
                                    var node = document.createTextNode("预约");
                                    d.appendChild(node);
                                    d.setAttribute("href","doc(data.shifts[j].sno)");
                                    $(".am").eq(i).appendChild(d);
                                    }else {
                                        $(".am").eq(i).html("没有号了");
                                    }
                                }else {
                                    var nums=data.shifts[j].maxNum-data.shifts[j].num;
                                    if(nums>0){
                                        $(".pm").eq(i).html("剩余"+nums+"个号");
                                        var d = document.createElement("a");
                                        var node = document.createTextNode("预约");
                                        d.appendChild(node);
                                        d.setAttribute("href","doc(data.shifts[j].sno)");
                                        $(".pm").eq(i).appendChild(d);
                                    }else {
                                        $(".pm").eq(i).html("没有号了");
                                    }
                                }
                            }
                        }
                    }
                }
            }
        })
    })
    function doc(sno) {
        var uno=$.cookie("uno");
        $.ajax({
            url: "~/pri/pri/reg/addReg",
            data: JSON.stringify({"sno":sno,"uno" :uno}),
            type: "GET",
            contentType: "application/json",
            dataType:"json",
            success: function (data) {
                if(data.code==0){
                    layer.msg("预约成功");
                }else {
                    layer.msg("预约失败");
                }
            }
            })
    }
</script>
</html>
