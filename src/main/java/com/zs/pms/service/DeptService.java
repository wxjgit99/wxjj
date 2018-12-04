package com.zs.pms.service;

import java.util.List;

import com.zs.pms.po.TDep;

public interface DeptService {
	//根据上级id获取部门列表
		public List<TDep> queryByPid(int pid);
}
