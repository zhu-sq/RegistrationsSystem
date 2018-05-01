<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link href="resources/index/css/reset.css" rel="stylesheet" type="text/css"/>
	<link href="resources/index/css/main.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="resources/lib/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">

        $(function () {
			$(".Dep_item").mouseover(function () {
				$(this).addClass("Dep_active").siblings().removeClass("Dep_active");
				$(".Deplist_item").eq($(".Dep_item").index(this)).show().siblings(".Deplist_item").hide();

            })
            $(".Dep_item").mouseout(function () {
                $(this).removeClass("Dep_active");
                $(".Deplist_item").eq($(".Dep_item").index(this)).hide();
            })
        })
                $(document).ready(function () {
                    $("#banner_bar ol li").mouseover(function (event) {
                        var index=$(this).index();
                        $("#banner_bar ul li").eq(index).fadeIn().siblings().fadeOut();
                        $(this).addClass("active").siblings().removeClass("active");
                    })
                })
                $(function(){
                    $(".dep_doc li").mouseover(function(){
                        $(this).addClass("active").siblings().removeClass("active");
                        $("#docter .mod").eq($(".dep_doc li").index(this)).show().siblings("#docter .mod").hide();
                    });
                });
</script>
</head>

<body>
<div class="top">
	<div class="topBar">
		<div class="comWidth">

			<div class="rightArea">
				您好！请 <a href="/login">登录</a> | <a href="/regis">注册</a>
			</div>
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
			<div class="search_box fr">
				<input type="text" maxlength="50" class="search_text" placeholder="请输入科室名或医生名"/>
				<input type="button" value="搜索" class="search_btn">
			</div>

		</div>
	</div>
	<div class="navBox">
		<div class="comWidth">
			<div class="allDepatrment fl" >
				<h3>全部科室<i></i></h3>
				<div class="Depatrment_show">
					<dl class="Dep_item  " /*onmouseover="tabSwitch(this)"*/>
						<dt ><b>儿科</b> &nbsp&nbsp&nbsp小儿感冒 抽动症</dt>
					</dl>
					<dl class="Dep_item" >
						<dt ><b>妇产科</b> &nbsp&nbsp&nbsp阴道炎 不孕不育</dt>
					</dl>
					<dl class="Dep_item" >
						<dt ><b>外科</b> &nbsp&nbsp&nbsp肾结石 脑外伤</dt>
					</dl>
					<dl class="Dep_item" >
						<dt ><b>内科</b> &nbsp&nbsp&nbsp高血压 冠心病</dt>
					</dl>
					<dl class="Dep_item" >
						<dt ><b>五官科</b> &nbsp&nbsp&nbsp白内障 近视</dt>
					</dl>
					<dl class="Dep_item" >
						<dt ><b>骨外科</b> &nbsp&nbsp&nbsp关节炎 骨折</dt>
					</dl>
					<dl class="Dep_item">
						<dt ><b>肿瘤科</b> &nbsp&nbsp&nbsp癌痛</dt>
					</dl>

				</div>
				<div class="Dep_list ">
					<div class="Deplist_item  hide">
						<dt>儿科</dt>
						<dd>
							<a href="#">儿科</a><a href="#">小儿呼吸科</a><a href="#">小儿外科</a><a href="#">小儿内科</a><a href="#">小儿骨科</a>
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
							<a href="#">妇科</a><a href="#">产科</a><a href="#">妇科内分泌</a><a href="#">妇泌尿科</a><a href="#">遗传咨询科</a>
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
							<a href="#">神经外科</a><a href="#">心血管外科</a><a href="#">胸外科</a><a href="#">整形科</a><a href="#">泌尿外科</a>
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
							<a href="#">心血管内科</a><a href="#">神经内科</a><a href="#">内分泌科</a><a href="#">消化内科</a><a href="#">普通内科</a>
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
							<a href="#">耳鼻喉</a><a href="#">头颈外科</a><a href="#">口腔科</a><a href="#">正畸科</a><a href="#">牙周科</a>
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
							<a href="#">骨科</a><a href="#">脊柱外科</a><a href="#">手外科</a><a href="#">创伤骨科</a><a href="#">矫形骨科</a>
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
							<a href="#">肿瘤内科</a><a href="#">肿瘤外科</a><a href="#">肿瘤妇科</a><a href="#">放疗科</a><a href="#">肿瘤康复科</a>
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
<br>
<br>
<div class="doc_search comWidth ">
	<div class="left_title">找医生</div>
	<ul class="dep_doc">
		<li class="active"><a href="#"> 儿科</a></li>
		<li><a href="#">妇产科</a> </li>
		<li><a href="#">外科</a> </li>
		<li><a href="#">内科</a> </li>
		<li><a href="#">五官科</a> </li>
		<li><a href="#">骨外科</a> </li>
		<li><a href="#">肿瘤科</a> </li>
	</ul>
	<div id="docter">
		<div class="mod">
			<ul>
				<li><img src="resources/index/img/doct.jpg"></li>
				<li>儿科主任</li>
			</ul>
			<ul>
				<li><img src="resources/index/img/doct.jpg"></li>
				<li>儿科副主任</li>
			</ul>
		</div>
		<div class="mod" style="display: none">
			<ul>
				<li><img src="resources/index/img/doct.jpg"></li>
				<li>妇产科主任</li>

			</ul>
			<ul>
				<li><img src="resources/index/img/doct.jpg"></li>
				<li>妇产科副主任</li>

			</ul>
		</div>
		<div class="mod"style="display: none">
			<ul>
				<li><img src="resources/index/img/doct.jpg"></li>
				<li>外科主任</li>

			</ul>
			<ul>
				<li><img src="resources/index/img/doct.jpg"></li>
				<li>外科副主任</li>

			</ul>
		</div>
		<div class="mod"style="display: none">
			<ul>
				<li><img src="resources/index/img/doct.jpg"></li>
				<li>内科主任</li>

			</ul>
			<ul>
				<li><img src="resources/index/img/doct.jpg"></li>
				<li>内科副主任</li>

			</ul>
		</div>
		<div class="mod"style="display: none">
			<ul>
				<li><img src="resources/index/img/doct.jpg"></li>
				<li>五官科主任</li>

			</ul>
			<ul>
				<li><img src="resources/index/img/doct.jpg"></li>
				<li>五官科副主任</li>

			</ul>
		</div>
		<div class="mod"style="display: none">
			<ul>
				<li><img src="resources/index/img/doct.jpg"></li>
				<li>骨外科主任</li>

			</ul>
			<ul>
				<li><img src="resources/index/img/doct.jpg"></li>
				<li>骨外科副主任</li>

			</ul>
		</div>
		<div class="mod"style="display: none">
			<ul>
				<li><img src="resources/index/img/doct.jpg"></li>
				<li>肿瘤科主任</li>

			</ul>
			<ul>
				<li><img src="resources/index/img/doct.jpg"></li>
				<li>肿瘤科副主任</li>

			</ul>
		</div>
	</div>
</div>
<br>
<div id="bottomBar"></div>
</body>
</html>