<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link href="resources/index/css/reset.css" rel="stylesheet" type="text/css"/>
	<link href="resources/index/css/main.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="/resources/lib/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="/resources/lib/jquery.cookie.js"></script>
	<script src="/resources/lib/layer/layer.js"></script>

</head>

<body>
<div class="top">
	<div class="topBar">
		<div class="comWidth">
			<div class="rightArea ">
				您好！请 <a href="/login">登录</a> | <a href="#">注册</a>
			</div>
			<div class="loginArea hide " >欢迎你！<p class="Username"></p>&nbsp&nbsp<a id="logout" href="#">退出登录</a>&nbsp&nbsp<a href="#">个人信息</a> </div>
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
				<div class="Depatrment_show">
					<ul>
						<li class="dep_item "><b>儿科</b> &nbsp&nbsp&nbsp小儿感冒 抽动症</li>

						<li class="dep_item"><b>妇产科</b> &nbsp&nbsp&nbsp阴道炎 不孕不育</li>

						<li class="dep_item" ><b>外科</b> &nbsp&nbsp&nbsp肾结石 脑外伤</li>

						<li class="dep_item"><b>内科</b> &nbsp&nbsp&nbsp高血压 冠心病</li>

						<li class="dep_item"><b>五官科</b> &nbsp&nbsp&nbsp白内障 近视</li>

						<li class="dep_item"><b>骨外科</b> &nbsp&nbsp&nbsp关节炎 骨折</li>

						<li class="dep_item"><b>肿瘤科</b> &nbsp&nbsp&nbsp癌痛</li>
					</ul>
				</div>
				<div class="Dep_list ">
					<div class="Deplist_item  hide">
						<dt>儿科</dt>
						<dd>
							<a href="#" id="dep_01">儿科</a><a href="#" id="dep_02">小儿呼吸科</a><a href="#" id="dep_03">小儿外科</a><a href="#" id="dep_04">小儿内科</a><a href="#" id="dep_05">小儿骨科</a>
						</dd>
						<br>
						<dt>儿科常见疾病</dt>
						<dd>
							<a href="#">小儿肺炎</a><a href="#">小儿感冒</a><a href="#">小儿咳嗽</a><a href="#">小儿腹泻</a><a href="#">儿童白血病</a><a href="#">小儿哮喘</a><a href="#">新生儿疾病</a>
						</dd>
					</div>
					<div class="Deplist_item  hide">
						<dt>妇产科</dt>
						<dd>
							<a href="#" id="dep_06">妇科</a><a href="#" id="dep_07">产科</a><a href="#" id="dep_08">妇科内分泌</a><a href="#" id="dep_09">妇泌尿科</a><a href="#" id="dep_10">遗传咨询科</a>
						</dd>
						<br>
						<dt>妇产科常见疾病</dt>
						<dd>
							<a href="#">不孕不育</a><a href="#">输卵管堵塞</a><a href="#">阴道炎</a><a href="#">宫颈癌</a><a href="#">月经失调</a><a href="#">宫外孕</a><a href="#">宫颈炎</a>
						</dd>
					</div>
					<div class="Deplist_item  hide">
						<dt>外科</dt>
						<dd>
							<a href="#" id="dep_11">神经外科</a><a href="#" id="dep_12">心血管外科</a><a href="#" id="dep_13">胸外科</a><a href="#" id="dep_14">整形科</a><a href="#" id="dep_15">泌尿外科</a>
						</dd>
						<br>
						<dt>外科常见疾病</dt>
						<dd>
							<a href="#">脑膜瘤</a><a href="#">脑肿瘤</a><a href="#">脑动脉瘤</a><a href="#">脑血管畸形</a><a href="#">脑梗塞</a><a href="#">三叉神经痛</a><a href="#">小儿癫痫</a>
						</dd>
					</div>
					<div class="Deplist_item  hide">
						<dt>内科</dt>
						<dd>
							<a href="#" id="dep_16">心血管内科</a><a href="#" id="dep_17">神经内科</a><a href="#" id="dep_18">内分泌科</a><a href="#" id="dep_19">消化内科</a><a href="#" id="dep_20">普通内科</a>
						</dd>
						<br>
						<dt>内科常见疾病</dt>
						<dd>
							<a href="#">冠心病</a><a href="#">高血压</a><a href="#">先天性心脏病</a><a href="#">心绞痛</a><a href="#">脑梗塞</a><a href="#">心律失常</a><a href="#">心衰</a>
						</dd>
					</div>
					<div class="Deplist_item  hide">
						<dt>五官科</dt>
						<dd>
							<a href="#" id="dep_21">耳鼻喉</a><a href="#" id="dep_22">头颈外科</a><a href="#" id="dep_23">口腔科</a><a href="#" id="dep_24">正畸科</a><a href="#" id="dep_25">牙周科</a>
						</dd>
						<br>
						<dt>五官科常见疾病</dt>
						<dd>
							<a href="#">牙颌畸形</a><a href="#">牙痛</a><a href="#">下颌关节病</a><a href="#">面部损伤</a><a href="#">口腔溃疡</a><a href="#">牙周炎</a><a href="#">面部囊肿</a>
						</dd>
					</div>
					<div class="Deplist_item  hide">
						<dt>骨外科</dt>
						<dd>
							<a href="#" id="dep_26">骨科</a><a href="#" id="dep_27">脊柱外科</a><a href="#" id="dep_28">手外科</a><a href="#" id="dep_29">创伤骨科</a><a href="#" id="dep_30">矫形骨科</a>
						</dd>
						<br>
						<dt>骨外科常见疾病</dt>
						<dd>
							<a href="#">骨折</a><a href="#">腰椎间盘突出</a><a href="#">颈椎病</a><a href="#">膝关节损伤</a><a href="#">腰椎管狭窄</a><a href="#">骨质增生</a><a href="#">关节炎</a>
						</dd>
					</div>
					<div class="Deplist_item  hide">
						<dt>肿瘤科</dt>
						<dd>
							<a href="#" id="dep_31">肿瘤内科</a><a href="#" id="dep_32">肿瘤外科</a><a href="#" id="dep_33">肿瘤妇科</a><a href="#" id="dep_34">放疗科</a><a href="#" id="dep_35">肿瘤康复科</a>
						</dd>
						<br>
						<dt>肿瘤科常见疾病</dt>
						<dd>
							<a href="#">癌痛</a><a href="#">葡萄胎</a><a href="#">绒毛膜癌</a><a href="#">骨肉瘤</a><a href="#">骨癌</a><a href="#">软骨瘤</a><a href="#">骨瘤</a>
						</dd>
					</div>

				</div>
			</div>
			<ul class="nav fl" >
				<li><a href="#" ><b>按科室挂号</b></a></li>
				<li><a href="#"><b>按医生挂号</b></a></li>
			</ul>
		</div>
	</div>
