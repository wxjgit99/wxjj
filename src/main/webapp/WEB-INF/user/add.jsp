<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../res/lecheng/css/admin.css" rel="stylesheet"
	type="text/css" />
<link href="../res/common/css/theme.css" rel="stylesheet"
	type="text/css" />
<link href="../res/common/css/jquery.validate.css" rel="stylesheet"
	type="text/css" />
<link href="../res/common/css/jquery.treeview.css" rel="stylesheet"
	type="text/css" />
<link href="../res/common/css/jquery.ui.css" rel="stylesheet"
	type="text/css" />


<script type="text/javascript" src="js/DatePicker/WdatePicker.js"></script>
<script src="../res/common/js/jquery.js" type="text/javascript"></script>
<script src="../res/common/js/jquery.ext.js" type="text/javascript"></script>
<script src="../res/common/js/jquery.form.js" type="text/javascript"></script>
<script src="../res/common/js/lecheng.js" type="text/javascript"></script>
<script src="../res/lecheng/js/admin.js" type="text/javascript"></script>
<!-- 引入jQuery -->
<script type="text/javascript" language="javascript"
	src="js/jquery-1.11.0.min.js"></script>
<!-- 引入时间控件 -->
<script type="text/javascript" language="javascript"
	src="js/DatePicker/WdatePicker.js"></script>
<link rel="stylesheet" href="../res/css/style.css" />

<script type="text/javascript">

	//文档就绪事件
	$(function() {
		$("#dep1").change(function() {
			//清空第二个下拉框
			$("#dep2").empty();
			$.post("getdep.do", //提交的url	
			{
				pid:this.value
			},//jost类型数据 传值
			function(data) {
				//装载数据
				if (data!=null) {
					$(data).each(
						function(){
							//添加数据到第二个下拉框中
							$("#dep2").append("<option value="+this.id+">"+this.name+"</option>");
						}
					)
				}
			},//成功执行
			"json" //返回类型
			)
		}
			);
	});
	
	//文件上传
	function upload() {
		//ajax请求 局部提交
		//设置参数
		var args={
			//url绝对路径
			url:$("#path").val()+"/upload/common.do",
			//返回类型
			dataType:"text",
			//提交方式
			type:"post",
			success:function(result){
				//设置图片属性
				$("#img").attr("src",$("#path").val()+"/upload/"+result);
				//将路径设置到隐藏域中
				$("#pic").val(result);
			}
		}
		//表单局部提交
		$("#jvForm").ajaxSubmit(args);
	}

</script>

