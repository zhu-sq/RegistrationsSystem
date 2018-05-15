<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<head>
    <title>sign up</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/resources/login/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="/resources/lib/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="/resources/lib/bootstrap/bootstrap-theme.min.css" rel="stylesheet" type="text/css">
    <link href="/resources/login/css/templatemo_style.css" rel="stylesheet" type="text/css">

    <%--<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">--%>
    <%--<link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css">--%>
    <%--<link href="css/templatemo_style.css" rel="stylesheet" type="text/css">--%>

</head>
<body class="templatemo-bg-gray">
<div class="container">
    <div class="col-md-12">
        <h1 class="margin-bottom-15">注 册</h1>
        <form class="form-horizontal templatemo-container templatemo-login-form-1 margin-bottom-30" role="form" action="#" method="post">

            <div class="form-group">
                <div class="col-xs-12">
                    <div class="control-wrapper">
                        <label for="name" ><i class="fa fa-user fa-medium"></i></label>
                        姓名<input type="text" class="form-control" id="name" placeholder="输入姓名">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-xs-12">
                    <div class="control-wrapper">
                        <label for="sex" ><i class="fa fa-user fa-medium"></i></label>
                        性别<input type="text" class="form-control" id="sex" placeholder="输入性别">
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-12">
                    <div class="control-wrapper">
                        <label for="pwd1" ><i class="fa fa-lock fa-medium"></i></label>
                        密码 <input type="password" class="form-control" id="pwd1" placeholder="输入密码">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-12">
                    <div class="control-wrapper">
                        <label for="pwd2" ><i class="fa fa-lock fa-medium"></i></label>
                        密码<input type="password" class="form-control" id="pwd2" placeholder="再次输入密码">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-12">
                    <div class="control-wrapper">
                        <label for="idcard" ><i class="fa fa-lock fa-medium"></i></label>
                        身份证号码<input type="text" class="form-control" id="idcard" placeholder="输入身份证号">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-12">
                    <div class="control-wrapper">
                        <label for="phone" ><i class="fa fa-lock fa-medium"></i></label>
                        联系电话 <input type="text" class="form-control" id="phone" placeholder="输入联系电话">
                    </div>
                </div>
            </div>
            <div class="form-group ">
                <div class="col-md-12">
                    <div class="control-wrapper">
                        <div class="doc_tit hide">
                            <label for="phone" ><i class="fa fa-lock fa-medium"></i></label>
                            职称 <input type="text" class="form-control" id="title" placeholder="输入职称">
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-12">
                    <div class="control-wrapper">
                        <div class="dep_name hide">
                            <label for="phone" ><i class="fa fa-user fa-medium"></i></label>
                              科室<select   id="dname" name="dname" >
                            <option value="01儿科">01儿科</option>
                            <option value="02小儿呼吸科">02小儿呼吸科</option>
                            <option value="03小儿外科">03小儿外科</option>
                            <option value="04小儿内科">04小儿内科</option>
                            <option value="05小儿骨科">05小儿骨科</option>
                            <option value="06妇科">06妇科</option>
                            <option value="07产科">07产科</option>
                            <option value="08妇科内分泌">08妇科内分泌</option>
                            <option value="09妇泌尿科">09妇泌尿科</option>
                            <option value="10遗传咨询科">10遗传咨询科</option>
                            <option value="11神经外科">11神经外科</option>
                            <option value="12心血管外科">12心血管外科</option>
                            <option value="13胸外科">13胸外科</option>
                            <option value="14整形科">14整形科</option>
                            <option value="15泌尿外科">15泌尿外科</option>
                            <option value="16心血管内科">16心血管内科</option>
                            <option value="17神经内科">17神经内科</option>
                            <option value="18内分泌科">18内分泌科</option>
                            <option value="19消化内科">19消化内科</option>
                            <option value="20普通内科">20普通内科</option>
                            <option value="21耳鼻喉">21耳鼻喉</option>
                            <option value="22头颈外科">22头颈外科</option>
                            <option value="23口腔科">23口腔科</option>
                            <option value="24正畸科">24正畸科</option>
                            <option value="25牙周科">25牙周科</option>
                            <option value="26骨科">26骨科</option>
                            <option value="27脊柱外科">27脊柱外科</option>
                            <option value="28手外科">28手外科</option>
                            <option value="29创伤骨科">29创伤骨科</option>
                            <option value="30矫形骨科">30矫形骨科</option>
                            <option value="31肿瘤内科">31肿瘤内科</option>
                            <option value="32肿瘤外科">32肿瘤外科</option>
                            <option value="33肿瘤妇科">33肿瘤妇科</option>
                            <option value="34放疗科">34放疗科</option>
                            <option value="35肿瘤康复科">35肿瘤康复科</option>
                        </select>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-12">
                    <div class="control-wrapper">
                        <input  type="button" id="signup" value="注册" class="btn btn-info">
                        <input  type="button" id="dot_signup" value="医生注册" class="btn btn-info " style="display: none">
                    </div>
                </div>
            </div>



            <hr>

        </form>
    </div>
</div>
<div id="role">${role}</div>
</body>


<script src="/resources/lib/jquery-2.1.4.min.js"></script>
<script src="/resources/lib/layer/layer.js"></script>
<script src="/resources/lib/jquery.cookie.js"></script>
<script>
    $(function () {

        if($('#role').html()=="1"){
            $("#signup").hide();
            $(".dep_name").show();

            $("#dot_signup").show();
            $(".doc_tit").show();

        }
    });
</script>

<script>
    $(document).ready(function() {

        $('#signup,#dot_signup').click(function () {

            var name = $('#name').val();
            var sex = $('#sex').val();
            var pwd1 = $('#pwd1').val();
            var pwd2 = $('#pwd2').val();
            var idcard = $('#idcard').val();
            var phone = $('#phone').val();
            var title=$("#title").val();
            var dname=$("#dname").val();
            var dno=parseInt(dname.substr(0,2));
            console.log("click:",name,sex,pwd1,idcard,phone);

            if (name === undefined || name==="") {
                layer.msg("请输入姓名");
                return;
            }
            if (sex !="男" && sex!="女") {
                layer.msg("请输入正确性别");
                return;
            }

            if (pwd1 === undefined || pwd1==="") {
                layer.msg("请输入密码");
                return;
            }
            if (pwd2 !=pwd1 ) {
                layer.msg("两个密码不一致");
                return;
            }
            if (idcard.length!=15 && idcard.length!=18) {
                layer.msg("请输入正确身份证号码");
                return;
            }
            if (phone === undefined && phone.length!=11) {
                layer.msg("请输入正确联系电话");
                return;
            }
            var data ={
                "name": name,
                "sex": sex,
                "pwd": pwd1,
                "idcard":idcard,
                "phone":phone,
                "title":title,
                "dno":dno
            }


            //显示一个加载动画
            var index = layer.open({
                type:3,
                shade: 0,//0.1透明度的白色背景
                time:0
            });

            $.ajax({
                url: "/reg/RegistOpt",
                data: JSON.stringify(data),
                type: "POST",
                contentType: "application/json",
                dataType:"json",
                success: function (data) {
                    //关闭加载动画
                    layer.close(index);
                    if(data.code!=0){
                        layer.msg(data.msg);
                    }else {
                        //跳转到首页
                        layer.msg("注册成功！");
                        $.cookie("user",JSON.stringify(data.user),{path:"/"});
                        window.location.href="/index.jsp";
                    }
                },
                error:function () {
                    //关闭加载动画
                    layer.close(index);
                    layer.msg("请检查网络");
                }
            });
        });
    })

</script>


</html>