</div>
<div class="Banner comWidth clearfix">
	<div id="banner_bar">
		<ul >
			<li><img src="resources/index/img/banner.jpg" alt="banner"></li>
			<li><img src="resources/index/img/banner2.png" alt="banner"></li>
			<li><img src="resources/index/img/banner3.jpg" alt="banner"></li>
		</ul>
		<ol>
			<li class="active">1</li>
			<li >2</li>
			<li>3</li>
		</ol>
	</div>
</div>

<div id="bottomBar"></div>
<script type="text/javascript">

    $(function () {
        $(".Depatrment_show li").mouseover(function () {
            $(this).addClass("Dep_active").siblings().removeClass("Dep_active");
            $(".Deplist_item").eq($(".Depatrment_show li").index(this)).show().siblings(".Deplist_item").hide();

        })
        $(".Depatrment_show li").mouseout(function () {
            $(this).removeClass("Dep_active");
            $(".Deplist_item").eq($(".Depatrment_show li").index(this)).hide();
        })
    });
    $(document).ready(function () {
        $("#banner_bar ol li").mouseover(function (event) {
            var index=$(this).index();
            $("#banner_bar ul li").eq(index).fadeIn().siblings().fadeOut();
            $(this).addClass("active").siblings().removeClass("active");
        })
    });
    $(function(){
        $(".dep_item").mouseover(function(){
            $(this).addClass("active").siblings().removeClass("active");
            $("#docter .mod").eq($(".dep_item").index(this)).show().siblings("#docter .mod").hide();
        });
    });
    $(function () {
        var Uname=$.cookie("name");
        if(Uname!=null ){
            $(".loginArea.Username").text("Uname" );
            $(".loginArea").show();
            $(".rightArea").hide();
        }
    });
    $("#logout").click(function () {

        layer.confirm('确定退出登录？', {
            btn: ['确定','取消'] //按钮
        }, function(){

            $.ajax({
                url: "~/logout",
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
                        $(".rightArea").show();
                        $(".loginArea").hide();
                    }
                }
            })
        }, function(){
            layer.close();
        });
    });
  function depno() {
      var dnoss = $(this).attr("id");
      var d = dnos.substr(dnos.length - 2);
      alert(d);
      var url="/shift/getByDnoUno?dno="+d;
      window.open(url);
  }

</script>
</body>
</html>