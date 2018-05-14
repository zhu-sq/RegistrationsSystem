<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script type="text/javascript">
$(function () {
var Uname=$.cookie("user.name");
console.log(Uname);
if(Uname!=null ){
$(".Username").html(Uname );
$(".loginArea").show();
$(".rightArea").hide();
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
</script>