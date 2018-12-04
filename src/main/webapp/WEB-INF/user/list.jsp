<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<link href="../res/lecheng/css/admin.css" rel="stylesheet" type="text/css" />
<link href="../res/common/css/theme.css" rel="stylesheet" type="text/css" />
<link href="../res/common/css/jquery.validate.css" rel="stylesheet"
	type="text/css" />
<link href="../res/common/css/jquery.treeview.css" rel="stylesheet"
	type="text/css" />
<link href="../res/common/css/jquery.ui.css" rel="stylesheet"
	type="../text/css" />

<!-- <script src="/thirdparty/ckeditor/ckeditor.js" type="text/javascript"></script> -->
<!-- <script src="/thirdparty/My97DatePicker/WdatePicker.js" type="text/javascript"></script> -->
<script type="text/javascript" src="/res/fckeditor/fckeditor.js"></script>
<script src="../res/common/js/jquery.js" type="text/javascript"></script>
<script src="../res/common/js/jquery.ext.js" type="text/javascript"></script>
<script src="../res/common/js/jquery.form.js" type="text/javascript"></script>
<script src="../res/common/js/lecheng.js" type="text/javascript"></script>
<script src="../res/lecheng/js/admin.js" type="text/javascript"></script>

<link rel="stylesheet" href="/res/css/style.css" />






<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>商品列表</title>
<meta charset="UTF-8">

</script>
</head>
<body>
	<div class="box-positon">
		<div class="rpos">当前位置: 用户管理 - 列表</div>
		<form class="ropt" action="toadd.do" method="post">
			<input class="add" type="submit" value="添加"
				/>
		</form>
		<div class="clear"></div>
	</div>
	<div class="body-box">
		<form action="list.do" method="post"
			style="padding-top: 5px;">
			<input type="hidden" value="1" name="pageNo" /> 
			登录名: <input
				type="text" onkeyup="changePageNo()" value="${QUERY }" name="loginname" /> 
				<select onchange="changePageNo()" name="isenabled">
				<c:if test="${QUERY.isenabled==0 }">
					<option value="0" selected="selected" >请选择</option>
					<option value="1">有效</option>
					<option value="-1">无效</option>
				</c:if>
				<c:if test="${QUERY.isenabled==1 }">
					<option value="0"  >请选择</option>
					<option value="1" selected="selected">有效</option>
					<option value="-1">无效</option>
				</c:if>
				<c:if test="${QUERY.isenabled==-1 }">
					<option value="0"  >请选择</option>
					<option value="1">有效</option>
					<option value="-1" selected="selected">无效</option>
				</c:if>
			</select> <input type="submit" class="query" value="查询" />
		</form>

		<form method="post" id="tableForm" action="deletes.do">

			<table cellspacing="1" cellpadding="0" width="100%" border="0"
				class="pn-ltable">
				<thead class="pn-lthead">
					<tr>
						<th width="2%"><input type="checkbox" /></th>
						<th width="8%">用户ID1</th>
						<th width="18%">登录名</th>
						<th width="8%">性别</th>
						<th width="4%">出生日期</th>
						<th width="8%">email</th>
						<th width="6%">部门名称</th>
						<th width="7%">真实姓名</th>
						<th width="4%">是否可用</th>
						<th width="4%">头像</th>
						<th width="12%">操作选项</th>
					</tr>
				</thead>
				<tbody class="pn-ltbody">
					<c:forEach items="${LIST }" var="user">
						<tr bgcolor="#ffffff" onmouseover="this.bgColor='#eeeeee'"
							onmouseout="this.bgColor='#ffffff'">
							<td><input type="checkbox" name="ids" value="${user.id }" /></td>
							<td align="center">${user.id }</td>
							<td align="center">${user.loginname }</td>
							<td align="center">${user.sex }</td>
							<td align="center">${user.birthdaytxt }</td>
							<td align="center">${user.email }</td>
							<td align="center">${user.dept.name }</td>
							<td align="center">${user.realname }</td>
							<td align="center">${user.isenabledtxt }</td>
							<td align="center"><img src="../upload/${user.pic }" width="50px" height="50px" /></td>
							
							<td align="center"><a href="get.do?id=${user.id }"
								class="pn-opt">修改</a> <a href="delete.do?id=${user.id} "
								class="pn-opt">删除</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

	<div style="margin-top:15px;">
<input class="del-button" type="submit" value="删除" /></div>
	
	</div>
	<div>
		
			<a href="list.do?page=1">首页</a> 
				
				<a href="list.do?page=${(PAGE-1)<=0?1:(PAGE-1) }&loginname=${QUERY.loginname}&isenabled=${QUERY.isenabled}">上一页</a>
			
				<a href="list.do?page=${PAGE+1>PAGECOUNT?PAGECOUNT:PAGE+1 }&loginname=${QUERY.loginname}&isenabled=${QUERY.isenabled}">下一页</a>
			<a href="list.do?page=${PAGECOUNT}&loginname=${QUERY.loginname}&isenabled=${QUERY.isenabled}"">尾页</a>
			当前第${PAGE}页,共${PAGECOUNT}页
		

	</div>
		</form>
</body>
</html>