<title>babasport-add</title>
<script type="text/javascript">
	//用户名验证
	var CHKLOGINNAME = "^(?![0-9]+$)[a-zA-Z0-9]{2,16}$";
	//var CHKLOGINNAME = "/^[a-zA-Z0-9_-]{4,16}$/";^.*(?=.{6,})(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*? ]).*$
	//密码验证 密码强度正则，最少6位，包括至少1个大写字母，1个小写字母，1个数字，1个特殊字符
	var CHKPASSWORD = "^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{6,16}$";
	//出生日期验证
	var CHKDATE = " /^\d{4}(\-)\d{1,2}\1\d{1,2}$/";
	//邮箱验证
	var CHKEMAIL = "^[a-zA-Z0-9]+@[a-z0-9]{2,5}(\\.[a-z]{2,3}){1,2}$";
	//真实姓名验证
	var CHKREALNAME = "^[\u4E00-\u9FA5\uf900-\ufa2d·s]{2,20}$";

	
	//验证用户名方法
	function chkloginname() {

		//获取用户名
		var loginname = $("#loginname").val();
		//调用匹配用户的正则表达式
		var reg = new RegExp(CHKLOGINNAME);
		//获取用户名是否输入成功的元素对象			
		if (reg.test(loginname)) {
			if (chkExistLoginname(loginname)) {
				return true;
			} else {
				return false;
			}

		} else {
			$("#resultName").html("用户名不符合规范，请重新输入");
			$("#resultName").css("color", "red");
			$("#loginname").val("");
			$("#loginname").focus();
			return false;
		}
	}
	//检查用户名是否重复
	function chkExistLoginname(loginname) {
		var flag = false;
		$.ajax({
			//请求路径
			url : 'chkuser.do',
			//请求方式
			type : 'post',
			//请求参数
			data : 'type=1&loginname=' + loginname,
			//是否异步
			async : false,
			//预期服务器返回的数据类型
			dataType : 'text',
			//响应成功调用回调函数
			success : function(flag) {
				if (flag == 'true') {//没有重复
					$("#resultName").html("✔");
					$("#resultName").css("color", "green");
					flag = true;
				} else {
					$("#resultName").html("用户名已存在，请重输");
					$("#resultName").css("color", "red");
					$("#loginname").focus();
					flag = false;
				}
			},
			error : function() {
				alert("请求数据失败");
			}
		});
		return flag;
	}

	//验证密码
	/*function chkpassword(){
		//获取密码
		var pwdEle=document.getElementById("password");
		var password=pwdEle.value;
		//定义匹配用户名的正则表达式
		var reg=new RegExp(CHKPASSWORD);
		//获取密码是否输入成功的元素对象
		var spanEle=document.getElementById("resultPwd");
		if(reg.test(password)){
			spanEle.innerHTML="✔";
			spanEle.style.color="green";
			return true;
		}else{
			spanEle.innerHTML="密码必须包含数字和字母，并且不能低于六位";
			spanEle.style.color="red";
			//清空文本框
			pwdEle.value="";
			//重新聚焦
			pwdEle.focus();
			return false;
		}
	}*/
	//验证密码
	function chkpassword() {

		//获取用户名
		var password = $("#password").val();
		//调用匹配用户的正则表达式
		var reg = new RegExp(CHKPASSWORD);
		//获取用户名是否输入成功的元素对象			
		if (reg.test(password)) {
			$("#resultPwd").html("✔");
			$("#resultPwd").css("color", "green");
			return true;
		} else {
			$("#resultPwd").html("密码不符合规范，请重新输入111");
			$("#resultPwd").css("color", "red");
			$("#password").val("");
			$("#password").focus();
			return false;
		}
	}
	//验证两次密码是否一致
	function chkrepwd() {
		//获取密码框内容
		var password = $("#password").val();
		//获取确认密码框内容 
		var repwd = $("#repwd").val();
		//当第一次输入的密码框为空时  确认密码 不可以输入
		if (password == "") {
			$("#resultRepwd").html("请先输入第一次密码，按顺序来");
			$("#resultRepwd").css("color", "red");
			//从新聚焦
			$("#password").focus();
			//清空文本框
			$("#password").val("");
			return false;
		} else if (repwd == password) {

			$("#resultRepwd").html("✔");
			$("#resultRepwd").css("color", "green");
			return true;
		} else {

			$("#resultRepwd").html("两次密码不一致请重新输入");
			$("#resultRepwd").css("color", "red");
			//清空文本框
			$("#repwd").val("");
			//从新聚焦
			$("#repwd").focus();
			return false;
		}

	}

	//验证真实姓名
	function chkrealname() {

		//获取用户真实名
		var lgEle = $("#realname").val();
		//调用匹配用户真实姓名的正则表达式
		var reg = new RegExp(CHKREALNAME);
		//判断是否验证成功
		if (reg.test(lgEle)) {//表示输入正确
			$("#resultrealname").html("✔");
			$("#resultrealname").css("color", "green");
			return true;
		} else {//输入错误 
			$("#resultrealname").html("真实姓名不符合规范");
			$("#resultrealname").css("color", "red");
			$("#realname").val("");
			$("#realname").focus();
			return false;
		}
	}

	//检查邮箱是否重复
	function chkExistEmail(email) {

		var flag = false;
		$.ajax({
			//请求路径
			url : 'chkuser.do',
			//请求方式
			type : 'post',
			//请求参数
			data : 'type=2&email=' + email,
			//是否异步
			async : false,
			//预期服务器返回的数据类型
			dataType : 'text',
			//响应成功调用回调函数
			success : function(flag) {
				if (flag == 'true') {//没有重复
					$("#resultemail").html("✔");
					$("#resultemail").css("color", "green");
					flag = true;
				} else {
					$("#resultemail").html("邮箱已被注册，请重输");
					$("#resultemail").css("color", "red");
					$("#email").focus();
					flag = false;
				}
			},
			error : function() {
				alert("请求数据失败");
			}
		});
		return flag;
	}
	//验证邮箱
	function chkemail() {
		var email = $("#email").val();
		//定义匹配用户名的正则表达式
		var reg = new RegExp(CHKEMAIL);
		if (reg.test(email)) {
			if (chkExistEmail(email)) {
				return true;
			} else {
				return false;
			}

		} else {
			$("#resultemail").html("email不符合规范");
			$("#resultemail").css("color", "red");
			$("#email").val("");
			$("#email").focus();
			return false;
		}
	}
	//所有条件都满足 才可以提交数据

</script>

