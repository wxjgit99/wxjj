<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href=" ../res/lecheng/css/admin.css" rel="stylesheet"
	type="text/css" />
<link href=" ../res/common/css/theme.css" rel="stylesheet"
	type="text/css" />
<link href=" ../res/common/css/jquery.validate.css" rel="stylesheet"
	type="text/css" />
<link href="../res/common/css/jquery.treeview.css" rel="stylesheet"
	type="text/css" />
<link href="../res/common/css/jquery.ui.css" rel="stylesheet"
	type="text/css" />

<!-- 引时间控件 -->
<script type="text/javascript" src=" js/DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src=" res/fckeditor/fckeditor.js"></script>
<script src=" ../res/common/js/jquery.js" type="text/javascript"></script>
<script src=" res/common/js/jquery.ext.js" type="text/javascript"></script>
<script src=" res/common/js/jquery.form.js" type="text/javascript"></script>
<script src=" res/common/js/lecheng.js" type="text/javascript"></script>
<script src=" res/lecheng/js/admin.js" type="text/javascript"></script>
<!-- 引入jQuery -->
<script type="text/javascript" language="javascript"
	src="js/jquery-1.11.0.min.js"></script>
<!-- 引入时间控件 -->
<script type="text/javascript" language="javascript"
	src="js/DatePicker/WdatePicker.js"></script>
<link rel="stylesheet" href=" res/css/style.css" />

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
</script>





<title>babasport-add</title>

<script type="text/javascript">
	//用户名验证
	var CHKLOGINNAME = "^(?![0-9]+$)[a-zA-Z0-9]{6,16}$";

	var CHKDATE = " /^\d{4}(\-)\d{1,2}\1\d{1,2}$/";
	//邮箱验证
	var CHKEMAIL = "^[a-zA-Z0-9]+@[a-z0-9]{2,5}(\\.[a-z]{2,3}){1,2}$";
	//真实姓名验证
	var CHKREALNAME = "^[\u4E00-\u9FA5\uf900-\ufa2d·s]{2,20}$";

	//验证用户名方法
	function chkloginname() {

		//获取用户名
		var lgEle = document.getElementById("loginname");
		var loginname = lgEle.value;
		//调用匹配用户的正则表达式
		var reg = new RegExp(CHKLOGINNAME);
		//获取用户名是否输入成功的元素对象			
		var spanEle = document.getElementById("resultName");
		if (reg.test(loginname)) {//表示输入正确
			if (chkExistUSER(loginname)) {
				return true;
			} else {
				return false;
			}
			return true;
		} else {//输入错误
			spanEle.innerHTML = "用户名不符合规范，请重新输入";
			spanEle.style.color = "red";
			lgEle.value = "";
			lgEle.focus();
			return false;
		}
	}

	//验证登录名是否重复
	function chkExistUSER(loginname) {
		var flag = false;
		$.ajax({
			//请求路径
			url : 'chkUSER.do',
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
				alert("数据请求失败");
			}
		});
	}
	//验证邮箱
	function chkemail() {
		var emailEle = document.getElementById("email");
		var email = emailEle.value;
		//定义匹配用户名的正则表达式
		var reg = new RegExp(CHKEMAIL);
		//获取邮箱是否输入成功的元素对象
		var spanEle = document.getElementById("resultemail");
		if (reg.test(email)) {
			spanEle.innerHTML = "✔";
			spanEle.style.color = "green";
			return true;
		} else {
			spanEle.innerHTML = "您输入的邮箱格式有误，请查证后重新输入";
			spanEle.style.color = "red";
			//清空文本框
			emailEle.value = "";
			//重新聚焦
			emailEle.focus();
			return false;
		}
	}

	//验证真实姓名
	function chkrealname() {

		//获取用户真实名
		var lgEle = document.getElementById("realname");
		var realname = lgEle.value;
		//调用匹配用户真实姓名的正则表达式
		var reg = new RegExp(CHKREALNAME);
		//获取用户真实姓名 是否输入成功的元素对象			
		var spanEle = document.getElementById("resultrealname");
		if (reg.test(realname)) {//表示输入正确
			spanEle.innerHTML = "✔";
			spanEle.style.color = "green";
			return true;
		} else {//输入错误 
			spanEle.innerHTML = "真实姓名不得低于两个字，请重新输入";
			spanEle.style.color = "red";
			lgEle.value = "";
			lgEle.focus();
			return false;
		}
	}
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
	background: url(' res/lecheng/img/admin/bg_ch.gif') repeat-x scroll 0%
		0% transparent;
}

