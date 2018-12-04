package com.zs.pms.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.zs.pms.exception.AppException;
import com.zs.pms.po.TUser;
import com.zs.pms.service.UserService;
import com.zs.pms.utils.DateUtil;
import com.zs.pms.vo.QueryUser;

@Controller//控制器
public class UserLoginController {
	@Autowired
	UserService us;
	
	
	/*
	 * 去Top
	 * 
	 */
	@RequestMapping("/totop.do")
	public String totop(){
		return "top";
	}
	/*
	 * 去左侧页面
	 * 
	 */
	
	@RequestMapping("/toleft.do")
	public String toleft(){
		return "left";
	}
	/*
	 * 去右侧页面
	 * 
	 */
	@RequestMapping("/toright.do")
	public String toright(){
		return "right";
	}
	/*
	 * 
	 * 去的登录页面
	 */
	@RequestMapping("/tologin.do")
	public String tologin(){
		return "login";
	}
	@RequestMapping("/login.do")
	public String chkLogin(QueryUser qUser,String code,ModelMap map,HttpSession session) throws AppException{
			//验证 验证码
			String code1=(String) session.getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
			//验证码不相同
			if(!code1.equals(code)){
				//页面待会信息
				map.addAttribute("MSG","验证码输入有误，请重新输入");
				//回登录页面
				return "login";
			}
			//验证码相同  验证登录
			TUser  user;
			try {
				user=us.chkLogin(qUser);
				session.setAttribute("Tuser",user);
				//当前日期
				session.setAttribute("TODAY",DateUtil.getStrDate(new Date()));
				return "main";
			} catch (AppException e) {
				map.addAttribute("MSG",e.getErrMsg());
				//回到登录页面
				return "login";
			}catch (Exception e1) {
				e1.printStackTrace();
				return "error";
			}
			
	}
}
