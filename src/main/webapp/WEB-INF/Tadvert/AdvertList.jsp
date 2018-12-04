<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>








<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>广告列表</title>
<meta charset="UTF-8">

<link href=" res/lecheng/css/admin.css" rel="stylesheet" type="text/css" />
<link href=" res/common/css/theme.css" rel="stylesheet" type="text/css" />
<link href=" res/common/css/jquery.validate.css" rel="stylesheet"
	type="text/css" />
<link href=" res/common/css/jquery.treeview.css" rel="stylesheet"
	type="text/css" />
<link href=" res/common/css/jquery.ui.css" rel="stylesheet"
	type="text/css" />

<!-- <script src="/thirdparty/ckeditor/ckeditor.js" type="text/javascript"></script> -->
<!-- <script src="/thirdparty/My97DatePicker/WdatePicker.js" type="text/javascript"></script> -->
<script type="text/javascript" src=" res/fckeditor/fckeditor.js"></script>
<script src=" res/common/js/jquery.js" type="text/javascript"></script>
<script src=" res/common/js/jquery.ext.js" type="text/javascript"></script>
<script src=" res/common/js/jquery.form.js" type="text/javascript"></script>
<script src=" res/common/js/lecheng.js" type="text/javascript"></script>
<script src=" res/lecheng/js/admin.js" type="text/javascript"></script>

<link rel="stylesheet" href=" res/css/style.css" />
</script>
</head>
<body>
	<div class="box-positon">
		<div class="rpos">当前位置: 广告管理 - 列表</div>
		<form class="ropt">
			<input class="add" type="button" value="添加"
				onclick="javascript:window.location.href='Tadvert/addadvert.jsp'" />
		</form>
		<div class="clear"></div>
	</div>
	<div class="body-box">
		<form action="ads.do?cp=1" method="post"
			style="padding-top: 5px;">

			广告信息查询: <input type="text" value="" name="mh"  id="mh" /> <input
				type="submit" class="query" name="a" value="查询" />
		</form>
		<form method="post" id="tableForm">

			<table cellspacing="1" cellpadding="0" width="100%" border="0"
				class="pn-ltable">
				<thead class="pn-lthead">
					<tr>
						<th width="2%"><input type="checkbox" /></th>
						<th width="3%">广告ID</th>
						<th width="24%">广告标题</th>
						<th width="34%">内容</th>
						<th width="8%">公告时间</th>
						<th>公告人</th>
						<th width="8%">操作选项</th>

					</tr>
				</thead>
				<tbody class="pn-ltbody">
					<c:forEach items="${adv }" var="adv">
						<tr bgcolor="#ffffff" onmouseover="this.bgColor='#eeeeee'"
							onmouseout="this.bgColor='#ffffff'">
							<td><input type="checkbox" name="ids" value="73" /></td>
							<td align="center">${adv.id }</td>
							<td align="center">${adv.title }</td>
							<td align="center">${adv.content }</td>
							<td align="center">${adv.crtime }</td>
							<td align="center">${adv.crman }</td>
							<td align="center"><a href="getadv.do?id=${adv.id }"
								class="pn-opt">修改</a> <a href="deladv.do?id=${adv.id }"
								class="pn-opt" >删除</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>


		</form>
		<div>
		
			<span> 
				<c:if test="${requestScope.cp!=null }">
					[${requestScope.cp }/${requestScope.pageCounts  }]
					<a href="ads.do?cp=1&&sel=${requestScope.sel }">首页</a>
					<c:if test="${requestScope.cp==1 }">
						<a href="">上一页</a>
					</c:if>
					<c:if test="${requestScope.cp-1>0 }">
						<a href="ads.do?cp=${requestScope.cp-1 }&&sel=${requestScope.sel }">上一页</a>
					</c:if>
					<c:if
						test="${requestScope.cp+1<=requestScope.pageCounts }">
						<a href="ads.do?cp=${requestScope.cp+1 }&&sel=${requestScope.sel }">下一页</a>
					</c:if>
					<c:if
						test="${requestScope.cp>requestScope.pageCounts }">
						<a href="">下一页</a>
					</c:if>
					<a href="ads.do?cp=${requestScope.pageCounts }&&sel=${requestScope.sel }">尾页</a>
				</c:if>
				<c:if test="${requestScope.cp==null }">
				
					[${requestScope.currentPage }/${requestScope.pageCounts  }]
					<a href="advlist.do?currentPage=1">首页</a>
					<c:if test="${requestScope.currentPage==1 }">
						<a href="">上一页</a>
					</c:if>
					<c:if test="${requestScope.currentPage-1>0 }">
						<a href="advlist.do?currentPage=${requestScope.currentPage-1 }">上一页</a>
					</c:if>
					<c:if
						test="${requestScope.currentPage+1<=requestScope.pageCounts }">
						<a href="advlist.do?currentPage=${requestScope.currentPage+1 }">下一页</a>
					</c:if>
					<c:if
						test="${requestScope.currentPage>=requestScope.pageCounts }">
						<a href="">下一页</a>
					</c:if>
					<a href="advlist.do?currentPage=${requestScope.pageCounts }">尾页</a>
					
				</c:if>
	
			
			</span>



		</div>

	</div>
</body>
</html>