a {
	color: #06C;
	text-decoration: none;
}
</style>

</head>
<body>
	<div class="box-positon">
		<div class="rpos">当前位置: 用户管理 - 修改</div>
		<form class="ropt">
			<input type="submit" onclick="this.form.action='USERlist.do';"
				value="返回列表" class="return-button" />
		</form>
		<div class="clear"></div>
	</div>

	<div class="body-box" style="float: right">
		<form id="jvForm" action="update.do?id=${USER.id }" method="post">
			<table cellspacing="1" cellpadding="2" width="100%" border="0"
				class="pn-ftable">
				<tbody id="tab_1">
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h"><span
							class="pn-frequired"></span> <span class="pn-frequired">${msg
								}</span></td>
					</tr>
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h"><span
							class="pn-frequired">*</span> 登录名:</td>
						<td width="80%" class="pn-fcontent"><input type="text"
							onblur="chkloginname()" name="loginname" id="loginname"
							value="${USER.loginname }" /> <span id="resultName"></span></td>
					</tr>

					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h">真实姓名:</td>
						<td width="80%" class="pn-fcontent"><input type="text"
							value="${USER.realname }" class="required" name="realname"
							id="realname" maxlength="10" onblur="chkrealname()" /> <span
							id="resultrealname"></span></td>
					</tr>
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h">性别:</td>
						<td width="80%" class="pn-fcontent"><c:if
								test="${USER.sex=='男'}">
								<input type="radio" name="sex" value="男" checked="checked" />男
							<input type="radio" name="sex" value="女" />女
						</c:if> <c:if test="${USER.sex=='女'}">
								<input type="radio" name="sex" value="男" />男
							<input type="radio" name="sex" value="女" checked="checked" />女
						</c:if></td>
					</tr>
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h">出生日期:</td>
						<td width="80%" class="pn-fcontent"><input type="text"
							name="birthday" maxlength="80" value="${USER.birthdaytxt }"
							class="Wdate" onclick="WdatePicker()" /></td>
					</tr>
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h">email:</td>
						<td width="80%" class="pn-fcontent"><input type="text"
							value="${USER.email }" onblur="chkemail()" id="email"
							name="email" /> <span id="resultemail"></span></td>
					</tr>


					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h">部门:</td>
						<td width="80%" class="pn-fcontent">
						<select name="dep1" id="dep1">
								<c:forEach items="${DLIST }" var="dep1">
									<!-- 该用户所在 部门的上级部门id=一级部门id 默认选择 -->
									<c:if test="${USER.dept.pid==dep1.id }">
										<option value="${dep1.id }" selected="selected">${dep1.name }</option>
									</c:if>
									<c:if test="${USER.dept.pid!=dep1.id }">
										<option value="${dep1.id }">${dep1.name }</option>
									</c:if>
								</c:forEach>
						</select> 
						<select name="dept.id" id="dep2">
								<c:forEach items="${DLIST2 }" var="dep2">
									<c:if test="${USER.dept.id==dep2.id }">
										<option value="${dep2.id }" selected="selected" >${dep2.name }</option>
									</c:if>
									<c:if test="${USER.dept.id!=dep2.id }">
										<option value="${dep2.id }" >${dep2.name }</option>
									</c:if>
								</c:forEach>
						</select>
						</td>
					</tr>

					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h"></td>
						<td width="80%" class="pn-fcontent"><c:if
								test="${USER.isenabled==1 }">
								<input type="hidden" value="1" name="enabled" checked="checked" />
								<input type="hidden" value="2" name="enabled" />
							</c:if> <c:if test="${USER.isenabled==2 }">
								<input type="radio" value="1" name="enabled" />
								<input type="radio" value="2" name="enabled" checked="checked" />
							</c:if></td>
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