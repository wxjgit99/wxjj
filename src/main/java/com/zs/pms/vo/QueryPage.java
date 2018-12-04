package com.zs.pms.vo;

import org.aspectj.apache.bcel.classfile.Constant;

import com.zs.pms.utils.Constants;

public class QueryPage {
	protected int start;//起始页
	protected int end;//截止页
	protected int page;//当前页
	/**
	 * 	计算起始数
	 * @return
	 */
	public int getStart() {
		//（当前页-1）*每页条数+1
		return (page-1)*Constants.PAGECOUNT+1;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return page*Constants.PAGECOUNT;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
}
