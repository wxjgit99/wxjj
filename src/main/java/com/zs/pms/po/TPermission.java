package com.zs.pms.po;

import java.util.ArrayList;
import java.util.List;

/**
 * 权限表
 * @author Administrator
 *
 */
public class TPermission {
	private int id;
	private String  pname;
	private int pid;
	private String url;
	private int lev;
	private int isleaf;
	private String npic;
	private List<TPermission> child=new ArrayList<>();//子菜单
	public List<TPermission> getChild() {
		return child;
	}
	public void setChild(List<TPermission> child) {
		this.child = child;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getLev() {
		return lev;
	}
	public void setLev(int lev) {
		this.lev = lev;
	}
	public int getIsleaf() {
		return isleaf;
	}
	public void setIsleaf(int isleaf) {
		this.isleaf = isleaf;
	}
	public String getNpic() {
		return npic;
	}
	public void setNpic(String npic) {
		this.npic = npic;
	}
}
