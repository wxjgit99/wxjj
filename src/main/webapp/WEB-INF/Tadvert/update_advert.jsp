<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link href="res/lecheng/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="res/common/css/theme.css" rel="stylesheet" type="text/css"/>
<link href="res/common/css/jquery.validate.css" rel="stylesheet" type="text/css"/>
<link href="res/common/css/jquery.treeview.css" rel="stylesheet" type="text/css"/>
<link href="res/common/css/jquery.ui.css" rel="stylesheet" type="text/css"/>

<!-- 引时间控件 -->
<script type="text/javascript" src="js/DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="../res/fckeditor/fckeditor.js"></script>
<script src="res/common/js/jquery.js" type="text/javascript"></script>
<script src="res/common/js/jquery.ext.js" type="text/javascript"></script>
<script src="res/common/js/jquery.form.js" type="text/javascript"></script>
<script src="res/common/js/lecheng.js" type="text/javascript"></script>
<script src="res/lecheng/js/admin.js" type="text/javascript"></script>
<!-- 引入jQuery -->
<script type="text/javascript"  language="javascript" src="js/jquery-1.11.0.min.js"></script>
<!-- 引入时间控件 -->
<script type="text/javascript"  language="javascript" src="js/DatePicker/WdatePicker.js"></script>
<link rel="stylesheet" href="../res/css/style.css" />







<title>babasport-add</title>

<script type="text/javascript">
	//广告标题验证
	
	var CHKKTITLE = "^[\u4E00-\u9FA5\uf900-\ufa2d·s]{2,20}$";
	//广告内容验证
	var CHKKTENT = "^[\u4E00-\u9FA5\uf900-\ufa2d·s]{8,20}$";
	
	function chktitle1() {
		
		var tELe = document.getElementById("title1");
		var t=tELe.value;
		
		//调用匹配标题的正则表达式
		var reg = new RegExp(CHKKTITLE);
		
		//获取提示语句标签
		var spanEle = document.getElementById("resulttitle");
		
		if (reg.test(t)) {
			
			spanEle.innerHTML = "✔";
			
			spanEle.style.color = "green";
			return true;
		} else {
			spanEle.innerHTML = "广告标题不符合规范，请重新输入";
			spanEle.style.color = "red";
			tELe.focus();
			return false;
		}
	}
	//广告内容验证
	function chkcontent() {
		var cELe = document.getElementById("content");
		var tt=cELe.value;
		
		//调用匹配用户的正则表达式
		var reg = new RegExp(CHKKTENT);
		
		//获取提示语句标签
		var spanEle = document.getElementById("resultcontent");
		
		if (reg.test(tt)) {
			
			spanEle.innerHTML = "✔";
			
			spanEle.style.color = "green";
			return true;
		} else {
			spanEle.innerHTML = "广告内容不符合规范";
			spanEle.style.color = "red";
			cELe.focus();
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
    background: url('../res/lecheng/img/admin/bg_ch.gif') repeat-x scroll 0% 0% transparent;
}
a {
    color: #06C;
    text-decoration: none;
}
</style>

</head>
<body>
<div class="box-positon">
	<div class="rpos">当前位置: 广告管理 - 修改</div>
	<form class="ropt">
		<input type="submit" onclick="this.form.action='advlist.do';" value="返回列表" class="return-button"/>
	</form>
	<div class="clear"></div>
</div>

<div class="body-box" style="float:right">
	<form id="jvForm" action="upadv.do?id=${adv.id }" method="post" >
		<table cellspacing="1" cellpadding="2" width="100%" border="0" class="pn-ftable">
			<tbody id="tab_1">
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired"></span>
						
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						广告标题:</td><td width="80%" class="pn-fcontent">
								<input type="text" name="title" id="title1" onblur="chktitle1()"  value="${adv.title }"/>
								<span id="resulttitle"></span>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						广告内容:</td><td width="80%" class="pn-fcontent">
						<textarea rows="20" cols="20" name="content"  id="content" onblur="chkcontent()" value="">${adv.content }</textarea>
						<span id="resultcontent"></span>
					</td>
				
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						创建时间:</td><td width="80%" class="pn-fcontent">
						<input type="text" value="${adv.crtime }" class="required" name="crtime" maxlength="10" class="Wdate" onclick="WdatePicker()"/>
					</td>
				</tr>
				
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						创建人:</td><td width="80%" class="pn-fcontent">
						<input type="text"  name="crman" maxlength="80"  value="${adv.crman }"   />
					</td>
				</tr>
				
				
				
				
					
			</tbody>
			<tbody id="tab_2" style="display: none">
				<tr>
					<td >
						<textarea rows="10" cols="10" id="productdesc" name="description"></textarea>
					</td>
				</tr>
			</tbody>
			<tbody id="tab_3" style="display: none">
				<tr>
					<td >
						<textarea rows="15" cols="136" id="productList" name="packageList"></textarea>
					</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td class="pn-fbutton" colspan="2">
						<input type="submit" class="submit" value="提交"/> &nbsp; <input type="reset" class="reset" value="重置"/>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>
</body>
</html>