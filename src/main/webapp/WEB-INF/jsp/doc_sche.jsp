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

                <li><a href="/departmentPage" ><b>按科室挂号</b></a></li> 				<li><a href="/doctorPage"><b>按医生挂号</b></a></li>

            </ul>
        </div>
    </div>
</div>
<img src="resources/sche/img/doct.jpg" class="imgs">
<div class="introduce   ">
    <a href="#"> <h3 id="DRname"></h3></a>
    <div>性别：<p id="DRsex"></p></div>
    <div>出生日期：<p id="DRbir"></p></div>
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
<script language="JavaScript" src="../resources/logout.js" charset="gbk"></script>
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
                    $("#DRname").html(data.user.name);
                    $("#DRsex").html(data.user.sex);
                    $("#DRbir").html(data.user.birthday);
                    $("#DRphone").html(data.user.phone);
                    $("#DRtitle").html(data.user.title);
                    $("#DRdetail").html(data.user.intro);
                    var day=0;
                    $('.mor').find('.am').each(function () {
                        var amTime = new Date(getTime('8:00:00',day++));
                        for(i=0;i<data.shifts.length;i++){
                            var item = data.shifts[i];
                            var itemTime = new Date(item.startDate);
                            if(itemTime.getTime()>amTime.getTime()) break;
                            if(itemTime.getTime()==amTime.getTime()){
                                var num=0;
                                if(isNaN(item.num)){
                                    num=0;
                                }else{
                                    num=item.num;
                                }
                                var html = '<li num="' +num +'" maxNum="'+item.maxNum + '"sno="'+item.sno
                                    +'"><div>预约情况</div>'
                                    + '<div> '+ num +"/"+ item.maxNum+'</div>'
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
                                var num=0;
                                if(isNaN(item.num)){
                                    num=0;
                                }else{
                                    num=item.num;
                                }
                                var html = '<li num="' +num +'" maxNum="'+item.maxNum + '"sno="'+item.sno
                                    +'"><div>预约情况</div>'
                                    + '<div> '+ num +"/"+ item.maxNum+'</div>'
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



    $('.am').click(reg);
    $('.pm').click(reg);

    function reg() {
        console.log("1111111111");
        var thiz = $(this).find('li');
        console.log(thiz.attr('num'));
        console.log($(thiz).attr('num'));
        if($(thiz).attr('num')>=$(thiz).attr('maxNum')){
            layser.msg("预约已满");
        }
        var user = JSON.parse($.cookie("user"));
        var uno=user.uno;
        //显示一个加载动画
        var index = layer.open({
            type:3,
            shade: 0,//0.1透明度的白色背景
            time:0
        });

        layer.confirm('是否要预约', {
            btn: ['是','否'] //按钮
        }, function(){
            $.ajax({
                url: "/pri/reg/addReg?sno="+$(thiz).attr('sno')+"&uno="+uno,
                type: "GET",
                dataType:"json",
                success: function (data) {
                    //关闭加载动画
                    layer.close(index);
                    if(data.code!=0){
                        layer.msg(data.msg);
                        return;
                    }
                    layer.msg('预约成功');
                    var html = '<li num="' +$(thiz).attr('num') +'" maxNum="'+$(thiz).attr('maxNum')  + '"sno="'+$(thiz).attr('sno')
                        +'"><div>预约情况</div>'
                        + '<div> '+ (parseInt((thiz).attr('num'))+1) +"/"+ $(thiz).attr('maxNum') +'</div>'
                        +'</li>';
                    $(thiz).html(html)
                },
                error:function () {
                    //关闭加载动画
                    layer.close(index);
                    layer.msg("请检查网络");
                }
            });

        }, function(){
          layer.closeAll();
        });
    }
</script>
</html>
