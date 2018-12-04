package com.zs.pms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zs.pms.po.TUser;
import com.zs.pms.service.UserService;
@Controller//是一个控制器
public class HelloController {
	@Autowired
	UserService us;
//	@RequestMapping("/hello.do")
//	public String hello(String name,ModelMap map){
//		map.addAttribute("Dname", name);
//		return "hello";
//	}
	@RequestMapping("/toinput.do")
	public String toinput(){
		return "input";
	}
//	@RequestMapping("/input.do")
//	public String intput(TUser user,ModelMap map){
//		//回带user对象到页面
//		map.addAttribute("TUser",user);
//		map.addAttribute("WELCOME", us.getWelcome());
//		return "hello";
//	} 
}
