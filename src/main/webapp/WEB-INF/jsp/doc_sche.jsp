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
<script type="text/javascript" src="WEB-INF/jsp/logout.jsp"></script>
<script type="text/javascript">

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
        var uno=window.location.href.split("=")[1];
        $.ajax({
            url: "/shift/getByDnoUno?uno="+uno,
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
                }
            }
        })
    })
    function getTime(startTime,day) {
        var date = new Date();
        var seperator1 = "-";
        var seperator2 = ":";
        var month = date.getMonth() + 1;
        var strDate = date.getDate()+day;
        if (month >= 1 && month <= 9) {
            month = "0" + month;
        }
        if (strDate >= 0 && strDate <= 9) {
            strDate = "0" + strDate;
        }
        var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate + " "+startTime;
        return currentdate;
    }

    function doc(sno) {
        var uno=$.cookie("user.uno");
        $.ajax({
            url: "/pri/pri/reg/addReg",
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
