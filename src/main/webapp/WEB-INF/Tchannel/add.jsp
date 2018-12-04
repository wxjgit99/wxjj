<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<link href="res/lecheng/css/admin.css" rel="stylesheet" type="text/css" />
<link href="res/common/css/theme.css" rel="stylesheet" type="text/css" />
<link href="res/common/css/jquery.validate.css" rel="stylesheet"
	type="text/css" />
<link href="res/common/css/jquery.treeview.css" rel="stylesheet"
	type="text/css" />
<link href="res/common/css/jquery.ui.css" rel="stylesheet"
	type="text/css" />

<!-- <script src="/thirdparty/ckeditor/ckeditor.js" type="text/javascript"></script> -->
<!-- <script src="/thirdparty/My97DatePicker/WdatePicker.js" type="text/javascript"></script> -->
<script type="text/javascript" src="../res/fckeditor/fckeditor.js"></script>
<script src="res/common/js/jquery.js" type="text/javascript"></script>
<script src="res/common/js/jquery.ext.js" type="text/javascript"></script>
<script src="res/common/js/jquery.form.js" type="text/javascript"></script>
<script src="res/common/js/lecheng.js" type="text/javascript"></script>
<script src="res/lecheng/js/admin.js" type="text/javascript"></script>

<link rel="stylesheet" href="../res/css/style.css" />






<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>channel-add</title>
<script type="text/javascript">
	//频道名称验证
	var CHKNAME = "^[\u4E00-\u9FA5\uf900-\ufa2d·s]{2,}$";
	function chkpname() {
		//获取频道名称的文本框
		var pname = document.getElementById("pname").value;
		
		//获取提示标签
		var spanEle = document.getElementById("spanP");
		var reg = new RegExp(CHKNAME);
		if (reg.test(pname)) {
			spanEle.innerHTML = "✔";

			spanEle.style.color = "green";
			return true;
		} else {
			spanEle.innerHTML = "频道名称不符合规范";

			spanEle.style.color = "red";
			pname.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<div class="box-positon">
		<div class="rpos">当前位置: 频道管理 - 添加</div>
		<form class="ropt">
			<input type="submit" onclick="this.form.action='chlist.do';"
				value="返回列表" class="return-button" />
		</form>
		<div class="clear"></div>
	</div>
	<div class="body-box" style="float: right">
		<form id="jvForm" action="addch.do" method="post">
			<table cellspacing="1" cellpadding="2" width="100%" border="0"
				class="pn-ftable">
				<tbody>
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h"><span
							class="pn-frequired">${msg }</span></td>
					</tr>
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h"><span
							class="pn-frequired">*</span> 频道名称:</td>
						<td width="80%" class="pn-fcontent"><input type="text"
							class="required" name="cname" onblur="chkpname()" id="pname" maxlength="100" /> <span
							id="spanP"></span></td>
					</tr>

					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h"><span
							class="pn-frequired">*</span> 所属频道:</td>
						<td width="80%" class="pn-fcontent"><select name="pid">
								<c:forEach items="${cc}" var="achans">
									<option value="${achans.id}" name="id">${achans.cname}</option>
								</c:forEach>
						</select></td>
					</tr>
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h"><span
							class="pn-frequired">*</span> 频道级别:</td>
						<td width="80%" class="pn-fcontent">
						<input type="radio" class="required" name="lev" value="1" maxlength="100" checked="checked" />一级
						<input type="radio" class="required" name="lev" value="2" maxlength="100" />二级
						</td>
					</tr>
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h"><span
							class="pn-frequired">*</span> 是否叶子:</td>
						<td width="80%" class="pn-fcontent">
						<input type="radio" class="required" name="isleaf" value="1" checked="checked" />是
						<input type="radio" class="required" name="isleaf" value="2" />否</td>
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