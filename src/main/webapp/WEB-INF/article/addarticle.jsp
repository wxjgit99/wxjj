<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href=" res/lecheng/css/admin.css" rel="stylesheet"
	type="text/css" />
<link href="res/common/css/theme.css" rel="stylesheet"
	type="text/css" />
<link href=" res/common/css/jquery.validate.css" rel="stylesheet"
	type="text/css" />
<link href="res/common/css/jquery.treeview.css" rel="stylesheet"
	type="text/css" />
<link href="res/common/css/jquery.ui.css" rel="stylesheet"
	type="text/css" />

<script type="text/javascript" src=" res/fckeditor/fckeditor.js"></script>

<script src=" res/common/js/jquery.ext.js" type="text/javascript"></script>
<script src=" res/common/js/jquery.form.js" type="text/javascript"></script>
<script src=" res/common/js/lecheng.js" type="text/javascript"></script>
<script src=" res/lecheng/js/admin.js" type="text/javascript"></script>

<link rel="stylesheet" href=" res/css/style.css" />
<title>babasport-add</title>
<!-- 引入jQuery -->
<script type="text/javascript"  language="javascript" src="js/jquery-1.11.0.min.js"></script>
<!-- 引入时间控件 -->
<script type="text/javascript"  language="javascript" src="js/DatePicker/WdatePicker.js"></script>


<script type="text/javascript">
	//文章标题验证
	var CHKTITLE = "^[\u4E00-\u9FA5\uf900-\ufa2d·s]{2,}$";
	//文章内容验证
	var CHKTENT = "^[\u4E00-\u9FA5\uf900-\ufa2d·s]{10,}$";
	//文章作者验证
	var CHKAUTHOR = "[\u4E00-\u9FA5\uf900-\ufa2d·s]{2,}$";
	function chktitle() {
		var tELe = document.getElementById("title").value;

		//调用匹配用户的正则表达式
		var reg = new RegExp(CHKTITLE);

		//获取提示语句标签
		var spanEle = document.getElementById("resulttitle");

		if (reg.test(tELe)) {

			spanEle.innerHTML = "✔";

			spanEle.style.color = "green";
			return true;
		} else {
			spanEle.innerHTML = "文章标题不符合规范，请重新输入";
			spanEle.style.color = "red";
			tELe.focus();
			return false;
		}
	}
	//文章内容验证
	function chkcontent() {
		var cELe = document.getElementById("content").value;

		//调用匹配用户的正则表达式
		var reg = new RegExp(CHKTITLE);

		//获取提示语句标签
		var spanEle = document.getElementById("resultcontent");

		if (reg.test(cELe)) {

			spanEle.innerHTML = "✔";

			spanEle.style.color = "green";
			return true;
		} else {
			spanEle.innerHTML = "文章内容不得少于10个字，请继续输入";
			spanEle.style.color = "red";
			cELe.focus();
			return false;
		}
	}
	//文章作者
	function chkauthor() {
		var aELe = document.getElementById("author").value;

		//调用匹配用户的正则表达式
		var reg = new RegExp(CHKAUTHOR);

		//获取提示语句标签
		var spanEle = document.getElementById("resultauthor");

		if (reg.test(aELe)) {

			spanEle.innerHTML = "✔";

			spanEle.style.color = "green";
			return true;
		} else {
			spanEle.innerHTML = "文章作者不得低于两个字";
			spanEle.style.color = "red";
			aELe.focus();
			return false;
		}
	}
</script>
<style type="">
.h2_ch a:hover,.h2_ch a.here {
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
		<div class="rpos">当前位置: 文章管理 - 新增</div>
		<form class="ropt">
			<input type="submit" onclick="this.form.action='../atclist.do';"
				value="返回列表" class="return-button" />
		</form>
		<div class="clear"></div>
	</div>

	<div class="body-box" style="float: right">
		<form id="jvForm" action="addarticle.do" method="post">
			<table cellspacing="1" cellpadding="2" width="100%" border="0"
				class="pn-ftable">
				<tbody id="tab_1">
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h"><span
							class="pn-frequired">*</span> 文章标题:</td>
						<td width="80%" class="pn-fcontent"><input type="text"
							name="title" id="title" onblur="chktitle()" /> <span
							id="resulttitle"></span></td>
					</tr>
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h"><span
							class="pn-frequired">*</span> 文章内容:</td>
						<td width="80%" class="pn-fcontent"><textarea name="content"
								rows="20" cols="40" id="content" onblur="chkcontent() "></textarea>
							<span id="resultcontent"></span></td>
					</tr>
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h">文章作者:</td>
						<td width="80%" class="pn-fcontent"><input type="text"
							name="author" id="author" onblur="chkauthor()" /> <span
							id="resultauthor"></span></td>
					</tr>
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h">创建日期:</td>
						<td width="80%" class="pn-fcontent"><input type="text" name="crtime" maxlength="80" id="crtime" class="Wdate" onclick="WdatePicker()" /> <span id="resultcrtime"></span></td>
					</tr>
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h">所属栏目:</td>
						<td width="80%" class="pn-fcontent">
						<select name="channel">
								<c:forEach items="${cc}" var="c">
									<option value="${c.id}">${c.cname}</option>
								</c:forEach>
						</select>
						
						</td>
					</tr>
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h"><span
							class="pn-frequired">*</span> 是否推荐:</td>
						<td width="80%" class="pn-fcontent">
						<input type="radio" checked="checked" name="isremod" id="isremod" value="1" />推荐
						<input type="radio" name="isremod" id="isremod" value="2" />不推荐</td>
					</tr>



					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h">是否热点:</td>
						<td width="80%" class="pn-fcontent"><input type="radio"
							value="1" name="ishot" />介是热点
							<input type="radio"
							value="2" name="ishot" />不是热点</td>
					</tr>





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