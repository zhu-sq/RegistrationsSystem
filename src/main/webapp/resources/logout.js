
$(function () {
    var user = JSON.parse($.cookie("user"));
        console.log(user);
        if(user!=null ){
            $(".Username").html(user.name);
            $(".loginArea").show();
            $(".rightArea").hide();
        }
        if(user.role==1){
            var html='<a href="/reg">注册</a>';
            $(".loginArea").append(html);
        }

    });
    $("#logout").click(function () {

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
                        layer.msg;
                        {
                            "退出失败"
                        }
                    } else {
                        layer.msg('退出成功', {icon: 1});
                        $.cookie("user", "", {expires: -1});
                        $(".rightArea").show();
                        $(".loginArea").hide();
                    }
                }
            })
        }, function(){
            layer.close();
        });
    });
