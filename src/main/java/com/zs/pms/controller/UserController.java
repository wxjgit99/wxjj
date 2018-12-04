package com.zs.pms.controller;

import java.util.List;

import javax.management.Query;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zs.pms.exception.AppException;
import com.zs.pms.po.TDep;
import com.zs.pms.po.TUser;
import com.zs.pms.service.DeptService;
import com.zs.pms.service.UserService;
import com.zs.pms.vo.QueryUser;

@Controller
public class UserController {
	@Autowired
	UserService us;//注入业务
	@Autowired
	DeptService ds;//注入部门
	@RequestMapping("/user/list.do")//二级url
	public String list(QueryUser qUser,String page,ModelMap map){
		//page是空
		if (page==null||"".equals(page)) {
			page="1";//默认第一页
		}
		//待会分页数据
		map.addAttribute("LIST",us.queryByPage(qUser, Integer.parseInt(page)));
		//带回总页数
		map.addAttribute("PAGECOUNT",us.queryPageCount(qUser));
		//带回当前页数
		map.addAttribute("PAGE", page);
		//带回查询条件
		map.addAttribute("QUERY",qUser);
		//返回user/list.jsp
		return "user/list";
	}
	
	@RequestMapping("/user/toadd.do")
	public String toadd(ModelMap map){
		//获得一级部门列表
		List<TDep> list1=ds.queryByPid(0);
		map.addAttribute("DLIST", list1);
		//获得默认一级部门下的二级部门列表
		List<TDep> list2=ds.queryByPid(list1.get(0).getId());
		map.addAttribute("DLIST2",list2);
		return "user/add";
	}
	@RequestMapping("/user/getdep.do")
	@ResponseBody
	/**
	 * 以ajax方式响应
	 * 方法返回string 直接返回文本
	 * 方法返回对象 返回json格式  自动调用 jsonarray
	 */
	public List<TDep> getDept(int pid){
		List<TDep>listt=ds.queryByPid(pid);
		return listt;
	}
	@RequestMapping("/user/add.do")
	public String add(TUser user,ModelMap map,HttpSession session) {
		//获得session中的用户信息
		TUser cUser=(TUser) session.getAttribute("Tuser");
		user.setCreator(cUser.getId());//创建人
		user.setIsenabled(1);//可用
		
		us.insert(user);
		//跳转到指定的url上 不需要传参
		return "redirect:list.do";
	}
	@RequestMapping("/user/delete.do")
	
	public String delete(int id){
		us.delete(id);
		return "redirect:list.do";	
	}
	@RequestMapping("/user/deletes.do")
	/**
	 * 删多条
	 * @param ids
	 * @return
	 */
	public String deletes(int[]ids){
		us.deleteUser(ids);
		return "redirect:list.do";	
	}
	@RequestMapping("/user/get.do")
	public String get(int id,ModelMap map){
		//TUser user=us.queryById(id);
		TUser user=us.queryById(id);
		map.addAttribute("USER", user);
		//获得一级部门列表
		List<TDep> list1=ds.queryByPid(0);
		map.addAttribute("DLIST",list1);
		//获得该用户的一级部门下的二级部门列表
		List<TDep> list2=ds.queryByPid(user.getDept().getPid());
		map.addAttribute("DLIST2", list2);
		return "/user/update";
	}
	
	@RequestMapping("/user/update.do")
	public String update(TUser user,HttpSession session,ModelMap map){
		//获得session中用户的信息
		TUser user2=(TUser) session.getAttribute("CUSER");
		us.update(user);
		return "redirect:list.do";
	}
}
