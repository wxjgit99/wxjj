package com.zs.pms.po;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.zs.pms.utils.DateUtil;

/**
 * 用户表的PO
 * @author Administrator
 *
 */
public class TUser implements Serializable {
	private int id;
	private String loginname;
	private String password;
	private String sex;
	private Date birthday;
	private String birthdaytxt;
	public String getBirthdaytxt() {
		return DateUtil.getStrDate(birthday);
	}
	public void setBirthdaytxt(String birthdaytxt) {
		this.birthdaytxt = birthdaytxt;
	}

	private String email;
	private int isenabled;
	private String realname;
	private int creator;
	private Date creattime;
	private int updator;
	private  String pic;
	private String isenabledtxt;
	public String getIsenabledtxt() {
		if (isenabled==1) {
			return "可用";
		}
		else {
			return "不可用";
		}
		
	}
	
	private TDep dept;//一对一关联对象
	private List<TPermission> tper;
	private List<TPermission> menu=new ArrayList<>();//主菜单
	
	
	public List<TPermission> getMenu() {
		//清空菜单
		menu.clear();
		for (TPermission per1:tper) {
			//一级菜单
			if (per1.getPid()==0) {
				//清空二级菜单
				per1.getChild().clear();
				for(TPermission per2:tper){
					//二级
					if (per1.getId()==per2.getPid()) {
						per1.getChild().add(per2);	
					}
				}
				menu.add(per1);
			}
		}
		return menu;
	}
	public void setMenu(List<TPermission> menu) {
		this.menu = menu;
	}
	
	
	public List<TPermission> getTper() {
		return tper;
	}
	public void setTper(List<TPermission> tper) {
		this.tper = tper;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getLoginname() {
		return loginname;
	}
	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	
	public TDep getDept() {
		return dept;
	}
	public void setDept(TDep dept) {
		this.dept = dept;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getIsenabled() {
		return isenabled;
	}
	public void setIsenabled(int isenabled) {
		this.isenabled = isenabled;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public int getCreator() {
		return creator;
	}
	public void setCreator(int creator) {
		this.creator = creator;
	}
	public Date getCreattime() {
		return creattime;
	}
	public void setCreattime(Date creattime) {
		this.creattime = creattime;
	}
	public int getUpdator() {
		return updator;
	}
	public void setUpdator(int updator) {
		this.updator = updator;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	
	
}
