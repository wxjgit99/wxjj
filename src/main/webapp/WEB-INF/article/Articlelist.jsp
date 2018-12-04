<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>


<link href=" res/lecheng/css/admin.css" rel="stylesheet" type="text/css"/>
<link href=" res/common/css/theme.css" rel="stylesheet" type="text/css"/>
<link href=" res/common/css/jquery.validate.css" rel="stylesheet" type="text/css"/>
<link href=" res/common/css/jquery.treeview.css" rel="stylesheet" type="text/css"/>
<link href=" res/common/css/jquery.ui.css" rel="stylesheet" type="text/css"/>

<!-- <script src="/thirdparty/ckeditor/ckeditor.js" type="text/javascript"></script> -->
<!-- <script src="/thirdparty/My97DatePicker/WdatePicker.js" type="text/javascript"></script> -->
<script type="text/javascript" src=" res/fckeditor/fckeditor.js"></script>
<script src=" res/common/js/jquery.js" type="text/javascript"></script>
<script src=" res/common/js/jquery.ext.js" type="text/javascript"></script>
<script src=" res/common/js/jquery.form.js" type="text/javascript"></script>
<script src=" res/common/js/lecheng.js" type="text/javascript"></script>
<script src=" res/lecheng/js/admin.js" type="text/javascript"></script>

<link rel="stylesheet" href=" res/css/style.css" />






<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>文章列表</title>

<meta charset="UTF-8">

</script>
</head>
<body>
<div class="box-positon">
	<div class="rpos">当前位置: 文章管理 - 列表</div>
	<form class="ropt">
		<input class="add" type="button" value="添加" onclick="javascript:window.location.href='tochannel.do'"/>
	</form>
	<div class="clear"></div>
</div>
<div class="body-box">

<form method="post" id="tableForm">

<table cellspacing="1" cellpadding="0" width="100%" border="0" class="pn-ltable">
	<thead class="pn-lthead">
		<tr>
			<th width="2%"><input type="checkbox" /></th>
			<th width="3%">文章ID</th>
			<th width="5%">标题</th>
			<th width="14%">内容</th>
			<th width="3%">作者</th>
			<th width="5%">创建日期</th>
			<th width="6%">所属栏目</th>
			<th width="3%">是否推荐</th>
			<th width="3%">是否热点</th>
			<th width="12%">操作选项</th>
		</tr>
	</thead>
	<tbody class="pn-ltbody">
		<c:forEach items="${atcs }" var="act">
			<tr bgcolor="#ffffff" onmouseover="this.bgColor='#eeeeee'" onmouseout="this.bgColor='#ffffff'">
			<td><input type="checkbox" name="ids" value="73"/></td>
			<td align="center">${act.id }</td>
			<td align="center">${act.title }</td>
			<td align="center">${act.content }</td>
			<td align="center">${act.author }</td>
			<td align="center">${act.crtime }</td>
			<td align="center">${act.cname }</td>
			<td align="center">${act.isremodtxt }</td>
			<td align="center">${act.ishottxt }</td>
			<td align="center">
			<a href="articleget.do?id=${act.id }" class="pn-opt">修改</a>
			<a href="articledelete.do?id=${act.id }" onclick="if(!confirm('确认删除？')){return false;}" class="pn-opt">删除</a>
			</td>
		</tr>
		</c:forEach>
	</tbody>
</table>
</form>
<div>
	<span>
		[${requestScope.currentPage }/${requestScope.pageCounts  }]
		<a href="atclist.do?currentPage=1">首页</a>
		<c:if test="${requestScope.currentPage-1>0 }">
			<a href="atclist.do?currentPage=${requestScope.currentPage-1 }">上一页</a>
		</c:if>
		<c:if test="${requestScope.currentPage+1<=requestScope.pageCounts }">
			<a href="atclist.do?currentPage=${requestScope.currentPage+1 }">下一页</a>
		</c:if>
		<a href="atclist.do?currentPage=${requestScope.pageCounts }">尾页</a>
	</span>
	
</div>
</body>
</html>