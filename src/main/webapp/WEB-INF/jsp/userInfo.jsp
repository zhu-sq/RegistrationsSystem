<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>

<button id="btn-get">按钮</button>
</body>



<script src="/resources/lib/jquery-2.1.4.min.js"></script>
<script src="/resources/lib/layer/layer.js"></script>
<script>
    $(document).ready(function() {
        $('#btn-get').click(function () {
            var data ={
                'startDate': '2018-04-30 08:00:00',
                'endDate': '2018-04-30 09:00:00'
            }

            $.ajax({
                url: "/pri/shift/getShiftByDate",
                data: JSON.stringify(data),
                type: "POST",
                contentType: "application/json",
                dataType:"json",
                success: function (data) {
                    //关闭加载动画
                    layer.close(index);
                    if(data.code!==0){
                        layer.msg("账号密码不正确");
                    }else{
                        //跳转到首页
                        layer.msg("登录成功");
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