<style type="">
.h2_ch a:hover, .h2_ch a.here {
	color: #FFF;
	font-weight: bold;
	background-position: 0px -32px;
}

.h2_ch a {
	float: left;
	height: 32px;
	margin-right: -1px;
	padding: 0px 16px;
	line-height: 32px;
	font-size: 14px;
	font-weight: normal;
	border: 1px solid #C5C5C5;
	background: url('../res/lecheng/img/admin/bg_ch.gif') repeat-x scroll 0%
		0% transparent;
}

a {
	color: #06C;
	text-decoration: none;
}
</style>

</head>
<body>
<input type="hidden" id="path" value="${pageContext.request.contextPath }" />
	<div class="box-positon">
		<div class="rpos">当前位置: 用户管理 - 添加</div>
		<form class="ropt">
			<input type="submit"
				onclick="this.form.action='list.do?currentPagecurrentPage=1';"
				value="返回列表" class="return-button" />
		</form>
		<div class="clear"></div>
	</div>

	<div class="body-box" style="float: right">
		<form id="jvForm" action="add.do" method="post" enctype="multipart/form-data">
			<table cellspacing="1" cellpadding="2" width="100%" border="0"
				class="pn-ftable">
				<tbody id="tab_1">
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h"><span
							class="pn-frequired"></span> <span class="pn-frequired"></span></td>
					</tr>
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h"><span
							class="pn-frequired">*</span> 登录名:</td>
						<td width="80%" class="pn-fcontent"><input type="text"
							name="loginname"  id="loginname" onblur="chkloginname()" /> <span
							id="resultName"></span></td>
					</tr>
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h"><span
							class="pn-frequired">*</span> 密码:</td>
						<td width="80%" class="pn-fcontent"><input type="text"
							name="password" id="password" onblur="chkpassword()" /> <span
							id="resultPwd"></span></td>
					</tr>
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h">确认密码:</td>
						<td width="80%" class="pn-fcontent"><input type="text"
							name="repwd" onblur="chkrepwd()" id="repwd" /> <span
							id="resultRepwd"></span></td>
					</tr>
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h">真实姓名:</td>
						<td width="80%" class="pn-fcontent"><input type="text"
							value="" onblur="chkrealname()" class="required" id="realname"
							name="realname" maxlength="10" /> <span id="resultrealname"></span>
						</td>
					</tr>
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h"><span
							class="pn-frequired">*</span> 性别:</td>
						<td width="80%" class="pn-fcontent"><input type="radio"
							checked="checked" name="sex" value="男" />男 <input type="radio"
							name="sex" id="" value="女" />女</td>
					</tr>
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h">出生日期:</td>
						<td width="80%" class="pn-fcontent"><input type="text"
							name="birthday" id="birthday" maxlength="80" class="Wdate" onclick="WdatePicker()" /></td>
					</tr>
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h">email:</td>
						<td width="80%" class="pn-fcontent"><input type="text"
							value="" onblur="chkemail()" name="email" id="email" /> <span
							id="resultemail"></span></td>
					</tr>


					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h">部门名称</td>
						<td width="80%" class="pn-fcontent">
						<select id="dep1" name="dep1">
								<c:forEach items="${DLIST}" var="dep1">
									<option value="${dep1.id }">${dep1.name }</option>
								</c:forEach>

						</select> 
						<select id="dep2" name="dept.id">
								<c:forEach items="${DLIST2}" var="dep2">
									<option value="${dep2.id }">${dep2.name }</option>
								</c:forEach>

						</select></td>
					</tr>
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h">
						头像</td><td width="80%" class="pn-fcontent">
							<input type="file" name="file" onchange="upload()" />
							<img id="img" width="150px" height="150px"/>
							<input type="hidden" id="pic" name="pic"  />
						</td>
					</tr>
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h">是否可用:</td>
						<td width="80%" class="pn-fcontent"><input type="radio"
							value="1" name="enabled" checked="checked" />可用 <input
							type="radio" value="2" name="enabled" />不可用</td>
				</tbody>
				<tbody id="tab_2" style="display: none">
					<tr>
						<td><textarea rows="10" cols="10" id="productdesc"
								name="description"></textarea></td>
					</tr>
				</tbody>
				<tbody id="tab_3" style="display: none">
					<tr>
						<td><textarea rows="15" cols="136" id="productList"
								name="packageList"></textarea></td>
					</tr>
				</tbody>
				<tbody>
					<tr>
						<td class="pn-fbutton" colspan="2"><input type="submit"
							class="submit" value="提交" /> &nbsp; <input type="reset"
							class="reset" value="重置" /></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>