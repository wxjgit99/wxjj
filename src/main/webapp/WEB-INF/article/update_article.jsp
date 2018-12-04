<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link href=" res/lecheng/css/admin.css" rel="stylesheet" type="text/css"/>
<link href=" res/common/css/theme.css" rel="stylesheet" type="text/css"/>
<link href=" res/common/css/jquery.validate.css" rel="stylesheet" type="text/css"/>
<link href=" res/common/css/jquery.treeview.css" rel="stylesheet" type="text/css"/>
<link href=" res/common/css/jquery.ui.css" rel="stylesheet" type="text/css"/>


<script src=" res/common/js/jquery.js" type="text/javascript"></script>
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
	//var CHKKTITLE = "^(?![0-9]+$)[a-zA-Z0-9]{2,16}$";
	var CHKKTITLE = "^[\u4E00-\u9FA5\uf900-\ufa2d·s]{2,20}$";
	//文章内容验证
	var CHKKTENT = "^[\u4E00-\u9FA5\uf900-\ufa2d·s]{2,}$";
	//文章作者验证
	var CHKKAUTHOR = "^[\u4E00-\u9FA5\uf900-\ufa2d·s]{1,}$";
	function chktitle1() {
		
		var tELe = document.getElementById("title");
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
			spanEle.innerHTML = "文章标题不符合规范，请重新输入";
			spanEle.style.color = "red";
			tELe.focus();
			return false;
		}
	}
	//文章内容验证
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
			spanEle.innerHTML = "文章内容不符合规范";
			spanEle.style.color = "red";
			cELe.focus();
			return false;
		}
	}
	//文章作者
	function chkauthor() {
		var aELe = document.getElementById("author").value;
		
		
		//调用匹配用户的正则表达式
		var reg = new RegExp(CHKKAUTHOR);
		
		//获取提示语句标签
		var spanEle = document.getElementById("resultauthor");
		
		if (reg.test(aELe)) {
			
			spanEle.innerHTML = "✔";
			
			spanEle.style.color = "green";
			return true;
		} else {
			spanEle.innerHTML = "文章作者不得低于一个字";
			spanEle.style.color = "red";
			aELe.focus();
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
    background: url(' res/lecheng/img/admin/bg_ch.gif') repeat-x scroll 0% 0% transparent;
}
a {
    color: #06C;
    text-decoration: none;
}
</style>

</head>
<body>
<div class="box-positon">
	<div class="rpos">当前位置: 文章管理 - 修改</div>
	<form class="ropt">									
		<input type="submit" onclick="this.form.action='atclist.do';" value="返回列表" class="return-button"/>
	</form>												
	<div class="clear"></div>
</div>

<div class="body-box" style="float:right">
	<form id="jvForm" action="updarticle.do?id=${articleBean.id }" method="post" >
		<table cellspacing="1" cellpadding="2" width="100%" border="0" class="pn-ftable">
			<tbody id="tab_1">
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						文章标题:</td><td width="80%" class="pn-fcontent">
								<input type="text" name="title" id="title" onblur="chktitle1()" value="${articleBean.title }" />
								<span id="resulttitle"></span>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						文章内容:</td><td width="80%" class="pn-fcontent">					  
						<textarea name="content" rows="20" cols="40" id="content" onblur="chkcontent()" >${articleBean.content }</textarea>
						<span id="resultcontent"></span>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						文章作者:</td><td width="60%" class="pn-fcontent">
						<input type="text" name="author" id="author" onblur="chkauthor()" value="${articleBean.author }" />
						<span id="resultauthor"></span>
					</td>
				</tr>
				<tr>
				<td width="20%" class="pn-flabel pn-flabel-h">
						创建日期:</td><td width="80%" class="pn-fcontent">
						<input type="text"  name="crtime" maxlength="80" value="${articleBean.crtime }" class="Wdate" onclick="WdatePicker()" />
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						所属栏目:</td><td width="80%" class="pn-fcontent">
						<select name="channel">
						
							<c:forEach items="${acs }" var="s">
							
								<c:if test="${s.id==articleBean.channel }">
									<option value="${ s.id}" selected="selected">${s.cname }</option>
								</c:if>
								<c:if test="${s.id!=articleBean.channel }">
									<option value="${ s.id}" >${s.cname }</option>
								</c:if>
							</c:forEach>
						
						</select>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						是否推荐:</td><td width="80%" class="pn-fcontent">
						<c:if test="${articleBean.isremod==1 }">
						<input type="radio" name="isremod" value="1" checked="checked"/>是
						<input type="radio" name="isremod" value="2"/>否
						</c:if>
						<c:if test="${articleBean.isremod==2 }">
						<input type="radio" name="isremod" value="1" />是
						<input type="radio" name="isremod" value="2"checked="checked"/>否
						</c:if>
					</td>
				</tr>
				
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						是否热点:</td><td width="80%" class="pn-fcontent">
					<c:if test="${articleBean.ishot==1 }">
						<input type="radio" name="ishot" value="1" checked="checked"/>是
						<input type="radio" name="ishot" value="2"/>否
						</c:if>
						<c:if test="${articleBean.ishot==2 }">
						<input type="radio" name="ishot" value="1" />是
						<input type="radio" name="ishot" value="2"checked="checked"/>否
						</c:if>
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